import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'league_table_v3_model.dart';
export 'league_table_v3_model.dart';

class LeagueTableV3Widget extends StatefulWidget {
  const LeagueTableV3Widget({
    super.key,
    required this.teamName,
    Color? focusBgColor,
    Color? focusTextColor,
    String? focusTeamName,
  })  : this.focusBgColor = focusBgColor ?? const Color(0xFF155CFA),
        this.focusTextColor = focusTextColor ?? const Color(0xFFFAEB00),
        this.focusTeamName = focusTeamName ?? 'AFC Telford United';

  final String? teamName;
  final Color focusBgColor;
  final Color focusTextColor;
  final String focusTeamName;

  @override
  State<LeagueTableV3Widget> createState() => _LeagueTableV3WidgetState();
}

class _LeagueTableV3WidgetState extends State<LeagueTableV3Widget> {
  late LeagueTableV3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeagueTableV3Model());

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

    return ClipRRect(
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(2.0, 5.0, 5.0, 5.0),
          child: FutureBuilder<ApiCallResponse>(
            future: BackendlessDatabaseGroup.newLeagueTableDetailsOnlyCall.call(
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
              final containerNewLeagueTableDetailsOnlyResponse = snapshot.data!;

              return Material(
                color: Colors.transparent,
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(valueOrDefault<double>(
                      FFLibraryValues().BRBottomLeft?.toDouble(),
                      0.0,
                    )),
                    bottomRight: Radius.circular(valueOrDefault<double>(
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
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(valueOrDefault<double>(
                        FFLibraryValues().BRBottomLeft?.toDouble(),
                        0.0,
                      )),
                      bottomRight: Radius.circular(valueOrDefault<double>(
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
                  child: Builder(
                    builder: (context) {
                      final team = (containerNewLeagueTableDetailsOnlyResponse
                                  .jsonBody
                                  .toList()
                                  .map<LeagueTableItemStruct?>(
                                      LeagueTableItemStruct.maybeFromMap)
                                  .toList() as Iterable<LeagueTableItemStruct?>)
                              .withoutNulls
                              ?.toList() ??
                          [];

                      return ListView.separated(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          0.0,
                          0,
                          0.0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: team.length,
                        separatorBuilder: (_, __) => SizedBox(height: 0.0),
                        itemBuilder: (context, teamIndex) {
                          final teamItem = team[teamIndex];
                          return Visibility(
                            visible: valueOrDefault<bool>(
                              ((functions.getTermIndex(
                                              widget!.teamName!,
                                              (containerNewLeagueTableDetailsOnlyResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<LeagueTableItemStruct?>(
                                                              LeagueTableItemStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          LeagueTableItemStruct?>)
                                                  .withoutNulls
                                                  .map((e) => e.name)
                                                  .toList()) -
                                          teamIndex) <
                                      3) &&
                                  ((functions.getTermIndex(
                                              widget!.teamName!,
                                              (containerNewLeagueTableDetailsOnlyResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<LeagueTableItemStruct?>(
                                                              LeagueTableItemStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          LeagueTableItemStruct?>)
                                                  .withoutNulls
                                                  .map((e) => e.name)
                                                  .toList()) -
                                          teamIndex) >
                                      -3),
                              false,
                            ),
                            child: Container(
                              width: 100.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: teamItem.name == widget!.teamName
                                    ? widget!.focusBgColor
                                    : Color(0x0014181B),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.09,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                teamItem.rank.toString(),
                                                textAlign: TextAlign.center,
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
                                                      color: teamItem.name ==
                                                              widget!.teamName
                                                          ? widget!
                                                              .focusTextColor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 18.0,
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
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.09,
                                              decoration: BoxDecoration(),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  teamItem.imageURL,
                                                  width: 25.0,
                                                  height: 25.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  teamItem.name
                                                      .maybeHandleOverflow(
                                                    maxChars: 10,
                                                    replacement: '…',
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
                                                        color: teamItem.name ==
                                                                widget!.teamName
                                                            ? widget!
                                                                .focusTextColor
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                        fontSize: 15.0,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.07,
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              teamItem.played.toString(),
                                              textAlign: TextAlign.center,
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
                                                    color: teamItem.name ==
                                                            widget!.teamName
                                                        ? widget!.focusTextColor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    fontSize: 15.0,
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
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.07,
                                            decoration: BoxDecoration(),
                                            child: Text(
                                              teamItem.goalDiff.toString(),
                                              textAlign: TextAlign.center,
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
                                                    color: teamItem.name ==
                                                            widget!.teamName
                                                        ? widget!.focusTextColor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    fontSize: 15.0,
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
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.07,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 1.0, 0.0),
                                              child: Text(
                                                teamItem.points.toString(),
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: teamItem.name ==
                                                              widget!.teamName
                                                          ? widget!
                                                              .focusTextColor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 18.0)),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(width: 10.0))
                                      .addToStart(SizedBox(width: 10.0))
                                      .addToEnd(SizedBox(width: 10.0)),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
