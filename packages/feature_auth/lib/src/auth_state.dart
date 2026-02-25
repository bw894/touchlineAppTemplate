import 'package:api_client/api_client.dart';

/// Sealed union representing every possible state of the auth flow.
///
/// State machine:
/// ```
/// AuthInitial → AuthLoading → AuthAuthenticated
///                           → AuthGuest
///                           → AuthUnauthenticated
/// ```
sealed class AuthState {
  const AuthState();
}

/// App has just started; auth state is unknown.
final class AuthInitial extends AuthState {
  const AuthInitial();
}

/// Auth handshake or session restore is in progress.
final class AuthLoading extends AuthState {
  const AuthLoading();
}

/// A registered user who has a valid token and a non-empty email address.
final class AuthAuthenticated extends AuthState {
  const AuthAuthenticated({
    required this.userToken,
    required this.currentUser,
  });

  final String userToken;
  final UserStruct currentUser;
}

/// An anonymous guest user — has a valid token and objectId but no email.
final class AuthGuest extends AuthState {
  const AuthGuest({
    required this.userToken,
    required this.currentUser,
  });

  final String userToken;
  final UserStruct currentUser;
}

/// Auth failed or the user is not signed in.
final class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated({this.message});

  /// Optional error message surfaced to the UI for display.
  final String? message;
}
