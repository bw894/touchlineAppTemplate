import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'x_feed_v1_model.dart';
export 'x_feed_v1_model.dart';

class XFeedV1Widget extends StatefulWidget {
  const XFeedV1Widget({super.key});

  @override
  State<XFeedV1Widget> createState() => _XFeedV1WidgetState();
}

class _XFeedV1WidgetState extends State<XFeedV1Widget> {
  late XFeedV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => XFeedV1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FutureBuilder<ApiCallResponse>(
              future: LiveTextCall.call(
                feedURL: FFLibraryValues().feedURL,
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
                final xfEEDLiveTextResponse = snapshot.data!;

                return Builder(
                  builder: (context) {
                    final twitterItem = (TwitterFeedStruct.maybeFromMap(
                                    xfEEDLiveTextResponse.jsonBody)
                                ?.items
                                .toList() ??
                            [])
                        .take(3)
                        .toList();

                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        18.0,
                        0,
                        0,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: twitterItem.length,
                      separatorBuilder: (_, __) => SizedBox(height: 14.0),
                      itemBuilder: (context, twitterItemIndex) {
                        final twitterItemItem = twitterItem[twitterItemIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await launchURL(twitterItemItem.url);
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
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
                                ),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            'X Feed • ${dateTimeFormat("relative", functions.convertStringToDateTime(twitterItemItem.datePublished))}',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            twitterItemItem.title,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 19.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        if (valueOrDefault<bool>(
                                          twitterItemItem.image != '',
                                          false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                child: Visibility(
                                                  visible: valueOrDefault<bool>(
                                                    twitterItemItem.image !=
                                                            '',
                                                    false,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        twitterItemItem.image,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        fit: BoxFit.contain,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.png',
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
