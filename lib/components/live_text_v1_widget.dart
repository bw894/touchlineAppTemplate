import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_list_widget.dart';
import '/components/single_live_text_item_blur_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'live_text_v1_model.dart';
export 'live_text_v1_model.dart';

class LiveTextV1Widget extends StatefulWidget {
  const LiveTextV1Widget({
    super.key,
    required this.matchObjectId,
  });

  final String? matchObjectId;

  @override
  State<LiveTextV1Widget> createState() => _LiveTextV1WidgetState();
}

class _LiveTextV1WidgetState extends State<LiveTextV1Widget> {
  late LiveTextV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveTextV1Model());

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
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
      child: FutureBuilder<ApiCallResponse>(
        future:
            BackendlessDatabaseGroup.getLiveTextItemsForRelatedMatchCall.call(
          matchObjectId: widget.matchObjectId,
          bLProjectId: FFLibraryValues().BLProjectId,
          bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
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
          final overallContainerGetLiveTextItemsForRelatedMatchResponse =
              snapshot.data!;

          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(),
            child: Builder(
              builder: (context) {
                final liveTextItem =
                    (overallContainerGetLiveTextItemsForRelatedMatchResponse
                                .jsonBody
                                .toList()
                                .map<LiveTextStruct?>(
                                    LiveTextStruct.maybeFromMap)
                                .toList() as Iterable<LiveTextStruct?>)
                            .withoutNulls
                            .where((e) => !(((e.description == 'null') ||
                                    (e.description == '')) &&
                                ((e.heading == 'null') ||
                                    (e.heading == ''))))
                            .toList()
                            .toList() ??
                        [];
                if (liveTextItem.isEmpty) {
                  return EmptyListWidget(
                    title: 'LIVE TEXT NOT AVAILABLE',
                    body: 'Check back soon',
                    icon: Icon(
                      Icons.list,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  );
                }

                return ListView.separated(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: liveTextItem.length,
                  separatorBuilder: (_, __) => SizedBox(height: 15.0),
                  itemBuilder: (context, liveTextItemIndex) {
                    final liveTextItemItem = liveTextItem[liveTextItemIndex];
                    return Builder(
                      builder: (context) => InkWell(
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
                                  child: SingleLiveTextItemBlurWidget(
                                    singleLiveTextItem: liveTextItemItem,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Divider(
                                height: 3.0,
                                thickness: 3.0,
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if ((liveTextItemItem.minuteIndicator !=
                                              '') &&
                                      (liveTextItemItem.minuteIndicator !=
                                          'null'))
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 3.0, 7.0, 6.0),
                                          child: Text(
                                            '${valueOrDefault<String>(
                                              liveTextItemItem.minuteIndicator,
                                              '00',
                                            )}\'',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 15.0,
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
                                      ),
                                    ),
                                  if ((liveTextItemItem.minuteIndicator ==
                                              '') ||
                                      (liveTextItemItem.minuteIndicator ==
                                          'null'))
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 3.0, 7.0, 6.0),
                                          child: Text(
                                            '${dateTimeFormat("jm", DateTime.fromMillisecondsSinceEpoch(valueOrDefault<int>(
                                                  liveTextItemItem.created,
                                                  0,
                                                )))} (UK)',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 15.0,
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
                                      ),
                                    ),
                                ],
                              ),
                              if ((liveTextItemItem.heading != '') &&
                                  (liveTextItemItem.type != 'GENERAL') &&
                                  (liveTextItemItem.heading != 'null'))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14.0, 3.0, 14.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if ((liveTextItemItem.imagePathUrl !=
                                                  '') &&
                                          (liveTextItemItem.imagePathUrl !=
                                              'null'))
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            liveTextItemItem.imagePathUrl,
                                            width: 38.0,
                                            height: 34.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      if ((liveTextItemItem.heading != '') &&
                                          (liveTextItemItem.heading != 'null'))
                                        Expanded(
                                          child: Text(
                                            valueOrDefault<String>(
                                              liveTextItemItem.heading,
                                              'TYPE',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    14.0, 6.0, 14.0, 6.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        liveTextItemItem.description,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w300,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 17.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              if ((liveTextItemItem.mainImageUrl != '') &&
                                  (liveTextItemItem.mainImageUrl != 'null'))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      14.0, 5.0, 14.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              liveTextItemItem.mainImageUrl,
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: liveTextItemItem.mainImageUrl,
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: liveTextItemItem.mainImageUrl,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          liveTextItemItem.mainImageUrl,
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
                            ].addToEnd(SizedBox(height: 14.0)),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
