// ============================================================
// STEP 1 — Club configuration
//
// Rename this class to [ClubName]Config, fill every field below,
// then update main.dart to use your new class.
// ============================================================

import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:theming/theming.dart';

/// Template club configuration — copy and fill in all required fields.
///
/// Every `throw UnimplementedError(...)` line MUST be replaced with a real
/// value before the app is usable.  The app compiles fine without them but
/// will crash at runtime as soon as any missing field is accessed.
///
/// Fields marked **required** throw [UnimplementedError].
/// Fields marked **optional** have defaults that you can override if needed.
// ignore: avoid_implementing_value_types
class TemplateClubConfig extends AppConfig {
  const TemplateClubConfig();

  // ------------------------------------------------------------------
  // Identity — required
  // ------------------------------------------------------------------

  /// Full display name, e.g. 'Kidderminster Harriers'.
  @override
  String get clubFullName => throw UnimplementedError('Set clubFullName');

  /// Short name used in compact UI, e.g. 'Harriers'.
  @override
  String get clubShortName => throw UnimplementedError('Set clubShortName');

  /// 3-letter code used in fixture tables, e.g. 'KID'.
  @override
  String get clubAbbreviation => throw UnimplementedError('Set clubAbbreviation');

  /// Plural nickname used in headings, e.g. 'The Robins'.
  @override
  String get nicknamePlural => throw UnimplementedError('Set nicknamePlural');

  // ------------------------------------------------------------------
  // Assets — required
  // These can be CDN URLs (https://...) or local asset paths (assets/...).
  // ------------------------------------------------------------------

  /// Club badge on a neutral background (shown on sign-in, profile etc.).
  @override
  String get badgeAssetPath => throw UnimplementedError('Set badgeAssetPath');

  /// Club badge on the primary-colour background (shown in nav circle button).
  @override
  String get badgeOnPrimaryAssetPath =>
      throw UnimplementedError('Set badgeOnPrimaryAssetPath');

  // ------------------------------------------------------------------
  // API — required
  // Get these values from the Touchline dashboard for your club.
  // ------------------------------------------------------------------

  /// Touchline API base URL — do not change this; shared across all clubs.
  @override
  String get apiBaseUrl => 'https://api.touchlineclub.com:7500';

  /// Backendless/Touchline project ID (UUID).
  @override
  String get projectId => throw UnimplementedError('Set projectId');

  /// Backendless/Touchline REST API key (UUID).
  @override
  String get restApiKey => throw UnimplementedError('Set restApiKey');

  /// Backendless object ID of the club's first-team record.
  @override
  String get focusTeamObjectId => throw UnimplementedError('Set focusTeamObjectId');

  // ------------------------------------------------------------------
  // Links — required
  // ------------------------------------------------------------------

  /// Ticketing portal URL — loaded in the Tickets tab WebView.
  @override
  String get ticketingUrl => throw UnimplementedError('Set ticketingUrl');

  /// Dynalink deep-link domain, e.g. 'yourclub.dynalinks.app'.
  @override
  String get deepLinkUrl => throw UnimplementedError('Set deepLinkUrl');

  // ------------------------------------------------------------------
  // Dynalink deep-link SDK — required
  // Get these from the Dynalink dashboard for your club project.
  // ------------------------------------------------------------------

  @override
  String get dynalinkPublicKey => throw UnimplementedError('Set dynalinkPublicKey');

  @override
  String get dynalinkProjectId => throw UnimplementedError('Set dynalinkProjectId');

  // ------------------------------------------------------------------
  // Content — required
  // ------------------------------------------------------------------

  /// RSS.app JSON feed URL for the X / Twitter section on the home page.
  @override
  String get xFeedUrl => throw UnimplementedError('Set xFeedUrl');

  /// Hero/background image URL shown behind the TopBitWidget.
  @override
  String get bgImageUrl => throw UnimplementedError('Set bgImageUrl');

  // ------------------------------------------------------------------
  // Team data — required
  // ------------------------------------------------------------------

  /// Fallback team object IDs used when the signed-in user has no teams.
  @override
  List<String> get backupTeamObjectIds =>
      throw UnimplementedError('Set backupTeamObjectIds');

  /// Backendless object ID of the club's settings record.
  @override
  String get settingsObjectId => throw UnimplementedError('Set settingsObjectId');

  // ------------------------------------------------------------------
  // Auth — required
  // ------------------------------------------------------------------

  /// Base URL for the Touchline JWT exchange endpoint.
  /// After Firebase sign-in the app POSTs the ID token here to receive a
  /// Touchline JWT, which is stored as the bearer token for API calls.
  @override
  String get touchlineAuthBaseUrl => 'https://auth.touchlineclub.com';

  // ------------------------------------------------------------------
  // Branding — required
  // Pick colours that match the club's identity.
  // ------------------------------------------------------------------

  @override
  ClubThemeConfig get theme => const ClubThemeConfig(
        // ── Primary / secondary brand colours ──────────────────────────
        primary: Color(0xFF000000), // Club primary colour
        secondary: Color(0xFFFFFFFF), // Club secondary colour
        tertiary: Color(0xFF888888),
        alternate: Color(0xFF444444),

        // ── Text ───────────────────────────────────────────────────────
        primaryText: Color(0xFF14181B),
        secondaryText: Color(0xFF57636C),

        // ── Backgrounds ────────────────────────────────────────────────
        primaryBackground: Color(0xFFF1F4F8),
        secondaryBackground: Color(0xFFFFFFFF),

        // ── Accents / status ───────────────────────────────────────────
        accent1: Color(0x4C4B39EF),
        accent2: Color(0x4D39D2C0),
        accent3: Color(0x4DEE8B60),
        accent4: Color(0xCCFFFFFF),
        success: Color(0xFF249689),
        warning: Color(0xFFF9CF58),
        error: Color(0xFFFF5963),
        info: Color(0xFFFFFFFF),

        // ── Predictor colours ──────────────────────────────────────────
        predictorRed: Color(0xFFEA0007),
        predictorOrange: Color(0xFFF78900),
        predictorGreen: Color(0xFF007504),

        // ── Shop ───────────────────────────────────────────────────────
        shopBorder: Color(0xFFD9D9D9),
        shopDark: Color(0xFF212121),

        // ── Font ───────────────────────────────────────────────────────
        // Must match an entry in pubspec.yaml > flutter > fonts.
        fontFamily: 'Roboto',
      );

  // ------------------------------------------------------------------
  // Optional overrides
  // Only add these if you want non-default values.
  //
  // @override BorderRadius get cardBorderRadius => BorderRadius.circular(8);
  // @override XFeedVariant get xFeedVariant => XFeedVariant.card;
  // @override NextFixtureSliderVariant get nextFixtureSliderVariant => NextFixtureSliderVariant.stack;
  // @override SquadHubSliderVariant get squadHubSliderVariant => SquadHubSliderVariant.carousel;
  // @override PlayerProfileVariant get playerProfileVariant => PlayerProfileVariant.standard;
  // @override LeagueTableVariant get leagueTableVariant => LeagueTableVariant.full;
  // @override NewsFeedVariant get newsFeedVariant => NewsFeedVariant.cards;
  // @override SocialIconsVariant get socialIconsVariant => SocialIconsVariant.horizontal;
  // @override AppBarVariant get appBarVariant => AppBarVariant.standard;
  // ------------------------------------------------------------------
}
