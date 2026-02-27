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
import 'league_table_v1_model.dart';
export 'league_table_v1_model.dart';

class LeagueTableV1Widget extends StatefulWidget {
  const LeagueTableV1Widget({super.key});

  @override
  State<LeagueTableV1Widget> createState() => _LeagueTableV1WidgetState();
}

class _LeagueTableV1WidgetState extends State<LeagueTableV1Widget> {
  late LeagueTableV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeagueTableV1Model());

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 5.0, 5.0, 5.0),
              child: FutureBuilder<ApiCallResponse>(
                future:
                    BackendlessDatabaseGroup.newLeagueTableDetailsOnlyCall.call(
                  bLProjectId: FFLibraryValues().BLProjectId,
                  bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
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
                  final containerNewLeagueTableDetailsOnlyResponse =
                      snapshot.data!;

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
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Builder(
                          builder: (context) {
                            final team =
                                (containerNewLeagueTableDetailsOnlyResponse
                                                .jsonBody
                                                .toList()
                                                .map<LeagueTableItemStruct?>(
                                                    LeagueTableItemStruct
                                                        .maybeFromMap)
                                                .toList()
                                            as Iterable<LeagueTableItemStruct?>)
                                        .withoutNulls
                                        ?.toList() ??
                                    [];

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: team.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 0.0),
                              itemBuilder: (context, teamIndex) {
                                final teamItem = team[teamIndex];
                                return Visibility(
                                  visible: valueOrDefault<bool>(
                                    ((functions.getTermIndex(
                                                    'AFC Telford United',
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
                                                    'AFC Telford United',
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
                                    true,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        9.0, 0.0, 9.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              teamItem.rank.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                          ],
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.07,
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
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            teamItem.name,
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
                                                  color: teamItem.name ==
                                                          'AFC Telford United'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
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
                                        Container(
                                          width: 75.0,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                teamItem.played.toString(),
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
                                              Text(
                                                teamItem.goalDiff.toString(),
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
                                              Text(
                                                teamItem.points.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
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
                                            ].divide(SizedBox(width: 18.0)),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
