import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_league/feature_league.dart';
import 'package:feature_match_centre/src/providers.dart';
import 'package:feature_match_centre/src/widgets/live_text_widget.dart';
import 'package:feature_match_centre/src/widgets/match_sponsors_widget.dart';
import 'package:feature_match_centre/src/widgets/stats_widget.dart';
import 'package:feature_player/feature_player.dart';
import 'package:feature_predictor/feature_predictor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:theming/theming.dart';

/// Single fixture detail screen — replaces LGCFixture, LGCLive, LGCResult.
///
/// Accepts a `matchObjectId` route parameter.  Match state (upcoming / live /
/// result) is derived from the loaded fixture data; sections are shown or
/// hidden accordingly.
///
/// Route paths `/lGCFixture`, `/lGCLive`, `/lGCResult` should redirect here.
class FixtureDetailScreen extends ConsumerWidget {
  const FixtureDetailScreen({super.key, required this.matchObjectId});

  static const routePath = '/fixture/:matchObjectId';

  final String matchObjectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfg = ref.watch(appConfigProvider);
    final authState = ref.watch(authNotifierProvider);
    final colorScheme = Theme.of(context).colorScheme;

    final userToken = switch (authState) {
      AuthAuthenticated(:final userToken) => userToken,
      AuthGuest(:final userToken) => userToken,
      _ => '',
    };
    final userEmail = switch (authState) {
      AuthAuthenticated(:final currentUser) => currentUser.email,
      _ => null,
    };

    final args = (
      projectId: cfg.projectId,
      restApiKey: cfg.restApiKey,
      matchObjectId: matchObjectId,
    );
    final fixtureAsync = ref.watch(fixtureDetailProvider(args));

    return fixtureAsync.when(
      loading: () => Scaffold(
        backgroundColor:
            Theme.of(context).extension<TouchlineColors>()?.primaryBackground,
        body: Center(
          child: SpinKitThreeBounce(
            color: colorScheme.primary,
            size: 30,
          ),
        ),
      ),
      error: (e, _) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('Failed to load fixture: $e')),
      ),
      data: (fixture) {
        if (fixture == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text('Fixture not found.')),
          );
        }
        return _FixtureDetailBody(
          fixture: fixture,
          matchObjectId: matchObjectId,
          cfg: cfg,
          userToken: userToken,
          userEmail: userEmail,
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Body — separated so it only rebuilds when fixture data changes.
// ---------------------------------------------------------------------------

class _FixtureDetailBody extends StatelessWidget {
  const _FixtureDetailBody({
    required this.fixture,
    required this.matchObjectId,
    required this.cfg,
    required this.userToken,
    required this.userEmail,
  });

  final BLESSfixtureStruct fixture;
  final String matchObjectId;
  final AppConfig cfg;
  final String userToken;
  final String? userEmail;

  /// True once a score exists on the fixture (result or live).
  bool get hasScore =>
      fixture.hasHomeGoals() && fixture.hasAwayGoals();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TouchlineColors>()!;

    return Scaffold(
      backgroundColor: colors.primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---- Top bit (always shown) ----
            TopBitWidget(
              variant: TopBitVariant.specific,
              bgImage: cfg.bgImageUrl,
              matchObjectId: matchObjectId,
              teamObjectIds: [
                cfg.focusTeamObjectId,
                ...cfg.backupTeamObjectIds,
              ],
              teamAbr: cfg.clubAbbreviation,
              onFixture: (id) async => _navigateToFixture(context, id),
              onLive: (id) async => _navigateToFixture(context, id),
              onTickets: () async => _navigateToTickets(context),
              onPredictor: () async => _navigateToPredictor(context),
              onPoll: (pollObjectId) async =>
                  _showPollDialog(context, pollObjectId),
            ),

            // ---- Stats (result / live only) ----
            if (hasScore)
              StatsWidget(
                matchObjectId: matchObjectId,
                projectId: cfg.projectId,
                restApiKey: cfg.restApiKey,
                homeImage: fixture.homeBadge,
                awayImage: fixture.awayBadge,
                userToken: userToken,
              ),

            // ---- Live text feed (result / live only) ----
            if (hasScore)
              LiveTextWidget(
                matchObjectId: matchObjectId,
                projectId: cfg.projectId,
                restApiKey: cfg.restApiKey,
              ),

            // ---- Lineups (when published) ----
            if (fixture.lineupsOnOff == true)
              LineupsWidget(
                listPlayerData: fixture.homeLineupJSON,
                awayTeamData: fixture.awayLineupJSON,
                homeTeamName: fixture.homeTeamName,
                awayTeamName: fixture.awayTeamName,
                homeTeamBadge: fixture.homeBadge,
                awayTeamBadge: fixture.awayBadge,
                squadPlayerClickAction: null,
                lineupsOnOff: fixture.lineupsOnOff ?? false,
                lineupsBuilderOnOff: fixture.lineupsBuilderOnOff ?? false,
                cardBorderRadius: cfg.cardBorderRadius,
                matchStartTime: fixture.start != null
                    ? DateTime.fromMillisecondsSinceEpoch(fixture.start!)
                    : null,
              ),

            // ---- Mini league table (always shown) ----
            LeagueTableWidget(
              projectId: cfg.projectId,
              restApiKey: cfg.restApiKey,
              userToken: userToken,
              teamName: cfg.clubFullName,
              variant: LeagueTableVariant.mini,
              cardBorderRadius: cfg.cardBorderRadius,
            ),

            // ---- Match sponsors (when present) ----
            MatchSponsorsWidget(
              matchSponsors: fixture.sponsorship,
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  void _navigateToFixture(BuildContext context, String id) {
    context.push('/fixture/$id');
  }

  void _navigateToTickets(BuildContext context) {
    context.push('/tickets');
  }

  void _navigateToPredictor(BuildContext context) {
    context.push('/predictor');
  }

  Future<void> _showPollDialog(
      BuildContext context, String pollObjectId) async {
    await showDialog<void>(
      context: context,
      builder: (_) => Dialog(
        child: PollsVotingWidget(
          projectId: cfg.projectId,
          restApiKey: cfg.restApiKey,
          userEmail: userEmail,
          pollObjectId: pollObjectId,
        ),
      ),
    );
  }
}
