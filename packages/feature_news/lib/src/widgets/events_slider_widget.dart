import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import 'package:feature_news/src/providers.dart';

/// Horizontal scrolling carousel of upcoming commercial events.
///
/// [clickAction] is called with the event's objectId when a card is tapped.
///
/// Ported from EventsSliderV1Widget (Phase 5.5).
class EventsSliderWidget extends ConsumerWidget {
  const EventsSliderWidget({
    super.key,
    required this.projectId,
    required this.restApiKey,
    this.cardBorderRadius = BorderRadius.zero,
    this.clickAction,
  });

  final String projectId;
  final String restApiKey;
  final BorderRadius cardBorderRadius;
  final Future<void> Function(String objectId)? clickAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final eventsAsync = ref.watch(upcomingEventsProvider((
      projectId: projectId,
      restApiKey: restApiKey,
    )));

    return eventsAsync.when(
      loading: () => Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: SpinKitWanderingCubes(
              color: theme.colorScheme.primary, size: 50),
        ),
      ),
      error: (_, __) => const SizedBox.shrink(),
      data: (events) {
        if (events.isEmpty) {
          return Center(
            child: Text(
              'NO UPCOMING EVENTS',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: events
                  .map(
                    (event) => Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0, 0, 15, 20),
                      child: _EventCard(
                        event: event,
                        borderRadius: cardBorderRadius,
                        theme: theme,
                        onTap: clickAction == null
                            ? null
                            : () => clickAction!(event.objectId),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Private card
// ---------------------------------------------------------------------------

class _EventCard extends StatelessWidget {
  const _EventCard({
    required this.event,
    required this.borderRadius,
    required this.theme,
    this.onTap,
  });

  final CommercialEventStruct event;
  final BorderRadius borderRadius;
  final ThemeData theme;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dateStr = _formatDate(event.startDatetime);
    final teaser = event.teaserText.length > 200
        ? '${event.teaserText.substring(0, 200)}\u2026'
        : event.teaserText;

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: borderRadius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                  height: 2,
                  thickness: 2,
                  color: theme.colorScheme.primary),
              if (event.image.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Image.network(
                    event.image,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (dateStr.isNotEmpty)
                      Text(
                        dateStr,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    if (event.name.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        event.name,
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                    if (teaser.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        teaser,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(int timestampMs) {
    try {
      if (timestampMs <= 0) return '';
      return DateFormat("MMM dd y '@ 'h:mm a")
          .format(DateTime.fromMillisecondsSinceEpoch(timestampMs));
    } catch (_) {
      return '';
    }
  }
}
