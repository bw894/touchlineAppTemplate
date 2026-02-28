import 'package:api_client/api_client.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:feature_predictor/src/providers.dart';

/// Displays the logged-in user's predictor entry history as an expandable
/// list inside a 320 px card.
///
/// Ported from PredictorHistoryV1Widget (Phase 5.4).
class PredictorHistoryWidget extends ConsumerWidget {
  const PredictorHistoryWidget({
    super.key,
    required this.projectId,
    required this.restApiKey,
    required this.uid,
    required this.name,
    this.clubBadgeUrl,
    this.clubShortName = '',
    this.cardBorderRadius = BorderRadius.zero,
  });

  final String projectId;
  final String restApiKey;
  final String? uid;
  final String? name;
  final String? clubBadgeUrl;
  final String clubShortName;
  final BorderRadius cardBorderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final historyAsync = ref.watch(predictorHistoryProvider((
      projectId: projectId,
      restApiKey: restApiKey,
      uid: uid ?? '',
    )));

    return Align(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: historyAsync.when(
          loading: () => Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitWanderingCubes(
                color: theme.colorScheme.primary,
                size: 50,
              ),
            ),
          ),
          error: (_, __) => const SizedBox.shrink(),
          data: (entries) => Container(
            width: 320,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, 2),
                ),
              ],
              borderRadius: cardBorderRadius,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (clubBadgeUrl != null &&
                                  clubBadgeUrl!.isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    clubBadgeUrl!,
                                    height: 44,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              const SizedBox(width: 4),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    clubShortName,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    'PREDICTOR',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontFamily: 'BebasNeue',
                                      fontSize: 40,
                                      height: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const Divider(),

                        if (entries.isEmpty)
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'No predictor history yet.',
                              style: theme.textTheme.bodyMedium,
                            ),
                          )
                        else
                          ...entries.map((entry) =>
                              _HistoryEntry(entry: entry, theme: theme)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Single expandable history entry
// ---------------------------------------------------------------------------

class _HistoryEntry extends StatelessWidget {
  const _HistoryEntry({required this.entry, required this.theme});

  final PredictorItemHistStruct entry;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final homeABR = entry.homeABR.isNotEmpty ? entry.homeABR : 'HME';
    final awayABR = entry.awayABR.isNotEmpty ? entry.awayABR : 'AWY';

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
      child: ExpandableNotifier(
        child: ExpandablePanel(
          header: Row(
            children: [
              if (entry.homeBadge.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(entry.homeBadge,
                      height: 24, fit: BoxFit.contain),
                ),
              const SizedBox(width: 4),
              Text(
                '$homeABR ${entry.homeScore} – ${entry.awayScore} $awayABR',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontFamily: 'BebasNeue', fontSize: 18),
              ),
              const SizedBox(width: 4),
              if (entry.awayBadge.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(entry.awayBadge,
                      height: 24, fit: BoxFit.contain),
                ),
              const Spacer(),
              Text(
                '${entry.entryPoints} pts',
                style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'BebasNeue',
                    color: theme.colorScheme.primary),
              ),
            ],
          ),
          collapsed: const SizedBox.shrink(),
          expanded: Padding(
            padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (entry.scorerName.isNotEmpty)
                  Text('Scorer: ${entry.scorerName}',
                      style: theme.textTheme.bodySmall),
                Text('Score pts: ${entry.pointsForScore}',
                    style: theme.textTheme.bodySmall),
                Text('Scorer pts: ${entry.pointsForScorer}',
                    style: theme.textTheme.bodySmall),
                if (entry.bonusPoints != 0)
                  Text('Bonus: ${entry.bonusPoints}',
                      style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          theme: const ExpandableThemeData(
            tapHeaderToExpand: true,
            hasIcon: true,
          ),
        ),
      ),
    );
  }
}
