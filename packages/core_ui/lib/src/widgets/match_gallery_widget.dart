import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:core_ui/src/config/app_config.dart';
import 'package:core_ui/src/utils/list_extensions.dart';

/// Displays a photo gallery for a specific match.
///
/// Fetches images via [BackendlessDatabaseGroup.getMatchGalleryItemsForMatchCall]
/// using the club config credentials. Shows a loading spinner while fetching,
/// an empty state when no images are found, or a responsive [Wrap] of images.
class MatchGalleryWidget extends ConsumerStatefulWidget {
  const MatchGalleryWidget({
    super.key,
    required this.matchObjectId,
  });

  final String matchObjectId;

  @override
  ConsumerState<MatchGalleryWidget> createState() => _MatchGalleryWidgetState();
}

class _MatchGalleryWidgetState extends ConsumerState<MatchGalleryWidget> {
  late final Future<ApiCallResponse> _future;

  @override
  void initState() {
    super.initState();
    final cfg = ref.read(appConfigProvider);
    final token = ref.read(userTokenProvider);
    _future = BackendlessDatabaseGroup.getMatchGalleryItemsForMatchCall.call(
      matchObjectId: widget.matchObjectId,
      bLProjectId: cfg.projectId,
      bLRestAPIKey: cfg.restApiKey,
      headerName: token.isNotEmpty ? 'user-token' : 'Content-Type',
      headerValue: token.isNotEmpty ? token : 'application/json',
    );
  }

  @override
  Widget build(BuildContext context) {
    final cfg = ref.watch(appConfigProvider);

    return SingleChildScrollView(
      primary: false,
      child: FutureBuilder<ApiCallResponse>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitWanderingCubes(
                  color: Theme.of(context).colorScheme.primary,
                  size: 50.0,
                ),
              ),
            );
          }

          final images = (snapshot.data!.jsonBody
                      .toList()
                      .map<MatchGalleryItemStruct?>(
                          MatchGalleryItemStruct.maybeFromMap)
                      .toList()
                  as Iterable<MatchGalleryItemStruct?>)
              .withoutNulls
              .toList();

          if (images.isEmpty) {
            return _EmptyGallery();
          }

          return Container(
            width: double.infinity,
            alignment: AlignmentDirectional.topCenter,
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 15.0,
              runSpacing: 15.0,
              children: images.map((item) {
                return ClipRRect(
                  borderRadius: cfg.cardBorderRadius,
                  child: SizedBox(
                    width: 300.0,
                    height: 200.0,
                    child: Image.network(
                      item.imagePath,
                      width: double.infinity,
                      height: 200.0,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Image.asset(
                        'assets/images/error_image.png',
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

class _EmptyGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final textColour = Theme.of(context).colorScheme.onSurface;

    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.image_outlined, color: primary, size: 50.0),
          Text(
            'No images Added',
            style: GoogleFonts.bebasNeue(fontSize: 32.0, color: textColour),
          ),
          Text(
            'Check back soon',
            style: GoogleFonts.inter(color: textColour),
          ),
        ].divide(const SizedBox(height: 6.0)),
      ),
    );
  }
}
