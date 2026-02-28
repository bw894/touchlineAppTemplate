import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import 'package:feature_news/src/providers.dart';
import 'package:feature_news/src/widgets/html_content_widget.dart';
import 'package:feature_news/src/widgets/universal_video_widget.dart';

/// Full-page CMS post view: video or hero image, date/author metadata, and
/// full HTML body rendered via [HtmlContentWidget].
///
/// Ported from CMSPostPageV1Widget (Phase 5.5).
class CmsPostPage extends ConsumerWidget {
  const CmsPostPage({
    super.key,
    required this.cmsPostObjectId,
    required this.projectId,
    required this.restApiKey,
    this.userToken = '',
  });

  final String cmsPostObjectId;
  final String projectId;
  final String restApiKey;
  final String userToken;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final postAsync = ref.watch(cmsPostProvider((
      projectId: projectId,
      restApiKey: restApiKey,
      postObjectId: cmsPostObjectId,
      userToken: userToken,
    )));

    return postAsync.when(
      loading: () => Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: SpinKitWanderingCubes(
              color: theme.colorScheme.primary, size: 50),
        ),
      ),
      error: (_, __) => const SizedBox.shrink(),
      data: (post) {
        if (post == null) return const SizedBox.shrink();
        return _CmsPostContent(post: post, theme: theme);
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Private content widget
// ---------------------------------------------------------------------------

class _CmsPostContent extends StatelessWidget {
  const _CmsPostContent({required this.post, required this.theme});

  final CMSPostStruct post;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isVideo = post.type == 'VIDEO';

    String dateStr = '';
    try {
      if (post.outputPostDate > 0) {
        dateStr = DateFormat.yMMMd()
            .format(DateTime.fromMillisecondsSinceEpoch(post.outputPostDate));
      }
    } catch (_) {}

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isVideo && post.videoUrl.isNotEmpty)
            UniversalVideoWidget(
              url: post.videoUrl,
              width: width,
              height: width * 9 / 16,
            )
          else if (post.imageUrl.isNotEmpty)
            Hero(
              tag: post.imageUrl,
              child: Image.network(
                post.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 8),
            child: Row(
              children: [
                if (dateStr.isNotEmpty)
                  Text(
                    dateStr,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                if (dateStr.isNotEmpty && post.authorName.isNotEmpty)
                  const SizedBox(width: 8),
                if (post.authorName.isNotEmpty)
                  Text(
                    '\u2022 ${post.authorName}',
                    style: theme.textTheme.bodySmall,
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
            child: HtmlContentWidget(
              htmlContent: post.fullBody,
              width: width - 32,
            ),
          ),
        ],
      ),
    );
  }
}
