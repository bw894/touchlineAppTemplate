import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// Displays a player's RSVP status for an event and allows them to update it.
///
/// Shows the player name and three choice buttons: YES / UNSURE / NO.
/// On tap, calls the appropriate API:
/// - [currentRSVPObjectId] set → `updateEventRSVPCall`
/// - [currentRSVPObjectId] null/empty → `addNewEventRSVPCall`
class EventRsvpWidget extends StatefulWidget {
  const EventRsvpWidget({
    super.key,
    required this.playerName,
    required this.playerObjectId,
    required this.eventObjectId,
    required this.projectId,
    required this.restApiKey,
    this.currentRSVP,
    this.currentRSVPObjectId,
  });

  final String playerName;
  final String playerObjectId;
  final String eventObjectId;
  final String projectId;
  final String restApiKey;
  final String? currentRSVP;
  final String? currentRSVPObjectId;

  @override
  State<EventRsvpWidget> createState() => _EventRsvpWidgetState();
}

class _EventRsvpWidgetState extends State<EventRsvpWidget> {
  String? _status;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _status = widget.currentRSVP;
  }

  Future<void> _setRsvp(String status) async {
    if (_loading) return;
    setState(() => _loading = true);
    try {
      final hasExisting = widget.currentRSVPObjectId != null &&
          widget.currentRSVPObjectId!.isNotEmpty;
      if (hasExisting) {
        await YouthManagementGroup.updateEventRSVPCall.call(
          rsvpObjectId: widget.currentRSVPObjectId,
          status: status,
          bLappId: widget.projectId,
          bLRestApiKey: widget.restApiKey,
        );
      } else {
        await YouthManagementGroup.addNewEventRSVPCall.call(
          eventObjectId: widget.eventObjectId,
          playerObjectId: widget.playerObjectId,
          status: status,
          bLappId: widget.projectId,
          bLRestApiKey: widget.restApiKey,
        );
      }
      if (mounted) setState(() => _status = status);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Player name
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.playerName,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                ),
              ),
              Text(
                _status ?? 'No response',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          // RSVP choice buttons
          if (_loading)
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: SpinKitWanderingCubes(
                color: theme.colorScheme.primary,
                size: 24.0,
              ),
            )
          else
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _RsvpButton(
                  label: 'YES',
                  selected: _status == 'YES',
                  onTap: () => _setRsvp('YES'),
                ),
                const SizedBox(width: 6.0),
                _RsvpButton(
                  label: 'UNSURE',
                  selected: _status == 'UNSURE',
                  onTap: () => _setRsvp('UNSURE'),
                ),
                const SizedBox(width: 6.0),
                _RsvpButton(
                  label: 'NO',
                  selected: _status == 'NO',
                  onTap: () => _setRsvp('NO'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _RsvpButton extends StatelessWidget {
  const _RsvpButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = selected
        ? theme.colorScheme.primary
        : theme.colorScheme.surfaceContainerHighest;
    final fg = selected ? Colors.white : theme.colorScheme.onSurface;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding:
            const EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 10.0, 6.0),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: fg,
            fontWeight: FontWeight.w600,
            fontSize: 11.0,
          ),
        ),
      ),
    );
  }
}
