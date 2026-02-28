import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:feature_predictor/src/providers.dart';

/// Grid of available players to assign to one lineup builder slot.
///
/// The currently selected slot is identified by [slotIndex].
/// Tapping a player assigns them to that slot (via [LineupBuilderNotifier]).
/// Tapping an already-selected player shows a confirmation dialog to remove.
///
/// Ported from PlayerSelectLineupsBuilderWidget (Phase 5.4).
class PlayerSelectWidget extends ConsumerWidget {
  const PlayerSelectWidget({
    super.key,
    required this.projectId,
    required this.restApiKey,
    required this.teamObjectId,
    required this.slotIndex,
  });

  final String projectId;
  final String restApiKey;
  final String teamObjectId;
  final int slotIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final playersAsync = ref.watch(lineupsBuilderPlayersProvider((
      projectId: projectId,
      restApiKey: restApiKey,
      teamObjectId: teamObjectId,
    )));

    final selectedSlots = ref.watch(lineupBuilderNotifierProvider);
    final notifier = ref.read(lineupBuilderNotifierProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: playersAsync.when(
        loading: () => Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: SpinKitWanderingCubes(
                color: theme.colorScheme.primary, size: 50),
          ),
        ),
        error: (_, __) => Center(
          child: Text('Failed to load players.',
              style: theme.textTheme.bodyMedium),
        ),
        data: (players) {
          if (players.isEmpty) {
            return Center(
              child: Text('No players available.',
                  style: theme.textTheme.bodyMedium),
            );
          }

          // Which objectIds are already used in other slots?
          final usedObjectIds = selectedSlots
              .where((s) => s.added && s.index != slotIndex)
              .map((s) => s.objectId)
              .toSet();

          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: players.length,
            itemBuilder: (context, index) {
              final player = players[index];
              final isCurrentSlot = selectedSlots.length > slotIndex &&
                  selectedSlots[slotIndex].added &&
                  selectedSlots[slotIndex].objectId == player.objectId;
              final isUsedElsewhere =
                  usedObjectIds.contains(player.objectId);

              return GestureDetector(
                onTap: () async {
                  if (isCurrentSlot) {
                    // Confirm removal
                    final remove = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Remove player'),
                        content:
                            const Text('Are you sure?'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pop(false),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.of(context).pop(true),
                            child: const Text('Remove'),
                          ),
                        ],
                      ),
                    );
                    if (remove == true) {
                      notifier.clearSlot(slotIndex);
                      if (context.mounted) Navigator.of(context).pop();
                    }
                  } else if (!isUsedElsewhere) {
                    notifier.selectPlayer(
                      slotIndex: slotIndex,
                      name: player.playerName,
                      number: player.number,
                      image: player.playerPictureurl,
                      objectId: player.objectId,
                    );
                    if (context.mounted) Navigator.of(context).pop();
                  }
                },
                child: _PlayerCard(
                  player: player,
                  isSelected: isCurrentSlot,
                  isUsed: isUsedElsewhere,
                  theme: theme,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Player card in selection grid
// ---------------------------------------------------------------------------

class _PlayerCard extends StatelessWidget {
  const _PlayerCard({
    required this.player,
    required this.isSelected,
    required this.isUsed,
    required this.theme,
  });

  final PlayerStruct player;
  final bool isSelected;
  final bool isUsed;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isUsed && !isSelected ? 0.4 : 1.0,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? null
              : Border.all(color: theme.colorScheme.outline),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: player.playerPictureurl.isNotEmpty
                  ? NetworkImage(player.playerPictureurl)
                  : null,
              backgroundColor: Colors.grey.shade300,
              child: player.playerPictureurl.isEmpty
                  ? const Icon(Icons.person, size: 28)
                  : null,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                player.playerName,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isSelected ? theme.colorScheme.onPrimary : null,
                  fontSize: 10,
                ),
              ),
            ),
            if (player.hasNumber() && player.number != 0)
              Text(
                '${player.number}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isSelected
                      ? theme.colorScheme.onPrimary.withValues(alpha: 0.7)
                      : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  fontSize: 9,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
