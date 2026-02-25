import 'package:feature_auth/src/auth_notifier.dart';
import 'package:feature_auth/src/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// App-wide auth provider.
///
/// Overriding this provider is not required — it is self-contained.
/// Override [appConfigProvider] (from `core_ui`) at the app entry point
/// instead, so [AuthNotifier] can read club credentials.
final authNotifierProvider =
    NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);
