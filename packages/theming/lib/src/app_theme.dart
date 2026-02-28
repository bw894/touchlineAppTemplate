import 'package:flutter/material.dart';

import 'text_theme.dart';
import 'club_theme_config.dart';
import 'touchline_colors.dart';

/// Static factory that converts a [ClubThemeConfig] into a [ThemeData].
///
/// Usage:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.build(const HarriersConfig()),
/// )
/// ```
///
/// Colour mapping:
/// - Standard Material 3 colours are placed in [ColorScheme].
/// - All FlutterFlow-specific / sport colours are placed in the
///   [TouchlineColors] [ThemeExtension].
class AppTheme {
  const AppTheme._();

  static ThemeData build(ClubThemeConfig config) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: config.primary,
      brightness: Brightness.light,
    ).copyWith(
      primary: config.primary,
      onPrimary: config.secondaryBackground,
      secondary: config.secondary,
      onSecondary: config.secondaryBackground,
      tertiary: config.tertiary,
      onTertiary: config.primaryBackground,
      error: config.error,
      onError: config.secondaryBackground,
      surface: config.primaryBackground,
      onSurface: config.primaryText,
      onSurfaceVariant: config.secondaryText,
      outline: config.alternate,
    );

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: config.primaryBackground,
      textTheme: AppTextTheme.build(config),
      extensions: [TouchlineColors.fromConfig(config)],
      useMaterial3: true,
    );
  }
}
