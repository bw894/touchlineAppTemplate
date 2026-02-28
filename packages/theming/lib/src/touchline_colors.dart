import 'package:flutter/material.dart';

import 'club_theme_config.dart';

/// ThemeExtension that exposes all Touchline/FlutterFlow custom colours via
/// the standard [Theme.of(context).extension<TouchlineColors>()] API.
///
/// Contains:
/// - 5 sport-specific colours (predictor, shop) — the primary purpose.
/// - Mirrors of all other FlutterFlowTheme colours that have no direct
///   Material 3 ColorScheme equivalent (alternate, accent1–4, success,
///   warning, info).  These are included so Phase 5 widget migration can
///   replace every `FlutterFlowTheme.of(context).X` call with
///   `Theme.of(context).extension<TouchlineColors>()!.X`.
class TouchlineColors extends ThemeExtension<TouchlineColors> {
  const TouchlineColors({
    // Sport-specific (primary purpose)
    required this.predictorRed,
    required this.predictorOrange,
    required this.predictorGreen,
    required this.shopBorder,
    required this.shopDark,
    // Non-M3-standard FF colours
    required this.alternate,
    required this.accent1,
    required this.accent2,
    required this.accent3,
    required this.accent4,
    required this.success,
    required this.warning,
    required this.info,
    // Convenience mirrors of M3-mappable colours (also in ColorScheme)
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.primaryText,
    required this.secondaryText,
    required this.primaryBackground,
    required this.secondaryBackground,
    required this.error,
  });

  // Sport-specific
  final Color predictorRed;
  final Color predictorOrange;
  final Color predictorGreen;
  final Color shopBorder;
  final Color shopDark;

  // Non-M3-standard
  final Color alternate;
  final Color accent1;
  final Color accent2;
  final Color accent3;
  final Color accent4;
  final Color success;
  final Color warning;
  final Color info;

  // M3-mirrored (also in ColorScheme)
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color primaryText;
  final Color secondaryText;
  final Color primaryBackground;
  final Color secondaryBackground;
  final Color error;

  factory TouchlineColors.fromConfig(ClubThemeConfig config) =>
      TouchlineColors(
        predictorRed: config.predictorRed,
        predictorOrange: config.predictorOrange,
        predictorGreen: config.predictorGreen,
        shopBorder: config.shopBorder,
        shopDark: config.shopDark,
        alternate: config.alternate,
        accent1: config.accent1,
        accent2: config.accent2,
        accent3: config.accent3,
        accent4: config.accent4,
        success: config.success,
        warning: config.warning,
        info: config.info,
        primary: config.primary,
        secondary: config.secondary,
        tertiary: config.tertiary,
        primaryText: config.primaryText,
        secondaryText: config.secondaryText,
        primaryBackground: config.primaryBackground,
        secondaryBackground: config.secondaryBackground,
        error: config.error,
      );

  @override
  TouchlineColors copyWith({
    Color? predictorRed,
    Color? predictorOrange,
    Color? predictorGreen,
    Color? shopBorder,
    Color? shopDark,
    Color? alternate,
    Color? accent1,
    Color? accent2,
    Color? accent3,
    Color? accent4,
    Color? success,
    Color? warning,
    Color? info,
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? primaryText,
    Color? secondaryText,
    Color? primaryBackground,
    Color? secondaryBackground,
    Color? error,
  }) =>
      TouchlineColors(
        predictorRed: predictorRed ?? this.predictorRed,
        predictorOrange: predictorOrange ?? this.predictorOrange,
        predictorGreen: predictorGreen ?? this.predictorGreen,
        shopBorder: shopBorder ?? this.shopBorder,
        shopDark: shopDark ?? this.shopDark,
        alternate: alternate ?? this.alternate,
        accent1: accent1 ?? this.accent1,
        accent2: accent2 ?? this.accent2,
        accent3: accent3 ?? this.accent3,
        accent4: accent4 ?? this.accent4,
        success: success ?? this.success,
        warning: warning ?? this.warning,
        info: info ?? this.info,
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        tertiary: tertiary ?? this.tertiary,
        primaryText: primaryText ?? this.primaryText,
        secondaryText: secondaryText ?? this.secondaryText,
        primaryBackground: primaryBackground ?? this.primaryBackground,
        secondaryBackground: secondaryBackground ?? this.secondaryBackground,
        error: error ?? this.error,
      );

  @override
  TouchlineColors lerp(TouchlineColors? other, double t) {
    if (other == null) return this;
    return TouchlineColors(
      predictorRed: Color.lerp(predictorRed, other.predictorRed, t)!,
      predictorOrange: Color.lerp(predictorOrange, other.predictorOrange, t)!,
      predictorGreen: Color.lerp(predictorGreen, other.predictorGreen, t)!,
      shopBorder: Color.lerp(shopBorder, other.shopBorder, t)!,
      shopDark: Color.lerp(shopDark, other.shopDark, t)!,
      alternate: Color.lerp(alternate, other.alternate, t)!,
      accent1: Color.lerp(accent1, other.accent1, t)!,
      accent2: Color.lerp(accent2, other.accent2, t)!,
      accent3: Color.lerp(accent3, other.accent3, t)!,
      accent4: Color.lerp(accent4, other.accent4, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      primaryBackground:
          Color.lerp(primaryBackground, other.primaryBackground, t)!,
      secondaryBackground:
          Color.lerp(secondaryBackground, other.secondaryBackground, t)!,
      error: Color.lerp(error, other.error, t)!,
    );
  }
}
