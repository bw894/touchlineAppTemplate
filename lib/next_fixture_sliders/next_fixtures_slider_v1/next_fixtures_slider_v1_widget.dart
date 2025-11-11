import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'next_fixtures_slider_v1_model.dart';
export 'next_fixtures_slider_v1_model.dart';

class NextFixturesSliderV1Widget extends StatefulWidget {
  const NextFixturesSliderV1Widget({super.key});

  @override
  State<NextFixturesSliderV1Widget> createState() =>
      _NextFixturesSliderV1WidgetState();
}

class _NextFixturesSliderV1WidgetState
    extends State<NextFixturesSliderV1Widget> {
  late NextFixturesSliderV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NextFixturesSliderV1Model());

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
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: FutureBuilder<ApiCallResponse>(
                future:
                    BackendlessDatabaseGroup.nextFixtureSliderDetailsCall.call(
                  time: getCurrentTimestamp.millisecondsSinceEpoch,
                  teamObjectId: FFLibraryValues().focusTeamObjectId,
                  bLProjectId: FFLibraryValues().BLProjectId,
                  bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
                  headerName: 'Content-Type',
                  headerValue: 'application/json',
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
                  final rowNextFixtureSliderDetailsResponse = snapshot.data!;

                  return Builder(
                    builder: (context) {
                      final fixture = ((rowNextFixtureSliderDetailsResponse
                                          .jsonBody
                                          .toList()
                                          .map<BLESSfixtureStruct?>(
                                              BLESSfixtureStruct.maybeFromMap)
                                          .toList()
                                      as Iterable<BLESSfixtureStruct?>)
                                  .withoutNulls
                                  .toList() ??
                              [])
                          .take(6)
                          .toList();

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(fixture.length, (fixtureIndex) {
                            final fixtureItem = fixture[fixtureIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  2.0, 5.0, 5.0, 5.0),
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
                                    padding: EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            fixtureItem.homeBadge,
                                            width: 35.0,
                                            height: 35.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              dateTimeFormat(
                                                  "MMMd",
                                                  functions.convertFromMills(
                                                      fixtureItem.start)),
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
                                            Text(
                                              '${dateTimeFormat("jm", functions.convertFromMills(fixtureItem.start))} KO',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                        fontSize: 10.0,
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
                                          ],
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.network(
                                            fixtureItem.awayBadge,
                                            width: 35.0,
                                            height: 35.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
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
      ),
    );
  }
}
