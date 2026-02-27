import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sponsor_ad_carousel_v1_model.dart';
export 'sponsor_ad_carousel_v1_model.dart';

class SponsorAdCarouselV1Widget extends StatefulWidget {
  const SponsorAdCarouselV1Widget({
    super.key,
    required this.locationKey,
  });

  final String? locationKey;

  @override
  State<SponsorAdCarouselV1Widget> createState() =>
      _SponsorAdCarouselV1WidgetState();
}

class _SponsorAdCarouselV1WidgetState extends State<SponsorAdCarouselV1Widget> {
  late SponsorAdCarouselV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SponsorAdCarouselV1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: FutureBuilder<ApiCallResponse>(
        future: BackendlessDatabaseGroup.sponsorAdsCall.call(
          locationKey: widget!.locationKey,
          bLProjectId: FFLibraryValues().BLProjectId,
          bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
          headerName:
              FFAppState().userToken != null && FFAppState().userToken != ''
                  ? 'user-token'
                  : 'Content-Type',
          headerValue:
              FFAppState().userToken != null && FFAppState().userToken != ''
                  ? FFAppState().userToken
                  : 'application/json',
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitWanderingCubes(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            );
          }
          final containerSponsorAdsResponse = snapshot.data!;

          return AnimatedContainer(
            duration: Duration(milliseconds: 210),
            curve: Curves.easeInOut,
            width: 350.0,
            height: 400.0,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 1.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Builder(
                builder: (context) {
                  final pagee = (containerSponsorAdsResponse.jsonBody
                              .toList()
                              .map<SponsorAdStruct?>(
                                  SponsorAdStruct.maybeFromMap)
                              .toList() as Iterable<SponsorAdStruct?>)
                          .withoutNulls
                          ?.toList() ??
                      [];

                  return Container(
                    width: double.infinity,
                    height: 500.0,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: PageView.builder(
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage:
                                        max(0, min(0, pagee.length - 1))),
                            scrollDirection: Axis.horizontal,
                            itemCount: pagee.length,
                            itemBuilder: (context, pageeIndex) {
                              final pageeItem = pagee[pageeIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL(pageeItem.link);
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          valueOrDefault<double>(
                                        FFLibraryValues()
                                            .BRBottomLeft
                                            ?.toDouble(),
                                        0.0,
                                      )),
                                      bottomRight: Radius.circular(
                                          valueOrDefault<double>(
                                        FFLibraryValues()
                                            .BRBottomRight
                                            ?.toDouble(),
                                        0.0,
                                      )),
                                      topLeft: Radius.circular(
                                          valueOrDefault<double>(
                                        FFLibraryValues().BRTopLeft?.toDouble(),
                                        0.0,
                                      )),
                                      topRight: Radius.circular(
                                          valueOrDefault<double>(
                                        FFLibraryValues()
                                            .BRTopRight
                                            ?.toDouble(),
                                        0.0,
                                      )),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      pageeItem.fileURL,
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
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage:
                                          max(0, min(0, pagee.length - 1))),
                              count: pagee.length,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.pageViewController!.animateToPage(
                                  i,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                                safeSetState(() {});
                              },
                              effect: smooth_page_indicator.SlideEffect(
                                spacing: 8.0,
                                radius: 8.0,
                                dotWidth: 8.0,
                                dotHeight: 8.0,
                                dotColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
