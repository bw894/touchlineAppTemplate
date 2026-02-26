import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:feature_predictor/src/providers.dart';

/// Displays a submitted lineup builder entry on a formation-style pitch view.
///
/// Ported from ViewLineupsBuilderWidget (Phase 5.4).
class ViewLineupsWidget extends ConsumerWidget {
  const ViewLineupsWidget({
    super.key,
    required this.objectId,
    required this.projectId,
    required this.restApiKey,
  });

  final String objectId;
  final String projectId;
  final String restApiKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final entryAsync = ref.watch(lineupsBuilderEntryProvider((
      projectId: projectId,
      restApiKey: restApiKey,
      objectId: objectId,
    )));

    return entryAsync.when(
      loading: () => Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child:
              SpinKitWanderingCubes(color: theme.colorScheme.primary, size: 50),
        ),
      ),
      error: (_, __) => const SizedBox.shrink(),
      data: (entry) {
        if (entry == null) return const SizedBox.shrink();

        final players = entry.selectedPlayers;
        final rowCounts = _parsePlayerMap(entry.playerMap);

        return SizedBox(
          width: 260,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (entry.userName.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    entry.userName,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontFamily: 'BebasNeue', fontSize: 22),
                  ),
                ),
              Container(
                width: 260,
                height: 388,
                decoration: BoxDecoration(
                  color: const Color(0xFF2E7D32),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white24),
                ),
                child: _FormationGrid(
                  players: players,
                  rowCounts: rowCounts,
                  theme: theme,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Parses comma-separated int string (e.g. "4,3,3") into a list of row
  /// counts.  Prepends GK row (1) if absent.
  List<int> _parsePlayerMap(String playerMap) {
    if (playerMap.isEmpty) return [1, 4, 3, 3];
    final parts = playerMap
        .split(',')
        .map((s) => int.tryParse(s.trim()) ?? 0)
        .where((n) => n > 0)
        .toList();
    if (parts.isEmpty) return [1, 4, 3, 3];
    // Ensure GK row is included (sum must be 11)
    final total = parts.fold(0, (a, b) => a + b);
    if (total == 10) return [1, ...parts]; // add GK row
    return parts;
  }
}

// ---------------------------------------------------------------------------
// Formation grid
// ---------------------------------------------------------------------------

class _FormationGrid extends StatelessWidget {
  const _FormationGrid({
    required this.players,
    required this.rowCounts,
    required this.theme,
  });

  final List<LineupBuilderPlayersStruct> players;
  final List<int> rowCounts;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    int playerIndex = 0;
    final rows = <Widget>[];

    for (final count in rowCounts) {
      final rowPlayers = <Widget>[];
      for (var i = 0; i < count; i++) {
        final p =
            playerIndex < players.length ? players[playerIndex] : null;
        playerIndex++;
        rowPlayers.add(_PlayerDot(player: p, theme: theme));
      }
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: rowPlayers,
      ));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: rows,
    );
  }
}

// ---------------------------------------------------------------------------
// Single player dot
// ---------------------------------------------------------------------------

class _PlayerDot extends StatelessWidget {
  const _PlayerDot({required this.player, required this.theme});

  final LineupBuilderPlayersStruct? player;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final p = player;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white24,
          backgroundImage:
              (p != null && p.added && p.image.isNotEmpty)
                  ? NetworkImage(p.image)
                  : null,
          child: (p == null || !p.added || p.image.isEmpty)
              ? const Icon(Icons.person, color: Colors.white, size: 18)
              : null,
        ),
        const SizedBox(height: 2),
        SizedBox(
          width: 48,
          child: Text(
            p != null && p.added
                ? _shortName(p.name)
                : '',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
                color: Colors.white, fontSize: 9, fontFamily: 'Inter'),
          ),
        ),
      ],
    );
  }

  String _shortName(String name) {
    final parts = name.trim().split(' ');
    if (parts.length == 1) return parts.first;
    return parts.last; // show surname
  }
}
