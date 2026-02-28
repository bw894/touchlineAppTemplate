import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:feature_predictor/src/providers.dart';
import 'package:feature_predictor/src/widgets/player_select_widget.dart';
import 'package:feature_predictor/src/widgets/view_lineups_widget.dart';

// ---------------------------------------------------------------------------
// Available formations
// ---------------------------------------------------------------------------

const _formations = <String>[
  '4-4-2',
  '4-3-3',
  '4-5-1',
  '3-5-2',
  '3-4-3',
  '5-3-2',
  '5-4-1',
  '4-2-3-1',
];

/// Returns row counts for each formation string: GK row is always first.
List<int> _rowsForFormation(String? formation) {
  if (formation == null) return [1, 4, 4, 2];
  final parts =
      formation.split('-').map((s) => int.tryParse(s.trim()) ?? 0).toList();
  return [1, ...parts];
}

// ---------------------------------------------------------------------------
// Widget
// ---------------------------------------------------------------------------

/// Lineup builder — lets the user pick a formation, select 11 players, and
/// submit their lineup for a match.  After a successful save the view switches
/// to [ViewLineupsWidget] to show the submitted lineup.
///
/// Ported from LineupBuilderV1Widget + LineupBuilderComponentWidget (Phase 5.4).
class LineupBuilderWidget extends ConsumerStatefulWidget {
  const LineupBuilderWidget({
    super.key,
    required this.projectId,
    required this.restApiKey,
    required this.teamObjectId,
    required this.userName,
    this.matchObjectId,
    this.closeReq = true,
    this.cardBorderRadius = BorderRadius.zero,
  });

  final String projectId;
  final String restApiKey;
  final String teamObjectId;
  final String? userName;
  final String? matchObjectId;
  final bool closeReq;
  final BorderRadius cardBorderRadius;

  @override
  ConsumerState<LineupBuilderWidget> createState() =>
      _LineupBuilderWidgetState();
}

class _LineupBuilderWidgetState extends ConsumerState<LineupBuilderWidget> {
  String? _formation;
  bool _submitted = false;
  String? _savedObjectId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(lineupBuilderNotifierProvider.notifier).initSlots();
    });
  }

  Future<void> _saveTeam(BuildContext context) async {
    final messenger = ScaffoldMessenger.of(context);
    final slots = ref.read(lineupBuilderNotifierProvider);

    if (_formation == null) {
      messenger.showSnackBar(
          const SnackBar(content: Text('Please select a formation.')));
      return;
    }
    final addedCount = slots.where((s) => s.added).length;
    if (addedCount < 11) {
      messenger.showSnackBar(
          const SnackBar(content: Text('Please select all 11 players.')));
      return;
    }

    // Format players to JSON-serialisable list.
    final playersJson = slots
        .map((s) => {
              'name': s.name,
              'number': s.number,
              'image': s.image,
              'objectId': s.objectId,
              'index': s.index,
              'added': s.added,
            })
        .toList();

    final r1 = await BackendlessDatabaseGroup.addLineupsBuilderEntryCall.call(
      userName: widget.userName,
      selectedPlayersJson: playersJson,
      playerMap: _formation,
      bLProjectId: widget.projectId,
      bLRestAPIKey: widget.restApiKey,
    );

    if (!r1.succeeded) {
      if (context.mounted) {
        _showErrorDialog(context, 'Failed to save lineup. Please try again.');
      }
      return;
    }

    final newObjectId = PublicLineupsBuilderStruct.maybeFromMap(r1.jsonBody)
        ?.objectId;

    if (widget.matchObjectId != null && widget.matchObjectId!.isNotEmpty) {
      final r2 = await BackendlessDatabaseGroup
          .addMatchToLineupsBuilderEntryCall
          .call(
        lineupsObjectId: newObjectId,
        matchObjectId: widget.matchObjectId,
        bLProjectId: widget.projectId,
        bLRestAPIKey: widget.restApiKey,
      );
      if (!r2.succeeded) {
        if (context.mounted) {
          _showErrorDialog(
              context, 'Lineup saved but failed to link to match.');
        }
        return;
      }
    }

    // Success — clear slots and show saved view.
    ref.read(lineupBuilderNotifierProvider.notifier).clearAll();
    setState(() {
      _savedObjectId = newObjectId;
      _submitted = true;
    });
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // After successful save, switch to read-only view.
    if (_submitted && _savedObjectId != null) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: ViewLineupsWidget(
          objectId: _savedObjectId!,
          projectId: widget.projectId,
          restApiKey: widget.restApiKey,
        ),
      );
    }

    final slots = ref.watch(lineupBuilderNotifierProvider);
    final rowCounts = _rowsForFormation(_formation);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close / nav
            if (widget.closeReq)
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close_outlined,
                      color: theme.colorScheme.onSurface, size: 28),
                ),
              ),

            // Title
            Text('LINEUP BUILDER',
                style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'BebasNeue', fontSize: 36, height: 1.0)),
            const SizedBox(height: 12),

            // Formation selector
            InputDecorator(
              decoration: InputDecoration(
                labelText: 'Select Formation',
                border: OutlineInputBorder(
                    borderRadius: widget.cardBorderRadius),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 4),
              ),
              child: DropdownButton<String>(
                value: _formation,
                isExpanded: true,
                underline: const SizedBox.shrink(),
                items: _formations
                    .map((f) => DropdownMenuItem(value: f, child: Text(f)))
                    .toList(),
                onChanged: (v) => setState(() => _formation = v),
              ),
            ),
            const SizedBox(height: 20),

            // Pitch grid
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32),
                borderRadius: BorderRadius.circular(8),
              ),
              child: _buildFormationGrid(context, theme, slots, rowCounts),
            ),
            const SizedBox(height: 20),

            // Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _saveTeam(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: widget.cardBorderRadius),
                ),
                child: Text('SAVE TEAM',
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'BebasNeue', fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormationGrid(
    BuildContext context,
    ThemeData theme,
    List<LineupBuilderPlayersStruct> slots,
    List<int> rowCounts,
  ) {
    int slotIndex = 0;
    final rows = <Widget>[];

    for (final count in rowCounts) {
      final rowWidgets = <Widget>[];
      for (var i = 0; i < count; i++) {
        final idx = slotIndex;
        final slot = idx < slots.length ? slots[idx] : null;
        slotIndex++;
        rowWidgets.add(_SlotButton(
          slotIndex: idx,
          slot: slot,
          onTap: () => _openPlayerSelect(context, idx),
        ));
      }
      rows.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rowWidgets,
        ),
      ));
    }

    return Column(children: rows);
  }

  void _openPlayerSelect(BuildContext context, int slotIndex) {
    showDialog<void>(
      context: context,
      builder: (_) => Dialog(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          child: PlayerSelectWidget(
            projectId: widget.projectId,
            restApiKey: widget.restApiKey,
            teamObjectId: widget.teamObjectId,
            slotIndex: slotIndex,
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Slot button
// ---------------------------------------------------------------------------

class _SlotButton extends StatelessWidget {
  const _SlotButton({
    required this.slotIndex,
    required this.slot,
    required this.onTap,
  });

  final int slotIndex;
  final LineupBuilderPlayersStruct? slot;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final added = slot?.added ?? false;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor:
                added ? Colors.white24 : Colors.white30,
            backgroundImage:
                (added && (slot?.image ?? '').isNotEmpty)
                    ? NetworkImage(slot!.image)
                    : null,
            child: (!added || (slot?.image ?? '').isEmpty)
                ? Icon(
                    added ? Icons.person : Icons.add,
                    color: Colors.white,
                    size: 20,
                  )
                : null,
          ),
          const SizedBox(height: 2),
          SizedBox(
            width: 52,
            child: Text(
              added ? _shortName(slot?.name ?? '') : '',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontFamily: 'Inter'),
            ),
          ),
        ],
      ),
    );
  }

  String _shortName(String name) {
    final parts = name.trim().split(' ');
    return parts.length > 1 ? parts.last : parts.first;
  }
}
