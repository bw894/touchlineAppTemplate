import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:theming/theming.dart';

/// Kidderminster Harriers club configuration.
///
/// All values sourced from `example_apps/harriers/lib/app_constants.dart`
/// and the original FlutterFlow LightModeTheme.
///
/// Badge fields are CDN URLs — [SignInScreen] and other auth screens handle
/// both URL and local asset paths transparently.
class HarriersConfig extends AppConfig {
  const HarriersConfig();

  // --- Identity ---
  @override
  String get clubFullName => 'Kidderminster Harriers';
  @override
  String get clubShortName => 'Harriers';
  @override
  String get clubAbbreviation => 'KID';
  @override
  String get nicknamePlural => 'Harriers';

  // --- Assets (CDN URLs) ---
  @override
  String get badgeAssetPath =>
      'https://upload.wikimedia.org/wikipedia/en/thumb/6/6e/Kidderminster_Harriers_FC_crest.svg/1200px-Kidderminster_Harriers_FC_crest.svg.png';
  @override
  String get badgeOnPrimaryAssetPath =>
      'https://api.touchlineclub.com:7500/6D654B32-2E5D-4E11-98F9-BACF8B9930B5/C7DEECF4-82EB-4F42-86BD-49ACA7E19114/files/Harriers%20Logo%20PNG%20White.png';

  // --- API ---
  @override
  String get apiBaseUrl => 'https://api.touchlineclub.com:7500';
  @override
  String get projectId => '6D654B32-2E5D-4E11-98F9-BACF8B9930B5';
  @override
  String get restApiKey => 'C7DEECF4-82EB-4F42-86BD-49ACA7E19114';
  @override
  String get focusTeamObjectId => 'B96AD055-85E0-4380-921B-2821C895360F';

  // --- Links ---
  @override
  String get ticketingUrl => 'https://harriers.ktckts.com/';
  @override
  String get deepLinkUrl => 'harriers.dynalinks.app';

  // --- Deep linking ---
  @override
  String get dynalinkPublicKey => 'Zte7joPjjxFgUt7W8j2swVqc';
  @override
  String get dynalinkProjectId => 'kidderminster-harriers';

  // --- Content ---
  @override
  String get xFeedUrl => 'https://rss.app/feeds/v1.1/ug3Ueshgo6RN4rL9.json';
  @override
  String get bgImageUrl => 'https://harriers.co.uk/wp-content/uploads/04-2.jpg';

  // --- Team data ---
  @override
  List<String> get backupTeamObjectIds =>
      const ['B96AD055-85E0-4380-921B-2821C895360F'];
  @override
  String get settingsObjectId => 'BBB686DF-D995-42C6-A0EA-AC4E3F50F9E0';

  // --- Auth ---
  // TODO: update when the Touchline JWT exchange endpoint is deployed.
  @override
  String get touchlineAuthBaseUrl => 'https://auth.touchlineclub.com';

  // --- Branding ---
  @override
  ClubThemeConfig get theme => const ClubThemeConfig(
        primary: Color(0xFFEB2D2E),
        secondary: Color(0xFF222222),
        tertiary: Color(0xFFEE8B60),
        alternate: Color(0xFFE0E3E7),
        primaryText: Color(0xFF14181B),
        secondaryText: Color(0xFF57636C),
        primaryBackground: Color(0xFFF1F4F8),
        secondaryBackground: Color(0xFFFFFFFF),
        accent1: Color(0xFFE53B4D),
        accent2: Color(0x4D39D2C0),
        accent3: Color(0x4DEE8B60),
        accent4: Color(0xCCFFFFFF),
        success: Color(0xFF249689),
        warning: Color(0xFFF9CF58),
        error: Color(0xFFFF5963),
        info: Color(0xFFFFFFFF),
        predictorRed: Color(0xFFEA0007),
        predictorOrange: Color(0xFFF78900),
        predictorGreen: Color(0xFF007504),
        shopBorder: Color(0xFFD9D9D9),
        shopDark: Color(0xFF212121),
        fontFamily: 'Montserrat',
      );

  // Variant overrides — all defaults (v1/standard) for now.
  // Override individual variants here as Harriers' production variants are confirmed.
}
