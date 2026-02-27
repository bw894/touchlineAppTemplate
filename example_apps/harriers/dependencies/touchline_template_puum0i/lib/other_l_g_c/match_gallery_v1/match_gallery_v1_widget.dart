import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'match_gallery_v1_model.dart';
export 'match_gallery_v1_model.dart';

class MatchGalleryV1Widget extends StatefulWidget {
  const MatchGalleryV1Widget({
    super.key,
    required this.matchObjectId,
  });

  final String? matchObjectId;

  @override
  State<MatchGalleryV1Widget> createState() => _MatchGalleryV1WidgetState();
}

class _MatchGalleryV1WidgetState extends State<MatchGalleryV1Widget> {
  late MatchGalleryV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchGalleryV1Model());

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

    return SingleChildScrollView(
      primary: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          FutureBuilder<ApiCallResponse>(
            future:
                BackendlessDatabaseGroup.getMatchGalleryItemsForMatchCall.call(
              matchObjectId: widget!.matchObjectId,
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
              final containerGetMatchGalleryItemsForMatchResponse =
                  snapshot.data!;

              return Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Builder(
                      builder: (context) {
                        final image = (containerGetMatchGalleryItemsForMatchResponse
                                        .jsonBody
                                        .toList()
                                        .map<MatchGalleryItemStruct?>(
                                            MatchGalleryItemStruct.maybeFromMap)
                                        .toList()
                                    as Iterable<MatchGalleryItemStruct?>)
                                .withoutNulls
                                ?.toList() ??
                            [];
                        if (image.isEmpty) {
                          return EmptyListWidget(
                            title: 'No images Added',
                            body: 'Check back soon',
                            icon: Icon(
                              Icons.image_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          );
                        }

                        return Wrap(
                          spacing: 15.0,
                          runSpacing: 15.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: List.generate(image.length, (imageIndex) {
                            final imageItem = image[imageIndex];
                            return ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(valueOrDefault<double>(
                                  FFLibraryValues().BRBottomLeft?.toDouble(),
                                  0.0,
                                )),
                                bottomRight:
                                    Radius.circular(valueOrDefault<double>(
                                  FFLibraryValues().BRBottomRight?.toDouble(),
                                  0.0,
                                )),
                                topLeft: Radius.circular(valueOrDefault<double>(
                                  FFLibraryValues().BRTopLeft?.toDouble(),
                                  0.0,
                                )),
                                topRight:
                                    Radius.circular(valueOrDefault<double>(
                                  FFLibraryValues().BRTopRight?.toDouble(),
                                  0.0,
                                )),
                              ),
                              child: Container(
                                width: 300.0,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft:
                                        Radius.circular(valueOrDefault<double>(
                                      FFLibraryValues()
                                          .BRBottomLeft
                                          ?.toDouble(),
                                      0.0,
                                    )),
                                    bottomRight:
                                        Radius.circular(valueOrDefault<double>(
                                      FFLibraryValues()
                                          .BRBottomRight
                                          ?.toDouble(),
                                      0.0,
                                    )),
                                    topLeft:
                                        Radius.circular(valueOrDefault<double>(
                                      FFLibraryValues().BRTopLeft?.toDouble(),
                                      0.0,
                                    )),
                                    topRight:
                                        Radius.circular(valueOrDefault<double>(
                                      FFLibraryValues().BRTopRight?.toDouble(),
                                      0.0,
                                    )),
                                  ),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Color(0x00FF5963),
                                    width: 1.0,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                    child: Image.network(
                                      imageItem.imagePath,
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 200.0,
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'packages/touchline_template_puum0i/assets/images/error_image.png',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 200.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
