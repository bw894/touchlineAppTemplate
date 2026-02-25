/// Touchline theming package.
///
/// Provides:
/// - [AppTheme]: ThemeData factory — call [AppTheme.build] with a [ClubThemeConfig]
/// - [ClubThemeConfig]: Per-club colour, typography, and branding configuration
/// - [TouchlineColors]: ThemeExtension for sport-specific and FF-custom colours
/// - [AppTextTheme]: TextTheme builder (used internally by AppTheme)
///
/// Usage:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.build(const HarriersConfig()),
/// )
/// ```
library theming;

export 'src/app_theme.dart';
export 'src/club_theme_config.dart';
export 'src/text_theme.dart';
export 'src/touchline_colors.dart';
