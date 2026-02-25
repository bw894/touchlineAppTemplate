import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theming/theming.dart';

import 'package:feature_league/src/providers.dart';

/// League table widget with three layout variants controlled by [variant].
///
/// - [LeagueTableVariant.mini]: Compact scrollable snippet showing ±3 rows
///   around [teamName]. Focus team name is rendered in the primary colour.
/// - [LeagueTableVariant.compact]: Same snippet but the focus team row gets a
///   coloured background ([focusBgColor] / [focusTextColor]).
/// - [LeagueTableVariant.full]: Full scrollable table with zone dividers
///   (promotion / play-off / relegation). Set [showTabs] to `true` to enable
///   the OVERALL / HOME / AWAY tab switcher (ported from FullLeagueTableV1).
///   Without tabs the table is always sorted by rank (ported from
///   FullLeagueTableTheSportsDB).
class LeagueTableWidget extends ConsumerStatefulWidget {
  const LeagueTableWidget({
    super.key,
    required this.projectId,
    required this.restApiKey,
    this.userToken = '',
    this.teamName = '',
    this.variant = LeagueTableVariant.mini,
    this.showTabs = false,
    this.focusBgColor,
    this.focusTextColor,
    this.autoPromotionIndex = 0,
    this.playoffIndex = 6,
    this.relegationIndex = 19,
    this.cardBorderRadius,
  });

  final String projectId;
  final String restApiKey;

  // Unused in API calls — kept for widget-level auth context if callers need it.
  final String userToken;

  /// The full team name used to identify / highlight the focus team.
  final String teamName;

  final LeagueTableVariant variant;

  /// [LeagueTableVariant.full] only — show OVERALL / HOME / AWAY tab switcher.
  final bool showTabs;

  /// [LeagueTableVariant.compact] — background colour of the highlighted row.
  /// [LeagueTableVariant.mini] — unused (primary colour used for text instead).
  final Color? focusBgColor;

  /// [LeagueTableVariant.compact] — text colour when the row is highlighted.
  final Color? focusTextColor;

  /// [LeagueTableVariant.full] — index (0-based) after which the automatic-
  /// promotion zone divider is drawn.
  final int autoPromotionIndex;

  /// [LeagueTableVariant.full] — index after which the play-off zone divider
  /// is drawn.
  final int playoffIndex;

  /// [LeagueTableVariant.full] — index after which the relegation zone divider
  /// is drawn.
  final int relegationIndex;

  /// [LeagueTableVariant.full] — border radius applied to the card container.
  final BorderRadius? cardBorderRadius;

  @override
  ConsumerState<LeagueTableWidget> createState() => _LeagueTableWidgetState();
}

class _LeagueTableWidgetState extends ConsumerState<LeagueTableWidget> {
  // Tab state — only used when variant == full && showTabs == true.
  String _tab = 'OVERALL';
  late FormFieldController<List<String>> _tabCtrl;

  @override
  void initState() {
    super.initState();
    _tabCtrl = FormFieldController<List<String>>(['OVERALL']);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Computed provider args
  // ---------------------------------------------------------------------------

  get _miniArgs => (
        projectId: widget.projectId,
        restApiKey: widget.restApiKey,
      );

  get _fullArgs => (
        projectId: widget.projectId,
        restApiKey: widget.restApiKey,
        sort: _tab == 'HOME'
            ? 'HomePoints'
            : _tab == 'AWAY'
                ? 'AwayPoints'
                : 'rank',
        sortDir: _tab == 'OVERALL' ? 'asc' : 'desc',
        gDterm: _tab == 'HOME'
            ? 'HomeGoalDifference'
            : _tab == 'AWAY'
                ? 'AwayGoalDifference'
                : 'GoalDifference',
      );

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    switch (widget.variant) {
      case LeagueTableVariant.mini:
      case LeagueTableVariant.compact:
        return _buildMini(context);
      case LeagueTableVariant.full:
        return _buildFull(context);
    }
  }

  // ---------------------------------------------------------------------------
  // Mini / compact variant
  // ---------------------------------------------------------------------------

  Widget _buildMini(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final primaryText = Theme.of(context).colorScheme.onSurface;

    final async = ref.watch(leagueMiniProvider(_miniArgs));

    return ClipRRect(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(2, 5, 5, 5),
          child: async.when(
            loading: () => Center(
              child: AppLoader(color: primary, size: 50),
            ),
            error: (_, __) => const SizedBox.shrink(),
            data: (teams) {
              // Find the focus team's index in the sorted list.
              final focusIdx =
                  teams.indexWhere((t) => t.name == widget.teamName);

              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                primary: false,
                shrinkWrap: true,
                itemCount: teams.length,
                separatorBuilder: (_, __) => const SizedBox.shrink(),
                itemBuilder: (context, i) {
                  final item = teams[i];

                  // Show only ±3 rows around the focus team.
                  final visible = focusIdx == -1 ||
                      ((focusIdx - i) < 3 && (focusIdx - i) > -3);

                  if (!visible) return const SizedBox.shrink();

                  final isFocus = item.name == widget.teamName;
                  final isCompact =
                      widget.variant == LeagueTableVariant.compact;
                  final rowBg = isCompact && isFocus
                      ? (widget.focusBgColor ?? primary)
                      : const Color(0x0014181B);
                  final textColor = isCompact && isFocus
                      ? (widget.focusTextColor ?? Colors.white)
                      : (!isCompact && isFocus ? primary : primaryText);

                  return Container(
                    height: isCompact ? 40 : null,
                    decoration: BoxDecoration(color: rowBg),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Left: rank | badge | name
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.09,
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    item.rank.toString(),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.09,
                                  decoration: const BoxDecoration(),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.zero,
                                    child: Image.network(
                                      item.imageURL,
                                      width: 25,
                                      height: 25,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    item.name.length > 10
                                        ? '${item.name.substring(0, 10)}…'
                                        : item.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: textColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Right: Pld | GD | Pts
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.07,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  item.played.toString(),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: textColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.07,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  item.goalDiff.toString(),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: textColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.07,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 1, 0),
                                  child: Text(
                                    item.points.toString(),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: textColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 18)),
                          ),
                        ]
                            .divide(const SizedBox(width: 10))
                            .addToStart(const SizedBox(width: 10))
                            .addToEnd(const SizedBox(width: 10)),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Full variant
  // ---------------------------------------------------------------------------

  Widget _buildFull(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final cfg = ref.watch(appConfigProvider);
    final br = widget.cardBorderRadius ?? cfg.cardBorderRadius;

    final async = ref.watch(leagueFullProvider(_fullArgs));

    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // ── OVERALL / HOME / AWAY tab chips ──────────────────────────
              if (widget.showTabs)
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: AppChoiceChips(
                      options: const [
                        ChipData('OVERALL'),
                        ChipData('HOME'),
                        ChipData('AWAY'),
                      ],
                      controller: _tabCtrl,
                      multiselect: false,
                      initialized: true,
                      alignment: WrapAlignment.center,
                      chipSpacing: 10,
                      selectedChipStyle: ChipStyle(
                        backgroundColor: primary,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                        labelPadding: const EdgeInsetsDirectional.fromSTEB(
                            12, 3, 12, 3),
                        elevation: 0,
                        borderRadius: br,
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: const Color(0xFFE0E3E7),
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        labelPadding: const EdgeInsetsDirectional.fromSTEB(
                            12, 3, 12, 3),
                        elevation: 0,
                        borderRadius: br,
                      ),
                      onChanged: (val) {
                        final selected = val?.firstOrNull;
                        if (selected != null && selected != _tab) {
                          setState(() => _tab = selected);
                        }
                      },
                    ),
                  ),
                ),

              // ── Header row ───────────────────────────────────────────────
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Container(
                  width: double.infinity,
                  color: const Color(0xC1E0E3E7),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.09,
                                decoration: const BoxDecoration(),
                                child: Text(
                                  'Pos',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.09,
                                decoration: const BoxDecoration(),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      2, 0, 0, 0),
                                  child: Text(
                                    'Team Name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.08,
                              decoration: const BoxDecoration(),
                              child: Text(
                                'Pld',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.08,
                              decoration: const BoxDecoration(),
                              child: Text(
                                'GD',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.10,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 1, 0),
                                child: Text(
                                  'Pts',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 18)),
                        ),
                      ]
                          .divide(const SizedBox(width: 10))
                          .addToStart(const SizedBox(width: 10))
                          .addToEnd(const SizedBox(width: 10)),
                    ),
                  ),
                ),
              ),

              // ── Table rows ───────────────────────────────────────────────
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 5),
                child: async.when(
                  loading: () => Center(
                    child: AppLoader(color: primary, size: 50),
                  ),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (teams) => ListView.separated(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    itemCount: teams.length,
                    separatorBuilder: (_, __) => const SizedBox.shrink(),
                    itemBuilder: (context, i) {
                      final item = teams[i];
                      final isFocus = item.name == widget.teamName;
                      final textColor = isFocus
                          ? Colors.white
                          : Theme.of(context).colorScheme.onSurface;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: isFocus ? primary : Colors.transparent,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Trend icon
                                        SizedBox(
                                          width: 16,
                                          child: _TrendIcon(
                                            trend: item.trend,
                                            isFocus: isFocus,
                                          ),
                                        ),
                                        // Position (1-based)
                                        Container(
                                          width: MediaQuery.sizeOf(context)
                                                  .width *
                                              0.08,
                                          decoration: const BoxDecoration(),
                                          child: Text(
                                            (i + 1).toString(),
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  color: textColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        // Badge
                                        Container(
                                          width: MediaQuery.sizeOf(context)
                                                  .width *
                                              0.09,
                                          decoration: const BoxDecoration(),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.zero,
                                            child: Image.network(
                                              item.imageURL,
                                              width: 25,
                                              height: 25,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        // Name
                                        Expanded(
                                          child: Text(
                                            item.name.length > 11
                                                ? '${item.name.substring(0, 11)}…'
                                                : item.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  color: textColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Stats columns
                                  _buildStatColumns(context, item, textColor),
                                ]
                                    .divide(const SizedBox(width: 10))
                                    .addToStart(const SizedBox(width: 4))
                                    .addToEnd(const SizedBox(width: 10)),
                              ),
                            ),
                          ),
                          // Zone dividers
                          if (i == widget.autoPromotionIndex ||
                              i == widget.playoffIndex ||
                              i == widget.relegationIndex)
                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0x54000000),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatColumns(
      BuildContext context, LeagueTableItemStruct item, Color textColor) {
    final (pld, gd, pts) = switch (_tab) {
      'HOME' => (
          item.homeMatchesPlayed,
          item.homeGoalDifference,
          item.homePoints,
        ),
      'AWAY' => (
          item.awayMatchesPlayed,
          item.awayGoalDifference,
          item.awayPoints,
        ),
      _ => (item.played, item.goalDiff, item.points),
    };

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.08,
          decoration: const BoxDecoration(),
          child: Text(
            pld.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 0.08,
          decoration: const BoxDecoration(),
          child: Text(
            gd.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 0.10,
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 1, 0),
            child: Text(
              pts.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ].divide(const SizedBox(width: 18)),
    );
  }
}

// ---------------------------------------------------------------------------
// Private helpers
// ---------------------------------------------------------------------------

class _TrendIcon extends StatelessWidget {
  const _TrendIcon({required this.trend, required this.isFocus});

  final String trend;
  final bool isFocus;

  @override
  Widget build(BuildContext context) {
    final upColor = isFocus
        ? Colors.white
        : Theme.of(context).extension<TouchlineColors>()!.predictorGreen;
    final downColor = isFocus
        ? Colors.white
        : Theme.of(context).extension<TouchlineColors>()!.predictorRed;
    final neutralColor = isFocus
        ? Colors.white
        : Theme.of(context).colorScheme.onSurfaceVariant;

    switch (trend) {
      case 'up':
        return FaIcon(FontAwesomeIcons.angleUp, size: 14, color: upColor);
      case 'down':
        return FaIcon(FontAwesomeIcons.angleDown, size: 14, color: downColor);
      default:
        return FaIcon(FontAwesomeIcons.minus, size: 14, color: neutralColor);
    }
  }
}
