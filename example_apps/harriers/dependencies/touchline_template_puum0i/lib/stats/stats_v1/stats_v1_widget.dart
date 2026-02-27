import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import 'dart:async';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stats_v1_model.dart';
export 'stats_v1_model.dart';

/// The UI for use in Live Game Centres to display the stats for a match
class StatsV1Widget extends StatefulWidget {
  const StatsV1Widget({
    super.key,
    required this.matchObjectId,
    required this.homeImage,
    required this.awayImage,
    bool? manualOverride,
  }) : this.manualOverride = manualOverride ?? false;

  final String? matchObjectId;
  final String? homeImage;
  final String? awayImage;
  final bool manualOverride;

  @override
  State<StatsV1Widget> createState() => _StatsV1WidgetState();
}

class _StatsV1WidgetState extends State<StatsV1Widget> {
  late StatsV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatsV1Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.STATS = InstantTimer.periodic(
        duration: Duration(milliseconds: 8000),
        callback: (timer) async {
          safeSetState(() => _model.apiRequestCompleter = null);
        },
        startImmediately: true,
      );
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
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(BackendlessDatabaseGroup.getStatsForMatchCall.call(
              objectId: widget!.matchObjectId,
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
            )))
          .future,
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
        final stackGetStatsForMatchResponse = snapshot.data!;

        return Stack(
          children: [
            if ((stackGetStatsForMatchResponse.jsonBody
                        .toList()
                        .map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap)
                        .toList() as Iterable<StatsObjectStruct?>)
                    .withoutNulls
                    .length >
                0)
              Stack(
                children: [
                  if (!widget!.manualOverride)
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.49),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          safeSetState(() => _model.apiRequestCompleter = null);
                        },
                        child: ListView(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    widget!.homeImage!,
                                    width: 65.0,
                                    height: 65.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Text(
                                    'MATCH STATS',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.bebasNeue(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 35.0,
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
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    widget!.awayImage!,
                                    width: 65.0,
                                    height: 65.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                            if (((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.awayShotsOnTarget !=
                                    null) &&
                                ((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.homeShotsOnTarget !=
                                    null))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homeShotsOnTarget
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Shots on target',
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
                                            fontSize: 17.0,
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
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.awayShotsOnTarget
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.awayShotsOffTarget !=
                                    null) &&
                                ((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.homeShotsOffTarget !=
                                    null))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homeShotsOffTarget
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Shots off target',
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
                                            fontSize: 17.0,
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
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.awayShotsOffTarget
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.homeCorners !=
                                    null) &&
                                ((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.awayCorners !=
                                    null))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homeCorners
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Corners',
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
                                            fontSize: 17.0,
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
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.awayCorners
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (((stackGetStatsForMatchResponse.jsonBody.toList().map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap).toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.awayPossession !=
                                    null) &&
                                ((stackGetStatsForMatchResponse.jsonBody.toList().map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap).toList() as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.homePossession !=
                                    null) &&
                                ((stackGetStatsForMatchResponse.jsonBody.toList().map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap).toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.homePossession !=
                                    0) &&
                                ((stackGetStatsForMatchResponse.jsonBody.toList().map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap).toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.awayPossession !=
                                    0) &&
                                ((stackGetStatsForMatchResponse.jsonBody.toList().map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap).toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.homePossession !=
                                    50) &&
                                ((stackGetStatsForMatchResponse.jsonBody
                                            .toList()
                                            .map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap)
                                            .toList() as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.awayPossession !=
                                    50))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homePossession
                                            ?.toString(),
                                        '0',
                                      )}%',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Possession',
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
                                            fontSize: 17.0,
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
                                    Text(
                                      '${valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.awayPossession
                                            ?.toString(),
                                        '0',
                                      )}%',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.awayFouls !=
                                    null) &&
                                ((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.homeFouls !=
                                    null) &&
                                !(((stackGetStatsForMatchResponse.jsonBody.toList().map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap).toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homeFouls ==
                                        0) &&
                                    ((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap)
                                                .toList() as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homeFouls ==
                                        0)))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homeFouls
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Fouls',
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
                                            fontSize: 17.0,
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
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.awayFouls
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.awayAttacks !=
                                    null) &&
                                ((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.homeAttacks !=
                                    null) &&
                                !(((stackGetStatsForMatchResponse.jsonBody.toList().map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap).toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homeAttacks ==
                                        0) &&
                                    ((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap)
                                                .toList() as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.awayAttacks ==
                                        0)))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homeAttacks
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Attacks',
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
                                            fontSize: 17.0,
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
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.awayAttacks
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.awayDangerousAttacks !=
                                    null) &&
                                ((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.homeDangerousAttacks !=
                                    null) &&
                                !(((stackGetStatsForMatchResponse.jsonBody.toList().map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap).toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homeDangerousAttacks ==
                                        0) &&
                                    ((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap)
                                                .toList() as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.awayDangerousAttacks ==
                                        0)))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homeDangerousAttacks
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Dangerous Attacks',
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
                                            fontSize: 17.0,
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
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.awayDangerousAttacks
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.homePenaltiesWon !=
                                    null) &&
                                ((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.awayPenaltiesWon !=
                                    null))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homePenaltiesWon
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Penalties Won',
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
                                            fontSize: 17.0,
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
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.awayPenaltiesWon
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.awayYellows !=
                                    null) &&
                                ((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.homeYellows !=
                                    null))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homeYellows
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Yellow Cards',
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
                                            fontSize: 17.0,
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
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.awayYellows
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.awayReds !=
                                    null) &&
                                ((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.homeReds !=
                                    null))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homeReds
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Red Cards',
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
                                            fontSize: 17.0,
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
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.awayReds
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.awayInjuries !=
                                    null) &&
                                ((stackGetStatsForMatchResponse.jsonBody
                                                .toList()
                                                .map<StatsObjectStruct?>(
                                                    StatsObjectStruct.maybeFromMap)
                                                .toList()
                                            as Iterable<StatsObjectStruct?>)
                                        .withoutNulls
                                        ?.firstOrNull
                                        ?.homeInjuries !=
                                    null))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.homeInjuries
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Injuries',
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
                                            fontSize: 17.0,
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
                                    Text(
                                      valueOrDefault<String>(
                                        (stackGetStatsForMatchResponse.jsonBody
                                                    .toList()
                                                    .map<StatsObjectStruct?>(
                                                        StatsObjectStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                as Iterable<StatsObjectStruct?>)
                                            .withoutNulls
                                            ?.firstOrNull
                                            ?.awayInjuries
                                            ?.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 23.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                    ),
                  if (widget!.manualOverride)
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Icon(
                                Icons.bar_chart,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 60.0,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Text(
                                'STATS',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.bebasNeue(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 50.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Text(
                              'NOT AVAILABLE FOR\nTHIS MATCH',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            if ((stackGetStatsForMatchResponse.jsonBody
                        .toList()
                        .map<StatsObjectStruct?>(StatsObjectStruct.maybeFromMap)
                        .toList() as Iterable<StatsObjectStruct?>)
                    .withoutNulls
                    ?.length ==
                0)
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Icon(
                          Icons.bar_chart,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 60.0,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Text(
                          'STATS',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.bebasNeue(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 50.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Text(
                        'NOT AVAILABLE FOR\nTHIS MATCH',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
