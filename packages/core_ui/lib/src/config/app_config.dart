import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theming/theming.dart';

import 'package:core_ui/src/config/component_variants.dart';
import 'package:core_ui/src/config/programmes_config.dart';
import 'package:core_ui/src/config/shop_config.dart';
import 'package:core_ui/src/config/youth_config.dart';

/// Per-club configuration base class.
///
/// Club apps extend this and override only the fields they need.
///
/// Design rules:
/// - **Required fields** (identity, API, assets, branding) throw
///   [UnimplementedError] — the app compiles but fails immediately at runtime
///   if a club forgets to override them.
/// - **Optional fields** (variant choices, feature sub-configs) have sensible
///   defaults and are non-breaking to add.
/// - **Feature sub-configs** are separate classes — adding a new field to
///   [ShopConfig] requires no change in any existing club config.
class AppConfig {
  const AppConfig();

  // --- Required: identity ---
  String get clubFullName     => throw UnimplementedError('clubFullName');
  String get clubShortName    => throw UnimplementedError('clubShortName');
  String get clubAbbreviation => throw UnimplementedError('clubAbbreviation');
  String get nicknamePlural   => throw UnimplementedError('nicknamePlural');

  // --- Required: assets ---
  String get badgeAssetPath           => throw UnimplementedError('badgeAssetPath');
  String get badgeOnPrimaryAssetPath  => throw UnimplementedError('badgeOnPrimaryAssetPath');

  // --- Required: API ---
  String get apiBaseUrl        => throw UnimplementedError('apiBaseUrl');
  String get projectId         => throw UnimplementedError('projectId');
  String get restApiKey        => throw UnimplementedError('restApiKey');
  String get focusTeamObjectId => throw UnimplementedError('focusTeamObjectId');

  // --- Required: links ---
  String get ticketingUrl => throw UnimplementedError('ticketingUrl');
  String get deepLinkUrl  => throw UnimplementedError('deepLinkUrl');

  // --- Required: deep linking ---
  String get dynalinkPublicKey  => throw UnimplementedError('dynalinkPublicKey');
  String get dynalinkProjectId  => throw UnimplementedError('dynalinkProjectId');

  // --- Required: content ---
  String get xFeedUrl   => throw UnimplementedError('xFeedUrl');
  String get bgImageUrl => throw UnimplementedError('bgImageUrl');

  // --- Required: team data ---
  List<String> get backupTeamObjectIds => throw UnimplementedError('backupTeamObjectIds');
  String get settingsObjectId          => throw UnimplementedError('settingsObjectId');

  // --- Required: auth ---
  String get touchlineAuthBaseUrl => throw UnimplementedError('touchlineAuthBaseUrl');

  // --- Required: branding ---
  ClubThemeConfig get theme => throw UnimplementedError('theme');

  // --- Optional: shared UI defaults ---
  BorderRadius get cardBorderRadius => BorderRadius.circular(8);

  // --- Optional: component variant selection (defaults = v1/standard layout) ---
  XFeedVariant get xFeedVariant                         => XFeedVariant.card;
  NextFixtureSliderVariant get nextFixtureSliderVariant => NextFixtureSliderVariant.stack;
  SquadHubSliderVariant get squadHubSliderVariant       => SquadHubSliderVariant.carousel;
  PlayerProfileVariant get playerProfileVariant         => PlayerProfileVariant.standard;
  LeagueTableVariant get leagueTableVariant             => LeagueTableVariant.full;
  NewsFeedVariant get newsFeedVariant                   => NewsFeedVariant.cards;
  SocialIconsVariant get socialIconsVariant             => SocialIconsVariant.horizontal;
  AppBarVariant get appBarVariant                       => AppBarVariant.standard;
  PredictorVariant get predictorVariant                 => PredictorVariant.standard;
  TopBitVariant get topBitVariant                       => TopBitVariant.home;

  // --- Optional: feature sub-configs (all features enabled by default) ---
  ShopConfig get shop             => const ShopConfig();
  YouthConfig get youth           => const YouthConfig();
  ProgrammesConfig get programmes => const ProgrammesConfig();
}

/// Riverpod provider for the club's [AppConfig].
///
/// Override this at app entry point before calling [runApp]:
/// ```dart
/// ProviderScope(
///   overrides: [appConfigProvider.overrideWithValue(HarriersConfig())],
///   child: const MyApp(),
/// )
/// ```
final appConfigProvider = Provider<AppConfig>(
  (ref) => throw UnimplementedError('appConfigProvider must be overridden'),
);

/// Riverpod provider for the authenticated user's token.
///
/// Defaults to empty string (unauthenticated). Override with the actual token
/// from [feature_auth]'s [AuthNotifier] at the app entry point:
/// ```dart
/// userTokenProvider.overrideWith((ref) {
///   return ref.watch(authNotifierProvider.select((s) => s.userToken));
/// })
/// ```
final userTokenProvider = Provider<String>((ref) => '');
