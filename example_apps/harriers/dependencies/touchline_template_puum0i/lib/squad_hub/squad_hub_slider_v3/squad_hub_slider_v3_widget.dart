import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'squad_hub_slider_v3_model.dart';
export 'squad_hub_slider_v3_model.dart';

class SquadHubSliderV3Widget extends StatefulWidget {
  const SquadHubSliderV3Widget({
    super.key,
    required this.tapAction,
    String? sort,
  }) : this.sort = sort ?? 'number';

  final Future Function(String playerObjectId)? tapAction;
  final String sort;

  @override
  State<SquadHubSliderV3Widget> createState() => _SquadHubSliderV3WidgetState();
}

class _SquadHubSliderV3WidgetState extends State<SquadHubSliderV3Widget> {
  late SquadHubSliderV3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SquadHubSliderV3Model());

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: FutureBuilder<ApiCallResponse>(
              future: BackendlessDatabaseGroup.playerNewSquadHubCall.call(
                bLProjectId: FFLibraryValues().BLProjectId,
                bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
                sort: widget!.sort,
                headerName: FFAppState().userToken != null &&
                        FFAppState().userToken != ''
                    ? 'user-token'
                    : 'Content-Type',
                headerValue: FFAppState().userToken != null &&
                        FFAppState().userToken != ''
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
                final rowPlayerNewSquadHubResponse = snapshot.data!;

                return Builder(
                  builder: (context) {
                    final player = (rowPlayerNewSquadHubResponse.jsonBody
                                .toList()
                                .map<PlayerStruct?>(PlayerStruct.maybeFromMap)
                                .toList() as Iterable<PlayerStruct?>)
                            .withoutNulls
                            ?.toList() ??
                        [];

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(player.length, (playerIndex) {
                          final playerItem = player[playerIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await widget.tapAction?.call(
                                  playerItem.objectId,
                                );
                              },
                              child: Material(
                                color: Colors.transparent,
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: Container(
                                    width: 125.0,
                                    height: 150.0,
                                    child: Stack(
                                      alignment:
                                          AlignmentDirectional(-1.0, 1.0),
                                      children: [
                                        if (playerItem.number != null)
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 12.0, 0.0, 0.0),
                                              child: Text(
                                                playerItem.number.toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.bebasNeue(
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
                                                      fontSize: 40.0,
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
                                                      lineHeight: 1.0,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ClipRRect(
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
                                          child: Container(
                                            width: 125.0,
                                            height: 150.0,
                                            decoration: BoxDecoration(
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
                                            child: Opacity(
                                              opacity: 0.65,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  child: Image.network(
                                                    playerItem.playerPictureurl,
                                                    width: 125.0,
                                                    height: 150.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Divider(
                                              height: 2.0,
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      playerItem.posAbr,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .bebasNeue(
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
                                                                    .secondaryBackground,
                                                                fontSize: 32.0,
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
                                                    SizedBox(
                                                      height: 20.0,
                                                      child: VerticalDivider(
                                                        thickness: 2.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Text(
                                                          playerItem.playerName,
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
                                                                    .secondaryBackground,
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
                                                    ),
                                                  ],
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
                        })
                            .divide(SizedBox(width: 15.0))
                            .addToStart(SizedBox(width: 20.0))
                            .addToEnd(SizedBox(width: 20.0)),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
