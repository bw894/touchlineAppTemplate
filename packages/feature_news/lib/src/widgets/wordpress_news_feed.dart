import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:feature_news/src/providers.dart';

/// News feed showing the 5 latest WordPress posts.
///
/// - [NewsFeedVariant.cards]: left-border accent bar per item (v1 style).
/// - [NewsFeedVariant.list]: top primary-colour divider per item (v2 style).
///
/// Ported from WordpressNewsFeedV1Widget + V2Widget (Phase 5.5).
class WordpressNewsFeed extends ConsumerWidget {
  const WordpressNewsFeed({
    super.key,
    required this.websiteBaseUrl,
    required this.variant,
    this.cardBorderRadius = BorderRadius.zero,
  });

  /// Base URL of the WordPress site — do NOT include `https://`.
  final String websiteBaseUrl;
  final NewsFeedVariant variant;
  final BorderRadius cardBorderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final newsAsync = ref.watch(
      wordpressNewsProvider((websiteBaseUrl: websiteBaseUrl)),
    );

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      child: newsAsync.when(
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
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          itemCount: items.length,
          separatorBuilder: (_, __) =>
              SizedBox(height: variant == NewsFeedVariant.cards ? 10 : 12),
          itemBuilder: (context, i) => _NewsCard(
            item: items[i],
            variant: variant,
            borderRadius: cardBorderRadius,
            theme: theme,
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Private card widget
// ---------------------------------------------------------------------------

class _NewsCard extends StatelessWidget {
  const _NewsCard({
    required this.item,
    required this.variant,
    required this.borderRadius,
    required this.theme,
  });

  final NewsItemStruct item;
  final NewsFeedVariant variant;
  final BorderRadius borderRadius;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final title = item.title.rendered.fixBackendlessText();
    final dateStr = _formatDate(item.date);

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => launchURL(item.link),
      child: Material(
        color: Colors.transparent,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: borderRadius,
          ),
          child: variant == NewsFeedVariant.cards
              ? _buildCardStyle(title, dateStr)
              : _buildListStyle(title, dateStr),
        ),
      ),
    );
  }

  /// v1 — left accent bar
  Widget _buildCardStyle(String title, String dateStr) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 45,
            child: VerticalDivider(
              width: 2,
              thickness: 2,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: _textColumn(title, dateStr, padding: const EdgeInsetsDirectional.fromSTEB(5, 8, 8, 8))),
          FaIcon(FontAwesomeIcons.angleRight,
              color: theme.colorScheme.primary, size: 21),
          const SizedBox(width: 0),
        ],
      ),
    );
  }

  /// v2 — top divider
  Widget _buildListStyle(String title, String dateStr) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(height: 2, thickness: 2, color: theme.colorScheme.primary),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(14, 0, 15, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _textColumn(title, dateStr, padding: const EdgeInsetsDirectional.fromSTEB(5, 8, 8, 8))),
              FaIcon(FontAwesomeIcons.angleRight,
                  color: theme.colorScheme.primary, size: 21),
            ],
          ),
        ),
      ],
    );
  }

  Widget _textColumn(String title, String dateStr,
      {required EdgeInsetsDirectional padding}) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.length > 75 ? '${title.substring(0, 75)}…' : title,
            style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Text(
            title.length > 250 ? '${title.substring(0, 250)}…' : title,
            style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.normal,
                fontSize: 14),
          ),
          Text(
            dateStr,
            style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary),
          ),
        ].map((w) => Padding(padding: const EdgeInsets.only(bottom: 1), child: w)).toList(),
      ),
    );
  }

  String _formatDate(String isoDate) {
    try {
      final dt = DateTime.tryParse(isoDate);
      if (dt == null) return isoDate;
      return DateFormat.yMMMd().format(dt);
    } catch (_) {
      return isoDate;
    }
  }
}
