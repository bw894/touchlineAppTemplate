/// Touchline auth feature package.
///
/// Provides:
/// - [AuthNotifier]: Riverpod StateNotifier managing auth state
/// - [AuthState]: Sealed union — initial | loading | authenticated | guest | unauthenticated
/// - [authNotifierProvider]: App-wide auth provider
/// - Account screens: login, guest, account details
///
/// CRITICAL: Preserves all FFAppState auth fields and FlutterSecureStorage
/// key names exactly (see MIGRATION_PLAN.md Appendix B).
///
/// Migration note: Populated in Phase 4 of MIGRATION_PLAN.md
library feature_auth;

// State
// export 'src/auth_state.dart';
// export 'src/auth_notifier.dart';
// export 'src/providers.dart';

// Screens
// export 'src/screens/login_screen.dart';
// export 'src/screens/account_screen.dart';
