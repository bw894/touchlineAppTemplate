import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

import 'package:core_ui/src/config/app_config.dart';
import 'package:core_ui/src/utils/url_utils.dart';

/// Sponsor advertisement carousel.
///
/// Fetches sponsor ads for [locationKey] from the Backendless backend and
/// displays them in a horizontal [PageView] with a [SmoothPageIndicator].
/// Each ad is tappable and opens [SponsorAdStruct.link] in the device browser.
class SponsorAdWidget extends ConsumerStatefulWidget {
  const SponsorAdWidget({
    super.key,
    required this.locationKey,
  });

  final String locationKey;

  @override
  ConsumerState<SponsorAdWidget> createState() => _SponsorAdWidgetState();
}

class _SponsorAdWidgetState extends ConsumerState<SponsorAdWidget> {
  PageController? _pageController;
  late final Future<ApiCallResponse> _future;

  @override
  void initState() {
    super.initState();
    final cfg = ref.read(appConfigProvider);
    final token = ref.read(userTokenProvider);
    _future = BackendlessDatabaseGroup.sponsorAdsCall.call(
      locationKey: widget.locationKey,
      bLProjectId: cfg.projectId,
      bLRestAPIKey: cfg.restApiKey,
      headerName: token.isNotEmpty ? 'user-token' : 'Content-Type',
      headerValue: token.isNotEmpty ? token : 'application/json',
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cfg = ref.watch(appConfigProvider);

    return Align(
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

          final ads = (snapshot.data!.jsonBody
                      .toList()
                      .map<SponsorAdStruct?>(SponsorAdStruct.maybeFromMap)
                      .toList()
                  as Iterable<SponsorAdStruct?>)
              .withoutNulls
              .toList();

          final initialPage = ads.isEmpty ? 0 : 0;
          _pageController ??= PageController(initialPage: initialPage);

          return AnimatedContainer(
            duration: const Duration(milliseconds: 210),
            curve: Curves.easeInOut,
            width: 350.0,
            height: 400.0,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 500.0,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                    child: PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: ads.length,
                      itemBuilder: (context, i) {
                        final ad = ads[i];
                        return GestureDetector(
                          onTap: () => launchURL(ad.link),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSurface,
                              borderRadius: cfg.cardBorderRadius,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                ad.fileURL,
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: smooth_page_indicator.SmoothPageIndicator(
                        controller: _pageController!,
                        count: ads.length,
                        axisDirection: Axis.horizontal,
                        onDotClicked: (i) async {
                          await _pageController!.animateToPage(
                            i,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                          setState(() {});
                        },
                        effect: smooth_page_indicator.SlideEffect(
                          spacing: 8.0,
                          radius: 8.0,
                          dotWidth: 8.0,
                          dotHeight: 8.0,
                          dotColor:
                              Theme.of(context).colorScheme.onSurface,
                          activeDotColor:
                              Theme.of(context).colorScheme.primary,
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
