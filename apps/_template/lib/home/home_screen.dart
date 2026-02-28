// ============================================================
// STEP 2 — Home screen composition
//
// This is where you decide which sections appear on the home page and
// in what order.  Each section is a clearly labelled block — enable,
// disable, reorder, or replace them to match the club's design.
//
// The NavbarWidget is NOT part of this widget; it is injected by the
// GoRouter ShellRoute in navigation/router.dart.
// ============================================================

import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_league/feature_league.dart';
import 'package:feature_match_centre/feature_match_centre.dart';
import 'package:feature_news/feature_news.dart';
import 'package:feature_player/feature_player.dart';
import 'package:feature_predictor/feature_predictor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:theming/theming.dart';

// ---------------------------------------------------------------------------
// Local providers
// ---------------------------------------------------------------------------

typedef _PollsArgs = ({
  String projectId,
  String restApiKey,
  int currentTime,
});

/// Active (non-fixture) polls — drives the "Vote Now" section visibility.
final _activePollsProvider =
    FutureProvider.autoDispose.family<List<PollStruct>, _PollsArgs>(
  (ref, args) async {
    final response =
        await BackendlessDatabaseGroup.checkForAllPollsCall.call(
      currentTime: args.currentTime,
      bLProjectId: args.projectId,
      bLRestAPIKey: args.restApiKey,
    );
    return ((response.jsonBody as List)
            .map<PollStruct?>(PollStruct.maybeFromMap)
            .toList() as Iterable<PollStruct?>)
        .withoutNulls
        .toList();
  },
);

// ---------------------------------------------------------------------------
// HomeScreen
// ---------------------------------------------------------------------------

/// Club home page — compose feature widgets in the order that suits this club.
///
/// To add a section: import the widget from its feature package and insert it
/// in the Column below.
/// To remove a section: delete or comment-out its block.
/// To reorder sections: move the block up or down within the Column.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const routePath = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfg = ref.watch(appConfigProvider);
    final authState = ref.watch(authNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final colors = Theme.of(context).extension<TouchlineColors>()!;

    // ---- Auth-derived values ----
    final userToken = switch (authState) {
      AuthAuthenticated(:final userToken) => userToken,
      AuthGuest(:final userToken) => userToken,
      _ => '',
    };
    final userEmail = switch (authState) {
      AuthAuthenticated(:final currentUser) => currentUser.email,
      _ => null,
    };
    final userTeams = switch (authState) {
      AuthAuthenticated(:final currentUser) => currentUser.teams,
      AuthGuest(:final currentUser) => currentUser.teams,
      _ => <TeamStruct>[],
    };

    // Team IDs: user's own teams if present, otherwise the backup list.
    final teamObjectIds = userTeams.isEmpty
        ? cfg.backupTeamObjectIds
        : userTeams.map((t) => t.objectId ?? '').toList();

    // ---- Next fixture data (drives "Upcoming" section visibility) ----
    final fixturesAsync = ref.watch(nextFixtureSliderProvider((
      projectId: cfg.projectId,
      restApiKey: cfg.restApiKey,
      focusTeamId: cfg.focusTeamObjectId,
      userToken: userToken,
    )));

    // ---- Active polls data (drives "Vote Now" section visibility) ----
    final pollsAsync = ref.watch(_activePollsProvider((
      projectId: cfg.projectId,
      restApiKey: cfg.restApiKey,
      currentTime: DateTime.now().millisecondsSinceEpoch,
    )));

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: colors.primaryBackground,
        body: Stack(
          children: [
            // ==============================================================
            // SECTION: Background image (optional — remove if not needed)
            // Replace 'assets/images/bg3-min.png' with your background asset.
            // ==============================================================
            Opacity(
              opacity: 0.8,
              child: Image.asset(
                'assets/images/bg3-min.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // ==============================================================
            // Scrollable content
            // ==============================================================
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // ==========================================================
                  // SECTION: Top bit (hero fixture card + sponsor strip)
                  // Always shown. Variant controlled by cfg.topBitVariant.
                  // Callback actions navigate to other routes.
                  // ==========================================================
                  TopBitWidget(
                    variant: TopBitVariant.home,
                    bgImage: cfg.bgImageUrl,
                    teamObjectIds: teamObjectIds,
                    teamAbr: cfg.clubAbbreviation,
                    altTimeColours: colorScheme.primary,
                    onPrimary: colors.secondaryBackground,
                    onFixture: (id) async => context.push('/fixture/$id'),
                    onLive: (id) async => context.push('/fixture/$id'),
                    onTickets: () async => context.push('/tickets'),
                    onPredictor: () async => context.push('/predictor'),
                    onPoll: (pollObjectId) async => _showPollDialog(
                      context,
                      cfg,
                      userEmail,
                      pollObjectId,
                    ),
                  ),

                  // Inner column — each child is one home-page section,
                  // separated by 32 dp gaps (via .divide) and padded at
                  // top and bottom by 32 dp (via .around).
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // ======================================================
                      // SECTION: Upcoming fixtures slider
                      // Only shown when there are upcoming fixtures.
                      // ======================================================
                      if (fixturesAsync.valueOrNull?.isNotEmpty == true)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TitleWidget(section: TitleSection.nextFixture),
                            NextFixtureSlider(
                              projectId: cfg.projectId,
                              restApiKey: cfg.restApiKey,
                              focusTeamId: cfg.focusTeamObjectId,
                              userToken: userToken,
                              variant: NextFixtureSliderVariant.stack,
                              fixtureAction: (id) async =>
                                  context.push('/fixture/$id'),
                            ),
                          ],
                        ),

                      // ======================================================
                      // SECTION: Mini league table
                      // Tapping navigates to the full-page table.
                      // ======================================================
                      GestureDetector(
                        onTap: () => context.push('/league-table'),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TitleWidget(
                              section: TitleSection.leagueTable,
                              onTap: () => context.push('/league-table'),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: LeagueTableWidget(
                                projectId: cfg.projectId,
                                restApiKey: cfg.restApiKey,
                                userToken: userToken,
                                teamName: cfg.clubFullName,
                                variant: LeagueTableVariant.mini,
                                cardBorderRadius: cfg.cardBorderRadius,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ======================================================
                      // SECTION: Vote Now (active polls)
                      // Only shown when there are active polls.
                      // ======================================================
                      if (pollsAsync.valueOrNull?.isNotEmpty == true)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TitleWidget(
                              section: TitleSection.generic,
                              title: 'VOTE NOW',
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: _PollsSection(
                                polls: pollsAsync.valueOrNull!,
                                onTap: (id) =>
                                    context.push('/play?objectId=$id'),
                              ),
                            ),
                          ],
                        ),

                      // ======================================================
                      // SECTION: Sponsor ad carousel
                      // locationKey identifies the ad slot in the backend.
                      // ======================================================
                      SponsorAdWidget(locationKey: 'home'),

                      // ======================================================
                      // SECTION: Latest club news (CMS)
                      // ======================================================
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                            child: TitleWidget(
                              section: TitleSection.latestNews,
                              onTap: () => context.push('/news-archive'),
                            ),
                          ),
                          CombinedCmsWidget(
                            projectId: cfg.projectId,
                            restApiKey: cfg.restApiKey,
                            userToken: userToken,
                            numberToFetch: 5,
                            clickAction: (id) async =>
                                context.push('/cms-post?objectId=$id'),
                          ),
                        ],
                      ),

                      // ======================================================
                      // SECTION: Squad hub slider
                      // ======================================================
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TitleWidget(section: TitleSection.squadHub),
                          SquadHubSlider(
                            projectId: cfg.projectId,
                            restApiKey: cfg.restApiKey,
                            tapAction: (playerObjectId) async =>
                                context.push('/player-page?objectId=$playerObjectId'),
                          ),
                        ],
                      ),

                      // ======================================================
                      // SECTION: X / Twitter feed
                      // feedUrl comes from AppConfig.xFeedUrl.
                      // ======================================================
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: TitleWidget(
                              section: TitleSection.generic,
                              title: 'X LATEST',
                            ),
                          ),
                          XFeedWidget(
                            feedUrl: cfg.xFeedUrl,
                            variant: XFeedVariant.card,
                            cardBorderRadius: cfg.cardBorderRadius,
                          ),
                        ],
                      ),

                      // ======================================================
                      // SECTION: Social icons bar
                      // Update the links below with real club social URLs.
                      // Toggle each platform on/off with the *On: bool params.
                      // ======================================================
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TitleWidget(section: TitleSection.social),
                          SocialIconsBar(
                            variant: SocialIconsVariant.horizontal,
                            tikTokOn: true,
                            facebookOn: true,
                            instagramOn: true,
                            xOn: true,
                            youtubeOn: true,
                            // TODO: replace with real club social URLs
                            tiktokLink: 'https://www.tiktok.com/@yourclub',
                            facebookLink: 'https://www.facebook.com/yourclub',
                            instagramLink: 'https://www.instagram.com/yourclub',
                            xLink: 'https://x.com/yourclub',
                            youtubeLink: 'https://www.youtube.com/@yourclub',
                          ),
                        ],
                      ),
                    ]
                        .divide(const SizedBox(height: 32))
                        .around(const SizedBox(height: 32)),
                  ),

                  // Bottom spacer so content isn't hidden behind the nav bar.
                  SizedBox(height: navBarPadding(context)),
                ],
              ),
            ),

            // ==============================================================
            // SECTION: User avatar overlay (top-right corner)
            // Navigates to /my-club-page on tap.
            // Remove this if the club doesn't need a profile shortcut here.
            // ==============================================================
            Align(
              alignment: const AlignmentDirectional(0.9, -0.85),
              child: GestureDetector(
                onTap: () => context.push('/my-club-page'),
                child: Material(
                  color: Colors.transparent,
                  elevation: 5,
                  shape: const CircleBorder(),
                  child: ClipOval(
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colors.secondaryBackground,
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          cfg.badgeOnPrimaryAssetPath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showPollDialog(
    BuildContext context,
    AppConfig cfg,
    String? userEmail,
    String pollObjectId,
  ) async {
    await showDialog<void>(
      context: context,
      builder: (_) => Dialog(
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: PollsVotingWidget(
            projectId: cfg.projectId,
            restApiKey: cfg.restApiKey,
            userEmail: userEmail,
            pollObjectId: pollObjectId,
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Poll cards list
// ---------------------------------------------------------------------------

class _PollsSection extends StatelessWidget {
  const _PollsSection({required this.polls, required this.onTap});

  final List<PollStruct> polls;
  final void Function(String pollObjectId) onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final colors = Theme.of(context).extension<TouchlineColors>()!;

    return Column(
      children: polls.map((poll) {
        if (!poll.hasObjectId()) return const SizedBox.shrink();
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: GestureDetector(
            onTap: () => onTap(poll.objectId),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.secondaryBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colorScheme.primary, width: 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      poll.title,
                      style: TextStyle(
                        color: colors.primaryText,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right, color: colorScheme.primary),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
