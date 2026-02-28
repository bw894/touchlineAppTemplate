import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import 'package:feature_news/src/providers.dart';
import 'package:feature_news/src/widgets/youtube_video_widget.dart';

/// Horizontal scroll of up to 5 latest YouTube videos.
///
/// Tapping a card opens [YoutubeVideoWidget] as a dialog.
///
/// Ported from LatestVideosV2Widget (Phase 5.5).
class LatestVideosWidget extends ConsumerWidget {
  const LatestVideosWidget({
    super.key,
    required this.youtubeApiKey,
    required this.playlistId,
    this.cardBorderRadius = BorderRadius.zero,
  });

  final String youtubeApiKey;
  final String playlistId;
  final BorderRadius cardBorderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final videosAsync = ref.watch(
      youtubeVideosProvider((
        playlistId: playlistId,
        apiKey: youtubeApiKey,
      )),
    );

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
      child: videosAsync.when(
        loading: () => Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: SpinKitWanderingCubes(
                color: theme.colorScheme.primary, size: 50),
          ),
        ),
        error: (_, __) => const SizedBox.shrink(),
        data: (videos) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: videos.asMap().entries.map((entry) {
              final video = entry.value;
              return Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 20),
                child: _VideoCard(
                  video: video,
                  borderRadius: cardBorderRadius,
                  theme: theme,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Private card
// ---------------------------------------------------------------------------

class _VideoCard extends StatelessWidget {
  const _VideoCard({
    required this.video,
    required this.borderRadius,
    required this.theme,
  });

  final ItemsStruct video;
  final BorderRadius borderRadius;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final watchUrl =
        'https://www.youtube.com/watch?v=${video.snippet.resourceId.videoId}';
    final title = video.snippet.title;
    final dateStr = _formatDate(video.snippet.publishedAt);
    final thumbUrl = video.snippet.thumbnails.high.url;

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => showDialog<void>(
        context: context,
        builder: (_) => Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: YoutubeVideoWidget(watchUrl: watchUrl),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: borderRadius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Divider(
                  height: 2,
                  thickness: 2,
                  color: theme.colorScheme.primary),
              ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Image.network(
                  thumbUrl,
                  width: double.infinity,
                  height: 125,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      dateStr,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      title.length > 25 ? '${title.substring(0, 25)}…' : title,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(String iso) {
    try {
      final dt = DateTime.tryParse(iso);
      if (dt == null) return iso;
      return DateFormat.yMMMd().format(dt);
    } catch (_) {
      return iso;
    }
  }
}
