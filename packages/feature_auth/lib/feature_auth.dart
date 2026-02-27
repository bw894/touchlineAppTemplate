/// Touchline auth feature package.
///
/// Provides:
/// - [AuthNotifier]: Riverpod Notifier managing auth state
/// - [AuthState]: Sealed union — initial | loading | authenticated | guest | unauthenticated
/// - [authNotifierProvider]: App-wide auth provider
/// - Account screens: AccountScreen, AccountDetailsScreen, AccountPrivatePublicScreen
///
/// CRITICAL: Preserves all FFAppState auth fields and FlutterSecureStorage
/// key names exactly (see MIGRATION_PLAN.md Appendix B).
library feature_auth;

// State
export 'src/auth_state.dart';
export 'src/auth_notifier.dart';
export 'src/providers.dart';

// Screens
export 'src/screens/account_screen.dart';
export 'src/screens/account_details_screen.dart';
export 'src/screens/account_private_public_screen.dart';
