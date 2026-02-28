import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:feature_player/src/providers.dart';

/// Visual variant for [SquadHubSlider].
///
/// - [v1]: Rounded-corner (12 px) cards, dimmed image, no divider.
/// - [v2]: Square cards, conditional top divider when border radii are zero.
/// - [v3]: Dark-background cards, squad number always shown, top + bottom divider.
/// - [v4]: Dark-background cards, configurable border radius, optional squad
///   number, bottom divider.
enum SquadHubSliderVariant { v1, v2, v3, v4 }

/// Horizontal scrolling strip of player cards.
///
/// Ported from SquadHubSliderV1–V4Widget (Phase 5.3).
class SquadHubSlider extends ConsumerWidget {
  const SquadHubSlider({
    super.key,
    required this.projectId,
    required this.restApiKey,
    required this.tapAction,
    this.variant = SquadHubSliderVariant.v1,
    this.sort = 'number',
    this.cardBorderRadius = BorderRadius.zero,
    this.squadNumbers = true,
  });

  final String projectId;
  final String restApiKey;

  /// How to order the squad list.  Defaults to `'number'`.
  final String sort;

  /// Layout variant.
  final SquadHubSliderVariant variant;

  /// Border radius applied to cards (used by [SquadHubSliderVariant.v1] and
  /// [SquadHubSliderVariant.v4]).
  final BorderRadius cardBorderRadius;

  /// [SquadHubSliderVariant.v4] — whether to show squad numbers.
  final bool squadNumbers;

  /// Called with the tapped player's objectId.
  final Future<void> Function(String playerObjectId)? tapAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final squadAsync = ref.watch(squadHubProvider((
      projectId: projectId,
      restApiKey: restApiKey,
      sort: sort,
    )));

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
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
              data: (players) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: players
                      .map((player) => Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 10),
                            child: _SliderCard(
                              player: player,
                              variant: variant,
                              cardBorderRadius: cardBorderRadius,
                              squadNumbers: squadNumbers,
                              primaryColor: theme.colorScheme.primary,
                              onTap: () =>
                                  tapAction?.call(player.objectId),
                            ),
                          ))
                      .toList()
                      .divide(const SizedBox(width: 15))
                      .addToStart(const SizedBox(width: 20))
                      .addToEnd(const SizedBox(width: 20)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliderCard extends StatelessWidget {
  const _SliderCard({
    required this.player,
    required this.variant,
    required this.cardBorderRadius,
    required this.squadNumbers,
    required this.primaryColor,
    required this.onTap,
  });

  final dynamic player; // PlayerStruct
  final SquadHubSliderVariant variant;
  final BorderRadius cardBorderRadius;
  final bool squadNumbers;
  final Color primaryColor;
  final VoidCallback onTap;

  // Image opacity varies by variant.
  double get _imageOpacity =>
      (variant == SquadHubSliderVariant.v1 ||
              variant == SquadHubSliderVariant.v2)
          ? 0.5
          : 0.65;

  // Outer container color (dark for v3/v4).
  Color _containerColor(BuildContext context) =>
      (variant == SquadHubSliderVariant.v3 ||
              variant == SquadHubSliderVariant.v4)
          ? Theme.of(context).colorScheme.onSurface
          : Colors.transparent;

  // Material (clip) border radius.
  BorderRadius _materialBorderRadius() {
    switch (variant) {
      case SquadHubSliderVariant.v1:
        return BorderRadius.circular(12);
      case SquadHubSliderVariant.v2:
      case SquadHubSliderVariant.v3:
        return BorderRadius.zero;
      case SquadHubSliderVariant.v4:
        return cardBorderRadius;
    }
  }

  // Image clip border radius.
  BorderRadius _imageClipBorderRadius() {
    switch (variant) {
      case SquadHubSliderVariant.v1:
      case SquadHubSliderVariant.v2:
      case SquadHubSliderVariant.v3:
        return cardBorderRadius; // from config
      case SquadHubSliderVariant.v4:
        return BorderRadius.zero;
    }
  }

  // Whether to show the squad number overlay.
  bool _showNumber(dynamic player) {
    switch (variant) {
      case SquadHubSliderVariant.v3:
        return true;
      case SquadHubSliderVariant.v4:
        return player.hasNumber() && squadNumbers && player.number != 0;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final matBR = _materialBorderRadius();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: matBR),
        child: Container(
          decoration: BoxDecoration(
            color: _containerColor(context),
            borderRadius: matBR,
          ),
          child: SizedBox(
            width: 125,
            height: 150,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                // Squad number watermark (v3 always, v4 conditionally)
                if (_showNumber(player))
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          8, 12, 0, 0),
                      child: Text(
                        player.number.toString(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontFamily: 'BebasNeue',
                          color: primaryColor,
                          fontSize: 40,
                          height: 1.0,
                        ),
                      ),
                    ),
                  ),

                // Player photo (clipped + dimmed)
                ClipRRect(
                  borderRadius: _imageClipBorderRadius(),
                  child: Container(
                    width: 125,
                    height: 150,
                    decoration: BoxDecoration(
                      color:
                          variant == SquadHubSliderVariant.v1 ||
                                  variant == SquadHubSliderVariant.v2
                              ? Colors.black
                              : null,
                      borderRadius: _imageClipBorderRadius(),
                    ),
                    child: Opacity(
                      opacity: _imageOpacity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.zero,
                        child: Image.network(
                          player.playerPictureurl,
                          width: 125,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                // Name bar (bottom) and optional dividers
                _buildOverlay(context, theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverlay(BuildContext context, ThemeData theme) {
    final nameRow = Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            player.posAbr,
            style: theme.textTheme.bodyMedium?.copyWith(
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
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: 'Inter',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );

    switch (variant) {
      case SquadHubSliderVariant.v1:
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Align(alignment: AlignmentDirectional.bottomCenter, child: nameRow)],
        );

      case SquadHubSliderVariant.v2:
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top divider only when border radii are square.
            if (cardBorderRadius.topLeft == Radius.zero &&
                cardBorderRadius.topRight == Radius.zero)
              Divider(height: 2, thickness: 2, color: primaryColor),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: nameRow,
            ),
          ],
        );

      case SquadHubSliderVariant.v3:
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Divider(height: 2, thickness: 2, color: primaryColor),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: nameRow,
            ),
          ],
        );

      case SquadHubSliderVariant.v4:
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: nameRow,
            ),
            Divider(height: 2, thickness: 2, color: primaryColor),
          ],
        );
    }
  }
}
