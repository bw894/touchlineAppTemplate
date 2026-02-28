import 'dart:convert';
import 'dart:io';

import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:feature_auth/src/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// Storage key names — must never be renamed (breaks existing user sessions).
const _kUserTokenKey = 'ff_userToken';
const _kCurrentUserKey = 'ff_currentUser';
const _kCurrentUserObjectIdKey = 'ff_currentUserObjectId';

/// Manages the auth lifecycle for a Touchline club app.
///
/// Auth flow:
/// 1. User signs in via Firebase (email/password, Google, or Apple).
/// 2. Firebase ID token is exchanged for a Touchline JWT via
///    [AppConfig.touchlineAuthBaseUrl]/auth/exchange.
/// 3. The JWT is stored under [_kUserTokenKey] and surfaced via
///    [userTokenProvider] for all downstream API calls.
///
/// Exchange endpoint contract:
///   POST {touchlineAuthBaseUrl}/auth/exchange
///   Body:    { "token": "<firebase_id_token>" }
///   Success: 200 { "token": "<touchline_jwt>" }
///
/// If the exchange endpoint is not yet live, sign-in transitions to
/// [AuthUnauthenticated] with an explanatory message. No partial auth state is
/// stored. Implement a stub server at [AppConfig.touchlineAuthBaseUrl] to
/// unblock local development before the endpoint is deployed.
class AuthNotifier extends Notifier<AuthState> {
  static const _storage = FlutterSecureStorage();

  @override
  AuthState build() => const AuthInitial();

  // ── Public API ─────────────────────────────────────────────────────────────

  /// Restore a persisted session from secure storage without a network call.
  ///
  /// Call this on app start (before any UI is shown) to avoid a flash of
  /// unauthenticated state. Also verifies that Firebase still has a current
  /// user; if not, the stored token is treated as stale.
  Future<void> restoreSession() async {
    state = const AuthLoading();

    final token = await _storage.read(key: _kUserTokenKey) ?? '';
    final userJson = await _storage.read(key: _kCurrentUserKey) ?? '{}';

    if (token.isEmpty || FirebaseAuth.instance.currentUser == null) {
      state = const AuthUnauthenticated();
      return;
    }

    UserStruct user;
    try {
      user = UserStruct.fromSerializableMap(
          jsonDecode(userJson) as Map<String, dynamic>);
    } catch (_) {
      user = UserStruct();
    }

    state = _stateForUser(token, user);
  }

  /// Sign in with email and password via Firebase, then exchange for a
  /// Touchline JWT.
  Future<void> signIn(String email, String password) async {
    state = const AuthLoading();
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await _finalizeFirebaseAuth(credential.user!);
    } on FirebaseAuthException catch (e) {
      state = AuthUnauthenticated(message: _firebaseErrorMessage(e.code));
    } catch (_) {
      state = const AuthUnauthenticated(
          message: 'Sign in failed. Please try again.');
    }
  }

  /// Create a new account with email, password, and display name via Firebase,
  /// then exchange for a Touchline JWT.
  Future<void> createAccount({
    required String email,
    required String password,
    required String displayName,
  }) async {
    state = const AuthLoading();
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
      await credential.user!.reload();
      await _finalizeFirebaseAuth(FirebaseAuth.instance.currentUser!);
    } on FirebaseAuthException catch (e) {
      state = AuthUnauthenticated(message: _firebaseErrorMessage(e.code));
    } catch (_) {
      state = const AuthUnauthenticated(
          message: 'Account creation failed. Please try again.');
    }
  }

  /// Sign in with Google via Firebase, then exchange for a Touchline JWT.
  ///
  /// Requires google-services.json (Android) and GoogleService-Info.plist with
  /// REVERSED_CLIENT_ID URL scheme (iOS) configured in the club app.
  Future<void> signInWithGoogle() async {
    state = const AuthLoading();
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // User cancelled the sign-in flow.
        state = const AuthUnauthenticated();
        return;
      }
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      await _finalizeFirebaseAuth(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      state = AuthUnauthenticated(message: _firebaseErrorMessage(e.code));
    } catch (_) {
      state = const AuthUnauthenticated(
          message: 'Google sign in failed. Please try again.');
    }
  }

  /// Sign in with Apple via Firebase, then exchange for a Touchline JWT.
  ///
  /// Only available on iOS. Gate call sites behind [isIOS].
  Future<void> signInWithApple() async {
    state = const AuthLoading();
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      await _finalizeFirebaseAuth(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      state = AuthUnauthenticated(message: _firebaseErrorMessage(e.code));
    } catch (_) {
      state = const AuthUnauthenticated(
          message: 'Apple sign in failed. Please try again.');
    }
  }

  /// Send a password reset email via Firebase.
  ///
  /// Throws a human-readable [String] on failure so the calling screen can
  /// surface it to the user.
  Future<void> sendPasswordReset(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _firebaseErrorMessage(e.code);
    } catch (_) {
      throw 'Failed to send reset email. Please try again.';
    }
  }

  /// Re-fetch the current user object from the backend and update state.
  ///
  /// No-op if auth state is not [AuthAuthenticated] or [AuthGuest].
  Future<void> refreshUserData() async {
    final s = state;
    final String token;
    final UserStruct user;

    if (s is AuthAuthenticated) {
      token = s.userToken;
      user = s.currentUser;
    } else if (s is AuthGuest) {
      token = s.userToken;
      user = s.currentUser;
    } else {
      return;
    }

    await _doRefreshUserData(userToken: token, currentUser: user);
  }

  /// Fire-and-forget CRM lookup.
  Future<void> createUserCRM({required String? userEmail}) async {
    final cfg = ref.read(appConfigProvider);
    await CrmGroup.queryEmailCall.call(
      bLappId: cfg.projectId,
      bLRestApiKey: cfg.restApiKey,
      email: userEmail,
    );
  }

  /// Clear all persisted auth data and sign out of Firebase.
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await _storage.delete(key: _kUserTokenKey);
    await _storage.delete(key: _kCurrentUserKey);
    await _storage.delete(key: _kCurrentUserObjectIdKey);
    state = const AuthUnauthenticated();
  }

  // ── Private helpers ────────────────────────────────────────────────────────

  /// Exchange a Firebase ID token for a Touchline JWT, then persist + set state.
  Future<void> _finalizeFirebaseAuth(User firebaseUser) async {
    final jwt = await _exchangeFirebaseToken(firebaseUser);

    if (jwt == null) {
      await FirebaseAuth.instance.signOut();
      state = const AuthUnauthenticated(
        message:
            'Auth service unavailable. Please check your connection and try again.',
      );
      return;
    }

    // Build a minimal UserStruct from Firebase data. The full profile is
    // fetched by _doRefreshUserData once the Touchline API is live.
    final user = UserStruct(
      email: firebaseUser.email ?? '',
      name: firebaseUser.displayName ?? '',
      objectId: firebaseUser.uid,
    );

    await _persist(token: jwt, user: user);
    // Best-effort profile refresh — no-op until the API migration is complete.
    await _doRefreshUserData(userToken: jwt, currentUser: user);
  }

  Future<String?> _exchangeFirebaseToken(User firebaseUser) async {
    final cfg = ref.read(appConfigProvider);
    try {
      final idToken = await firebaseUser.getIdToken();
      final response = await http.post(
        Uri.parse('${cfg.touchlineAuthBaseUrl}/auth/exchange'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': idToken}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return data['token'] as String?;
      }
    } catch (_) {}
    return null;
  }

  Future<void> _doRefreshUserData({
    required String userToken,
    required UserStruct currentUser,
  }) async {
    final cfg = ref.read(appConfigProvider);
    final result = await AuthGroup.getUserObjectCall.call(
      userObjectId: currentUser.objectId,
      bLappId: cfg.projectId,
      bLRestApiKey: cfg.restApiKey,
      userToken: userToken,
    );

    if (result.succeeded) {
      final updated = UserStruct.maybeFromMap(result.jsonBody ?? '');
      if (updated != null) {
        await _persist(token: userToken, user: updated);
        return;
      }
    }

    // Refresh failed — persist what we have and continue.
    await _persist(token: userToken, user: currentUser);
  }

  Future<void> _persist({
    required String token,
    required UserStruct user,
  }) async {
    await _storage.write(key: _kUserTokenKey, value: token);
    await _storage.write(key: _kCurrentUserKey, value: user.serialize());
    await _storage.write(
        key: _kCurrentUserObjectIdKey, value: user.objectId);
    state = _stateForUser(token, user);
  }

  AuthState _stateForUser(String token, UserStruct user) =>
      user.email.isNotEmpty
          ? AuthAuthenticated(userToken: token, currentUser: user)
          : AuthGuest(userToken: token, currentUser: user);

  String _firebaseErrorMessage(String code) => switch (code) {
        'user-not-found' ||
        'wrong-password' ||
        'INVALID_LOGIN_CREDENTIALS' ||
        'invalid-credential' =>
          'Incorrect email or password.',
        'email-already-in-use' =>
          'An account with this email already exists.',
        'weak-password' =>
          'Password is too weak. Please use at least 6 characters.',
        'invalid-email' => 'Please enter a valid email address.',
        'user-disabled' => 'This account has been disabled.',
        'too-many-requests' => 'Too many attempts. Please try again later.',
        _ => 'Authentication failed. Please try again.',
      };
}

/// Platform guard — exposed so auth screens can gate the Apple Sign-In button.
bool get isIOS => Platform.isIOS;
