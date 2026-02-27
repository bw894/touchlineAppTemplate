import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/latest_videos/youtube_video/youtube_video_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'latest_videos_v2_model.dart';
export 'latest_videos_v2_model.dart';

class LatestVideosV2Widget extends StatefulWidget {
  const LatestVideosV2Widget({
    super.key,
    required this.keyyyy,
    required this.playlistId,
  });

  final String? keyyyy;
  final String? playlistId;

  @override
  State<LatestVideosV2Widget> createState() => _LatestVideosV2WidgetState();
}

class _LatestVideosV2WidgetState extends State<LatestVideosV2Widget> {
  late LatestVideosV2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LatestVideosV2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
      child: FutureBuilder<ApiCallResponse>(
        future: YouTubeVideosCall.call(
          playlistId: widget!.playlistId,
          tkeye: widget!.keyyyy,
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
          final containerYouTubeVideosResponse = snapshot.data!;

          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(),
            child: Builder(
              builder: (context) {
                final video = (VideoResponseStruct.maybeFromMap(
                                containerYouTubeVideosResponse.jsonBody)
                            ?.items
                            ?.toList() ??
                        [])
                    .take(5)
                    .toList();

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(video.length, (videoIndex) {
                      final videoItem = video[videoIndex];
                      return Builder(
                        builder: (context) => Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: WebViewAware(
                                      child: YoutubeVideoWidget(
                                        watchURL:
                                            'https://www.youtube.com/watch?v=${videoItem.snippet.resourceId.videoId}',
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
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
                                width: 200.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Divider(
                                      height: 2.0,
                                      thickness: 2.0,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                      child: Image.network(
                                        videoItem.snippet.thumbnails.high.url,
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 125.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            dateTimeFormat(
                                                "yMMMd",
                                                functions.parseDateTime(
                                                    videoItem
                                                        .snippet.publishedAt)),
                                            textAlign: TextAlign.center,
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
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                  lineHeight: 1.0,
                                                ),
                                          ),
                                          Text(
                                            videoItem.snippet.title
                                                .maybeHandleOverflow(
                                              maxChars: 25,
                                              replacement: '…',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                  lineHeight: 1.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 6.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).divide(SizedBox(width: 15.0)),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
