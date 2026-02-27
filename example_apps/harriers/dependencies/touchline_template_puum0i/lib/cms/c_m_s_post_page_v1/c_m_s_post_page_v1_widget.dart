import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'c_m_s_post_page_v1_model.dart';
export 'c_m_s_post_page_v1_model.dart';

class CMSPostPageV1Widget extends StatefulWidget {
  const CMSPostPageV1Widget({
    super.key,
    required this.cmsPostObjectId,
  });

  final String? cmsPostObjectId;

  @override
  State<CMSPostPageV1Widget> createState() => _CMSPostPageV1WidgetState();
}

class _CMSPostPageV1WidgetState extends State<CMSPostPageV1Widget> {
  late CMSPostPageV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CMSPostPageV1Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.clearCmsPostCacheKey(valueOrDefault<String>(
        widget!.cmsPostObjectId,
        '1234',
      ));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: _model.cmsPost(
        uniqueQueryKey: valueOrDefault<String>(
          widget!.cmsPostObjectId,
          '1234',
        ),
        requestFn: () => CmsGroup.getCMSPostByIDCall.call(
          cmsPostObjectId: widget!.cmsPostObjectId,
          bLappId: FFLibraryValues().BLProjectId,
          bLRestApiKey: FFLibraryValues().BLRestAPIKey,
        ),
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
        final containerGetCMSPostByIDResponse = snapshot.data!;

        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    child: Stack(
                      children: [
                        if (CMSPostStruct.maybeFromMap(
                                    containerGetCMSPostByIDResponse.jsonBody)
                                ?.type ==
                            'VIDEO')
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: valueOrDefault<double>(
                              (MediaQuery.sizeOf(context).width / 16) * 9,
                              200.0,
                            ),
                            child: custom_widgets.UniversalVideoEmbedWidget(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: valueOrDefault<double>(
                                (MediaQuery.sizeOf(context).width / 16) * 9,
                                200.0,
                              ),
                              url: CMSPostStruct.maybeFromMap(
                                      containerGetCMSPostByIDResponse.jsonBody)!
                                  .videoUrl,
                            ),
                          ),
                        if ((CMSPostStruct.maybeFromMap(
                                        containerGetCMSPostByIDResponse
                                            .jsonBody)
                                    ?.type ==
                                'VIDEO') &&
                            responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: valueOrDefault<double>(
                              (MediaQuery.sizeOf(context).width / 16) * 9,
                              200.0,
                            ),
                            child: custom_widgets.YouTubeEmbedWidget(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: valueOrDefault<double>(
                                (MediaQuery.sizeOf(context).width / 16) * 9,
                                200.0,
                              ),
                              url: CMSPostStruct.maybeFromMap(
                                      containerGetCMSPostByIDResponse.jsonBody)!
                                  .videoUrl,
                            ),
                          ),
                        if (CMSPostStruct.maybeFromMap(
                                    containerGetCMSPostByIDResponse.jsonBody)
                                ?.type !=
                            'VIDEO')
                          Hero(
                            tag: CMSPostStruct.maybeFromMap(
                                    containerGetCMSPostByIDResponse.jsonBody)!
                                .imageUrl,
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                              child: Image.network(
                                CMSPostStruct.maybeFromMap(
                                        containerGetCMSPostByIDResponse
                                            .jsonBody)!
                                    .imageUrl,
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  'packages/touchline_template_puum0i/assets/images/error_image.png',
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 3.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.access_time_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                'Published ${dateTimeFormat("relative", DateTime.fromMillisecondsSinceEpoch(valueOrDefault<int>(
                                                      CMSPostStruct.maybeFromMap(
                                                              containerGetCMSPostByIDResponse
                                                                  .jsonBody)
                                                          ?.outputPostDate,
                                                      0,
                                                    )))}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 13.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 8.0))
                                            .addToStart(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.person_outline,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                CMSPostStruct.maybeFromMap(
                                                        containerGetCMSPostByIDResponse
                                                            .jsonBody)
                                                    ?.authorName,
                                                'admin',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 8.0))
                                            .addToStart(SizedBox(width: 10.0))
                                            .addToEnd(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: custom_widgets.ResponsiveHtmlViewer3(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 550.0,
                                htmlContent: CMSPostStruct.maybeFromMap(
                                        containerGetCMSPostByIDResponse
                                            .jsonBody)!
                                    .fullBody,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
