import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:core_ui/src/config/app_config.dart';
import 'package:core_ui/src/config/component_variants.dart';
import 'package:core_ui/src/utils/url_utils.dart';
import 'package:core_ui/src/utils/list_extensions.dart';

/// Social media icon row for Touchline apps.
///
/// Variant behaviour:
/// - [SocialIconsVariant.horizontal]: Flat primary-coloured icons beside a
///   "social media" Bebas Neue label. TikTok · Facebook · Instagram · X.
/// - [SocialIconsVariant.compact]: Card-style icons with elevation 3 and a
///   2px primary-coloured top stripe. TikTok · Instagram · X · YouTube · Facebook.
/// - [SocialIconsVariant.vertical]: Card-style icons with elevation 5, a
///   2px border, and a fixed 50×50 container. Same icon order as compact.
class SocialIconsBar extends ConsumerWidget {
  const SocialIconsBar({
    super.key,
    required this.variant,
    this.tikTokOn = true,
    this.facebookOn = true,
    this.instagramOn = true,
    this.xOn = true,
    this.youtubeOn = false,
    this.tiktokLink,
    this.facebookLink,
    this.instagramLink,
    this.xLink,
    this.youtubeLink,
  });

  final SocialIconsVariant variant;
  final bool tikTokOn;
  final bool facebookOn;
  final bool instagramOn;
  final bool xOn;
  final bool youtubeOn;
  final String? tiktokLink;
  final String? facebookLink;
  final String? instagramLink;
  final String? xLink;
  final String? youtubeLink;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfg = ref.watch(appConfigProvider);
    return switch (variant) {
      SocialIconsVariant.horizontal => _Horizontal(
          tikTokOn: tikTokOn,
          facebookOn: facebookOn,
          instagramOn: instagramOn,
          xOn: xOn,
          tiktokLink: tiktokLink,
          facebookLink: facebookLink,
          instagramLink: instagramLink,
          xLink: xLink,
        ),
      SocialIconsVariant.compact => _CardIcons(
          tikTokOn: tikTokOn,
          facebookOn: facebookOn,
          instagramOn: instagramOn,
          xOn: xOn,
          youtubeOn: youtubeOn,
          tiktokLink: tiktokLink,
          facebookLink: facebookLink,
          instagramLink: instagramLink,
          xLink: xLink,
          youtubeLink: youtubeLink,
          elevation: 3.0,
          showTopStripe: true,
          showBorder: false,
          cardBorderRadius: cfg.cardBorderRadius,
        ),
      SocialIconsVariant.vertical => _CardIcons(
          tikTokOn: tikTokOn,
          facebookOn: facebookOn,
          instagramOn: instagramOn,
          xOn: xOn,
          youtubeOn: youtubeOn,
          tiktokLink: tiktokLink,
          facebookLink: facebookLink,
          instagramLink: instagramLink,
          xLink: xLink,
          youtubeLink: youtubeLink,
          elevation: 5.0,
          showTopStripe: false,
          showBorder: true,
          cardBorderRadius: cfg.cardBorderRadius,
        ),
    };
  }
}

// ---------------------------------------------------------------------------
// horizontal (v1) — flat icon row with "social media" label
// ---------------------------------------------------------------------------
class _Horizontal extends StatelessWidget {
  const _Horizontal({
    required this.tikTokOn,
    required this.facebookOn,
    required this.instagramOn,
    required this.xOn,
    this.tiktokLink,
    this.facebookLink,
    this.instagramLink,
    this.xLink,
  });

  final bool tikTokOn;
  final bool facebookOn;
  final bool instagramOn;
  final bool xOn;
  final String? tiktokLink;
  final String? facebookLink;
  final String? instagramLink;
  final String? xLink;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'social media',
            style: GoogleFonts.bebasNeue(
              fontSize: 32.0,
              color: Theme.of(context).colorScheme.onSurface,
              letterSpacing: 0.0,
            ),
          ),
          Row(
            children: [
              if (tikTokOn && tiktokLink != null)
                GestureDetector(
                  onTap: () => launchURL(tiktokLink!),
                  child: Icon(Icons.tiktok_rounded, color: primary, size: 30.0),
                ),
              if (facebookOn && facebookLink != null)
                GestureDetector(
                  onTap: () => launchURL(facebookLink!),
                  child: FaIcon(FontAwesomeIcons.facebookSquare,
                      color: primary, size: 30.0),
                ),
              if (instagramOn && instagramLink != null)
                GestureDetector(
                  onTap: () => launchURL(instagramLink!),
                  child: FaIcon(FontAwesomeIcons.instagram,
                      color: primary, size: 30.0),
                ),
              if (xOn && xLink != null)
                GestureDetector(
                  onTap: () => launchURL(xLink!),
                  child: FaIcon(FontAwesomeIcons.twitter,
                      color: primary, size: 30.0),
                ),
            ].divide(const SizedBox(width: 12.0)),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// compact (v2) + vertical (v3) — card-style icon row
// ---------------------------------------------------------------------------
class _CardIcons extends StatelessWidget {
  const _CardIcons({
    required this.tikTokOn,
    required this.facebookOn,
    required this.instagramOn,
    required this.xOn,
    required this.youtubeOn,
    this.tiktokLink,
    this.facebookLink,
    this.instagramLink,
    this.xLink,
    this.youtubeLink,
    required this.elevation,
    required this.showTopStripe,
    required this.showBorder,
    required this.cardBorderRadius,
  });

  final bool tikTokOn;
  final bool facebookOn;
  final bool instagramOn;
  final bool xOn;
  final bool youtubeOn;
  final String? tiktokLink;
  final String? facebookLink;
  final String? instagramLink;
  final String? xLink;
  final String? youtubeLink;
  final double elevation;
  final bool showTopStripe;
  final bool showBorder;
  final BorderRadius cardBorderRadius;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final surface = Theme.of(context).colorScheme.surface;
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final iconSize = showBorder ? 29.0 : 32.0;

    final icons = <({Widget icon, String? link, bool visible})>[
      (icon: Icon(Icons.tiktok, color: onSurface, size: iconSize), link: tiktokLink, visible: tikTokOn),
      (icon: FaIcon(FontAwesomeIcons.instagram, color: onSurface, size: iconSize), link: instagramLink, visible: instagramOn),
      (icon: FaIcon(FontAwesomeIcons.twitter, color: onSurface, size: iconSize), link: xLink, visible: xOn),
      (icon: FaIcon(FontAwesomeIcons.youtube, color: onSurface, size: iconSize), link: youtubeLink, visible: youtubeOn),
      (icon: FaIcon(FontAwesomeIcons.facebookSquare, color: onSurface, size: iconSize), link: facebookLink, visible: facebookOn),
    ];

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 12.0),
            child: Row(
              children: [
                for (final item in icons)
                  if (item.visible && item.link != null)
                    _SocialCard(
                      icon: item.icon,
                      link: item.link!,
                      elevation: elevation,
                      showTopStripe: showTopStripe,
                      showBorder: showBorder,
                      primary: primary,
                      surface: surface,
                      cardBorderRadius: cardBorderRadius,
                    ),
              ].divide(const SizedBox(width: 18.0)),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialCard extends StatelessWidget {
  const _SocialCard({
    required this.icon,
    required this.link,
    required this.elevation,
    required this.showTopStripe,
    required this.showBorder,
    required this.primary,
    required this.surface,
    required this.cardBorderRadius,
  });

  final Widget icon;
  final String link;
  final double elevation;
  final bool showTopStripe;
  final bool showBorder;
  final Color primary;
  final Color surface;
  final BorderRadius cardBorderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchURL(link),
      child: Material(
        color: Colors.transparent,
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: cardBorderRadius),
        child: Container(
          width: showBorder ? 50.0 : null,
          height: showBorder ? 50.0 : null,
          decoration: BoxDecoration(
            color: surface,
            borderRadius: cardBorderRadius,
            border: showBorder
                ? Border.all(color: surface, width: 2.0)
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showTopStripe)
                SizedBox(
                  width: 50.0,
                  child: Divider(
                    height: 2.0,
                    thickness: 2.0,
                    color: primary,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(child: icon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
