import 'package:flutter/material.dart';

import 'club_theme_config.dart';

/// Builds a [TextTheme] from a [ClubThemeConfig], replicating the type scale
/// defined in [FlutterFlowTheme] / [ThemeTypography].
///
/// All sizes, weights, and colours match the original FlutterFlow defaults.
/// The [fontFamily] name is embedded in each [TextStyle]; the actual font
/// loading (via GoogleFonts or asset bundles) is the responsibility of the
/// host app, keeping this package free of network I/O.
class AppTextTheme {
  const AppTextTheme._();

  static TextTheme build(ClubThemeConfig config) {
    final String family = config.fontFamily;

    // ignore: prefer_function_declarations_over_variables
    TextStyle s(
      Color color,
      double size,
      FontWeight weight,
    ) =>
        TextStyle(fontFamily: family, color: color, fontSize: size, fontWeight: weight);

    return TextTheme(
      // Display
      displayLarge: s(config.primaryText, 64, FontWeight.normal),
      displayMedium: s(config.primaryText, 44, FontWeight.normal),
      displaySmall: s(config.primaryText, 36, FontWeight.w600),
      // Headline
      headlineLarge: s(config.primaryText, 32, FontWeight.w600),
      headlineMedium: s(config.primaryText, 24, FontWeight.normal),
      headlineSmall: s(config.primaryText, 24, FontWeight.w500),
      // Title
      titleLarge: s(config.primaryText, 22, FontWeight.w500),
      // titleMedium/Small use `info` colour in FlutterFlowTheme (white in light mode)
      titleMedium: s(config.info, 18, FontWeight.normal),
      titleSmall: s(config.info, 16, FontWeight.w500),
      // Label
      labelLarge: s(config.secondaryText, 16, FontWeight.normal),
      labelMedium: s(config.secondaryText, 14, FontWeight.normal),
      labelSmall: s(config.secondaryText, 12, FontWeight.normal),
      // Body
      bodyLarge: s(config.primaryText, 16, FontWeight.normal),
      bodyMedium: s(config.primaryText, 14, FontWeight.normal),
      bodySmall: s(config.primaryText, 12, FontWeight.normal),
    );
  }
}
