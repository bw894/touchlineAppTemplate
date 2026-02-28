import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:theming/theming.dart';

void main() {
  // GoogleFonts loads fonts asynchronously — initialise the binding so the
  // ServicesBinding is available, but allow runtime fetching (the default) so
  // GoogleFonts does not throw when font files are not bundled as test assets.
  TestWidgetsFlutterBinding.ensureInitialized();
  // ---------------------------------------------------------------------------
  // Default config (matches LightModeTheme defaults from FlutterFlowTheme)
  // ---------------------------------------------------------------------------
  group('AppTheme.build — default config', () {
    late ThemeData theme;

    setUpAll(() {
      theme = AppTheme.build(const ClubThemeConfig());
    });

    test('builds without throwing', () {
      expect(theme, isNotNull);
    });

    test('useMaterial3 is true', () {
      expect(theme.useMaterial3, isTrue);
    });

    // --- ColorScheme ---
    test('colorScheme.primary matches config.primary', () {
      expect(theme.colorScheme.primary, equals(const Color(0xFFD5242D)));
    });

    test('colorScheme.secondary matches config.secondary', () {
      expect(theme.colorScheme.secondary, equals(const Color(0xFF181829)));
    });

    test('colorScheme.tertiary matches config.tertiary', () {
      expect(theme.colorScheme.tertiary, equals(const Color(0xFFEE8B60)));
    });

    test('colorScheme.error matches config.error', () {
      expect(theme.colorScheme.error, equals(const Color(0xFFFF5963)));
    });

    test('colorScheme.surface matches config.primaryBackground', () {
      expect(theme.colorScheme.surface, equals(const Color(0xFFF1F1F1)));
    });

    test('colorScheme.onSurface matches config.primaryText', () {
      expect(theme.colorScheme.onSurface, equals(const Color(0xFF14181B)));
    });

    test('colorScheme.onSurfaceVariant matches config.secondaryText', () {
      expect(
          theme.colorScheme.onSurfaceVariant, equals(const Color(0xFF57636C)));
    });

    // --- TouchlineColors extension ---
    test('TouchlineColors extension is registered', () {
      expect(theme.extension<TouchlineColors>(), isNotNull);
    });

    test('sport-specific: predictorRed', () {
      expect(theme.extension<TouchlineColors>()!.predictorRed,
          equals(const Color(0xFFEA0007)));
    });

    test('sport-specific: predictorOrange', () {
      expect(theme.extension<TouchlineColors>()!.predictorOrange,
          equals(const Color(0xFFF78900)));
    });

    test('sport-specific: predictorGreen', () {
      expect(theme.extension<TouchlineColors>()!.predictorGreen,
          equals(const Color(0xFF007504)));
    });

    test('sport-specific: shopBorder', () {
      expect(theme.extension<TouchlineColors>()!.shopBorder,
          equals(const Color(0xFFD9D9D9)));
    });

    test('sport-specific: shopDark', () {
      expect(theme.extension<TouchlineColors>()!.shopDark,
          equals(const Color(0xFF212121)));
    });

    test('non-M3 colours in extension: success', () {
      expect(theme.extension<TouchlineColors>()!.success,
          equals(const Color(0xFF249689)));
    });

    test('non-M3 colours in extension: warning', () {
      expect(theme.extension<TouchlineColors>()!.warning,
          equals(const Color(0xFFF9CF58)));
    });

    test('non-M3 colours in extension: info (white)', () {
      expect(theme.extension<TouchlineColors>()!.info,
          equals(const Color(0xFFFFFFFF)));
    });

    test('non-M3 colours in extension: alternate', () {
      expect(theme.extension<TouchlineColors>()!.alternate,
          equals(const Color(0xFFE0E3E7)));
    });

    // --- TextTheme (sizes match FlutterFlowTheme.ThemeTypography) ---
    test('textTheme.displayLarge fontSize = 64', () {
      expect(theme.textTheme.displayLarge?.fontSize, equals(64.0));
    });

    test('textTheme.displaySmall fontWeight = w600', () {
      expect(theme.textTheme.displaySmall?.fontWeight, equals(FontWeight.w600));
    });

    test('textTheme.headlineLarge fontWeight = w600', () {
      expect(
          theme.textTheme.headlineLarge?.fontWeight, equals(FontWeight.w600));
    });

    test('textTheme.titleMedium fontSize = 18', () {
      expect(theme.textTheme.titleMedium?.fontSize, equals(18.0));
    });

    test('textTheme.titleMedium colour = info (white)', () {
      expect(theme.textTheme.titleMedium?.color, equals(const Color(0xFFFFFFFF)));
    });

    test('textTheme.labelSmall fontSize = 12', () {
      expect(theme.textTheme.labelSmall?.fontSize, equals(12.0));
    });

    test('textTheme.bodyMedium fontSize = 14', () {
      expect(theme.textTheme.bodyMedium?.fontSize, equals(14.0));
    });

    test('scaffoldBackgroundColor = primaryBackground', () {
      expect(theme.scaffoldBackgroundColor, equals(const Color(0xFFF1F1F1)));
    });
  });

  // ---------------------------------------------------------------------------
  // Custom config — club overrides
  // ---------------------------------------------------------------------------
  group('AppTheme.build — custom config', () {
    const customPrimary = Color(0xFF003399);
    const customPredictorRed = Color(0xFFCC0000);
    const customFont = 'Roboto';

    late ThemeData theme;

    setUpAll(() {
      theme = AppTheme.build(const ClubThemeConfig(
        primary: customPrimary,
        predictorRed: customPredictorRed,
        fontFamily: customFont,
      ));
    });

    test('colorScheme.primary reflects override', () {
      expect(theme.colorScheme.primary, equals(customPrimary));
    });

    test('TouchlineColors.primary reflects override', () {
      expect(
          theme.extension<TouchlineColors>()!.primary, equals(customPrimary));
    });

    test('TouchlineColors.predictorRed reflects override', () {
      expect(theme.extension<TouchlineColors>()!.predictorRed,
          equals(customPredictorRed));
    });

    test('non-overridden defaults are preserved', () {
      expect(theme.extension<TouchlineColors>()!.predictorGreen,
          equals(const Color(0xFF007504)));
    });
  });

  // ---------------------------------------------------------------------------
  // TouchlineColors.copyWith and lerp
  // ---------------------------------------------------------------------------
  group('TouchlineColors', () {
    const base = ClubThemeConfig();

    test('copyWith overrides single field', () {
      final colors = TouchlineColors.fromConfig(base);
      final updated = colors.copyWith(predictorRed: const Color(0xFF000000));
      expect(updated.predictorRed, equals(const Color(0xFF000000)));
      expect(updated.predictorGreen, equals(colors.predictorGreen));
    });

    test('lerp with null returns self', () {
      final colors = TouchlineColors.fromConfig(base);
      expect(colors.lerp(null, 0.5), same(colors));
    });

    test('lerp at t=0 returns start', () {
      final a = TouchlineColors.fromConfig(base);
      final b = TouchlineColors.fromConfig(
          const ClubThemeConfig(predictorRed: Color(0xFF000000)));
      final result = a.lerp(b, 0.0);
      expect(result.predictorRed, equals(a.predictorRed));
    });

    test('lerp at t=1 returns end', () {
      final a = TouchlineColors.fromConfig(base);
      final b = TouchlineColors.fromConfig(
          const ClubThemeConfig(predictorRed: Color(0xFF000000)));
      final result = a.lerp(b, 1.0);
      expect(result.predictorRed, equals(const Color(0xFF000000)));
    });
  });
}
