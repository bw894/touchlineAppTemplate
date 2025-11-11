import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'combined_c_m_s_v1_model.dart';
export 'combined_c_m_s_v1_model.dart';

class CombinedCMSV1Widget extends StatefulWidget {
  const CombinedCMSV1Widget({
    super.key,
    required this.clickAction,
    int? numberToFetch,
  }) : this.numberToFetch = numberToFetch ?? 5;

  final Future Function(String cmsPostObjectId)? clickAction;
  final int numberToFetch;

  @override
  State<CombinedCMSV1Widget> createState() => _CombinedCMSV1WidgetState();
}

class _CombinedCMSV1WidgetState extends State<CombinedCMSV1Widget> {
  late CombinedCMSV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CombinedCMSV1Model());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
        child: FutureBuilder<ApiCallResponse>(
          future: CmsGroup.getLatestPostsCall.call(
            bLappId: FFLibraryValues().BLProjectId,
            bLRestApiKey: FFLibraryValues().BLRestAPIKey,
            number: widget.numberToFetch,
            headerName:
                FFAppState().userToken != ''
                    ? 'user-token'
                    : 'Content-Type',
            headerValue:
                FFAppState().userToken != ''
                    ? FFAppState().userToken
                    : 'application/json',
            currentTime: getCurrentTimestamp.millisecondsSinceEpoch,
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
            final containerGetLatestPostsResponse = snapshot.data!;

            return Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              constraints: BoxConstraints(
                maxWidth: 550.0,
              ),
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Builder(
                      builder: (context) {
                        final cMSPost = (containerGetLatestPostsResponse
                                    .jsonBody
                                    .toList()
                                    .map<CMSPostStruct?>(
                                        CMSPostStruct.maybeFromMap)
                                    .toList() as Iterable<CMSPostStruct?>)
                                .withoutNulls
                                .toList() ??
                            [];

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: cMSPost.length,
                          separatorBuilder: (_, __) => SizedBox(height: 10.0),
                          itemBuilder: (context, cMSPostIndex) {
                            final cMSPostItem = cMSPost[cMSPostIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 5.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await widget.clickAction?.call(
                                    cMSPostItem.objectId,
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
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
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 250.0,
                                      ),
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
                                            FFLibraryValues()
                                                .BRTopLeft
                                                ?.toDouble(),
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
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                              child: Image.network(
                                                cMSPostItem.imageUrl,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                fit: BoxFit.contain,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                              "yMMMd",
                                                              DateTime.fromMillisecondsSinceEpoch(
                                                                  cMSPostItem
                                                                      .outputPostDate)),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            functions
                                                                .removeUnwantedCharacters(
                                                                    cMSPostItem
                                                                        .title),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Text(
                                                          functions
                                                              .removeUnwantedCharacters(
                                                                  cMSPostItem
                                                                      .shortBody)
                                                              .maybeHandleOverflow(
                                                                maxChars: 200,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 4.0)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ].divide(SizedBox(height: 5.0)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
