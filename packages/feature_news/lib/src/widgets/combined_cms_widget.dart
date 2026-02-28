import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import 'package:feature_news/src/providers.dart';

/// Vertical list of the latest CMS posts fetched from Backendless.
///
/// [clickAction] is called with the post's objectId when a card is tapped.
///
/// Ported from CombinedCMSV1Widget (Phase 5.5).
class CombinedCmsWidget extends ConsumerWidget {
  const CombinedCmsWidget({
    super.key,
    required this.projectId,
    required this.restApiKey,
    this.userToken = '',
    this.numberToFetch = 5,
    this.clickAction,
  });

  final String projectId;
  final String restApiKey;
  final String userToken;
  final int numberToFetch;
  final Future<void> Function(String cmsPostObjectId)? clickAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final postsAsync = ref.watch(cmsLatestPostsProvider((
      projectId: projectId,
      restApiKey: restApiKey,
      count: numberToFetch,
      userToken: userToken,
    )));

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      child: postsAsync.when(
        loading: () => Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: SpinKitWanderingCubes(
                color: theme.colorScheme.primary, size: 50),
          ),
        ),
        error: (_, __) => const SizedBox.shrink(),
        data: (posts) => ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: posts.length,
          separatorBuilder: (_, __) => const SizedBox(height: 14),
          itemBuilder: (context, i) {
            final post = posts[i];
            return _CmsPostCard(
              post: post,
              theme: theme,
              onTap: clickAction == null
                  ? null
                  : () => clickAction!(post.objectId),
            );
          },
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Private card
// ---------------------------------------------------------------------------

class _CmsPostCard extends StatelessWidget {
  const _CmsPostCard({
    required this.post,
    required this.theme,
    this.onTap,
  });

  final CMSPostStruct post;
  final ThemeData theme;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final title = post.title.fixBackendlessText();
    final body = post.shortBody.fixBackendlessText();
    final truncatedBody =
        body.length > 200 ? '${body.substring(0, 200)}\u2026' : body;

    String dateStr = '';
    try {
      if (post.outputPostDate > 0) {
        dateStr = DateFormat.yMMMd()
            .format(DateTime.fromMillisecondsSinceEpoch(post.outputPostDate));
      }
    } catch (_) {}

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        elevation: 3,
        shape: const RoundedRectangleBorder(),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (post.imageUrl.isNotEmpty)
                Image.network(
                  post.imageUrl,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (dateStr.isNotEmpty)
                      Text(
                        dateStr,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    if (title.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        title,
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                    if (truncatedBody.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        truncatedBody,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
