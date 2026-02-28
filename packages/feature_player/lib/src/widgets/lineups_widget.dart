import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Displays home and away team lineups (starters + subs).
///
/// All player data is passed in — no API call is made.  When `lineupsOnOff`
/// is `false`, or when both team lists are empty, the "NOT YET AVAILABLE"
/// placeholder is shown instead.
///
/// The lineup-builder section is handled by passing a fully-constructed
/// [lineupBuilderWidget] from the parent; this widget shows it only when
/// [lineupsBuilderOnOff] is `true` AND the match has not yet kicked off
/// (i.e. [DateTime.now()] is before [matchStartTime]).
///
/// Ported from LineupsV1Widget (Phase 5.3).
class LineupsWidget extends StatelessWidget {
  const LineupsWidget({
    super.key,
    required this.listPlayerData,
    required this.awayTeamData,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeTeamBadge,
    required this.awayTeamBadge,
    required this.squadPlayerClickAction,
    this.headerColour = const Color(0x9A000000),
    this.lineupsOnOff = true,
    this.lineupsBuilderOnOff = true,
    this.cardBorderRadius = BorderRadius.zero,
    this.matchStartTime,
    this.lineupBuilderWidget,
  });

  final List<PlayerJSONStruct>? listPlayerData;
  final List<PlayerJSONStruct>? awayTeamData;
  final String? homeTeamName;
  final String? awayTeamName;
  final String? homeTeamBadge;
  final String? awayTeamBadge;
  final Future<void> Function(String playerObjectId)? squadPlayerClickAction;
  final Color headerColour;
  final bool lineupsOnOff;
  final bool lineupsBuilderOnOff;

  /// Border radius applied to lineup cards.
  final BorderRadius cardBorderRadius;

  /// Kick-off time.  The lineup-builder section is only shown before this.
  final DateTime? matchStartTime;

  /// Fully-constructed lineup-builder widget supplied by the parent.
  /// Shown when [lineupsBuilderOnOff] is `true` and the match has not started.
  final Widget? lineupBuilderWidget;

  bool get _hasData {
    final home = listPlayerData?.length ?? 0;
    final away = awayTeamData?.length ?? 0;
    return (home > 0 || away > 0) && lineupsOnOff;
  }

  bool get _showLineupBuilder {
    if (!lineupsBuilderOnOff) return false;
    final start = matchStartTime;
    if (start == null) return false;
    return DateTime.now().isBefore(start);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          // ── Lineups panels ──────────────────────────────────────────────
          if (_hasData)
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Home team
                      if ((listPlayerData?.length ?? 0) > 0)
                        _TeamPanel(
                          teamName: homeTeamName ?? 'Home',
                          teamBadge: homeTeamBadge,
                          players: listPlayerData!,
                          headerColour: headerColour,
                          cardBorderRadius: cardBorderRadius,
                          primaryColor: theme.colorScheme.primary,
                          onPlayerTap: squadPlayerClickAction,
                        ),
                      // Away team
                      if ((awayTeamData?.length ?? 0) > 0)
                        _TeamPanel(
                          teamName: awayTeamName ?? 'Away',
                          teamBadge: awayTeamBadge,
                          players: awayTeamData!,
                          headerColour: headerColour,
                          cardBorderRadius: cardBorderRadius,
                          primaryColor: theme.colorScheme.primary,
                          onPlayerTap: squadPlayerClickAction,
                        ),
                    ]
                        .divide(const SizedBox(height: 20))
                        .addToStart(const SizedBox(height: 20))
                        .addToEnd(const SizedBox(height: 20)),
                  ),
                ),
              ),
            ),

          // ── Not yet available placeholder ───────────────────────────────
          if (!_hasData)
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: FaIcon(
                        FontAwesomeIcons.shirt,
                        color: theme.colorScheme.primary,
                        size: 60,
                      ),
                    ),
                    Text(
                      'LINEUPS',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'BebasNeue',
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      'NOT YET AVAILABLE',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    // Lineup builder (if available and before kick-off)
                    if (_showLineupBuilder && lineupBuilderWidget != null)
                      lineupBuilderWidget!,
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Team panel
// ---------------------------------------------------------------------------

class _TeamPanel extends StatelessWidget {
  const _TeamPanel({
    required this.teamName,
    required this.teamBadge,
    required this.players,
    required this.headerColour,
    required this.cardBorderRadius,
    required this.primaryColor,
    required this.onPlayerTap,
  });

  final String teamName;
  final String? teamBadge;
  final List<PlayerJSONStruct> players;
  final Color headerColour;
  final BorderRadius cardBorderRadius;
  final Color primaryColor;
  final Future<void> Function(String playerObjectId)? onPlayerTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final starters = players
        .where((p) => p.startedOnPitch)
        .take(11)
        .toList();
    final subs = players
        .where((p) => !p.startedOnPitch)
        .take(7)
        .toList();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: cardBorderRadius,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Header
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: headerColour),
              child: Column(
                children: [
                  Divider(height: 2, thickness: 2, color: primaryColor),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8, 10, 8, 12),
                    child: Row(
                      children: [
                        if (teamBadge != null && teamBadge!.isNotEmpty)
                          ClipRRect(
                            borderRadius: BorderRadius.zero,
                            child: Image.network(
                              teamBadge!,
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          ),
                        Text(
                          teamName,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Inter',
                            color: theme.colorScheme.surface,
                          ),
                        ),
                      ].divide(const SizedBox(width: 8)),
                    ),
                  ),
                ],
              ),
            ),

            // Starters list
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                primary: false,
                shrinkWrap: true,
                itemCount: starters.length,
                separatorBuilder: (_, __) => const SizedBox(height: 3),
                itemBuilder: (context, i) => _PlayerRow(
                  player: starters[i],
                  primaryColor: primaryColor,
                  onTap: () => _onPlayerTap(starters[i]),
                ),
              ),
            ),

            // "Substitutes" label
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: Text(
                    'Substitutes',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ],
            ),

            // Subs list
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                primary: false,
                shrinkWrap: true,
                itemCount: subs.length,
                separatorBuilder: (_, __) => const SizedBox(height: 3),
                itemBuilder: (context, i) => _PlayerRow(
                  player: subs[i],
                  primaryColor: primaryColor,
                  onTap: () => _onPlayerTap(subs[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onPlayerTap(PlayerJSONStruct player) async {
    final id = player.playerObjectId;
    if (id.isNotEmpty && id != 'null') {
      await onPlayerTap?.call(id);
    }
  }
}

// ---------------------------------------------------------------------------
// Player row
// ---------------------------------------------------------------------------

class _PlayerRow extends StatelessWidget {
  const _PlayerRow({
    required this.player,
    required this.primaryColor,
    required this.onTap,
  });

  final PlayerJSONStruct player;
  final Color primaryColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                // Squad number
                SizedBox(
                  width: 26,
                  child: Visibility(
                    visible: player.playerNumber != 0,
                    child: Text(
                      player.playerNumber.toString(),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Rubik',
                        color: theme.colorScheme.onSurface,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                // Avatar
                if (player.playerProfileURL.isNotEmpty)
                  Container(
                    width: 36,
                    height: 36,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(
                      player.playerProfileURL,
                      fit: BoxFit.cover,
                    ),
                  ),

                // Name: first initial + ". " + last name
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                    child: ClipRect(
                      child: Row(
                        children: [
                          Text(
                            player.playerFirst.isNotEmpty
                                ? player.playerFirst.substring(0, 1)
                                : '',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontFamily: 'Rubik',
                              color:
                                  theme.colorScheme.onSurfaceVariant,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            '. ${player.playerLast}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontFamily: 'Rubik',
                              color:
                                  theme.colorScheme.onSurfaceVariant,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(width: 4)),
            ),
          ),

          // Status icons
          Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              children: [
                // Injury
                if (player.isInjured)
                  Icon(Icons.medical_services,
                      color: theme.colorScheme.tertiary, size: 22),

                // Substituted off
                if (player.startedOnPitch && !player.isOnPitch)
                  FaIcon(FontAwesomeIcons.angleDown,
                      color: theme.colorScheme.error, size: 22),

                // Substitution on minute
                if (player.minuteOn != 0)
                  Text(
                    player.minuteOn.toString(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontFamily: 'Rubik',
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                // Yellow card (1)
                if (player.numberOfCards == 1)
                  const Icon(Icons.rectangle_rounded,
                      color: Colors.amber, size: 22),

                // Red card (3)
                if (player.numberOfCards == 3)
                  Icon(Icons.rectangle_rounded,
                      color: theme.colorScheme.error, size: 22),

                // Yellow + red (2)
                if (player.numberOfCards == 2)
                  Stack(
                    children: [
                      const Align(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 5, 5, 0),
                          child: Icon(Icons.rectangle_rounded,
                              color: Colors.amber, size: 22),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.12, -0.38),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5, 0, 0, 5),
                          child: Icon(Icons.rectangle_rounded,
                              color: theme.colorScheme.error, size: 22),
                        ),
                      ),
                    ],
                  ),

                // Goals
                SizedBox(
                  width: 23,
                  height: 23,
                  child: Stack(
                    children: [
                      if (player.numberOfGoals > 0)
                        Icon(Icons.sports_soccer,
                            color: theme.colorScheme.onSurface, size: 24),
                      if (player.numberOfGoals >= 2)
                        Opacity(
                          opacity: 0.7,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surface,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                player.numberOfGoals.toString(),
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ].divide(const SizedBox(width: 4)),
            ),
          ),
        ],
      ),
    );
  }
}
