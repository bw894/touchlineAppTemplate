import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theming/theming.dart';

import 'package:feature_match_centre/src/providers.dart';

/// Horizontal scrolling slider showing upcoming fixtures.
///
/// Variant dispatch is controlled by [variant]:
/// - [NextFixtureSliderVariant.stack] — simple card, no tap, no accent bar.
/// - [NextFixtureSliderVariant.horizontal] — tappable, primary accent divider
///   at top, 170 px cards.
/// - [NextFixtureSliderVariant.compact] — tappable, custom [topColour] accent
///   divider, 185 px cards.
/// - [NextFixtureSliderVariant.minimal] — falls back to [stack] layout.
class NextFixtureSlider extends ConsumerWidget {
  const NextFixtureSlider({
    super.key,
    required this.projectId,
    required this.restApiKey,
    required this.focusTeamId,
    this.userToken = '',
    this.variant = NextFixtureSliderVariant.stack,
    this.fixtureAction,
    this.topColour,
    this.bottomColour,
  });

  final String projectId;
  final String restApiKey;
  final String focusTeamId;
  final String userToken;
  final NextFixtureSliderVariant variant;

  /// Called when a card is tapped (horizontal / compact variants).
  final Future<void> Function(String matchObjectId)? fixtureAction;

  /// Accent bar colour for the compact variant. Defaults to primary.
  final Color? topColour;

  /// Unused — kept for API compatibility. Defaults to primary.
  final Color? bottomColour;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = (
      projectId: projectId,
      restApiKey: restApiKey,
      focusTeamId: focusTeamId,
      userToken: userToken,
    );
    final fixturesAsync = ref.watch(nextFixtureSliderProvider(args));
    final primary = Theme.of(context).colorScheme.primary;
    final accentColor = topColour ?? primary;
    final colors = Theme.of(context).extension<TouchlineColors>()!;
    final cfg = ref.watch(appConfigProvider);

    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: variant == NextFixtureSliderVariant.stack
            ? const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20)
            : EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: fixturesAsync.when(
                loading: () => Center(
                  child: AppLoader(color: primary, size: 50),
                ),
                error: (_, __) => const SizedBox.shrink(),
                data: (fixtures) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(fixtures.length, (i) {
                      final item = fixtures[i];
                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            2, 5, 5, 5),
                        child: _buildCard(
                          context,
                          item,
                          cfg,
                          colors,
                          primary,
                          accentColor,
                        ),
                      );
                    })
                        .divide(const SizedBox(width: 15))
                        .addToStart(const SizedBox(width: 20))
                        .addToEnd(const SizedBox(width: 20)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    BLESSfixtureStruct item,
    AppConfig cfg,
    TouchlineColors colors,
    Color primary,
    Color accentColor,
  ) {
    final isHorizontal = variant == NextFixtureSliderVariant.horizontal;
    final isCompact = variant == NextFixtureSliderVariant.compact;
    final hasTap = isHorizontal || isCompact;
    final cardWidth = isCompact ? 185.0 : (isHorizontal ? 170.0 : null);
    final cardBorderRadius = cfg.cardBorderRadius;

    Widget card = Material(
      color: Colors.transparent,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: cardBorderRadius),
      child: ClipRRect(
        borderRadius: cardBorderRadius,
        child: Container(
          width: cardWidth,
          decoration: BoxDecoration(
            color: colors.secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: cardBorderRadius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Accent divider (horizontal and compact variants only)
              if (isHorizontal)
                Divider(height: 3, thickness: 3, color: primary),
              if (isCompact)
                Divider(height: 3, thickness: 3, color: accentColor),

              // Card content
              Padding(
                padding: EdgeInsets.all(isCompact ? 15 : 12),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: isHorizontal || isCompact
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: Image.network(
                        item.homeBadge,
                        width: 35,
                        height: 35,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          dateTimeFormat(
                            'MMMd',
                            convertFromMills(item.start),
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${dateTimeFormat("jm", convertFromMills(item.start))} KO',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: Image.network(
                        item.awayBadge,
                        width: 35,
                        height: 35,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ].divide(const SizedBox(width: 10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (!hasTap) return card;

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => fixtureAction?.call(item.objectId),
      child: card,
    );
  }
}
