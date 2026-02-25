import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:feature_auth/src/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Storage key names — must never be renamed (breaks existing user sessions).
const _kUserTokenKey = 'ff_userToken';
const _kCurrentUserKey = 'ff_currentUser';
const _kCurrentUserObjectIdKey = 'ff_currentUserObjectId';

/// Manages the auth lifecycle for a Touchline club app.
///
/// Ports [initalRoute], [refreshUserData], and [createUserCRM] from
/// `lib/actions/actions.dart` exactly. All branching logic is preserved.
///
/// Snackbar errors from the original are represented as
/// [AuthUnauthenticated.message] so the UI layer can react to state changes
/// rather than requiring a [BuildContext] inside the notifier.
class AuthNotifier extends Notifier<AuthState> {
  static const _storage = FlutterSecureStorage();

  @override
  AuthState build() => const AuthInitial();

  // ── Public API ─────────────────────────────────────────────────────────────

  /// Restore a persisted session from secure storage without a network call.
  ///
  /// Call this before Firebase delivers its first auth event so the app shows
  /// a loading indicator instead of a flash of unauthenticated UI.
  Future<void> restoreSession() async {
    state = const AuthLoading();

    final token = await _storage.read(key: _kUserTokenKey) ?? '';
    final userJson = await _storage.read(key: _kCurrentUserKey) ?? '{}';

    UserStruct user;
    try {
      user = UserStruct.fromSerializableMap(
          jsonDecode(userJson) as Map<String, dynamic>);
    } catch (_) {
      user = UserStruct();
    }

    state = token.isNotEmpty
        ? _stateForUser(token, user)
        : const AuthUnauthenticated();
  }

  /// Full authentication handshake with the Touchline backend.
  ///
  /// Direct port of [initalRoute] from `lib/actions/actions.dart`.
  /// Preserves all branching logic and FlutterSecureStorage key names.
  Future<void> initialize({
    String? authEmail,
    String? authUserToken,
    String? uid,
  }) async {
    state = const AuthLoading();

    var userToken = authUserToken ?? '';
    final currentUser = UserStruct(email: authEmail);
    final cfg = ref.read(appConfigProvider);

    if (userToken != '') {
      // ── Has a stored token — validate it ──────────────────────────────────
      final tokenValid = await AuthGroup.isMyUserTokenValidCall.call(
        userToken: userToken,
        bLappId: cfg.projectId,
        bLRestApiKey: cfg.restApiKey,
      );

      if (tokenValid.bodyText == 'true') {
        // Token is still valid.
        if (currentUser.objectId == '') {
          // Fetch objectId by email (user object not yet cached locally).
          final result = await AuthGroup.getUserObjectIdByEmailCall.call(
            email: authEmail,
            bLappId: cfg.projectId,
            bLRestApiKey: cfg.restApiKey,
          );

          if (result.succeeded) {
            currentUser.objectId = AuthGroup.getUserObjectIdByEmailCall
                .objectId(result.jsonBody ?? '');
          }
        }
        // else: already have full user — skip objectId fetch.
      } else {
        // Token invalid — do a fresh exchange.
        if (currentUser.email != '') {
          final result = await AuthGroup.emailLoginTokenExchangeCall.call(
            email: currentUser.email,
            bLappId: cfg.projectId,
            bLRestApiKey: cfg.restApiKey,
          );

          if (result.succeeded) {
            final parsed =
                GuestLoginStruct.maybeFromMap(result.jsonBody ?? '');
            userToken = parsed?.userToken ?? userToken;
            currentUser.objectId = parsed?.objectId;
          } else {
            state = const AuthUnauthenticated(
                message: 'Failed to login without email specified');
            return;
          }
        } else {
          final result = await AuthGroup.guestLoginTokenExchangeCall.call(
            bLappId: cfg.projectId,
            bLRestApiKey: cfg.restApiKey,
          );

          if (result.succeeded) {
            final parsed =
                GuestLoginStruct.maybeFromMap(result.jsonBody ?? '');
            userToken = parsed?.userToken ?? userToken;
            currentUser.objectId = parsed?.objectId;
          } else {
            state = const AuthUnauthenticated(
                message: 'Failed to register guest user');
            return;
          }
        }
      }
    } else {
      // ── No token at all ───────────────────────────────────────────────────
      if (currentUser.email != '') {
        // Register the new user (fire-and-forget — result unused in original).
        await AuthGroup.registerNewUserCall.call(
          email: currentUser.email,
          bLappId: cfg.projectId,
          bLRestApiKey: cfg.restApiKey,
          uid: uid,
        );

        final result = await AuthGroup.emailLoginTokenExchangeCall.call(
          email: currentUser.email,
          bLappId: cfg.projectId,
          bLRestApiKey: cfg.restApiKey,
        );

        if (result.succeeded) {
          final parsed = GuestLoginStruct.maybeFromMap(result.jsonBody ?? '');
          userToken = parsed?.userToken ?? userToken;
          currentUser.objectId = parsed?.objectId;
        } else {
          state = const AuthUnauthenticated(
              message: 'Failed to login without email specified');
          return;
        }
      } else {
        // Guest with no token.
        final result = await AuthGroup.guestLoginTokenExchangeCall.call(
          bLappId: cfg.projectId,
          bLRestApiKey: cfg.restApiKey,
        );

        if (result.succeeded) {
          final parsed = GuestLoginStruct.maybeFromMap(result.jsonBody ?? '');
          userToken = parsed?.userToken ?? userToken;
          currentUser.objectId = parsed?.objectId;
        } else {
          state = const AuthUnauthenticated(
              message: 'Failed to register guest user');
          return;
        }
      }
    }

    await _doRefreshUserData(userToken: userToken, currentUser: currentUser);
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

  /// Fire-and-forget CRM lookup. Ports [createUserCRM] from actions.dart.
  Future<void> createUserCRM({required String? userEmail}) async {
    final cfg = ref.read(appConfigProvider);
    await CrmGroup.queryEmailCall.call(
      bLappId: cfg.projectId,
      bLRestApiKey: cfg.restApiKey,
      email: userEmail,
    );
  }

  /// Clear all persisted auth data and transition to [AuthUnauthenticated].
  Future<void> signOut() async {
    await _storage.delete(key: _kUserTokenKey);
    await _storage.delete(key: _kCurrentUserKey);
    await _storage.delete(key: _kCurrentUserObjectIdKey);
    state = const AuthUnauthenticated();
  }

  // ── Private helpers ────────────────────────────────────────────────────────

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
}
