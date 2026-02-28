/// Touchline auth feature package.
///
/// Provides:
/// - [AuthNotifier]: Riverpod Notifier managing auth state (Firebase + Touchline JWT)
/// - [AuthState]: Sealed union — initial | loading | authenticated | guest | unauthenticated
/// - [authNotifierProvider]: App-wide auth provider
/// - Auth flow screens: SignInScreen, CreateAccountScreen, ForgotPasswordScreen
/// - Account screens: AccountScreen, AccountDetailsScreen, AccountPrivatePublicScreen
///
/// CRITICAL: Preserves all FFAppState auth fields and FlutterSecureStorage
/// key names exactly (see MIGRATION_PLAN.md Appendix B).
library feature_auth;

// State
export 'src/auth_state.dart';
export 'src/auth_notifier.dart';
export 'src/providers.dart';

// Screens — auth flow
export 'src/screens/sign_in_screen.dart';
export 'src/screens/create_account_screen.dart';
export 'src/screens/forgot_password_screen.dart';

// Screens — account management
export 'src/screens/account_screen.dart';
export 'src/screens/account_details_screen.dart';
export 'src/screens/account_private_public_screen.dart';
