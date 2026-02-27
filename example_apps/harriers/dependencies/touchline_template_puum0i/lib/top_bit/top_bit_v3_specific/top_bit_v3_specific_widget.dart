import '/backend/api_requests/api_calls.dart';
import '/components/indiv_penalty_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:math';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'top_bit_v3_specific_model.dart';
export 'top_bit_v3_specific_model.dart';

class TopBitV3SpecificWidget extends StatefulWidget {
  const TopBitV3SpecificWidget({
    super.key,
    required this.bgImage,
    required this.teamAbr,
    required this.ticketsAction,
    required this.matchObjectId,
    required this.predictorAction,
    Color? onPrimary,
    required this.pollAction,
    this.altTimeColours,
  }) : this.onPrimary = onPrimary ?? Colors.white;

  final String? bgImage;
  final String? teamAbr;
  final Future Function()? ticketsAction;
  final String? matchObjectId;
  final Future Function()? predictorAction;

  /// for poll text
  final Color onPrimary;

  final Future Function(

      /// objectId of the poll in question
      String pollObjectId)? pollAction;
  final Color? altTimeColours;

  @override
  State<TopBitV3SpecificWidget> createState() => _TopBitV3SpecificWidgetState();
}

class _TopBitV3SpecificWidgetState extends State<TopBitV3SpecificWidget>
    with TickerProviderStateMixin {
  late TopBitV3SpecificModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopBitV3SpecificModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.fixt = await BackendlessDatabaseGroup.upcomingOneFixturesCall.call(
        time: getCurrentTimestamp.millisecondsSinceEpoch,
        bLProjectId: FFLibraryValues().BLProjectId,
        bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
        teamObjectId: FFLibraryValues().focusTeamObjectId,
      );

      if (getCurrentTimestamp.millisecondsSinceEpoch >
          ((_model.fixt?.jsonBody ?? '')
                  .toList()
                  .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
                  .toList() as Iterable<BLESSfixtureStruct?>)
              .withoutNulls
              .firstOrNull!
              .start) {
        _model.refreshStats = InstantTimer.periodic(
          duration: Duration(milliseconds: 25000),
          callback: (timer) async {
            safeSetState(() => _model.apiRequestCompleter = null);
            await _model.waitForApiRequestCompleted();
          },
          startImmediately: true,
        );
      }
    });

    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 330.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: Offset(0.0, 25.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 340.0.ms,
            begin: Offset(-64.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 225.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 290.0.ms,
            duration: 630.0.ms,
            begin: Offset(0.75, 0.75),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 330.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 290.0.ms,
            duration: 630.0.ms,
            begin: Offset(0.75, 0.75),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 330.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 290.0.ms,
            duration: 630.0.ms,
            begin: Offset(0.75, 0.75),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 330.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 290.0.ms,
            duration: 630.0.ms,
            begin: Offset(0.75, 0.75),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 330.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 760.0.ms,
            duration: 340.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 760.0.ms,
            duration: 340.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 340.0.ms,
            begin: Offset(64.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 225.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On component dispose action.
    () async {
      if (_model.refreshStats.isActive) {
        _model.refreshStats?.cancel();
      }
    }();

    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(BackendlessDatabaseGroup
                .getSpecificFixtureTopLevelDetailsCall
                .call(
              objectId: widget!.matchObjectId,
              bLProjectId: FFLibraryValues().BLProjectId,
              bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
              headerName: 'Content-Type',
              headerValue: 'application/json',
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
        final masterContainerGetSpecificFixtureTopLevelDetailsResponse =
            snapshot.data!;

        return Container(
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              if (valueOrDefault<bool>(
                widget!.matchObjectId != null && widget!.matchObjectId != '',
                true,
              ))
                FutureBuilder<ApiCallResponse>(
                  future: BackendlessDatabaseGroup
                      .checkForPollsWithRelatedMatchesCall
                      .call(
                    currentTime: getCurrentTimestamp.millisecondsSinceEpoch,
                    matchObjectId: widget!.matchObjectId,
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
                    final containerCheckForPollsWithRelatedMatchesResponse =
                        snapshot.data!;

                    return ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(valueOrDefault<double>(
                          FFLibraryValues().BRBottomLeft?.toDouble(),
                          0.0,
                        )),
                        bottomRight: Radius.circular(valueOrDefault<double>(
                          FFLibraryValues().BRBottomRight?.toDouble(),
                          0.0,
                        )),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              BLESSfixtureStruct.maybeFromMap(
                                                  masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                      .jsonBody)
                                              ?.matchBackground !=
                                          null &&
                                      BLESSfixtureStruct.maybeFromMap(
                                                  masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                      .jsonBody)
                                              ?.matchBackground !=
                                          ''
                                  ? BLESSfixtureStruct.maybeFromMap(
                                          masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                              .jsonBody)!
                                      .matchBackground
                                  : widget!.bgImage!,
                            ).image,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(valueOrDefault<double>(
                              FFLibraryValues().BRBottomLeft?.toDouble(),
                              0.0,
                            )),
                            bottomRight: Radius.circular(valueOrDefault<double>(
                              FFLibraryValues().BRBottomRight?.toDouble(),
                              0.0,
                            )),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0x3A1E1E1E),
                                Colors.black,
                                Colors.black
                              ],
                              stops: [0.0, 0.8, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 48.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (!BLESSfixtureStruct
                                                              .maybeFromMap(
                                                                  masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                      .jsonBody)!
                                                          .scoreOnlyFT)
                                                        Text(
                                                          () {
                                                            if (getCurrentTimestamp
                                                                    .millisecondsSinceEpoch >
                                                                BLESSfixtureStruct.maybeFromMap(
                                                                        masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)!
                                                                    .end) {
                                                              return 'FULL TIME';
                                                            } else if (getCurrentTimestamp
                                                                    .millisecondsSinceEpoch <
                                                                BLESSfixtureStruct.maybeFromMap(
                                                                        masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)!
                                                                    .start) {
                                                              return 'UPCOMING FIXTURE';
                                                            } else {
                                                              return 'LIVE NOW';
                                                            }
                                                          }(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            letterSpacing: 2.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                            shadows: [
                                                              Shadow(
                                                                color: Color(
                                                                    0x6818191A),
                                                                offset: Offset(
                                                                    2.0, 2.0),
                                                                blurRadius: 5.0,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      if (BLESSfixtureStruct
                                                                  .maybeFromMap(
                                                                      masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                          .jsonBody)
                                                              ?.scoreOnlyFT ??
                                                          true)
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          1.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .info_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 17.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              'SCORE ONLY AT FT',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    1.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                shadows: [
                                                                  Shadow(
                                                                    color: Color(
                                                                        0x6818191A),
                                                                    offset:
                                                                        Offset(
                                                                            2.0,
                                                                            2.0),
                                                                    blurRadius:
                                                                        5.0,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 5.0)),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.31,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    _model.temp = (String
                                                                        var1) {
                                                                      return var1
                                                                          .split(
                                                                              '');
                                                                    }(valueOrDefault<
                                                                        String>(
                                                                      BLESSfixtureStruct.maybeFromMap(
                                                                              masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                          ?.homePenaltyBreakdown,
                                                                      'MMMMM',
                                                                    )).toList().cast<
                                                                        String>();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child: Image
                                                                        .network(
                                                                      () {
                                                                        if (BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.homeAbr ==
                                                                            'TEL') {
                                                                          return 'https://api.touchlineclub.com:7500/6B1865C5-E9FE-2985-FF3A-58F30C754F00/C7DEECF4-82EB-4F42-86BD-49ACA7E19114/files/buckWhiteFull.png';
                                                                        } else if ((BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.homeTeamName ==
                                                                                'Kidderminster Harriers') ||
                                                                            (BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.homeTeamName ==
                                                                                'Harriers')) {
                                                                          return 'https://api.touchlineclub.com:7500/6D654B32-2E5D-4E11-98F9-BACF8B9930B5/C7DEECF4-82EB-4F42-86BD-49ACA7E19114/files/Harriers%20Logo%20PNG%20White.png';
                                                                        } else {
                                                                          return BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)!
                                                                              .homeBadge;
                                                                        }
                                                                      }(),
                                                                      width:
                                                                          75.0,
                                                                      height:
                                                                          90.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    BLESSfixtureStruct.maybeFromMap(
                                                                            masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                        ?.homeTeamName,
                                                                    'Home',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                BLESSfixtureStruct.maybeFromMap(
                                                                        masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)
                                                                    ?.penaltyShootout,
                                                                false,
                                                              ))
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final homePenalty =
                                                                        ((String
                                                                            var1) {
                                                                      return var1
                                                                          .split(
                                                                              '');
                                                                    }(valueOrDefault<
                                                                            String>(
                                                                      BLESSfixtureStruct.maybeFromMap(
                                                                              masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                          ?.homePenaltyBreakdown,
                                                                      'MMMMM',
                                                                    ))).toList();

                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: List.generate(
                                                                          homePenalty
                                                                              .length,
                                                                          (homePenaltyIndex) {
                                                                        final homePenaltyItem =
                                                                            homePenalty[homePenaltyIndex];
                                                                        return wrapWithModel(
                                                                          model: _model
                                                                              .indivPenaltyModels1
                                                                              .getModel(
                                                                            homePenaltyIndex.toString(),
                                                                            homePenaltyIndex,
                                                                          ),
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          updateOnChange:
                                                                              true,
                                                                          child:
                                                                              IndivPenaltyWidget(
                                                                            key:
                                                                                Key(
                                                                              'Key647_${homePenaltyIndex.toString()}',
                                                                            ),
                                                                            inputLetter:
                                                                                homePenaltyItem,
                                                                          ),
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                            ],
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'columnOnPageLoadAnimation2']!),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)
                                                                        ?.leagueBadgeUrl !=
                                                                    null &&
                                                                BLESSfixtureStruct.maybeFromMap(
                                                                            masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                        ?.leagueBadgeUrl !=
                                                                    '')
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                  child: Image
                                                                      .network(
                                                                    BLESSfixtureStruct.maybeFromMap(
                                                                            masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)!
                                                                        .leagueBadgeUrl,
                                                                    height:
                                                                        21.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                            if (BLESSfixtureStruct.maybeFromMap(
                                                                        masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)
                                                                    ?.isPostponed ??
                                                                true)
                                                              Text(
                                                                'P-P',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .rubik(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          26.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          1.4,
                                                                    ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'textOnPageLoadAnimation1']!),
                                                            if ((getCurrentTimestamp
                                                                        .millisecondsSinceEpoch >
                                                                    BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)!
                                                                        .start) &&
                                                                !BLESSfixtureStruct.maybeFromMap(
                                                                        masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)!
                                                                    .isPostponed)
                                                              Text(
                                                                '${BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.homeGoals?.toString()} - ${BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.awayGoals?.toString()}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .rubik(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          26.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'textOnPageLoadAnimation2']!),
                                                            if ((getCurrentTimestamp
                                                                        .millisecondsSinceEpoch >
                                                                    BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)!
                                                                        .start) &&
                                                                !BLESSfixtureStruct.maybeFromMap(
                                                                        masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)!
                                                                    .isPostponed &&
                                                                valueOrDefault<
                                                                    bool>(
                                                                  BLESSfixtureStruct.maybeFromMap(
                                                                          masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                              .jsonBody)
                                                                      ?.penaltyShootout,
                                                                  false,
                                                                ))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '(${valueOrDefault<String>(
                                                                    BLESSfixtureStruct.maybeFromMap(
                                                                            masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                        ?.homePenalties
                                                                        ?.toString(),
                                                                    '0',
                                                                  )}) - (${valueOrDefault<String>(
                                                                    BLESSfixtureStruct.maybeFromMap(
                                                                            masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                        ?.awayPenalties
                                                                        ?.toString(),
                                                                    '0',
                                                                  )})',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .rubik(
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'textOnPageLoadAnimation3']!),
                                                              ),
                                                            if (getCurrentTimestamp
                                                                    .millisecondsSinceEpoch <
                                                                BLESSfixtureStruct.maybeFromMap(
                                                                        masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)!
                                                                    .start)
                                                              Text(
                                                                dateTimeFormat(
                                                                    "Hm",
                                                                    functions.convertFromMills(
                                                                        BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)!
                                                                            .start)),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .rubik(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          26.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          1.4,
                                                                    ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'textOnPageLoadAnimation4']!),
                                                            if (getCurrentTimestamp
                                                                    .millisecondsSinceEpoch <
                                                                BLESSfixtureStruct.maybeFromMap(
                                                                        masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)!
                                                                    .start)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            46.0),
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                      "MMMEd",
                                                                      functions.convertFromMills(
                                                                          BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)!
                                                                              .start)),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .rubik(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Color(
                                                                            0xFFD9D9D9),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                        lineHeight:
                                                                            1.4,
                                                                      ),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'textOnPageLoadAnimation5']!),
                                                              ),
                                                            if ((getCurrentTimestamp
                                                                        .millisecondsSinceEpoch >
                                                                    BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)!
                                                                        .start) &&
                                                                !BLESSfixtureStruct.maybeFromMap(
                                                                        masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)!
                                                                    .isPostponed)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    (String
                                                                        display) {
                                                                      return display.length <=
                                                                              2
                                                                          ? 25.0
                                                                          : display.length == 3
                                                                              ? 40.0
                                                                              : display.length <= 7
                                                                                  ? 50.0
                                                                                  : 70.0;
                                                                    }(valueOrDefault<
                                                                        String>(
                                                                      BLESSfixtureStruct.maybeFromMap(
                                                                              masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                          ?.outputStatus,
                                                                      'Not Started',
                                                                    )),
                                                                    70.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            6.0,
                                                                            4.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.outputStatus,
                                                                            'Not Started',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: valueOrDefault<double>(
                                                                                  (String display) {
                                                                                    return display.length > 7 ? 11.0 : 15.0;
                                                                                  }(valueOrDefault<String>(
                                                                                    BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.outputStatus,
                                                                                    'Not Started',
                                                                                  )),
                                                                                  11.0,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      if ((BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)!.end >
                                                                              getCurrentTimestamp
                                                                                  .millisecondsSinceEpoch) &&
                                                                          (BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)!.start <
                                                                              getCurrentTimestamp.millisecondsSinceEpoch))
                                                                        Lottie.asset(
                                                                          'packages/touchline_template_puum0i/assets/jsons/LiveAnimationWhite.json',
                                                                          width:
                                                                              70.0,
                                                                          height:
                                                                              2.0,
                                                                          fit: BoxFit
                                                                              .fitWidth,
                                                                          animate:
                                                                              true,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation']!),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.31,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child: Image
                                                                        .network(
                                                                      () {
                                                                        if (BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.awayAbr ==
                                                                            'TEL') {
                                                                          return 'https://api.touchlineclub.com:7500/6B1865C5-E9FE-2985-FF3A-58F30C754F00/C7DEECF4-82EB-4F42-86BD-49ACA7E19114/files/buckWhiteFull.png';
                                                                        } else if ((BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.awayTeamName ==
                                                                                'Kidderminster Harriers') ||
                                                                            (BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.awayTeamName ==
                                                                                'Harriers')) {
                                                                          return 'https://api.touchlineclub.com:7500/6D654B32-2E5D-4E11-98F9-BACF8B9930B5/C7DEECF4-82EB-4F42-86BD-49ACA7E19114/files/Harriers%20Logo%20PNG%20White.png';
                                                                        } else {
                                                                          return BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)!
                                                                              .awayBadge;
                                                                        }
                                                                      }(),
                                                                      width:
                                                                          75.0,
                                                                      height:
                                                                          90.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    BLESSfixtureStruct.maybeFromMap(
                                                                            masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                        ?.awayTeamName,
                                                                    'Away',
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                BLESSfixtureStruct.maybeFromMap(
                                                                        masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                            .jsonBody)
                                                                    ?.penaltyShootout,
                                                                false,
                                                              ))
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final awayPenalty =
                                                                        ((String
                                                                            var1) {
                                                                      return var1
                                                                          .split(
                                                                              '');
                                                                    }(valueOrDefault<
                                                                            String>(
                                                                      BLESSfixtureStruct.maybeFromMap(
                                                                              masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                          ?.awayPenaltyBreakdown,
                                                                      'MMMMM',
                                                                    ))).toList();

                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: List.generate(
                                                                          awayPenalty
                                                                              .length,
                                                                          (awayPenaltyIndex) {
                                                                        final awayPenaltyItem =
                                                                            awayPenalty[awayPenaltyIndex];
                                                                        return wrapWithModel(
                                                                          model: _model
                                                                              .indivPenaltyModels2
                                                                              .getModel(
                                                                            awayPenaltyIndex.toString(),
                                                                            awayPenaltyIndex,
                                                                          ),
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          updateOnChange:
                                                                              true,
                                                                          child:
                                                                              IndivPenaltyWidget(
                                                                            key:
                                                                                Key(
                                                                              'Keyddr_${awayPenaltyIndex.toString()}',
                                                                            ),
                                                                            inputLetter:
                                                                                awayPenaltyItem,
                                                                          ),
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
                                                                ),
                                                            ],
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'columnOnPageLoadAnimation3']!),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].addToStart(SizedBox(height: 65.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            22.0, 8.0, 22.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Builder(
                                                  builder: (context) {
                                                    final homeGoals = functions
                                                            .formatGoalscorers(
                                                                BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                    ?.eventTimeline
                                                                    ?.where((e) =>
                                                                        (e.participantId == BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.homeTeamId) &&
                                                                        (e.typeId ==
                                                                            14))
                                                                    .toList()
                                                                    ?.map((e) => e
                                                                        .playerName)
                                                                    .toList()
                                                                    ?.toList(),
                                                                functions
                                                                    .minuteFormat(
                                                                        BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                            ?.eventTimeline
                                                                            ?.where((e) =>
                                                                                (e.participantId == BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.homeTeamId) &&
                                                                                (e.typeId ==
                                                                                    14))
                                                                            .toList()
                                                                            ?.map((e) => e
                                                                                .minute)
                                                                            .toList()
                                                                            ?.toList(),
                                                                        BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                            ?.eventTimeline
                                                                            ?.where((e) => (e.participantId == BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.homeTeamId) && (e.typeId == 14))
                                                                            .toList()
                                                                            ?.map((e) => e.extraMinute)
                                                                            .toList()
                                                                            ?.toList())
                                                                    ?.toList())
                                                            ?.toList() ??
                                                        [];

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          homeGoals.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 5.0),
                                                      itemBuilder: (context,
                                                          homeGoalsIndex) {
                                                        final homeGoalsItem =
                                                            homeGoals[
                                                                homeGoalsIndex];
                                                        return Text(
                                                          homeGoalsItem,
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
                                                                fontSize: 13.0,
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
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            if (BLESSfixtureStruct.maybeFromMap(
                                                        masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                            .jsonBody)!
                                                    .eventTimeline
                                                    .where(
                                                        (e) => e.typeId == 14)
                                                    .toList()
                                                    .length >
                                                0)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Icon(
                                                    Icons.sports_soccer_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 14.0,
                                                  ),
                                                ),
                                              ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Builder(
                                                  builder: (context) {
                                                    final awayGoals = functions
                                                            .formatGoalscorers(
                                                                BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                    ?.eventTimeline
                                                                    ?.where((e) =>
                                                                        (e.participantId == BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.awayTeamId) &&
                                                                        (e.typeId ==
                                                                            14))
                                                                    .toList()
                                                                    ?.map((e) => e
                                                                        .playerName)
                                                                    .toList()
                                                                    ?.toList(),
                                                                functions
                                                                    .minuteFormat(
                                                                        BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                            ?.eventTimeline
                                                                            ?.where((e) =>
                                                                                (e.participantId == BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.awayTeamId) &&
                                                                                (e.typeId ==
                                                                                    14))
                                                                            .toList()
                                                                            ?.map((e) => e
                                                                                .minute)
                                                                            .toList()
                                                                            ?.toList(),
                                                                        BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)
                                                                            ?.eventTimeline
                                                                            ?.where((e) => (e.participantId == BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.awayTeamId) && (e.typeId == 14))
                                                                            .toList()
                                                                            ?.map((e) => e.extraMinute)
                                                                            .toList()
                                                                            ?.toList())
                                                                    ?.toList())
                                                            ?.toList() ??
                                                        [];

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          awayGoals.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 5.0),
                                                      itemBuilder: (context,
                                                          awayGoalsIndex) {
                                                        final awayGoalsItem =
                                                            awayGoals[
                                                                awayGoalsIndex];
                                                        return Text(
                                                          awayGoalsItem,
                                                          textAlign:
                                                              TextAlign.end,
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
                                                                fontSize: 13.0,
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
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if ((getCurrentTimestamp
                                                  .millisecondsSinceEpoch <
                                              BLESSfixtureStruct.maybeFromMap(
                                                      masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                          .jsonBody)!
                                                  .start) &&
                                          !BLESSfixtureStruct.maybeFromMap(
                                                  masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                      .jsonBody)!
                                              .isPostponed)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  56.0, 12.0, 56.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  AnimatedDefaultTextStyle(
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 28.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                    duration: Duration(
                                                        milliseconds: 600),
                                                    curve: Curves.easeInOut,
                                                    child: Text(
                                                      key: ValueKey(
                                                          getCurrentTimestamp
                                                              .secondsSinceEpoch
                                                              .toString()),
                                                      formatNumber(
                                                        (((BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)!
                                                                            .start /
                                                                        1000) -
                                                                    getCurrentTimestamp
                                                                        .secondsSinceEpoch) /
                                                                86400)
                                                            .floor(),
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '00',
                                                        locale: '',
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'D',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: valueOrDefault<
                                                              Color>(
                                                            widget!.altTimeColours != null
                                                                ? widget!
                                                                    .altTimeColours
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                          fontSize: 16.0,
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
                                                ].divide(SizedBox(width: 3.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    ':',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .bebasNeue(
                                                            fontWeight:
                                                                FontWeight.w100,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 3.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  AnimatedDefaultTextStyle(
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 28.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                    duration: Duration(
                                                        milliseconds: 600),
                                                    curve: Curves.easeInOut,
                                                    child: Text(
                                                      key: ValueKey(
                                                          getCurrentTimestamp
                                                              .secondsSinceEpoch
                                                              .toString()),
                                                      formatNumber(
                                                        ((((BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)!.start /
                                                                            1000) -
                                                                        getCurrentTimestamp
                                                                            .secondsSinceEpoch) /
                                                                    3600) %
                                                                24)
                                                            .floor(),
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '00',
                                                        locale: '',
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'H',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                          color: valueOrDefault<
                                                              Color>(
                                                            widget!.altTimeColours != null
                                                                ? widget!
                                                                    .altTimeColours
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                          fontSize: 16.0,
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
                                                ].divide(SizedBox(width: 3.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    ':',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .bebasNeue(
                                                            fontWeight:
                                                                FontWeight.w100,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 3.0)),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  AnimatedDefaultTextStyle(
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.rubik(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          fontSize: 28.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                    duration: Duration(
                                                        milliseconds: 600),
                                                    curve: Curves.easeInOut,
                                                    child: Text(
                                                      key: ValueKey(
                                                          getCurrentTimestamp
                                                              .secondsSinceEpoch
                                                              .toString()),
                                                      formatNumber(
                                                        (((BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)!
                                                                            .start /
                                                                        1000) -
                                                                    getCurrentTimestamp
                                                                        .secondsSinceEpoch) /
                                                                60) %
                                                            60,
                                                        formatType:
                                                            FormatType.custom,
                                                        format: '00',
                                                        locale: '',
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'M',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                          color: valueOrDefault<
                                                              Color>(
                                                            widget!.altTimeColours != null
                                                                ? widget!
                                                                    .altTimeColours
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                          fontSize: 16.0,
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
                                                ].divide(SizedBox(width: 3.0)),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      if ((BLESSfixtureStruct.maybeFromMap(
                                                      masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                          .jsonBody)
                                                  ?.overallAttendance !=
                                              null) &&
                                          (BLESSfixtureStruct.maybeFromMap(
                                                      masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                          .jsonBody)
                                                  ?.overallAttendance !=
                                              0))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            (BLESSfixtureStruct.maybeFromMap(
                                                                masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                    .jsonBody)
                                                            ?.awayAttendance !=
                                                        null) &&
                                                    (BLESSfixtureStruct.maybeFromMap(
                                                                masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                    .jsonBody)
                                                            ?.awayAttendance !=
                                                        0)
                                                ? 'Attendance ${BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.overallAttendance?.toString()} (${BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.awayAttendance?.toString()} Away)'
                                                : 'Attendance ${BLESSfixtureStruct.maybeFromMap(masterContainerGetSpecificFixtureTopLevelDetailsResponse.jsonBody)?.overallAttendance?.toString()}',
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
                                                      .secondaryBackground,
                                                  fontSize: 15.0,
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
                                      if (valueOrDefault<bool>(
                                        (BLESSfixtureStruct.maybeFromMap(
                                                            masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                .jsonBody)
                                                        ?.location !=
                                                    null &&
                                                BLESSfixtureStruct.maybeFromMap(
                                                            masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                .jsonBody)
                                                        ?.location !=
                                                    '') &&
                                            !BLESSfixtureStruct.maybeFromMap(
                                                    masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                        .jsonBody)!
                                                .penaltyShootout,
                                        true,
                                      ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 0.0, 5.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              BLESSfixtureStruct.maybeFromMap(
                                                      masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                          .jsonBody)
                                                  ?.location,
                                              'Stadium Name',
                                            ),
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
                                                      .secondaryBackground,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.5,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      if ((BLESSfixtureStruct.maybeFromMap(
                                                          masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                              .jsonBody)
                                                      ?.penaltiesText !=
                                                  null &&
                                              BLESSfixtureStruct.maybeFromMap(
                                                          masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                              .jsonBody)
                                                      ?.penaltiesText !=
                                                  '') &&
                                          valueOrDefault<bool>(
                                            BLESSfixtureStruct.maybeFromMap(
                                                    masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                        .jsonBody)
                                                ?.penaltyShootout,
                                            false,
                                          ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 5.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              BLESSfixtureStruct.maybeFromMap(
                                                      masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                          .jsonBody)
                                                  ?.penaltiesText,
                                              'Home won 4-3 on penalties',
                                            ),
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
                                                      .secondaryBackground,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.5,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            22.0, 0.0, 22.0, 0.0),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible: (getCurrentTimestamp
                                                        .millisecondsSinceEpoch <
                                                    BLESSfixtureStruct.maybeFromMap(
                                                            masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                .jsonBody)!
                                                        .start) &&
                                                !BLESSfixtureStruct.maybeFromMap(
                                                        masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                            .jsonBody)!
                                                    .isPostponed,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (valueOrDefault<bool>(
                                                    BLESSfixtureStruct.maybeFromMap(
                                                            masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                .jsonBody)
                                                        ?.predictor,
                                                    true,
                                                  ))
                                                    Expanded(
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          await widget
                                                              .predictorAction
                                                              ?.call();
                                                        },
                                                        text: 'Play Predictor',
                                                        icon: Icon(
                                                          Icons
                                                              .sports_soccer_outlined,
                                                          size: 16.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 35.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          color:
                                                              Color(0x00FF1D3B),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 2.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              FFLibraryValues()
                                                                  .BRBottomLeft
                                                                  ?.toDouble(),
                                                              0.0,
                                                            )),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              FFLibraryValues()
                                                                  .BRBottomRight
                                                                  ?.toDouble(),
                                                              0.0,
                                                            )),
                                                            topLeft:
                                                                Radius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              FFLibraryValues()
                                                                  .BRTopLeft
                                                                  ?.toDouble(),
                                                              0.0,
                                                            )),
                                                            topRight:
                                                                Radius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              FFLibraryValues()
                                                                  .BRTopRight
                                                                  ?.toDouble(),
                                                              0.0,
                                                            )),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if ((BLESSfixtureStruct.maybeFromMap(
                                                                  masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                      .jsonBody)
                                                              ?.homeAbr ==
                                                          widget!.teamAbr) &&
                                                      valueOrDefault<bool>(
                                                        BLESSfixtureStruct
                                                                .maybeFromMap(
                                                                    masterContainerGetSpecificFixtureTopLevelDetailsResponse
                                                                        .jsonBody)
                                                            ?.tickets,
                                                        true,
                                                      ))
                                                    Expanded(
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          await widget
                                                              .ticketsAction
                                                              ?.call();
                                                        },
                                                        text: 'Get Tickets',
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .ticketAlt,
                                                          size: 16.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 35.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 2.0,
                                                          borderSide:
                                                              BorderSide(
                                                            width: 0.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              FFLibraryValues()
                                                                  .BRBottomLeft
                                                                  ?.toDouble(),
                                                              0.0,
                                                            )),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              FFLibraryValues()
                                                                  .BRBottomRight
                                                                  ?.toDouble(),
                                                              0.0,
                                                            )),
                                                            topLeft:
                                                                Radius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              FFLibraryValues()
                                                                  .BRTopLeft
                                                                  ?.toDouble(),
                                                              0.0,
                                                            )),
                                                            topRight:
                                                                Radius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              FFLibraryValues()
                                                                  .BRTopRight
                                                                  ?.toDouble(),
                                                              0.0,
                                                            )),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (valueOrDefault<bool>(
                                        (containerCheckForPollsWithRelatedMatchesResponse
                                                        .jsonBody
                                                        .toList()
                                                        .map<PollStruct?>(
                                                            PollStruct.maybeFromMap)
                                                        .toList()
                                                    as Iterable<PollStruct?>)
                                                .withoutNulls
                                                ?.length !=
                                            0,
                                        false,
                                      ))
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    22.0, 8.0, 22.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await widget.pollAction?.call(
                                                  (containerCheckForPollsWithRelatedMatchesResponse
                                                              .jsonBody
                                                              .toList()
                                                              .map<PollStruct?>(
                                                                  PollStruct
                                                                      .maybeFromMap)
                                                              .toList()
                                                          as Iterable<
                                                              PollStruct?>)
                                                      .withoutNulls
                                                      .firstOrNull!
                                                      .objectId,
                                                );
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          26.0, 8.0, 26.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Icon(
                                                        Icons.bar_chart,
                                                        color: valueOrDefault<
                                                            Color>(
                                                          widget!.onPrimary,
                                                          Colors.white,
                                                        ),
                                                        size: 24.0,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              'VOTE: ${valueOrDefault<String>(
                                                                (containerCheckForPollsWithRelatedMatchesResponse
                                                                        .jsonBody
                                                                        .toList()
                                                                        .map<PollStruct?>(
                                                                            PollStruct.maybeFromMap)
                                                                        .toList() as Iterable<PollStruct?>)
                                                                    .withoutNulls
                                                                    ?.firstOrNull
                                                                    ?.title,
                                                                'Poll Title',
                                                              )}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
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
                                                                    fontSize:
                                                                        14.0,
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
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .keyboard_double_arrow_right_rounded,
                                                        color: valueOrDefault<
                                                            Color>(
                                                          widget!.onPrimary,
                                                          Colors.white,
                                                        ),
                                                        size: 26.0,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ].addToEnd(SizedBox(height: 15.0)),
                          ).animateOnPageLoad(
                              animationsMap['columnOnPageLoadAnimation1']!),
                        ),
                      ),
                    );
                  },
                ),
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 45.0, 0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 50.0,
                    icon: Icon(
                      Icons.west,
                      color: FlutterFlowTheme.of(context).info,
                      size: 28.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
