import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
/// Live match stats panel.
///
/// Polls [GetStatsForMatchCall] every 8 seconds and shows available stat rows.
/// Pull-to-refresh is also supported when [manualOverride] is false.
class StatsWidget extends ConsumerStatefulWidget {
  const StatsWidget({
    super.key,
    required this.matchObjectId,
    required this.projectId,
    required this.restApiKey,
    required this.homeImage,
    required this.awayImage,
    this.userToken = '',
    this.manualOverride = false,
  });

  final String? matchObjectId;
  final String projectId;
  final String restApiKey;
  final String? homeImage;
  final String? awayImage;
  final String userToken;
  final bool manualOverride;

  @override
  ConsumerState<StatsWidget> createState() => _StatsWidgetState();
}

class _StatsWidgetState extends ConsumerState<StatsWidget> {
  Future<ApiCallResponse>? _statsFuture;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _statsFuture = _fetch();
    _timer = Timer.periodic(const Duration(milliseconds: 8000), (_) {
      if (mounted) setState(() => _statsFuture = _fetch());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<ApiCallResponse> _fetch() =>
      BackendlessDatabaseGroup.getStatsForMatchCall.call(
        objectId: widget.matchObjectId,
        bLProjectId: widget.projectId,
        bLRestAPIKey: widget.restApiKey,
      );

  void _refresh() => setState(() => _statsFuture = _fetch());

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return FutureBuilder<ApiCallResponse>(
      future: _statsFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: AppLoader(color: primary, size: 50));
        }
        final response = snapshot.data!;
        final stats = ((response.jsonBody as List)
                .map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap)
                .toList() as Iterable<StatsObjectStruct?>)
            .withoutNulls
            .toList();

        if (stats.isEmpty) return const SizedBox.shrink();

        final s = stats.first;

        if (widget.manualOverride) return const SizedBox.shrink();

        return Align(
          alignment: const AlignmentDirectional(0, -1.49),
          child: RefreshIndicator(
            onRefresh: () async => _refresh(),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              primary: false,
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget.homeImage != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(widget.homeImage!,
                            width: 65, height: 65, fit: BoxFit.contain),
                      ),
                    Align(
                      alignment: const AlignmentDirectional(0, -1),
                      child: Text(
                        'MATCH STATS',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 35),
                      ),
                    ),
                    if (widget.awayImage != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(widget.awayImage!,
                            width: 65, height: 65, fit: BoxFit.contain),
                      ),
                  ],
                ),
                if (s.hasAwayShotsOnTarget() && s.hasHomeShotsOnTarget())
                  _StatRow(
                    home: s.homeShotsOnTarget.toString(),
                    label: 'Shots on target',
                    away: s.awayShotsOnTarget.toString(),
                  ),
                if (s.hasAwayShotsOffTarget() && s.hasHomeShotsOffTarget())
                  _StatRow(
                    home: s.homeShotsOffTarget.toString(),
                    label: 'Shots off target',
                    away: s.awayShotsOffTarget.toString(),
                  ),
                if (s.hasAwayCorners() && s.hasHomeCorners())
                  _StatRow(
                    home: s.homeCorners.toString(),
                    label: 'Corners',
                    away: s.awayCorners.toString(),
                  ),
                if (s.hasHomePossession() &&
                    s.hasAwayPossession() &&
                    s.homePossession != 0 &&
                    s.awayPossession != 0 &&
                    !(s.homePossession == 50 && s.awayPossession == 50))
                  _StatRow(
                    home: '${s.homePossession}%',
                    label: 'Possession',
                    away: '${s.awayPossession}%',
                  ),
                if (s.hasAwayFouls() &&
                    s.hasHomeFouls() &&
                    s.homeFouls != 0 &&
                    s.awayFouls != 0)
                  _StatRow(
                    home: s.homeFouls.toString(),
                    label: 'Fouls',
                    away: s.awayFouls.toString(),
                  ),
                if (s.hasAwayAttacks() &&
                    s.hasHomeAttacks() &&
                    s.homeAttacks != 0 &&
                    s.awayAttacks != 0)
                  _StatRow(
                    home: s.homeAttacks.toString(),
                    label: 'Attacks',
                    away: s.awayAttacks.toString(),
                  ),
                if (s.hasAwayDangerousAttacks() &&
                    s.hasHomeDangerousAttacks() &&
                    s.homeDangerousAttacks != 0 &&
                    s.awayDangerousAttacks != 0)
                  _StatRow(
                    home: s.homeDangerousAttacks.toString(),
                    label: 'Dangerous attacks',
                    away: s.awayDangerousAttacks.toString(),
                  ),
                if (s.hasAwayPenaltiesWon() && s.hasHomePenaltiesWon())
                  _StatRow(
                    home: s.homePenaltiesWon.toString(),
                    label: 'Penalties won',
                    away: s.awayPenaltiesWon.toString(),
                  ),
                if (s.hasAwayYellows() && s.hasHomeYellows())
                  _StatRow(
                    home: s.homeYellows.toString(),
                    label: 'Yellow cards',
                    away: s.awayYellows.toString(),
                  ),
                if (s.hasAwayReds() && s.hasHomeReds())
                  _StatRow(
                    home: s.homeReds.toString(),
                    label: 'Red cards',
                    away: s.awayReds.toString(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Private
// ---------------------------------------------------------------------------

class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.home,
    required this.label,
    required this.away,
  });

  final String home;
  final String label;
  final String away;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            home,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 23, fontWeight: FontWeight.w600),
          ),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 17),
          ),
          Text(
            away,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 23, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
