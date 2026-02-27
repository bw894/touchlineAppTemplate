import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:core_ui/src/config/app_config.dart';
import 'package:core_ui/src/config/component_variants.dart';

/// Club-branded top app bar.
///
/// Variant behaviour:
/// - [AppBarVariant.standard]: 140px height, 65×65 badge, no bottom stripe.
/// - [AppBarVariant.compact]: 105px height, 100×100 badge, 11px primary colour
///   bottom stripe, bottom corners respect [AppConfig.cardBorderRadius].
class TouchlineAppBar extends ConsumerWidget {
  const TouchlineAppBar({
    super.key,
    required this.variant,
    required this.badgeUrl,
    this.backgroundColour,
    this.iconColour,
    this.showBackButton = true,
  });

  final AppBarVariant variant;
  final String badgeUrl;
  final Color? backgroundColour;
  final Color? iconColour;
  final bool showBackButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfg = ref.watch(appConfigProvider);
    final bg = backgroundColour ?? Theme.of(context).colorScheme.primary;
    final ic = iconColour ?? Colors.black;

    return switch (variant) {
      AppBarVariant.standard => _Standard(
          badgeUrl: badgeUrl,
          backgroundColour: bg,
          iconColour: ic,
          showBackButton: showBackButton,
        ),
      AppBarVariant.compact => _Compact(
          badgeUrl: badgeUrl,
          backgroundColour: bg,
          iconColour: ic,
          showBackButton: showBackButton,
          secondaryColour: Theme.of(context).colorScheme.secondary,
          cardBorderRadius: cfg.cardBorderRadius,
        ),
    };
  }
}

// ---------------------------------------------------------------------------
// Standard (v1) — 140px, 65×65 badge, no stripe
// ---------------------------------------------------------------------------
class _Standard extends StatelessWidget {
  const _Standard({
    required this.badgeUrl,
    required this.backgroundColour,
    required this.iconColour,
    required this.showBackButton,
  });

  final String badgeUrl;
  final Color backgroundColour;
  final Color iconColour;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140.0,
      color: backgroundColour,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 65.0, 20.0, 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => GoRouter.of(context).pop(),
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: Opacity(
                  opacity: showBackButton ? 1.0 : 0.0,
                  child: Align(
                    child: Icon(Icons.west, color: iconColour, size: 30.0),
                  ),
                ),
              ),
            ),
            Image.network(
              badgeUrl,
              width: 65.0,
              height: 65.0,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 50.0, height: 50.0),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Compact (v2) — 105px, 100×100 badge, secondary colour bottom stripe
// ---------------------------------------------------------------------------
class _Compact extends StatelessWidget {
  const _Compact({
    required this.badgeUrl,
    required this.backgroundColour,
    required this.iconColour,
    required this.showBackButton,
    required this.secondaryColour,
    required this.cardBorderRadius,
  });

  final String badgeUrl;
  final Color backgroundColour;
  final Color iconColour;
  final bool showBackButton;
  final Color secondaryColour;
  final BorderRadius cardBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 105.0,
      decoration: BoxDecoration(
        color: backgroundColour,
        borderRadius: BorderRadius.only(
          bottomLeft: cardBorderRadius.bottomLeft,
          bottomRight: cardBorderRadius.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => GoRouter.of(context).pop(),
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Opacity(
                        opacity: showBackButton ? 1.0 : 0.0,
                        child: Align(
                          child:
                              Icon(Icons.west, color: iconColour, size: 26.0),
                        ),
                      ),
                    ),
                  ),
                  Image.network(
                    badgeUrl,
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 50.0, height: 50.0),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 11.0,
              color: secondaryColour,
            ),
          ],
        ),
      ),
    );
  }
}
