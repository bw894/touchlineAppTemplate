import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Displays a list of CMS static pages contained within [rootKey].
///
/// Navigation pattern:
/// - type == 'FOLDER' → push another [StaticPageFolderScreen] with the folder
///   title as the new [rootKey]
/// - any other type → push StaticPageScreen (/my-club-page) with the objectId
///
/// Ported from MyClubFolderWidget (Phase 6 My Club).
class StaticPageFolderScreen extends ConsumerStatefulWidget {
  const StaticPageFolderScreen({
    super.key,
    required this.rootKey,
  });

  static const routePath = '/my-club-folder';

  /// The `Title` of the parent folder whose direct children we display.
  /// Pass `'root'` to show the top-level My Club pages.
  final String rootKey;

  @override
  ConsumerState<StaticPageFolderScreen> createState() =>
      _StaticPageFolderScreenState();
}

class _StaticPageFolderScreenState
    extends ConsumerState<StaticPageFolderScreen> {
  late Future<List<StaticPageStruct>> _pagesFuture;

  @override
  void initState() {
    super.initState();
    _pagesFuture = _fetchPages();
  }

  Future<List<StaticPageStruct>> _fetchPages() async {
    final cfg = ref.read(appConfigProvider);
    final result =
        await BackendlessDatabaseGroup.getPagesWhereContainedEqualsTermCall.call(
      pageKey: widget.rootKey,
      bLProjectId: cfg.projectId,
      bLRestAPIKey: cfg.restApiKey,
    );

    if (!result.succeeded) return [];

    final raw = result.jsonBody;
    if (raw is! List) return [];

    return raw
        .map((e) => StaticPageStruct.maybeFromMap(e))
        .whereType<StaticPageStruct>()
        .toList();
  }

  void _onTap(BuildContext context, StaticPageStruct page) {
    if (page.type == 'FOLDER') {
      context.push(
        '/my-club-folder?rootKey=${Uri.encodeComponent(page.title)}',
      );
    } else {
      context.push('/my-club-page?objectId=${page.objectId}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final cfg = ref.watch(appConfigProvider);
    final title = widget.rootKey == 'root' ? 'My Club' : widget.rootKey;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          if (cfg.bgImageUrl.isNotEmpty)
            Positioned.fill(
              child: Image.network(
                cfg.bgImageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const ColoredBox(color: Colors.black),
              ),
            )
          else
            const Positioned.fill(child: ColoredBox(color: Colors.black)),

          // Dark overlay
          Positioned.fill(
            child: ColoredBox(
                color: Colors.black.withValues(alpha: 0.45)),
          ),

          // Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button + title row
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                        onPressed: () => context.pop(),
                      ),
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                // Page list
                Expanded(
                  child: FutureBuilder<List<StaticPageStruct>>(
                    future: _pagesFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: AppLoader(color: Colors.white),
                        );
                      }
                      final pages = snapshot.data ?? [];
                      if (pages.isEmpty) {
                        return const Center(
                          child: Text(
                            'No pages found.',
                            style: TextStyle(color: Colors.white70),
                          ),
                        );
                      }
                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        itemCount: pages.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 15),
                        itemBuilder: (context, index) {
                          final page = pages[index];
                          return _PageCard(
                            page: page,
                            onTap: () => _onTap(context, page),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Card widget
// ---------------------------------------------------------------------------

class _PageCard extends StatelessWidget {
  const _PageCard({required this.page, required this.onTap});

  final StaticPageStruct page;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Material(
        color: Colors.transparent,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
            height: 250,
            child: Column(
              children: [
                // Featured image
                if (page.featuredImage.isNotEmpty)
                  Image.network(
                    page.featuredImage,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey.shade800,
                      child: const Icon(Icons.image_not_supported,
                          color: Colors.white54, size: 48),
                    ),
                  )
                else
                  Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey.shade800,
                  ),

                // Title label
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.surface,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        page.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
