import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:feature_player/src/providers.dart';

/// Full-page squad hub with a 2-column grid of player cards.
///
/// Ported from SquadHubPageV1Widget (Phase 5.3).
class SquadHubScreen extends ConsumerWidget {
  const SquadHubScreen({
    super.key,
    required this.projectId,
    required this.restApiKey,
    required this.tapAction,
    this.cardBorderRadius = BorderRadius.zero,
    this.clubBadgeUrl,
    this.clubFullName = '',
  });

  final String projectId;
  final String restApiKey;

  /// Border radius applied to player cards.
  final BorderRadius cardBorderRadius;

  /// Club badge image URL shown in the header.
  final String? clubBadgeUrl;

  /// Club full name shown in the header.
  final String clubFullName;

  /// Called with the tapped player's objectId.
  final Future<void> Function(String playerObjectId)? tapAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final squadAsync = ref.watch(squadHubProvider((
      projectId: projectId,
      restApiKey: restApiKey,
      sort: 'number',
    )));

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
      child: squadAsync.when(
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
        data: (players) => Stack(
          children: [
            Align(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 80),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: 48,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                              minWidth: 48,
                              minHeight: 48,
                            ),
                            icon: Icon(
                              Icons.west,
                              color: theme.colorScheme.onSurface,
                              size: 30,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          Row(
                            children: [
                              if (clubBadgeUrl != null && clubBadgeUrl!.isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    clubBadgeUrl!,
                                    height: 50,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 0, 0),
                                    child: Text(
                                      clubFullName,
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 15.3,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'squad hub',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontFamily: 'BebasNeue',
                                      fontSize: 45,
                                      height: 1.0,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 2)),
                              ),
                            ],
                          ),
                          // Invisible spacer to centre the logo row.
                          const Opacity(
                            opacity: 0,
                            child: IconButton(
                              iconSize: 48,
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(
                                minWidth: 48,
                                minHeight: 48,
                              ),
                              icon: Icon(Icons.west, size: 30),
                              onPressed: null,
                            ),
                          ),
                        ].divide(const SizedBox(width: 5)),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color(0x6290A4B2),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: players.length,
                          itemBuilder: (context, index) {
                            final player = players[index];
                            return _PlayerGridCard(
                              player: player,
                              cardBorderRadius: cardBorderRadius,
                              primaryColor: theme.colorScheme.primary,
                              onTap: () => tapAction?.call(player.objectId),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlayerGridCard extends StatelessWidget {
  const _PlayerGridCard({
    required this.player,
    required this.cardBorderRadius,
    required this.primaryColor,
    required this.onTap,
  });

  final PlayerStruct player;
  final BorderRadius cardBorderRadius;
  final Color primaryColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Material(
          color: Colors.transparent,
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: cardBorderRadius),
          child: Container(
            decoration: BoxDecoration(borderRadius: cardBorderRadius),
            child: SizedBox(
              width: 125,
              height: 150,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  // Background + dimmed photo
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Align(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.network(
                          player.playerPictureurl,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Position + name bar (bottom)
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            player.posAbr.isEmpty ? 'GK' : player.posAbr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontFamily: 'BebasNeue',
                                  color: Colors.white,
                                  fontSize: 32,
                                ),
                          ),
                          SizedBox(
                            height: 20,
                            child: VerticalDivider(
                              thickness: 2,
                              color: primaryColor,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              player.playerName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontFamily: 'Inter',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surface,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Squad number watermark (top-left, hardcoded decoration)
                  Opacity(
                    opacity: 0.7,
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 12, 0, 0),
                        child: Text(
                          '10',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'BebasNeue',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceContainerHighest,
                                    fontSize: 38,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
