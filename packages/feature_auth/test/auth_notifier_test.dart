import 'package:api_client/api_client.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// These tests verify the AuthNotifier state machine structure and the
// restoreSession / signOut flows without network access.
//
// Full API mocking (initialize() flow) requires the API client to be
// injectable — that refactor is deferred to a future phase.

void main() {
  group('AuthNotifier — initial state', () {
    test('starts as AuthInitial', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      expect(container.read(authNotifierProvider), isA<AuthInitial>());
    });
  });

  group('AuthNotifier — signOut', () {
    test('transitions to AuthUnauthenticated', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await container.read(authNotifierProvider.notifier).signOut();

      expect(
        container.read(authNotifierProvider),
        isA<AuthUnauthenticated>(),
      );
    });

    test('signOut clears error message', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await container.read(authNotifierProvider.notifier).signOut();

      final state =
          container.read(authNotifierProvider) as AuthUnauthenticated;
      expect(state.message, isNull);
    });
  });

  group('AuthNotifier — restoreSession with no persisted data', () {
    test('transitions to AuthUnauthenticated when storage is empty', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await container.read(authNotifierProvider.notifier).restoreSession();

      expect(
        container.read(authNotifierProvider),
        isA<AuthUnauthenticated>(),
      );
    });
  });

  group('AuthState sealed class', () {
    test('AuthAuthenticated exposes userToken and currentUser', () {
      final user = UserStruct(email: 'test@example.com');
      final state = AuthAuthenticated(userToken: 'tok123', currentUser: user);

      expect(state.userToken, 'tok123');
      expect(state.currentUser.email, 'test@example.com');
    });

    test('AuthGuest exposes userToken and currentUser', () {
      final user = UserStruct();
      final state = AuthGuest(userToken: 'guest_tok', currentUser: user);

      expect(state.userToken, 'guest_tok');
      expect(state.currentUser.email, '');
    });

    test('AuthUnauthenticated message defaults to null', () {
      const state = AuthUnauthenticated();
      expect(state.message, isNull);
    });

    test('AuthUnauthenticated carries error message', () {
      const state =
          AuthUnauthenticated(message: 'Failed to register guest user');
      expect(state.message, 'Failed to register guest user');
    });
  });
}
