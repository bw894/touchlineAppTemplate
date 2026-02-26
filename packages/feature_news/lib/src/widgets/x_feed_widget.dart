import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:feature_news/src/providers.dart';

/// Displays the latest 3 items from the X (Twitter) feed loaded via [feedUrl].
///
/// Variant differences:
/// - [XFeedVariant.card]     — 20px padding all sides, left-aligned text,
///                             elevation 3 (v1).
/// - [XFeedVariant.list]     — horizontal 20px padding only, left-aligned,
///                             elevation 3 (v2).
/// - [XFeedVariant.carousel] — horizontal 20px, centred, top divider,
///                             elevation 3 (v3).
/// - [XFeedVariant.minimal]  — horizontal 20px, centred, top divider,
///                             elevation 5 (v4).
///
/// Ported from XFeedV1–V4Widget (Phase 5.5).
class XFeedWidget extends ConsumerWidget {
  const XFeedWidget({
    super.key,
    required this.feedUrl,
    required this.variant,
    this.cardBorderRadius = BorderRadius.zero,
  });

  final String feedUrl;
  final XFeedVariant variant;
  final BorderRadius cardBorderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final feedAsync = ref.watch(xFeedProvider((feedUrl: feedUrl)));

    final hPadding = variant == XFeedVariant.card
        ? const EdgeInsets.all(20)
        : const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: hPadding,
        child: feedAsync.when(
          loading: () => Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitWanderingCubes(
                  color: theme.colorScheme.primary, size: 50),
            ),
          ),
          error: (_, __) => const SizedBox.shrink(),
          data: (items) => ListView.separated(
            padding: variant == XFeedVariant.card
                ? const EdgeInsets.only(top: 18)
                : EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (context, i) => _XFeedCard(
              item: items[i],
              variant: variant,
              borderRadius: cardBorderRadius,
              theme: theme,
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Private card widget
// ---------------------------------------------------------------------------

class _XFeedCard extends StatelessWidget {
  const _XFeedCard({
    required this.item,
    required this.variant,
    required this.borderRadius,
    required this.theme,
  });

  final ItemTwitterStruct item;
  final XFeedVariant variant;
  final BorderRadius borderRadius;
  final ThemeData theme;

  bool get _isCentred =>
      variant == XFeedVariant.carousel || variant == XFeedVariant.minimal;
  bool get _hasTopDivider =>
      variant == XFeedVariant.carousel || variant == XFeedVariant.minimal;
  double get _elevation => variant == XFeedVariant.minimal ? 5.0 : 3.0;

  @override
  Widget build(BuildContext context) {
    final relDate = _relativeDate(item.datePublished);

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => launchURL(item.url),
      child: Material(
        color: Colors.transparent,
        elevation: _elevation,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: borderRadius,
          ),
          child: _hasTopDivider
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                        height: 2,
                        thickness: 2,
                        color: theme.colorScheme.primary),
                    Padding(
                        padding: const EdgeInsets.all(16),
                        child: _contentColumn(relDate)),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: _contentColumn(relDate),
                ),
        ),
      ),
    );
  }

  Widget _contentColumn(String relDate) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          _isCentred ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'X Feed \u2022 $relDate',
          textAlign: _isCentred ? TextAlign.center : TextAlign.start,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.primary,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: _isCentred ? 5 : 8),
        Text(
          item.title,
          textAlign: _isCentred ? TextAlign.center : TextAlign.start,
          style: theme.textTheme.bodyMedium?.copyWith(fontSize: 19),
        ),
        if (item.image.isNotEmpty) ...[
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(_isCentred ? 0 : 8),
            child: Image.network(
              item.image,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ],
    );
  }

  String _relativeDate(String datePublished) {
    try {
      final dt = DateTime.tryParse(datePublished);
      if (dt == null) return datePublished;
      return timeago.format(dt);
    } catch (_) {
      return datePublished;
    }
  }
}
