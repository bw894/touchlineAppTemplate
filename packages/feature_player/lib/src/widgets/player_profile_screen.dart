import 'package:api_client/api_client.dart';
import 'package:collection/collection.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:feature_player/src/providers.dart';

// ---------------------------------------------------------------------------
// Variant enum
// ---------------------------------------------------------------------------

/// Visual variant for [PlayerProfileScreen].
///
/// - [v1]: 270 px hero, always shows sponsors (away optional), `SPONSORS` /
///   `BIOGRAPHY` labels in Inter bold italic.
/// - [v2]: 350 px hero, white position badge with config border radius,
///   `sponsorsReq` flag, `SPONSORS` in Inter semi-bold.
/// - [v3]: 350 px hero, `SPONSORS` / `BIOGRAPHY` in Bebas Neue 38 px,
///   `sponsorsReq` flag, fully config border radius.
/// - [v4]: Like v3 but the position badge uses fully config border radius
///   (top-right stays 0 in v2, fully config in v4), `BIOGRAPHY` in Bebas Neue.
/// - [v5adv]: 350 px hero, scrollable sponsorship-deals list with buy / visit
///   actions.  Uses [sponsorshipBuyClickAction] instead of static labels.
enum PlayerProfileVariant { v1, v2, v3, v4, v5adv }

// ---------------------------------------------------------------------------
// Widget
// ---------------------------------------------------------------------------

/// Full-column player profile content widget.
///
/// Ported from PlayerProfilePageV1–V5AdvWidget (Phase 5.3).
class PlayerProfileScreen extends ConsumerWidget {
  const PlayerProfileScreen({
    super.key,
    required this.projectId,
    required this.restApiKey,
    required this.playerObjectId,
    this.variant = PlayerProfileVariant.v2,
    this.homeKitColour = const Color(0xFF1A56A8),
    this.awayKitColour = const Color(0xFF1A56A8),
    this.awaySponsorReq = true,
    this.sponsorsReq = true,
    this.cardBorderRadius = BorderRadius.zero,
    this.sponsorshipBuyClickAction,
  });

  final String projectId;
  final String restApiKey;
  final String? playerObjectId;
  final PlayerProfileVariant variant;

  /// Kit accent colour shown on the home sponsor card divider.
  final Color homeKitColour;

  /// Kit accent colour shown on the away sponsor card divider.
  final Color awayKitColour;

  /// Whether to show the away-sponsor column.
  /// When `false`, the home column label reads "PLAYER SPONSOR".
  final bool awaySponsorReq;

  /// Whether to show the sponsors section at all (v2–v4 only).
  final bool sponsorsReq;

  /// Border radius applied to cards and image clips (config-driven).
  final BorderRadius cardBorderRadius;

  /// [PlayerProfileVariant.v5adv] — called when the user buys a sponsorship slot.
  final Future<void> Function(
    String sponsorshipDealObjectId,
    double value,
    String playerName,
    String shortDisplay,
  )? sponsorshipBuyClickAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    if (playerObjectId == null || playerObjectId!.isEmpty) {
      return const SizedBox.shrink();
    }

    final playerAsync = ref.watch(specificPlayerProvider((
      projectId: projectId,
      restApiKey: restApiKey,
      playerObjectId: playerObjectId!,
    )));

    return playerAsync.when(
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
      data: (player) {
        if (player == null) return const SizedBox.shrink();
        return _PlayerProfileBody(
          player: player,
          variant: variant,
          homeKitColour: homeKitColour,
          awayKitColour: awayKitColour,
          awaySponsorReq: awaySponsorReq,
          sponsorsReq: sponsorsReq,
          cardBorderRadius: cardBorderRadius,
          sponsorshipBuyClickAction: sponsorshipBuyClickAction,
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Body (stateless — no Riverpod needed once player is loaded)
// ---------------------------------------------------------------------------

class _PlayerProfileBody extends StatelessWidget {
  const _PlayerProfileBody({
    required this.player,
    required this.variant,
    required this.homeKitColour,
    required this.awayKitColour,
    required this.awaySponsorReq,
    required this.sponsorsReq,
    required this.cardBorderRadius,
    required this.sponsorshipBuyClickAction,
  });

  final PlayerStruct player;
  final PlayerProfileVariant variant;
  final Color homeKitColour;
  final Color awayKitColour;
  final bool awaySponsorReq;
  final bool sponsorsReq;
  final BorderRadius cardBorderRadius;
  final Future<void> Function(
    String sponsorshipDealObjectId,
    double value,
    String playerName,
    String shortDisplay,
  )? sponsorshipBuyClickAction;

  // Hero height varies between v1 (270) and v2–v5 (350).
  double get _heroHeight =>
      variant == PlayerProfileVariant.v1 ? 270.0 : 350.0;

  // Position badge background colour.
  Color _badgeBg(BuildContext context) =>
      variant == PlayerProfileVariant.v1
          ? Theme.of(context).colorScheme.onSurface
          : Colors.white;

  // Position badge border radius (top-right always 0; bottom-left varies).
  BorderRadius _badgeBorderRadius() {
    switch (variant) {
      case PlayerProfileVariant.v1:
        return const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.zero,
          topLeft: Radius.zero,
          topRight: Radius.zero,
        );
      case PlayerProfileVariant.v2:
        return BorderRadius.only(
          bottomLeft: cardBorderRadius.bottomLeft,
          bottomRight: Radius.zero,
          topLeft: Radius.zero,
          topRight: Radius.zero,
        );
      case PlayerProfileVariant.v3:
      case PlayerProfileVariant.v4:
      case PlayerProfileVariant.v5adv:
        return BorderRadius.only(
          bottomLeft: cardBorderRadius.bottomLeft,
          bottomRight: cardBorderRadius.bottomRight,
          topLeft: cardBorderRadius.topLeft,
          topRight: Radius.zero,
        );
    }
  }

  // Hero container border radius (top corners always 0; bottom varies).
  BorderRadius _heroBorderRadius() {
    switch (variant) {
      case PlayerProfileVariant.v1:
        return const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
          topLeft: Radius.zero,
          topRight: Radius.zero,
        );
      case PlayerProfileVariant.v2:
        return BorderRadius.only(
          bottomLeft: cardBorderRadius.bottomLeft,
          bottomRight: cardBorderRadius.bottomRight,
          topLeft: Radius.zero,
          topRight: Radius.zero,
        );
      case PlayerProfileVariant.v3:
      case PlayerProfileVariant.v4:
      case PlayerProfileVariant.v5adv:
        return cardBorderRadius;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final nameParts = _splitByFirstSpace(player.playerName);

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Hero header ──────────────────────────────────────────────────
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: SizedBox(
              height: _heroHeight,
              child: Stack(
                children: [
                  // Background + blurred player photo
                  ClipRRect(
                    borderRadius: _heroBorderRadius(),
                    child: Container(
                      width: double.infinity,
                      height: _heroHeight,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onSurface,
                        borderRadius: _heroBorderRadius(),
                      ),
                      child: Opacity(
                        opacity: 0.4,
                        child: Hero(
                          tag: player.playerPictureurl,
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.zero,
                            child: Image.network(
                              player.playerPictureurl,
                              width: double.infinity,
                              height: _heroHeight,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Position badge (top-right corner)
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: _badgeBg(context),
                        borderRadius: _badgeBorderRadius(),
                      ),
                      child: Center(
                        child: Text(
                          player.posAbr.isEmpty ? 'POS' : player.posAbr,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontFamily: 'BebasNeue',
                            color: theme.colorScheme.primary,
                            fontSize: 40,
                            fontWeight: FontWeight.normal,
                            height: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Player name (bottom-left)
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20, 0, 20, 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25,
                            child: VerticalDivider(
                              width: 2,
                              thickness: 2,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          Text(
                            nameParts.first,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontFamily: 'Rubik',
                              color: theme.colorScheme.surface,
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            nameParts.last,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontFamily: 'Rubik',
                              color: theme.colorScheme.surface,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ].divide(const SizedBox(width: 6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Spacer row (preserved from original)
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 5),
            child: Row(
              children: [Expanded(child: SizedBox.shrink())],
            ),
          ),

          // ── Sponsors / sponsorship deals section ─────────────────────────
          if (variant == PlayerProfileVariant.v5adv)
            _V5AdvSponsorsSection(
              player: player,
              cardBorderRadius: cardBorderRadius,
              primaryColor: Theme.of(context).colorScheme.primary,
              secondaryBg: Theme.of(context).colorScheme.surfaceContainerHighest,
              sponsorshipBuyClickAction: sponsorshipBuyClickAction,
            )
          else if (variant == PlayerProfileVariant.v1 ||
              (sponsorsReq &&
                  (variant == PlayerProfileVariant.v2 ||
                      variant == PlayerProfileVariant.v3 ||
                      variant == PlayerProfileVariant.v4))) ...[
            _buildSponsorsHeader(context),
            _buildSponsorsRow(context),
          ],

          // ── Biography ────────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Text(
                      'BIOGRAPHY',
                      style: _biographyHeadingStyle(context),
                    ),
                  ),
                ),
                Text(
                  _cleanBiography(player.biography),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Inter',
                        fontSize: 15,
                      ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  TextStyle? _sponsorsHeadingStyle(BuildContext context) {
    final base = Theme.of(context).textTheme.bodyMedium;
    switch (variant) {
      case PlayerProfileVariant.v1:
        return base?.copyWith(
          fontFamily: 'Inter',
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        );
      case PlayerProfileVariant.v2:
        return base?.copyWith(
          fontFamily: 'Inter',
          fontSize: 26,
          fontWeight: FontWeight.w600,
        );
      case PlayerProfileVariant.v3:
      case PlayerProfileVariant.v4:
      case PlayerProfileVariant.v5adv:
        return base?.copyWith(
          fontFamily: 'BebasNeue',
          fontSize: 38,
          fontWeight: FontWeight.bold,
        );
    }
  }

  TextStyle? _biographyHeadingStyle(BuildContext context) {
    final base = Theme.of(context).textTheme.bodyMedium;
    switch (variant) {
      case PlayerProfileVariant.v1:
        return base?.copyWith(
          fontFamily: 'Inter',
          fontSize: 26,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        );
      case PlayerProfileVariant.v2:
        return base?.copyWith(
          fontFamily: 'Inter',
          fontSize: 26,
          fontWeight: FontWeight.w600,
        );
      case PlayerProfileVariant.v3:
      case PlayerProfileVariant.v4:
      case PlayerProfileVariant.v5adv:
        return base?.copyWith(
          fontFamily: 'BebasNeue',
          fontSize: 38,
          fontWeight: FontWeight.bold,
        );
    }
  }

  Widget _buildSponsorsHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('SPONSORS', style: _sponsorsHeadingStyle(context)),
        ],
      ),
    );
  }

  Widget _buildSponsorsRow(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 15, 20, 15),
      child: Row(
        children: [
          // Home / player sponsor
          Expanded(
            child: _SponsorCard(
              kitColour: homeKitColour,
              label: awaySponsorReq ? 'HOME SPONSOR' : 'PLAYER SPONSOR',
              sponsorName: player.homeSponsor.isEmpty
                  ? 'Sponsor Now!'
                  : player.homeSponsor,
              cardBorderRadius: cardBorderRadius,
              theme: theme,
            ),
          ),
          if (awaySponsorReq) ...[
            const SizedBox(width: 20),
            Expanded(
              child: _SponsorCard(
                kitColour: awayKitColour,
                label: 'AWAY SPONSOR',
                sponsorName: player.awaySponsor.isEmpty
                    ? 'Sponsor Now!'
                    : player.awaySponsor,
                cardBorderRadius: cardBorderRadius,
                theme: theme,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Sponsor card (v1–v4)
// ---------------------------------------------------------------------------

class _SponsorCard extends StatelessWidget {
  const _SponsorCard({
    required this.kitColour,
    required this.label,
    required this.sponsorName,
    required this.cardBorderRadius,
    required this.theme,
  });

  final Color kitColour;
  final String label;
  final String sponsorName;
  final BorderRadius cardBorderRadius;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: cardBorderRadius,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Divider(height: 2, thickness: 2, color: kitColour),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(FontAwesomeIcons.shirt, color: kitColour, size: 15),
                  Text(
                    label,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontFamily: 'Inter',
                      fontSize: 15,
                    ),
                  ),
                ].divide(const SizedBox(width: 8)),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: Text(
                sponsorName,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontFamily: 'Inter',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// V5 advanced sponsorship deals list
// ---------------------------------------------------------------------------

class _V5AdvSponsorsSection extends StatelessWidget {
  const _V5AdvSponsorsSection({
    required this.player,
    required this.cardBorderRadius,
    required this.primaryColor,
    required this.secondaryBg,
    required this.sponsorshipBuyClickAction,
  });

  final PlayerStruct player;
  final BorderRadius cardBorderRadius;
  final Color primaryColor;
  final Color secondaryBg;
  final Future<void> Function(
    String sponsorshipDealObjectId,
    double value,
    String playerName,
    String shortDisplay,
  )? sponsorshipBuyClickAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sponsors = player.sponsorship
        .sorted((a, b) => a.sortOrder.compareTo(b.sortOrder));

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Heading
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SPONSORS',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontFamily: 'BebasNeue',
                  fontSize: 38,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        // Deals list
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 14),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: sponsors.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(Icons.close_rounded,
                              color: primaryColor, size: 30),
                          const SizedBox(height: 8),
                          Text('NOT AVAILABLE',
                              style: theme.textTheme.titleMedium),
                          Text('Check back soon!',
                              style: theme.textTheme.bodyMedium),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      itemCount: sponsors.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, i) {
                        final deal = sponsors[i];
                        return _SponsorshipDealTile(
                          deal: deal,
                          playerName: player.playerName,
                          cardBorderRadius: cardBorderRadius,
                          primaryColor: primaryColor,
                          secondaryBg: secondaryBg,
                          onTap: () => _handleDealTap(context, deal),
                        );
                      },
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _handleDealTap(
      BuildContext context, SponsorshipDealsStruct deal) async {
    if (deal.status == 'For Sale') {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Add to Cart?'),
          content: Text('Cost: £${deal.value}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Confirm'),
            ),
          ],
        ),
      );
      if (confirmed == true) {
        await sponsorshipBuyClickAction?.call(
          deal.objectId,
          deal.value,
          player.playerName,
          deal.shortDisplay,
        );
      }
    } else {
      final website = deal.sponsorWebsite;
      if (website.isNotEmpty && website != 'null') {
        final uri = Uri.tryParse(website);
        if (uri != null) await launchUrl(uri);
      }
    }
  }
}

class _SponsorshipDealTile extends StatelessWidget {
  const _SponsorshipDealTile({
    required this.deal,
    required this.playerName,
    required this.cardBorderRadius,
    required this.primaryColor,
    required this.secondaryBg,
    required this.onTap,
  });

  final SponsorshipDealsStruct deal;
  final String playerName;
  final BorderRadius cardBorderRadius;
  final Color primaryColor;
  final Color secondaryBg;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accentColor = _parseCssColor(deal.colour, primaryColor);

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: secondaryBg,
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: accentColor,
              offset: const Offset(-4, 4),
            ),
          ],
          borderRadius: cardBorderRadius,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      deal.shortDisplay,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (deal.sponsorName.isNotEmpty)
                      Text(
                        deal.sponsorName,
                        style: theme.textTheme.bodySmall,
                      ),
                  ],
                ),
              ),
              Text(
                deal.status,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: deal.status == 'For Sale' ? primaryColor : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Private helpers
// ---------------------------------------------------------------------------

/// Splits [input] at the first space and returns [firstName, restOfName].
List<String> _splitByFirstSpace(String input) {
  if (input.isEmpty) return ['', ''];
  final i = input.indexOf(' ');
  if (i == -1) return [input, ''];
  return [input.substring(0, i), input.substring(i + 1)];
}

/// Removes common HTML entities from biography text returned by the API.
String _cleanBiography(String input) {
  const entities = {
    '&#8230;': '…',
    '&#8211;': '–',
    '&#8212;': '—',
    '&#8216;': "'",
    '&#8217;': "'",
    '&#8220;': '"',
    '&#8221;': '"',
    '&#8222;': '„',
    '&#8226;': '•',
    '&amp;': '&',
    '&lt;': '<',
    '&gt;': '>',
    '&nbsp;': ' ',
    '&quot;': '"',
    '&#39;': "'",
  };
  var result = input;
  for (final entry in entities.entries) {
    result = result.replaceAll(entry.key, entry.value);
  }
  return result;
}

/// Parses a CSS hex color string (`#RRGGBB` or `#AARRGGBB`) to a [Color].
Color _parseCssColor(String? css, Color fallback) {
  if (css == null || css.isEmpty) return fallback;
  final hex = css.startsWith('#') ? css.substring(1) : css;
  try {
    if (hex.length == 6) return Color(int.parse('FF$hex', radix: 16));
    if (hex.length == 8) return Color(int.parse(hex, radix: 16));
  } catch (_) {}
  return fallback;
}
