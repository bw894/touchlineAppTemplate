import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'todays_games_model.dart';
export 'todays_games_model.dart';

class TodaysGamesWidget extends StatefulWidget {
  const TodaysGamesWidget({
    super.key,
    required this.otherGames,
  });

  final List<SmFixtureStruct>? otherGames;

  @override
  State<TodaysGamesWidget> createState() => _TodaysGamesWidgetState();
}

class _TodaysGamesWidgetState extends State<TodaysGamesWidget> {
  late TodaysGamesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TodaysGamesModel());

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
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        child: Builder(
          builder: (context) {
            final otherGames = widget!.otherGames!.toList();

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(otherGames.length, (otherGamesIndex) {
                final otherGamesItem = otherGames[otherGamesIndex];
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.18,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      otherGamesItem.participants
                                          .where(
                                              (e) => e.meta.location == 'home')
                                          .toList()
                                          .firstOrNull
                                          ?.name,
                                      'Home',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    otherGamesItem.participants
                                        .where((e) => e.meta.location == 'home')
                                        .toList()
                                        .firstOrNull
                                        ?.imagePath,
                                    'Home',
                                  ),
                                  width: 25.0,
                                  height: 25.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 4.0, 8.0, 4.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              otherGamesItem.scores
                                                  .where((e) =>
                                                      (e.description ==
                                                          'CURRENT') &&
                                                      (e.score.participant ==
                                                          'home'))
                                                  .toList()
                                                  .firstOrNull
                                                  ?.score
                                                  ?.goals
                                                  ?.toString(),
                                              '0',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 4.0, 4.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              otherGamesItem.scores
                                                  .where((e) =>
                                                      (e.description ==
                                                          'CURRENT') &&
                                                      (e.score.participant ==
                                                          'away'))
                                                  .toList()
                                                  .firstOrNull
                                                  ?.score
                                                  ?.goals
                                                  ?.toString(),
                                              '0',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  fontSize: 17.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    otherGamesItem.participants
                                        .where((e) => e.meta.location == 'away')
                                        .toList()
                                        .firstOrNull
                                        ?.imagePath,
                                    'Away',
                                  ),
                                  width: 25.0,
                                  height: 25.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: ClipRRect(
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.18,
                                decoration: BoxDecoration(),
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      otherGamesItem.participants
                                          .where(
                                              (e) => e.meta.location == 'away')
                                          .toList()
                                          .firstOrNull
                                          ?.name,
                                      'Away',
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      color: Color(0xF0C6C7C9),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                );
              })
                  .divide(SizedBox(height: 12.0))
                  .addToStart(SizedBox(height: 12.0))
                  .addToEnd(SizedBox(height: 12.0)),
            );
          },
        ),
      ),
    );
  }
}
