import 'package:flutter/material.dart';

/// Per-club colour, typography, and branding configuration.
///
/// Used by [AppTheme.build] to produce a [ThemeData].
/// Club apps extend this and override fields as needed.
class ClubThemeConfig {
  const ClubThemeConfig({
    // Standard M3-mappable colours
    this.primary = const Color(0xFFD5242D),
    this.secondary = const Color(0xFF181829),
    this.tertiary = const Color(0xFFEE8B60),
    this.alternate = const Color(0xFFE0E3E7),
    this.primaryText = const Color(0xFF14181B),
    this.secondaryText = const Color(0xFF57636C),
    this.primaryBackground = const Color(0xFFF1F1F1),
    this.secondaryBackground = const Color(0xFFFFFFFF),
    this.accent1 = const Color(0x4C4B39EF),
    this.accent2 = const Color(0x4D39D2C0),
    this.accent3 = const Color(0x4DEE8B60),
    this.accent4 = const Color(0xCCFFFFFF),
    this.success = const Color(0xFF249689),
    this.warning = const Color(0xFFF9CF58),
    this.error = const Color(0xFFFF5963),
    this.info = const Color(0xFFFFFFFF),
    // Sport-specific colours (→ TouchlineColors ThemeExtension)
    this.predictorRed = const Color(0xFFEA0007),
    this.predictorOrange = const Color(0xFFF78900),
    this.predictorGreen = const Color(0xFF007504),
    this.shopBorder = const Color(0xFFD9D9D9),
    this.shopDark = const Color(0xFF212121),
    // Typography
    this.fontFamily = 'Inter',
  });

  // --- Standard colours ---
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color alternate;
  final Color primaryText;
  final Color secondaryText;
  final Color primaryBackground;
  final Color secondaryBackground;
  final Color accent1;
  final Color accent2;
  final Color accent3;
  final Color accent4;
  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  // --- Sport-specific colours ---
  final Color predictorRed;
  final Color predictorOrange;
  final Color predictorGreen;
  final Color shopBorder;
  final Color shopDark;

  // --- Typography ---
  final String fontFamily;
}
