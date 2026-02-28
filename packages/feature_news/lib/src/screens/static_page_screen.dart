import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:feature_news/src/widgets/html_content_widget.dart';

/// Displays the HTML content of a single CMS static page identified by
/// [objectId].
///
/// Ported from MyClubPageWidget (Phase 6 My Club).
class StaticPageScreen extends ConsumerStatefulWidget {
  const StaticPageScreen({
    super.key,
    required this.objectId,
  });

  static const routePath = '/my-club-page';

  /// Backendless objectId of the `InternalPages` record to display.
  final String objectId;

  @override
  ConsumerState<StaticPageScreen> createState() => _StaticPageScreenState();
}

class _StaticPageScreenState extends ConsumerState<StaticPageScreen> {
  late Future<StaticPageStruct?> _pageFuture;

  @override
  void initState() {
    super.initState();
    _pageFuture = _fetchPage();
  }

  Future<StaticPageStruct?> _fetchPage() async {
    final cfg = ref.read(appConfigProvider);
    final result =
        await BackendlessDatabaseGroup.getStaticPageContentByIDCall.call(
      pageObjectId: widget.objectId,
      bLProjectId: cfg.projectId,
      bLRestAPIKey: cfg.restApiKey,
    );

    if (!result.succeeded) return null;
    return StaticPageStruct.maybeFromMap(result.jsonBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: FutureBuilder<StaticPageStruct?>(
          future: _pageFuture,
          builder: (context, snapshot) {
            final title = snapshot.data?.title ?? '';
            return Text(title);
          },
        ),
      ),
      body: FutureBuilder<StaticPageStruct?>(
        future: _pageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: AppLoader());
          }
          if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text('Could not load page.'));
          }
          final page = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Featured image (if present)
                if (page.featuredImage.isNotEmpty)
                  Image.network(
                    page.featuredImage,
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                  ),

                // HTML body
                HtmlContentWidget(htmlContent: page.fullBody),
              ],
            ),
          );
        },
      ),
    );
  }
}
