// All component variant enums for the Touchline platform.
//
// Each enum corresponds to one multi-layout widget. Club apps pick variants
// via their [AppConfig] subclass. Feature packages import only the enums
// they need — no circular dependency on the rest of [core_ui].

enum XFeedVariant { card, list, carousel, minimal }

enum NextFixtureSliderVariant { stack, horizontal, minimal, compact }

enum SquadHubSliderVariant { carousel, grid, compact, row }

enum PlayerProfileVariant { standard, extended, card, compact, advanced }

/// [LeagueTableWidget] layout variants.
/// - [mini]: Compact snippet showing ±3 rows around the focus team, text highlight.
/// - [compact]: Compact snippet with configurable focus-row background colour (v3 style).
/// - [full]: Full scrollable table; pass [showTabs] to enable OVERALL/HOME/AWAY tab switcher.
enum LeagueTableVariant { full, compact, mini }

enum PredictorVariant { standard, legacy }

enum NewsFeedVariant { cards, list }

enum SocialIconsVariant { horizontal, vertical, compact }

enum AppBarVariant { standard, compact }

/// [GamesPageWidget] layout variants.
/// - [standard]: Results + Fixtures tabs (V1).
/// - [withEvents]: Results + Fixtures + Events tabs (V2).
enum GamesPageVariant { standard, withEvents }

enum TitleSection {
  latestNews,
  latestVideos,
  leagueTable,
  nextFixture,
  squadHub,
  social,
  generic,
}

enum TitleStyle { standard, compact }
