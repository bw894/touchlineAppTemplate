# Touchline — FlutterFlow to Clean Flutter: Migration Plan

> **Sequential execution guide for Claude Code.**
> Find the first unchecked `[ ]` item and continue from there.
> Mark items `[x]` immediately upon completion.
> Do NOT modify code that is not referenced by the current phase.

---

## Quick Reference

| Item | Value |
|---|---|
| State management | Riverpod (`flutter_riverpod`) |
| Routing | GoRouter (already in use — wrapper removal only) |
| Theming | `ThemeData` + `ThemeExtension` |
| Loading spinners | **`flutter_spinkit` — keep intentionally** |
| Component variants | Enum-driven single widget (see Section 4) |
| API base URL | `https://api.touchlineclub.com:7500/{projectId}/{restAPIKey}` |
| Storage keys | Never rename — preserve exactly |

---

## Codebase Snapshot (at migration start)

- **110** page/screen widgets + **108** models across **31** feature directories
- **75** data struct files in `lib/backend/schema/structs/`
- **100+** API endpoint call classes in `lib/backend/api_requests/api_calls.dart`
- **120+** pub dependencies
- FlutterFlow utilities in `lib/flutter_flow/`
- Global state in `lib/app_state.dart` (FFAppState singleton)
- White-label config in `lib/library_values.dart`

---

## Target Monorepo Structure

```
touchline/                        ← monorepo root
├── apps/
│   ├── club_app_1/               ← e.g. Harriers
│   │   ├── lib/
│   │   │   ├── main.dart         ← ProviderScope + AppConfig injection
│   │   │   └── app.dart          ← MaterialApp.router
│   │   ├── assets/               ← club badge, club-specific images only
│   │   ├── app_config.dart       ← implements AppConfig
│   │   └── pubspec.yaml
│   ├── club_app_2/
│   └── _template/                ← seed for new clubs
│
├── packages/
│   ├── core_ui/                  ← shared widgets, tokens, extensions
│   ├── theming/                  ← ThemeData factory + ClubThemeConfig
│   ├── api_client/               ← HTTP layer + all data structs (pure Dart)
│   ├── feature_match_centre/     ← fixtures, results, live text, stats
│   ├── feature_player/           ← squad hub, player profiles, lineups
│   ├── feature_predictor/        ← predictor, lineup builder, polls
│   ├── feature_news/             ← WordPress, CMS, X feed, videos
│   ├── feature_auth/             ← login, guest, CRM, token management
│   ├── feature_shop/             ← shop, cart, checkout, orders
│   ├── feature_events/           ← team events, RSVP, parking, youth
│   ├── feature_programmes/       ← digital programmes
│   └── feature_league/           ← league tables
│
├── melos.yaml
├── analysis_options.yaml         ← shared strict lints
└── CLAUDE.md                     ← Claude Code entry point
```

---

## Section 1 — FlutterFlow Constructs to Remove

### 1.1 Files and classes to eliminate

| Construct | Current Location | Replacement |
|---|---|---|
| `FFAppState` | `lib/app_state.dart` | Riverpod `StateNotifier` / `AsyncNotifier` providers |
| `FlutterFlowTheme` | `lib/flutter_flow/flutter_flow_theme.dart` | `Theme.of(context)` + `ThemeExtension` |
| `FlutterFlowModel` base class | `lib/flutter_flow/flutter_flow_model.dart` | `ConsumerWidget` + scoped `StateNotifierProvider` |
| `FlutterFlowDynamicModels` | `lib/flutter_flow/flutter_flow_model.dart` | `provider.family<T, Key>` |
| `FFRoute` + `serialization_util.dart` | `lib/flutter_flow/` | Native GoRouter `GoRoute` with typed extras |
| `flutter_flow_util.dart` helpers | `lib/flutter_flow/flutter_flow_util.dart` | Extension methods in `core_ui` |
| `custom_functions.dart` | `lib/flutter_flow/custom_functions.dart` | Extension methods in `core_ui/utils` |
| `FFButtonWidget` | `lib/flutter_flow/` | `AppButton` in `core_ui` |
| `FlutterFlowIconButton` | `lib/flutter_flow/` | `AppIconButton` in `core_ui` |
| `FlutterFlowChoiceChips` | `lib/flutter_flow/` | `AppChoiceChips` in `core_ui` |
| `FlutterFlowDropDown` | `lib/flutter_flow/` | `AppDropdown` in `core_ui` |
| `FlutterFlowCountController` | `lib/flutter_flow/` | `AppCountController` in `core_ui` |
| `FlutterFlowButtonTabBar` | `lib/flutter_flow/` | `AppTabBar` in `core_ui` |
| `FlutterFlowExpandedImageView` | `lib/flutter_flow/` | `AppImageViewer` in `core_ui` |
| `FlutterFlowWebView` | `lib/flutter_flow/` | `webview_flutter` directly |
| `library_values.dart` | `lib/library_values.dart` | `AppConfig` abstract class |

### 1.2 State mapping (FFAppState → Riverpod)

| FFAppState field | Riverpod provider | Package |
|---|---|---|
| `userToken`, `currentUser`, `currentUserObjectId` | `authNotifierProvider` | `feature_auth` |
| `cart`, `newOrder`, `checkout`, `savedShippingDetails` | `cartNotifierProvider`, `checkoutNotifierProvider` | `feature_shop` |
| `selectedPlayersLineupBuilder`, `playersForLineupsBuilder` | `lineupBuilderNotifierProvider` | `feature_predictor` |
| `pageViewIndex`, `activeTabBarIndex` | Local `StateProvider` per widget | (no package — widget-local) |
| `bottomPaddingHeight` | `uiStateProvider` | `core_ui` |
| `campaignObjectIds` | `campaignProvider` | `feature_events` |
| `currentMatchObjectId` | `currentMatchProvider` | `feature_match_centre` |
| `currentPlayerIndex` | Local `StateProvider` | (widget-local) |
| `playingCommentary` | `commentaryNotifierProvider` | `feature_match_centre` |

### 1.3 Packages to remove

| Remove | Reason | Alternative |
|---|---|---|
| `provider` | Replaced by Riverpod | `flutter_riverpod` |
| `webviewx_plus` (git fork) | Unmaintained fork | `webview_flutter` (official) |
| `expandable_page_view` | Standard `PageView` sufficient | `PageView` |
| `page_transition` | GoRouter handles transitions | GoRouter `CustomTransitionPage` |
| `dropdown_button2` | Material 3 has `DropdownMenu` | `DropdownMenu` |
| `aligned_tooltip` | Standard `Tooltip` sufficient | `Tooltip` |

### 1.4 Packages to keep (already clean)

`go_router`, `cached_network_image`, `http`, `shared_preferences`,
`flutter_secure_storage`, `sqflite`, `lottie`, `video_player`,
`youtube_player_iframe`, `image_picker`, `font_awesome_flutter`,
`google_fonts`, `percent_indicator`, `uuid`, `equatable`,
**`flutter_spinkit`** (preferred loading indicator — keep intentionally),
`auto_size_text`, `smooth_page_indicator`, `rxdart`, `collection`

---

## Section 2 — State Management Pattern

### 2.1 Provider structure

```dart
// feature_auth/lib/src/auth_notifier.dart
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._apiClient, this._storage) : super(const AuthState.initial());

  Future<void> initialise() async { /* port initalRoute() logic exactly */ }
  Future<void> login(String email, String password) async { ... }
  Future<void> loginAsGuest() async { ... }
  Future<void> logout() async { ... }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(apiClientProvider), ref.watch(storageProvider)),
);
```

### 2.2 App entry point

```dart
// apps/club_app_1/lib/main.dart
void main() {
  runApp(
    ProviderScope(
      overrides: [
        appConfigProvider.overrideWithValue(const HarriersConfig()),
      ],
      child: const TouchlineApp(),
    ),
  );
}
```

### 2.3 Widget pattern

```dart
// Before (FlutterFlow)
class XxxWidget extends StatefulWidget { ... }
class _XxxWidgetState extends State<XxxWidget> {
  late XxxModel _model;
  // uses context.watch<FFAppState>()
}

// After (clean)
class XxxWidget extends ConsumerWidget {
  const XxxWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(xxxProvider);
    // ...
  }
}
```

---

## Section 3 — Theming Pattern

### 3.1 ThemeData factory

```dart
// packages/theming/lib/app_theme.dart
class AppTheme {
  static ThemeData build(ClubThemeConfig config) => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: config.primaryColor),
    textTheme: _buildTextTheme(config.fontFamily),
    extensions: [TouchlineColors.fromConfig(config)],
  );
}

// packages/theming/lib/club_theme_config.dart
class ClubThemeConfig {
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  final Color alternateColor;
  final Color primaryText;
  final Color secondaryText;
  final Color primaryBackground;
  final Color secondaryBackground;
  final Color accent1, accent2, accent3, accent4;
  final Color success, warning, error, info;
  // Sport-specific
  final Color predictorRed, predictorOrange, predictorGreen;
  final Color shopBorder, shopDark;
  final String fontFamily;
}
```

### 3.2 Colour migration

```dart
// Before
FlutterFlowTheme.of(context).primary
FlutterFlowTheme.of(context).primaryText
FlutterFlowTheme.of(context).predictorRed

// After
Theme.of(context).colorScheme.primary
Theme.of(context).colorScheme.onSurface
Theme.of(context).extension<TouchlineColors>()!.predictorRed
```

---

## Section 4 — Component Variant Strategy

### 4.1 The problem

Many components exist in multiple layout variants (previously labelled v1–v4).
**All variants are in production.** They share identical data and business logic —
only the visual layout differs. Different club apps use different variants.

### 4.2 The solution: enum-driven variant selection

Each component becomes a **single widget** with a `variant` parameter.
The club app's `AppConfig` specifies which variant each section uses.
Layout-specific code lives in private sub-widgets selected via a `switch`.

```dart
// packages/feature_news/lib/src/x_feed/x_feed_widget.dart

enum XFeedVariant { card, list, carousel, minimal }

class XFeedWidget extends ConsumerWidget {
  const XFeedWidget({required this.variant, super.key});
  final XFeedVariant variant;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(xFeedProvider);
    return switch (variant) {
      XFeedVariant.card     => _XFeedCard(posts: posts),
      XFeedVariant.list     => _XFeedList(posts: posts),
      XFeedVariant.carousel => _XFeedCarousel(posts: posts),
      XFeedVariant.minimal  => _XFeedMinimal(posts: posts),
    };
  }
}

// Private layout widgets — same props, different visual arrangement
class _XFeedCard     extends StatelessWidget { ... }
class _XFeedList     extends StatelessWidget { ... }
class _XFeedCarousel extends StatelessWidget { ... }
class _XFeedMinimal  extends StatelessWidget { ... }
```

```dart
// apps/club_app_1/lib/app_config.dart
class HarriersConfig extends AppConfig {
  @override
  XFeedVariant get xFeedVariant => XFeedVariant.card;

  @override
  NextFixtureSliderVariant get nextFixtureSliderVariant =>
      NextFixtureSliderVariant.horizontal;
  // ...
}
```

### 4.3 Variant mapping per feature

| Component | Enum Name | Variants (A=v1, B=v2 …) |
|---|---|---|
| `XFeedWidget` | `XFeedVariant` | card, list, carousel, minimal |
| `NextFixtureSlider` | `NextFixtureSliderVariant` | stack, horizontal, minimal, compact |
| `SquadHubSlider` | `SquadHubSliderVariant` | carousel, grid, compact, row |
| `PlayerProfileScreen` | `PlayerProfileVariant` | standard, extended, card, compact, advanced |
| `LeagueTableWidget` | `LeagueTableVariant` | full, compact, mini |
| `PredictorWidget` | `PredictorVariant` | standard, legacy |
| `WordpressNewsFeed` | `NewsFeedVariant` | cards, list |
| `SocialIconsBar` | `SocialIconsVariant` | horizontal, vertical, compact |
| `AppBarWidget` | `AppBarVariant` | standard, compact |
| `TitleWidget` | `TitleVariant` | (consolidate 24 title variants into 6 semantic types — see below) |

### 4.4 Title widget consolidation (24 → 6)

The 24 title variants consolidate to 6 semantic `TitleWidget` types:

```dart
enum TitleSection {
  latestNews,
  latestVideos,
  leagueTable,
  nextFixture,
  squadHub,
  social,
  // generic fallback for any other section
  generic,
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    required this.section,
    required this.title,
    this.onTap,
    this.style = TitleStyle.standard, // standard | compact
    super.key,
  });
  // ...
}
```

---

## Section 5 — AppConfig Interface

### 5.1 Design principles

`AppConfig` is a **concrete base class**, not abstract. Club configs use `extends`, not `implements`.

Rules:
- **Required fields** (identity, API credentials, theme) default to `throw UnimplementedError(fieldName)`. The app compiles without override, but crashes immediately at runtime if missing — surfaces the gap quickly without forcing all clubs to update simultaneously.
- **Optional fields** (feature flags, variant choices, sub-configs) have sensible defaults. Adding a new optional field is **non-breaking** for all existing club configs.
- **Feature-area config** is grouped into sub-config objects (see 5.3). New feature parameters are added to the relevant sub-config, not to the top-level class, so `AppConfig` stays readable and top-level changes are rare.
- **Deprecated fields** get `@Deprecated('...')` annotation and are never removed until all club configs have migrated.

### 5.2 Top-level AppConfig

```dart
// packages/core_ui/lib/src/config/app_config.dart
class AppConfig {
  const AppConfig();

  // --- Required: identity ---
  String get clubFullName       => throw UnimplementedError('clubFullName');
  String get clubShortName      => throw UnimplementedError('clubShortName');
  String get clubAbbreviation   => throw UnimplementedError('clubAbbreviation');
  String get nicknamePlural     => throw UnimplementedError('nicknamePlural');

  // --- Required: assets ---
  String get badgeAssetPath             => throw UnimplementedError('badgeAssetPath');
  String get badgeOnPrimaryAssetPath    => throw UnimplementedError('badgeOnPrimaryAssetPath');

  // --- Required: API ---
  String get apiBaseUrl         => throw UnimplementedError('apiBaseUrl');
  String get projectId          => throw UnimplementedError('projectId');
  String get restApiKey         => throw UnimplementedError('restApiKey');
  String get focusTeamObjectId  => throw UnimplementedError('focusTeamObjectId');

  // --- Required: links ---
  String get ticketingUrl       => throw UnimplementedError('ticketingUrl');
  String get deepLinkUrl        => throw UnimplementedError('deepLinkUrl');

  // --- Required: branding ---
  ClubThemeConfig get theme     => throw UnimplementedError('theme');
  BorderRadius get cardBorderRadius => BorderRadius.circular(8);

  // --- Optional: component variant selection (defaults match v1/standard layout) ---
  XFeedVariant get xFeedVariant                         => XFeedVariant.card;
  NextFixtureSliderVariant get nextFixtureSliderVariant => NextFixtureSliderVariant.stack;
  SquadHubSliderVariant get squadHubSliderVariant       => SquadHubSliderVariant.carousel;
  PlayerProfileVariant get playerProfileVariant         => PlayerProfileVariant.standard;
  LeagueTableVariant get leagueTableVariant             => LeagueTableVariant.full;
  NewsFeedVariant get newsFeedVariant                   => NewsFeedVariant.cards;
  SocialIconsVariant get socialIconsVariant             => SocialIconsVariant.horizontal;
  AppBarVariant get appBarVariant                       => AppBarVariant.standard;
  PredictorVariant get predictorVariant                 => PredictorVariant.standard;

  // --- Optional: feature sub-configs (all features enabled by default) ---
  ShopConfig get shop             => const ShopConfig();
  YouthConfig get youth           => const YouthConfig();
  ProgrammesConfig get programmes => const ProgrammesConfig();
  // New features: add a sub-config getter here with a default instance.
  // Existing club configs require no changes.
}

final appConfigProvider = Provider<AppConfig>((ref) => throw UnimplementedError());
```

### 5.3 Feature sub-config objects

Each sub-config is a standalone `const`-constructable class with all fields defaulted. Clubs override only what they need.

```dart
// packages/core_ui/lib/src/config/shop_config.dart
class ShopConfig {
  const ShopConfig();
  bool get enabled          => true;
  bool get guestCheckout    => false;
  int  get maxCartItems     => 20;
}

// packages/core_ui/lib/src/config/youth_config.dart
class YouthConfig {
  const YouthConfig();
  bool get enabled          => true;
  bool get showPaymentPlans => true;
}

// packages/core_ui/lib/src/config/programmes_config.dart
class ProgrammesConfig {
  const ProgrammesConfig();
  bool get enabled          => true;
}
```

Each new feature package ships its own `XxxConfig` class in its own package. `AppConfig` gains one new getter returning the default instance — zero changes required in any existing club config.

### 5.4 Adding new config fields — decision table

| Change type | Method | Breaking for existing clubs? |
|---|---|---|
| New optional variant / flag | Concrete getter with default value | No |
| New required credential / identity field | `throw UnimplementedError(name)` | Runtime error only — compile passes |
| New feature area | New `XxxConfig` sub-class + one getter on `AppConfig` | No |
| New field within existing sub-config | Concrete getter with default in sub-config class | No |
| Deprecated field | Add `@Deprecated('Use X instead — remove by vN.N')` | No |
| Field removal | Remove only after all club configs have migrated | — |

### 5.5 Example club config

```dart
// apps/club_app_1/lib/app_config.dart
class HarriersConfig extends AppConfig {
  const HarriersConfig();

  @override String get clubFullName      => 'Harriers FC';
  @override String get clubShortName     => 'Harriers';
  @override String get clubAbbreviation  => 'HFC';
  @override String get nicknamePlural    => 'The Harriers';

  @override String get badgeAssetPath            => 'assets/badge.png';
  @override String get badgeOnPrimaryAssetPath   => 'assets/badge_on_primary.png';

  @override String get apiBaseUrl        => 'https://api.touchlineclub.com:7500/harriers/xxx';
  @override String get projectId         => 'harriers';
  @override String get restApiKey        => 'xxx';
  @override String get focusTeamObjectId => 'xxx';

  @override String get ticketingUrl      => 'https://harriers.com/tickets';
  @override String get deepLinkUrl       => 'https://harriers.com';

  @override ClubThemeConfig get theme    => const HarriersTheme();

  // Only override variants that differ from defaults
  @override XFeedVariant get xFeedVariant => XFeedVariant.carousel;

  // Only override sub-configs where defaults need changing
  @override ShopConfig get shop => const ShopConfig(guestCheckout: true);
}

---

## Section 6 — API Client Pattern

The existing `ApiManager` and all API call classes are clean enough to migrate
by file-move. No rewrite needed.

```dart
// packages/api_client/lib/src/api_manager.dart  ← moved, unchanged
// packages/api_client/lib/src/endpoints/        ← all call classes moved here
// packages/api_client/lib/src/models/           ← all 75 structs moved here
```

`api_client/pubspec.yaml` must depend **only** on:
`http`, `equatable`, `collection`, `uuid` — no Flutter SDK, no provider, no riverpod.
This keeps the data layer testable as pure Dart.

---

## Section 7 — Widget Tree Cleanup Rules

Apply these rules to every widget during migration (do not do it as a separate pass):

1. Remove any `Container` whose only purpose is to wrap a `Column` or `Row` with no decoration — replace with `Padding` or nothing
2. Replace `Column(children: [SizedBox(height: N), Widget])` with `Column` + `mainAxisSize` and explicit `gap` (or keep the `SizedBox` if it matches existing spacing exactly)
3. Add `const` to all leaf widgets and any widget with no dynamic children
4. Replace `Flexible(child: Container(width: double.infinity, ...))` with `Expanded`
5. Use `ListView.builder` for any list rendered with `Column` + `.map().toList()` where count > 5
6. Lazy-initialise video players — do not init until the widget is visible (`VisibilityDetector` or `didChangeDependencies` after frame)

---

## Phase 0 — Monorepo Setup

**Goal:** Create the skeleton. No logic moved yet.
**Estimated time with Claude Code: 2–4 hours**

- [x] Create `melos.yaml` at repo root
- [x] Create `analysis_options.yaml` at repo root (strict lints)
- [x] Create package directories: `packages/core_ui`, `packages/theming`, `packages/api_client`, `packages/feature_match_centre`, `packages/feature_player`, `packages/feature_predictor`, `packages/feature_news`, `packages/feature_auth`, `packages/feature_shop`, `packages/feature_events`, `packages/feature_programmes`, `packages/feature_league`
- [x] Create `pubspec.yaml` for each package (empty `lib/src/` placeholder)
- [x] Create `apps/club_app_1/` directory structure
- [x] Create `apps/_template/` directory structure
- [x] Run `flutter pub get` in `packages/api_client` — resolves cleanly ✓
- [x] Note: `melos bootstrap` must be run from **PowerShell or Windows CMD** (not Git Bash) — see note in `melos.yaml`
- [x] Commit: "chore: monorepo scaffold"

### melos.yaml template

```yaml
name: touchline
repository: https://github.com/your-org/touchline

packages:
  - apps/**
  - packages/**

scripts:
  lint:
    run: melos exec -- dart analyze
    description: Lint all packages
  test:
    run: melos exec -- flutter test
    description: Test all packages
  clean:
    run: melos exec -- flutter clean
```

---

## Phase 1 — Data Layer Migration

**Goal:** Move all data structs and API client to `packages/api_client`.
No Flutter dependencies. Fully testable pure Dart.
**Estimated time with Claude Code: 2–4 hours**

- [x] Move `lib/backend/schema/structs/` (75 files) → `packages/api_client/lib/src/models/`
- [x] Move `lib/backend/api_requests/api_manager.dart` → `packages/api_client/lib/src/api_manager.dart`
- [x] Move `lib/backend/api_requests/api_calls.dart` → `packages/api_client/lib/src/endpoints/` (split into one file per API group: `backendless_endpoints.dart`, `wordpress_endpoints.dart`, `cms_endpoints.dart`, `crm_endpoints.dart`, `teams_endpoints.dart`, `auth_endpoints.dart`, `shop_endpoints.dart`, `youth_endpoints.dart`)
- [x] Update all imports in moved files to relative paths within `api_client`
- [x] Verify `api_client/pubspec.yaml` has NO Flutter SDK dependency — only `http`, `equatable`, `collection`, `uuid`
- [x] Run `dart analyze` in `packages/api_client/` — zero errors
- [x] Write serialisation round-trip tests for: `UserStruct`, `CartLinesStruct`, `SMFixtureStruct`, `LeagueTableItemStruct`, `PredictorTableItemStruct`, `PlayerStruct`
- [x] Run tests — all pass
- [x] Commit: "feat(api_client): extract data layer and API client to standalone package"

---

## Phase 2 — Theming Package

**Goal:** Replace `FlutterFlowTheme` with standard `ThemeData`.
**Estimated time with Claude Code: 2–3 hours**

- [x] Create `packages/theming/lib/src/club_theme_config.dart` — port all colour and typography fields from `FlutterFlowTheme` (see Section 3)
- [x] Create `packages/theming/lib/src/touchline_colors.dart` — `ThemeExtension` for custom colours (`predictorRed`, `predictorOrange`, `predictorGreen`, `shopBorder`, `shopDark`)
- [x] Create `packages/theming/lib/src/app_theme.dart` — `AppTheme.build(ClubThemeConfig)` factory
- [x] Create `packages/theming/lib/src/text_theme.dart` — port all typography from `FlutterFlowTheme` (displayLarge → labelSmall)
- [x] Write unit test: build a `ThemeData` and assert all expected colour/text style values are present
- [x] Run `flutter analyze` in `packages/theming/` — zero errors
- [x] Commit: "feat(theming): implement ThemeData factory replacing FlutterFlowTheme"

---

## Phase 3 — Core UI Package

**Goal:** Port all FlutterFlow wrapper widgets to clean composable widgets.
**Estimated time with Claude Code: 3–4 hours**

- [x] Create `AppConfig` concrete base class and `appConfigProvider` in `packages/core_ui/lib/src/config/app_config.dart` (see Section 5 — required fields throw `UnimplementedError`, optional fields have defaults)
- [x] Create feature sub-config classes (`ShopConfig`, `YouthConfig`, `ProgrammesConfig`) in `packages/core_ui/lib/src/config/` — each with `const` constructor and all fields defaulted
- [x] Create all variant enums (one file: `packages/core_ui/lib/src/config/component_variants.dart`)
- [x] Port `custom_functions.dart` → `packages/core_ui/lib/src/utils/` as extension methods:
  - `StringExtensions` (stripHtmlTags, fixBackendlessText)
  - `DateTimeExtensions` (parseDateTime, convertFromMills, formatting)
  - `NumExtensions` (calculateSubtotal, formatting)
- [x] Port `FlutterFlowButtonWidget` → `AppButton` (preserve all existing visual parameters)
- [x] Port `FlutterFlowIconButton` → `AppIconButton`
- [x] Port `FlutterFlowChoiceChips` → `AppChoiceChips`
- [x] Port `FlutterFlowDropDown` → `AppDropdown`
- [x] Port `FlutterFlowCountController` → `AppCountController`
- [x] Port `FlutterFlowButtonTabBar` → `AppTabBar`
- [x] Port `FlutterFlowExpandedImageView` → `AppImageViewer`
- [x] Keep `KeepAliveWrapper` — move to `core_ui` unchanged
- [x] Port `flutter_flow_util.dart` URL launching, number formatting → `core_ui/utils/`
- [x] Add `flutter_spinkit` dependency to `core_ui` — create `AppLoader` widget wrapping `SpinKitThreeBounce` (or preferred variant) so spinner style is centrally controlled
- [x] Run `flutter analyze` in `packages/core_ui/` — zero errors
- [x] Commit: "feat(core_ui): port all FlutterFlow wrapper widgets to clean components"

---

## Phase 4 — Auth Package

**Goal:** Replace FFAppState auth fields and `initalRoute()` with `AuthNotifier`.
This is the highest-risk phase — port logic exactly, do not simplify.
**Estimated time with Claude Code: 3–5 hours**

- [x] Create `packages/feature_auth/lib/src/auth_state.dart` (`AuthState` union: initial, loading, authenticated, guest, unauthenticated)
- [x] Create `packages/feature_auth/lib/src/auth_notifier.dart`:
  - Read `lib/actions/actions.dart` `initalRoute()` — port ALL branching logic identically
  - Read `lib/app_state.dart` auth fields — port persistence logic identically
  - Preserve `FlutterSecureStorage` key names exactly (do NOT rename keys)
- [x] Create `authNotifierProvider`
- [x] Create `packages/feature_auth/lib/src/screens/` — port login widget(s)
- [x] Wire `refreshUserData()` action into notifier
- [x] Wire `createUserCRM()` action into notifier
- [x] Unit test `AuthNotifier` state transitions (mock API client)
- [x] Run `flutter analyze` in `packages/feature_auth/` — zero errors
- [x] Commit: "feat(feature_auth): implement AuthNotifier replacing FFAppState auth logic"

---

## Phase 5 — Feature Packages

**Goal:** Migrate all feature widgets. Apply variant enum pattern.
**Estimated time with Claude Code: 1–2 days (all features in parallel sessions)**

For each feature package, follow this exact process:

### Per-feature checklist template

Replace `{feature}` and `{FeatureName}` with the actual names below.

- [ ] Create provider(s) for feature data (Riverpod `AsyncNotifier` calling `api_client`)
- [ ] Create variant enum if multiple layouts exist (see Section 4.3)
- [ ] For each variant: extract the layout-specific code from the corresponding FF widget into a private `_Layout` class
- [ ] Create the top-level `{FeatureName}Widget` with `variant` parameter and `switch` dispatch
- [ ] Replace all `FlutterFlowTheme.of(context).*` with `Theme.of(context).*` or `Theme.of(context).extension<TouchlineColors>()!.*`
- [ ] Replace all `context.watch<FFAppState>()` with `ref.watch(provider)`
- [ ] Apply widget tree cleanup rules (Section 7)
- [ ] Add `const` constructors
- [ ] Run `flutter analyze` — zero errors
- [ ] Visual check: widget renders identically (refer to screenshots if available)

### 5.1 feature_match_centre

Source files to migrate:
- `lib/games_page/` (v1, v2) → `GamesPageWidget` with `GamesPageVariant`
- `lib/next_fixture_sliders/` (v1, v2, v4) → `NextFixtureSlider` with `NextFixtureSliderVariant`
- `lib/todays_games/` → `TodaysGamesWidget`
- `lib/stats/` → `StatsWidget`
- `lib/components/live_text_widget/` → `LiveTextWidget`
- `lib/sync_fixtures/` → `SyncFixturesWidget`, `AndroidTutorialWidget`
- `lib/components/match_sponsors/` → `MatchSponsorsWidget`

- [x] feature_match_centre: providers + variant enums
- [x] feature_match_centre: all widgets migrated
- [x] feature_match_centre: analyze clean
- [x] Commit: "feat(feature_match_centre): migrate all match centre widgets"

### 5.2 feature_league

Source files:
- `lib/league_table/` (v1, v2, v3) → `LeagueTableWidget` with `LeagueTableVariant`
- `lib/components/full_league_table/` (v1, v2) → included as `LeagueTableVariant.full` variants

- [x] feature_league: providers + variant enums
- [x] feature_league: all widgets migrated
- [x] feature_league: analyze clean
- [x] Commit: "feat(feature_league): migrate league table widgets"

### 5.3 feature_player

Source files:
- `lib/squad_hub/squad_hub_page_v1/` → base of `SquadHubScreen`
- `lib/squad_hub/squad_hub_slider_v1–v4/` → `SquadHubSlider` with `SquadHubSliderVariant`
- `lib/squad_hub/player_profile_page_v1–v5_adv/` → `PlayerProfileScreen` with `PlayerProfileVariant`
- `lib/lineups/` → `LineupsWidget`

- [x] feature_player: providers + variant enums
- [x] feature_player: all widgets migrated
- [x] feature_player: analyze clean
- [x] Commit: "feat(feature_player): migrate squad hub and player profile widgets"

### 5.4 feature_predictor

Source files:
- `lib/predictor/predictor_v1/`, `predictor_v2/` → `PredictorWidget` with `PredictorVariant`
- `lib/predictor/predictor_history_v1/` → `PredictorHistoryWidget`
- `lib/predictor/polls_voting/` → `PollsVotingWidget`
- `lib/predictor/lineup_builder_v1/` → `LineupBuilderWidget`
- `lib/predictor/player_select_lineups_builder/` → `PlayerSelectWidget`
- `lib/components/view_lineups_builder/` → `ViewLineupsWidget`
- FFAppState: `selectedPlayersLineupBuilder`, `playersForLineupsBuilder` → `lineupBuilderNotifierProvider`

- [x] feature_predictor: providers (including lineupBuilder state) + variant enums
- [x] feature_predictor: all widgets migrated
- [x] feature_predictor: analyze clean
- [x] Commit: "feat(feature_predictor): migrate predictor, polls and lineup builder"

### 5.5 feature_news

Source files:
- `lib/wordpress_news/` (v1, v2) → `WordpressNewsFeed` with `NewsFeedVariant`
- `lib/x_feed/` (v1, v2, v3, v4) → `XFeedWidget` with `XFeedVariant`
- `lib/latest_videos/` (v2) → `LatestVideosWidget`
- `lib/latest_videos/youtube_video_widget/` → `YoutubeVideoWidget`
- `lib/cms/` (c_m_s_post_page_v1, combined_c_m_s_v1, events_slider_v1) → `CmsPostPage`, `CombinedCmsWidget`, `EventsSliderWidget`
- Custom widgets: `ResponsiveHtmlViewer`, `YouTubeEmbedWidget`, `UniversalVideoEmbedWidget` → port to `feature_news`

- [x] feature_news: providers + variant enums
- [x] feature_news: all widgets migrated
- [x] feature_news: analyze clean
- [x] Commit: "feat(feature_news): migrate news, X feed, videos and CMS widgets"

### 5.6 feature_shop

Source files:
- `lib/shop_individual_product/` → `ShopProductScreen`
- `lib/cart/` → `CartScreen`
- `lib/components/cart_item/` → `CartItemWidget`
- `lib/components/cart_component/` → `CartSummaryWidget`
- `lib/components/checkout/` → `CheckoutWidget`
- FFAppState: `cart`, `newOrder`, `checkout`, `savedShippingDetails` → `cartNotifierProvider`, `checkoutNotifierProvider`

- [x] feature_shop: providers (cart + checkout state)
- [x] feature_shop: all widgets migrated
- [x] feature_shop: analyze clean
- [x] Commit: "feat(feature_shop): migrate shop, cart and checkout widgets"

### 5.7 feature_events

Source files:
- `lib/team_event/` → `TeamEventScreen`
- `lib/pay_for_parking/` → `PayForParkingWidget`
- `lib/components/event_rsvp/` → `EventRsvpWidget`
- `lib/interactive_hub/` → `InteractiveHubScreen`
- `lib/youth_main_screen/` → `YouthMainScreen`
- `lib/youth_sign_up/` → `YouthSignUpScreen`
- `lib/components/youth_signup_payment_plans/` → `YouthPaymentPlansWidget`
- `lib/components/youth_signup_team_select/` → `YouthTeamSelectWidget`
- `lib/components/campaign/` → `CampaignWidget`
- FFAppState: `campaignObjectIds` → `campaignProvider`

- [x] feature_events: providers + variant enums
- [x] feature_events: all widgets migrated
- [x] feature_events: analyze clean
- [x] Commit: "feat(feature_events): migrate events, RSVP, youth and interactive hub"

### 5.8 feature_programmes

Source files:
- `lib/programmes/digital_programme_product_page/` → `DigitalProgrammeScreen`
- `lib/programmes/my_programmes/` → `MyProgrammesScreen`

- [x] feature_programmes: providers
- [x] feature_programmes: all widgets migrated
- [x] feature_programmes: analyze clean
- [x] Commit: "feat(feature_programmes): migrate digital programmes"

### 5.9 Shared UI components (back into core_ui)

Source files:
- `lib/app_bar/` (v1, v2) → `TouchlineAppBar` with `AppBarVariant` in `core_ui`
- `lib/nav_bar/` → `TouchlineNavBar` in `core_ui`
- `lib/top_bit/` (v3_home, v3_specific) → `TopBitWidget` with `TopBitVariant` in `core_ui`
- `lib/titles/` (24 variants) → `TitleWidget` with `TitleSection` + `TitleStyle` in `core_ui` (see Section 4.4)
- `lib/social_icons/` (v1, v2, v3) → `SocialIconsBar` with `SocialIconsVariant` in `core_ui`
- `lib/other_l_g_c/match_gallery_v1/` → `MatchGalleryWidget` in `core_ui`
- `lib/misc/lightbox_images/` → `LightboxImageViewer` in `core_ui`
- `lib/components/sponsor_ad/` → `SponsorAdWidget` in `core_ui`
- `lib/components/rsvp/` → keep in `feature_events`
- `lib/custom_code/widgets/CustomTabsWidget` → `AppCustomTabs` in `core_ui`
- `lib/custom_code/widgets/TouchlineChoiceChips` → merge into `AppChoiceChips` in `core_ui`
- `lib/custom_code/actions/` (2 actions) → port to `core_ui/utils/`

- [x] core_ui: shared layout components migrated (app_bar, nav_bar, top_bit, titles, social_icons)
- [x] core_ui: analyze clean
- [x] Commit: "feat(core_ui): migrate shared layout and navigation components"

### 5.10 Account screens

Source files:
- `lib/account/account_v1/`, `account_details/`, `account_private_public/` → port to `feature_auth`

- [x] feature_auth: account screens migrated
- [x] Commit: "feat(feature_auth): migrate account screens"

---

## Phase 6 — App Assembly

**Goal:** Wire all packages into the first club app. Remove all FlutterFlow code.
**Estimated time with Claude Code: 3–5 hours**

- [ ] Create `apps/club_app_1/lib/app_config.dart` — implement `AppConfig` with real club values from `lib/library_values.dart`
- [ ] Create `apps/club_app_1/lib/main.dart` with `ProviderScope` + config override
- [ ] Create `apps/club_app_1/lib/app.dart` with `MaterialApp.router`
- [ ] Build GoRouter config using all feature screens — preserve ALL existing route paths exactly (to maintain deep links)
- [ ] Wire `authNotifierProvider` to initial route logic
- [ ] Move club-specific assets to `apps/club_app_1/assets/`
- [ ] Move shared assets to `packages/core_ui/assets/`
- [ ] Run `flutter build apk --debug` in `apps/club_app_1/` — must succeed
- [ ] Run `flutter build ios --debug --no-codesign` — must succeed
- [ ] Execute smoke tests (Section 8) against debug build
- [ ] Run `flutter analyze` across entire workspace — zero errors
- [ ] Commit: "feat(apps): assemble club_app_1 from migrated packages"

### Route preservation

All route paths from the current `createRouter()` must exist unchanged:
- `/myProgrammesLIB`
- `/teamSelect`
- `/teamEvent`
- `/cart`
- `/interactiveHub`
- `/youthSignUp`
- `/shop`
- `/youthMainScreen`
- `/digitalProgramme/:matchObjectId`

---

## Phase 7 — Final Cleanup

**Goal:** Delete all FlutterFlow code. Clean dependencies.
**Estimated time with Claude Code: 1–2 hours**

- [ ] Delete `lib/flutter_flow/` directory entirely
- [ ] Delete `lib/app_state.dart`
- [ ] Delete `lib/library_values.dart`
- [ ] Delete `lib/backend/` (now in `api_client` package)
- [ ] Delete `lib/actions/actions.dart` (now in `feature_auth`)
- [ ] Delete `lib/custom_code/` (now distributed across packages)
- [ ] Delete `lib/index.dart` (FF-generated barrel export)
- [ ] Update root `pubspec.yaml` to remove all packages now only referenced by `api_client`
- [ ] Remove: `provider`, `webviewx_plus`, `expandable_page_view`, `page_transition`, `dropdown_button2`, `aligned_tooltip`
- [ ] Replace `webviewx_plus` usages with `webview_flutter` in programme viewer
- [ ] Run `dart pub deps` — verify no transitive `provider` package remains
- [ ] Run `flutter analyze` across workspace — zero errors, zero warnings
- [ ] Run full smoke test suite
- [ ] Commit: "chore: remove all FlutterFlow dependencies and legacy code"

---

## Phase 8 — Additional Club Apps

**Goal:** Onboard each additional club app.
**Estimated time per app with Claude Code: 1–3 hours**

For each club app:

- [ ] Create `apps/club_app_N/` from `apps/_template/`
- [ ] Implement `AppConfig` with club-specific values
- [ ] Move club-specific assets to `apps/club_app_N/assets/`
- [ ] Configure variant selections in `AppConfig`
- [ ] Verify build succeeds
- [ ] Smoke test critical flows
- [ ] Commit: "feat(apps): add club_app_N"

---

## Phase 9 — CI/CD Setup

**Estimated time with Claude Code: 2–3 hours**

- [ ] Create `codemagic.yaml` at repo root:

```yaml
workflows:
  pr-checks:
    name: PR — Lint + Test
    triggering:
      events: [pull_request]
    scripts:
      - name: Install melos
        script: dart pub global activate melos
      - name: Bootstrap
        script: melos bootstrap
      - name: Lint
        script: melos run lint
      - name: Test
        script: melos run test

  club-app-1-build:
    name: Club App 1 — Release Build
    triggering:
      events: [push]
      branch_patterns:
        - { pattern: 'main', include: true }
    scripts:
      - name: Bootstrap
        script: melos bootstrap
      - name: Build Android
        script: cd apps/club_app_1 && flutter build apk --release
      - name: Build iOS
        script: cd apps/club_app_1 && flutter build ios --release --no-codesign
    artifacts:
      - apps/club_app_1/build/app/outputs/flutter-apk/*.apk

  pr-preview:
    name: PR — Preview Build (Firebase App Distribution)
    triggering:
      events: [pull_request]
    scripts:
      - melos bootstrap
      - cd apps/club_app_1 && flutter build apk --debug
    # configure Firebase App Distribution artifact upload here
```

- [ ] `codemagic.yaml` committed and first build triggered
- [ ] PR preview build confirmed working
- [ ] Commit: "ci: add Codemagic workflow for lint, test, build and PR preview"

---

## Section 8 — Smoke Test Checklist

Run these manually after Phase 6 and again after Phase 7.

| Flow | Steps | Pass/Fail |
|---|---|---|
| **Cold start + auth** | Launch app → splash → login or guest selection → home screen loads | |
| **Authenticated launch** | Re-launch with stored token → home screen without login prompt | |
| **Fixture browse** | Home → games page → select fixture → fixture detail screen | |
| **Live match** | Open today's games → live text feed loads and updates | |
| **Player profile** | Navigate to squad hub → select player → profile screen | |
| **League table** | Navigate to league table → data loads and displays | |
| **Predictor** | Open predictor → submit a prediction → confirmation shown | |
| **Lineup builder** | Open lineup builder → select players → submit entry | |
| **Poll vote** | Open polls → cast vote → result shown | |
| **Shop browse** | Open shop → view product → add to cart | |
| **Checkout** | Cart → checkout → billing details form | |
| **Digital programme** | Programmes list → open programme → PDF/content renders | |
| **News feed** | WordPress news feed loads → open article | |
| **X feed** | X feed widget renders posts | |
| **Video playback** | Latest videos → select → video plays | |
| **Team event** | Events section → select event → RSVP flow | |
| **Deep link** | Open deep link URL → correct screen opens | |
| **Theme** | Correct club colours applied throughout | |
| **Dark/light mode** | Toggle if supported → no visual regressions | |

---

## Section 9 — Risk Register

| Risk | Severity | Mitigation |
|---|---|---|
| `initalRoute()` auth branching regression | High | Port logic line-by-line; unit test all branches |
| `FlutterSecureStorage` key rename breaks existing users | High | Never rename keys; test on device with existing session |
| Multi-version widget visual regression | Medium | Screenshot each variant before migration; compare after |
| GoRouter deep link paths change | Medium | Keep all route path strings identical |
| Payment/checkout regression | High | Migrate `feature_shop` last; test thoroughly |
| `webviewx_plus` → `webview_flutter` behaviour difference | Medium | Test HTML programme viewer on both Android and iOS |
| CSV serialisation format change in structs | High | Port serialisation identically; add round-trip tests in Phase 1 |
| Riverpod `AutoDispose` disposing state too early | Medium | Audit provider lifetimes; use `keepAlive()` where needed |
| Missing `const` causing unnecessary rebuilds | Low | Flutter DevTools widget rebuild tracking |

---

## Section 10 — Estimated Timeline (Claude Code-Accelerated)

| Phase | Description | Estimated Time |
|---|---|---|
| Phase 0 | Monorepo scaffold | 2–4 hours |
| Phase 1 | Data layer migration | 2–4 hours |
| Phase 2 | Theming package | 2–3 hours |
| Phase 3 | Core UI package | 3–4 hours |
| Phase 4 | Auth package | 3–5 hours |
| Phase 5 | All feature packages | 1–2 days |
| Phase 6 | App assembly | 3–5 hours |
| Phase 7 | Final cleanup | 1–2 hours |
| Phase 8 | Additional club apps (each) | 1–3 hours |
| Phase 9 | CI/CD | 2–3 hours |
| **Total** | **Single developer + Claude Code** | **~4–5 days** |

---

## Appendix A — File Move Reference

### Structs (75 files): `lib/backend/schema/structs/` → `packages/api_client/lib/src/models/`

All files move unchanged. Update import prefix from `../../flutter_flow/...` to relative paths.

### API endpoints: `lib/backend/api_requests/api_calls.dart` → split to:

| API Group class | Target file |
|---|---|
| `BackendlessDatabaseGroup` | `packages/api_client/lib/src/endpoints/backendless_endpoints.dart` |
| `WordpressWebsitesGroup` | `packages/api_client/lib/src/endpoints/wordpress_endpoints.dart` |
| `CmsGroup` | `packages/api_client/lib/src/endpoints/cms_endpoints.dart` |
| `CrmGroup` | `packages/api_client/lib/src/endpoints/crm_endpoints.dart` |
| `TeamsGroup` | `packages/api_client/lib/src/endpoints/teams_endpoints.dart` |
| `AuthGroup` | `packages/api_client/lib/src/endpoints/auth_endpoints.dart` |
| `ShopGroup` | `packages/api_client/lib/src/endpoints/shop_endpoints.dart` |
| `YouthManagementGroup` | `packages/api_client/lib/src/endpoints/youth_endpoints.dart` |

### FlutterFlow utilities: `lib/flutter_flow/custom_functions.dart` → `packages/core_ui/lib/src/utils/`

| Function | Target extension |
|---|---|
| `parseDateTime()`, `convertFromMills()` | `DateTimeExtensions` |
| `stripHtmlTags()`, `fixBackendlessText()` | `StringExtensions` |
| `getTermIndex()`, `findIndexCopy()` | `ListExtensions` |
| `calculateSubtotal()` | `NumExtensions` |

---

## Appendix B — FlutterSecureStorage Key Names (do NOT change)

Read these from `lib/app_state.dart` before Phase 4 and list them here.
Changing a key name will log out all existing users of the app.

These keys were read from `lib/app_state.dart` on 2026-02-24:

| Key | Type | Field |
|---|---|---|
| `ff_newOrder` | `List<String>` (CSV-serialised `OrderItemsStruct`) | `newOrder` |
| `ff_playingCommentary` | `bool` | `playingCommentary` |
| `ff_currentUserObjectId` | `String` | `currentUserObjectId` |
| `ff_userToken` | `String` | `userToken` |
| `ff_currentUser` | `String` (JSON-serialised `UserStruct`) | `currentUser` |
| `ff_cart` | `List<String>` (CSV-serialised `CartLinesStruct`) | `cart` |
| `ff_savedShippingDetails` | `List<String>` (CSV-serialised `ShippingDetailsStruct`) | `savedShippingDetails` |
| `ff_checkout` | `String` (JSON-serialised `CheckoutStruct`) | `checkout` |
| `ff_bottomPaddingHeight` | `double` | `bottomPaddingHeight` |
| `ff_campaignObjectIds` | `List<String>` (CSV-serialised strings) | `campaignObjectIds` |
| `ff_currentPlayerIndex` | `int` | `currentPlayerIndex` |

**Serialisation note:** List fields use `CsvToListConverter` / `ListToCsvConverter` from the `csv` package.
Single structs use `jsonDecode(serializedData)` → `StructName.fromSerializableMap(...)`.
All of this logic must be preserved exactly when migrating to `AuthNotifier` / `CartNotifier`.

---

*Last updated: 2026-02-24*
*Plan version: 1.2*
*Changes from v1.1: Replace `abstract class AppConfig` with concrete base class; add feature sub-config objects (`ShopConfig`, `YouthConfig`, `ProgrammesConfig`); add schema evolution decision table (Section 5.4).*
