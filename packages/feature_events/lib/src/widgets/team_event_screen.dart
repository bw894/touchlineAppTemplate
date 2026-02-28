import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:feature_events/src/widgets/event_rsvp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

/// Full-page screen for a single team event.
///
/// Loads event details via [TeamsGroup.getTeamEventByIDCall], displays a
/// primary-colour header, key details (date / location / description), and
/// an RSVP section listing [players] for the event's team.
///
/// [players] should be the current user's player records — this widget
/// filters them internally to those belonging to the event's team.
class TeamEventScreen extends StatelessWidget {
  const TeamEventScreen({
    super.key,
    required this.objectId,
    required this.projectId,
    required this.restApiKey,
    required this.userToken,
    required this.players,
    this.clubBadgeUrl,
  });

  final String objectId;
  final String projectId;
  final String restApiKey;
  final String userToken;
  final List<PlayerStruct> players;
  final String? clubBadgeUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: FutureBuilder<ApiCallResponse>(
          future: TeamsGroup.getTeamEventByIDCall.call(
            eventObjectId: objectId,
            userToken: userToken,
            bLappId: projectId,
            bLRestApiKey: restApiKey,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: SpinKitWanderingCubes(
                  color: Theme.of(context).colorScheme.primary,
                  size: 50.0,
                ),
              );
            }
            final response = snapshot.data!;
            final event = TeamEventStruct.maybeFromMap(response.jsonBody);

            return _TeamEventBody(
              event: event,
              players: players,
              projectId: projectId,
              restApiKey: restApiKey,
              eventObjectId: objectId,
              clubBadgeUrl: clubBadgeUrl,
            );
          },
        ),
      ),
    );
  }
}

class _TeamEventBody extends StatelessWidget {
  const _TeamEventBody({
    required this.event,
    required this.players,
    required this.projectId,
    required this.restApiKey,
    required this.eventObjectId,
    this.clubBadgeUrl,
  });

  final TeamEventStruct? event;
  final List<PlayerStruct> players;
  final String projectId;
  final String restApiKey;
  final String eventObjectId;
  final String? clubBadgeUrl;

  /// Filters players to those belonging to this event's team.
  List<PlayerStruct> get _teamPlayers {
    final teamId = event?.team.objectId;
    if (teamId == null || teamId.isEmpty) return players;
    return players.where((p) => p.team.objectId == teamId).toList();
  }

  IconData _typeIcon(String? type) {
    switch (type) {
      case 'AWARDS':
        return FontAwesomeIcons.award;
      case 'MATCH':
        return Icons.sports_soccer;
      default:
        return Icons.fitness_center_sharp;
    }
  }

  String _formatDateTime(int? ms) {
    if (ms == null || ms == 0) return '';
    final dt = DateTime.fromMillisecondsSinceEpoch(ms);
    return DateFormat('jm, MMMMEEEEd').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ------------------------------------------------------------------
          // Header (270px primary)
          // ------------------------------------------------------------------
          Container(
            width: double.infinity,
            height: 270.0,
            color: theme.colorScheme.primary,
            child: Stack(
              children: [
                // Back button
                Positioned(
                  top: 55.0,
                  left: 14.0,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).maybePop(),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.west,
                        color: theme.colorScheme.onPrimary,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                // Club badge (top right)
                if (clubBadgeUrl != null)
                  Positioned(
                    top: 55.0,
                    right: 14.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(
                        clubBadgeUrl!,
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                // Event info
                Positioned(
                  bottom: 16.0,
                  left: 14.0,
                  right: 14.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Team badge chip
                      if (event?.team.name != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.onPrimary
                                .withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            event!.team.name.toUpperCase(),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      const SizedBox(height: 6.0),
                      // Event name
                      Text(
                        (event?.eventName ?? '').toUpperCase(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      // Type icon + organiser
                      Row(
                        children: [
                          Icon(
                            _typeIcon(event?.type),
                            color: theme.colorScheme.onPrimary,
                            size: 18.0,
                          ),
                          const SizedBox(width: 6.0),
                          if (event?.owner.name != null)
                            Text(
                              'Organised by ${event!.owner.name}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onPrimary
                                    .withValues(alpha: 0.85),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ------------------------------------------------------------------
          // KEY DETAILS
          // ------------------------------------------------------------------
          Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(14.0, 15.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KEY DETAILS',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                // Date/time
                Row(
                  children: [
                    Icon(Icons.access_time_rounded,
                        size: 18.0, color: theme.colorScheme.onSurface),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        _formatDateTime(event?.startDateTime),
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                // Location
                if ((event?.locationString ?? '').isNotEmpty)
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 18.0, color: theme.colorScheme.onSurface),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          event!.locationString,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                // Description
                if ((event?.description ?? '').isNotEmpty) ...[
                  const SizedBox(height: 13.0),
                  Text(
                    'From the Coach',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    event!.description,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ],
            ),
          ),

          // ------------------------------------------------------------------
          // RSVP section — one row per player in this team
          // ------------------------------------------------------------------
          if (_teamPlayers.isNotEmpty) ...[
            const SizedBox(height: 13.0),
            ..._teamPlayers.asMap().entries.map((entry) {
              final player = entry.value;
              return Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    0.0, 0.0, 0.0, 15.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: YouthManagementGroup.getEventRSVPCall.call(
                    eventObjectId: eventObjectId,
                    playerObjectId: player.objectId,
                    bLappId: projectId,
                    bLRestApiKey: restApiKey,
                  ),
                  builder: (context, snap) {
                    if (!snap.hasData) {
                      return Center(
                        child: SpinKitWanderingCubes(
                          color: Theme.of(context).colorScheme.primary,
                          size: 50.0,
                        ),
                      );
                    }
                    final rsvps = (snap.data!.jsonBody
                                .toList()
                                .map<EventRSVPStruct?>(
                                    EventRSVPStruct.maybeFromMap)
                                .toList()
                            as Iterable<EventRSVPStruct?>)
                        .withoutNulls
                        .toList();
                    final existing = rsvps.isNotEmpty ? rsvps.first : null;

                    return EventRsvpWidget(
                      key: ValueKey('rsvp_${player.objectId}'),
                      playerName: player.playerName,
                      playerObjectId: player.objectId,
                      eventObjectId: eventObjectId,
                      projectId: projectId,
                      restApiKey: restApiKey,
                      currentRSVP: existing?.status,
                      currentRSVPObjectId: existing?.objectId,
                    );
                  },
                ),
              );
            }),
          ],

          // ------------------------------------------------------------------
          // Team sponsors divider
          // ------------------------------------------------------------------
          Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Expanded(child: Divider(thickness: 1.0)),
                const SizedBox(width: 12.0),
                Text(
                  'TEAM SPONSORS',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(width: 12.0),
                const Expanded(child: Divider(thickness: 1.0)),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
        ]
            .divide(const SizedBox(height: 13.0))
            .addToStart(const SizedBox())
            .addToEnd(const SizedBox(height: 15.0)),
      ),
    );
  }
}
