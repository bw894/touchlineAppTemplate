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
// Local provider — active (non-fixture) polls for the VOTE NOW section.
// ---------------------------------------------------------------------------

typedef _PollsArgs = ({
  String projectId,
  String restApiKey,
  int currentTime,
});

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

/// The Harriers home page — composes all feature widgets in club order.
///
/// Ported from [HomeWidget] in
/// `example_apps/harriers/lib/auth/pages/home/home_widget.dart`.
///
/// The bottom navigation bar is NOT part of this widget; it is provided by
/// the parent GoRouter shell route ([NavbarWidget], Phase 6.6).
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

    // Team IDs: use user's teams if present, otherwise backup list.
    final teamObjectIds = (userTeams.isEmpty)
        ? cfg.backupTeamObjectIds
        : userTeams.map((t) => t.objectId ?? '').toList();

    // ---- Next fixture slider data (drives visibility of section) ----
    final sliderArgs = (
      projectId: cfg.projectId,
      restApiKey: cfg.restApiKey,
      focusTeamId: cfg.focusTeamObjectId,
      userToken: userToken,
    );
    final fixturesAsync = ref.watch(nextFixtureSliderProvider(sliderArgs));

    // ---- Active polls data ----
    final pollsArgs = (
      projectId: cfg.projectId,
      restApiKey: cfg.restApiKey,
      currentTime: DateTime.now().millisecondsSinceEpoch,
    );
    final pollsAsync = ref.watch(_activePollsProvider(pollsArgs));

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: colors.primaryBackground,
        body: Stack(
          children: [
            // ---- Background ----
            Opacity(
              opacity: 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/bg3-min.png',
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // ---- Scrollable content ----
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Top bit — always shown, manages its own fixture data.
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

                  // Section column — items separated and surrounded by 32pt gaps.
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // ---- Next fixtures (only if upcoming fixtures exist) ----
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

                      // ---- League table ----
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20),
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

                      // ---- Vote now (only if active polls exist) ----
                      if (pollsAsync.valueOrNull?.isNotEmpty == true)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TitleWidget(
                              section: TitleSection.generic,
                              title: 'VOTE NOW',
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20),
                              child: _PollsSection(
                                polls: pollsAsync.valueOrNull!,
                                onTap: (pollObjectId) =>
                                    context.push('/play?objectId=$pollObjectId'),
                              ),
                            ),
                          ],
                        ),

                      // ---- Sponsor ad carousel ----
                      SponsorAdWidget(locationKey: 'home'),

                      // ---- Club latest (CMS) ----
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 6),
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
                            clickAction: (cmsPostObjectId) async =>
                                context.push(
                                    '/cms-post?objectId=$cmsPostObjectId'),
                          ),
                        ],
                      ),

                      // ---- Squad hub ----
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TitleWidget(section: TitleSection.squadHub),
                          SquadHubSlider(
                            projectId: cfg.projectId,
                            restApiKey: cfg.restApiKey,
                            tapAction: (playerObjectId) async =>
                                context.push(
                                    '/player-page?objectId=$playerObjectId'),
                          ),
                        ],
                      ),

                      // ---- X / Twitter feed ----
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 5),
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

                      // ---- Social icons ----
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
                            tiktokLink:
                                'https://www.tiktok.com/@khfcofficial?lang=en',
                            facebookLink:
                                'https://www.facebook.com/khfcofficial',
                            instagramLink:
                                'https://www.instagram.com/khfcofficial/?hl=en',
                            xLink: 'https://x.com/khfcofficial',
                            youtubeLink:
                                'https://www.youtube.com/@khfcofficial',
                          ),
                        ],
                      ),
                    ]
                        .divide(const SizedBox(height: 32))
                        .around(const SizedBox(height: 32)),
                  ),

                  // Bottom spacer (nav bar height).
                  SizedBox(height: navBarPadding(context)),
                ],
              ),
            ),

            // ---- User avatar overlay (top-right) ----
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
                          width: 1,
                          height: 200,
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
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
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
// Poll cards list (replaces VoteNonFixtureV1Widget)
// ---------------------------------------------------------------------------

class _PollsSection extends StatelessWidget {
  const _PollsSection({
    required this.polls,
    required this.onTap,
  });

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
