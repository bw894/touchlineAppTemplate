import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

/// Youth portal main screen.
///
/// Displays a primary-colour header with the current player's name and team,
/// then a tab view with three tabs:
/// 1. Fines — loaded from [YouthManagementGroup.getFinesForPlayerObjectIdCall]
/// 2. Events — RSVPs loaded from [YouthManagementGroup.getAllRSVPsForAPlayerCall]
/// 3. Account — placeholder tab
///
/// [player] is the currently active player record for the logged-in user.
class YouthMainScreen extends StatefulWidget {
  const YouthMainScreen({
    super.key,
    required this.player,
    required this.projectId,
    required this.restApiKey,
  });

  final PlayerStruct? player;
  final String projectId;
  final String restApiKey;

  @override
  State<YouthMainScreen> createState() => _YouthMainScreenState();
}

class _YouthMainScreenState extends State<YouthMainScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3, initialIndex: 0)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// Splits "John Smith" → ["John", "Smith"].
  List<String> _splitName(String name) {
    if (name.isEmpty) return ['', ''];
    final idx = name.indexOf(' ');
    if (idx < 0) return [name, ''];
    return [name.substring(0, idx), name.substring(idx + 1)];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final player = widget.player;
    final nameParts = _splitName(player?.playerName ?? '');

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: theme.colorScheme.surfaceContainerHighest,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // ------------------------------------------------------------------
            // Header — 140px primary colour
            // ------------------------------------------------------------------
            Container(
              width: double.infinity,
              height: 140.0,
              color: theme.colorScheme.primary,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    20.0, 65.0, 20.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).maybePop(),
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.west,
                                color: theme.colorScheme.onPrimary,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 3.0),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'HOME',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onPrimary,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              (player?.team.name ?? 'TEAM NAME').toUpperCase(),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Player name block (right side)
                    Container(
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.0,
                            color: theme.colorScheme.onPrimary,
                            offset: const Offset(0.0, 3.0),
                          ),
                        ],
                        border: Border.all(color: theme.colorScheme.primary),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            nameParts.first,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.w300,
                              fontSize: 13.0,
                            ),
                          ),
                          Text(
                            nameParts.last.toUpperCase(),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ------------------------------------------------------------------
            // Tab bar
            // ------------------------------------------------------------------
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Fines'),
                Tab(text: 'Events'),
                Tab(text: 'Account'),
              ],
            ),

            // ------------------------------------------------------------------
            // Tab content
            // ------------------------------------------------------------------
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _FinesTab(
                    playerObjectId: player?.objectId ?? '',
                    projectId: widget.projectId,
                    restApiKey: widget.restApiKey,
                  ),
                  _EventsTab(
                    playerObjectId: player?.objectId ?? '',
                    projectId: widget.projectId,
                    restApiKey: widget.restApiKey,
                  ),
                  const Center(child: Text('Account')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Fines tab
// ---------------------------------------------------------------------------
class _FinesTab extends StatelessWidget {
  const _FinesTab({
    required this.playerObjectId,
    required this.projectId,
    required this.restApiKey,
  });

  final String playerObjectId;
  final String projectId;
  final String restApiKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FutureBuilder<ApiCallResponse>(
      future: YouthManagementGroup.getFinesForPlayerObjectIdCall.call(
        playerObjectId: playerObjectId,
        bLappId: projectId,
        bLRestApiKey: restApiKey,
      ),
      builder: (context, snap) {
        if (!snap.hasData) {
          return Center(
            child: SpinKitWanderingCubes(
              color: theme.colorScheme.primary,
              size: 50.0,
            ),
          );
        }
        final fines = (snap.data!.jsonBody
                    .toList()
                    .map<PlayerFinesStruct?>(PlayerFinesStruct.maybeFromMap)
                    .toList() as Iterable<PlayerFinesStruct?>)
                .withoutNulls
                .toList();

        if (fines.isEmpty) {
          return const Center(child: Text('No fines'));
        }

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            itemCount: fines.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12.0),
            itemBuilder: (context, i) => _FineCard(fine: fines[i]),
          ),
        );
      },
    );
  }
}

class _FineCard extends StatelessWidget {
  const _FineCard({required this.fine});

  final PlayerFinesStruct fine;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final issuedFmt = DateFormat('dd MMM')
        .format(DateTime.fromMillisecondsSinceEpoch(fine.issuedDatetime))
        .toUpperCase();
    final incidentFmt = DateFormat('dd MMM')
        .format(DateTime.fromMillisecondsSinceEpoch(fine.incidentDatetime))
        .toUpperCase();
    final totalStr =
        '£${NumberFormat('#,##0.00', 'en_GB').format(fine.total)}';

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Warning icon + description
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 44.0,
                    height: 44.0,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onPrimary,
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.warning_rounded,
                        color: theme.colorScheme.primary,
                        size: 28.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FINE ISSUED: $issuedFmt',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          '${fine.categoryCode} - ${fine.categoryDescription}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 19.0,
                          ),
                        ),
                        Text(
                          'INCIDENT:  $incidentFmt',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontSize: 12.0,
                          ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                ],
              ),
            ),
            // Amount + Pay Now button
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  totalStr,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.onPrimary,
                    foregroundColor: theme.colorScheme.primary,
                    elevation: 0.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 0.0, 16.0, 0.0),
                    minimumSize: const Size(0, 40.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    textStyle: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.0,
                    ),
                  ),
                  child: const Text('PAY NOW'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Events / RSVPs tab
// ---------------------------------------------------------------------------
class _EventsTab extends StatelessWidget {
  const _EventsTab({
    required this.playerObjectId,
    required this.projectId,
    required this.restApiKey,
  });

  final String playerObjectId;
  final String projectId;
  final String restApiKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FutureBuilder<ApiCallResponse>(
      future: YouthManagementGroup.getAllRSVPsForAPlayerCall.call(
        playerObjectId: playerObjectId,
        bLappId: projectId,
        bLRestApiKey: restApiKey,
      ),
      builder: (context, snap) {
        if (!snap.hasData) {
          return Center(
            child: SpinKitWanderingCubes(
              color: theme.colorScheme.primary,
              size: 50.0,
            ),
          );
        }
        final rsvps = (snap.data!.jsonBody
                    .toList()
                    .map<EventRSVPStruct?>(EventRSVPStruct.maybeFromMap)
                    .toList() as Iterable<EventRSVPStruct?>)
                .withoutNulls
                .toList();

        if (rsvps.isEmpty) {
          return const Center(child: Text('No events'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(12.0),
          itemCount: rsvps.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12.0),
          itemBuilder: (context, i) {
            final rsvp = rsvps[i];
            return Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      rsvp.eventObjectId,
                      style: theme.textTheme.bodyMedium,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: _rsvpColor(rsvp.status, theme),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Text(
                        rsvp.status,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Color _rsvpColor(String status, ThemeData theme) {
    switch (status) {
      case 'YES':
        return theme.colorScheme.secondary;
      case 'NO':
        return theme.colorScheme.error;
      default:
        return theme.colorScheme.outline;
    }
  }
}
