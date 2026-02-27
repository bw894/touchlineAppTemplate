import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'wordpress_news_feed_v1_model.dart';
export 'wordpress_news_feed_v1_model.dart';

class WordpressNewsFeedV1Widget extends StatefulWidget {
  const WordpressNewsFeedV1Widget({
    super.key,
    required this.websiteNewsFeed,
  });

  /// Do not include https://
  final String? websiteNewsFeed;

  @override
  State<WordpressNewsFeedV1Widget> createState() =>
      _WordpressNewsFeedV1WidgetState();
}

class _WordpressNewsFeedV1WidgetState extends State<WordpressNewsFeedV1Widget> {
  late WordpressNewsFeedV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WordpressNewsFeedV1Model());

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
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder<ApiCallResponse>(
            future: WordpressWebsitesGroup.newsCall.call(
              websiteBaseUrl: widget!.websiteNewsFeed,
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
              final listViewNewsResponse = snapshot.data!;

              return Builder(
                builder: (context) {
                  final newsItem = ((listViewNewsResponse.jsonBody
                                  .toList()
                                  .map<NewsItemStruct?>(
                                      NewsItemStruct.maybeFromMap)
                                  .toList() as Iterable<NewsItemStruct?>)
                              .withoutNulls
                              ?.toList() ??
                          [])
                      .take(5)
                      .toList();

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: newsItem.length,
                    separatorBuilder: (_, __) => SizedBox(height: 10.0),
                    itemBuilder: (context, newsItemIndex) {
                      final newsItemItem = newsItem[newsItemIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await launchURL(newsItemItem.link);
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
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
                              topLeft: Radius.circular(valueOrDefault<double>(
                                FFLibraryValues().BRTopLeft?.toDouble(),
                                0.0,
                              )),
                              topRight: Radius.circular(valueOrDefault<double>(
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
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        height: 45.0,
                                        child: VerticalDivider(
                                          width: 2.0,
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 8.0, 8.0, 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                functions
                                                    .removeUnwantedCharacters(
                                                        newsItemItem
                                                            .title.rendered)
                                                    .maybeHandleOverflow(
                                                      maxChars: 75,
                                                      replacement: '…',
                                                    ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                functions
                                                    .removeUnwantedCharacters(
                                                        newsItemItem
                                                            .title.rendered)
                                                    .maybeHandleOverflow(
                                                      maxChars: 250,
                                                      replacement: '…',
                                                    ),
                                                style: FlutterFlowTheme.of(
                                                        context)
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                dateTimeFormat(
                                                    "yMMMd",
                                                    functions.parseDateTime(
                                                        newsItemItem.date)),
                                                style: FlutterFlowTheme.of(
                                                        context)
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
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
                                          ].divide(SizedBox(height: 1.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.angleRight,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 21.0,
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ].divide(SizedBox(height: 5.0)),
      ),
    );
  }
}
