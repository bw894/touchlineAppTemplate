import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'top_bit_v3_home_model.dart';
export 'top_bit_v3_home_model.dart';

class TopBitV3HomeWidget extends StatefulWidget {
  const TopBitV3HomeWidget({
    super.key,
    required this.bgImage,
    required this.lGCFixture,
    required this.lGCLive,
    required this.ticketsAction,
    required this.predictorAction,
    Color? onPrimary,
    required this.pollAction,
    this.altTimeColours,
    required this.teamObjectIds,
    required this.teamAbr,
  }) : this.onPrimary = onPrimary ?? Colors.white;

  final String? bgImage;
  final Future Function(String matchObjectId)? lGCFixture;
  final Future Function(String matchObjectId)? lGCLive;
  final Future Function()? ticketsAction;
  final Future Function()? predictorAction;

  /// for poll text
  final Color onPrimary;

  final Future Function(

      /// objectId of the poll in question
      String pollObjectId)? pollAction;
  final Color? altTimeColours;

  /// This should pass in a list of all the teams a user is associated with
  final List<String>? teamObjectIds;

  final String? teamAbr;

  @override
  State<TopBitV3HomeWidget> createState() => _TopBitV3HomeWidgetState();
}

class _TopBitV3HomeWidgetState extends State<TopBitV3HomeWidget> {
  late TopBitV3HomeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopBitV3HomeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      unawaited(
        () async {
          await action_blocks.launchCampaigns(context);
        }(),
      );
      _model.fixt = await BackendlessDatabaseGroup.upcomingOneFixturesCall.call(
        time: getCurrentTimestamp.millisecondsSinceEpoch,
        bLProjectId: FFLibraryValues().BLProjectId,
        bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
        teamObjectId:
            widget.teamObjectIds?.elementAtOrNull(_model.pageViewCurrentIndex),
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
            safeSetState(() {
              _model.clearTopBitHomeCacheKey(_model.apiRequestLastUniqueKey);
              _model.apiRequestCompleted = false;
            });
            await _model.waitForApiRequestCompleted();
          },
          startImmediately: true,
        );
      }
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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
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
      child: FutureBuilder<ApiCallResponse>(
        future: BackendlessDatabaseGroup
            .upcomingOneFixturesObjectIdStartEventTimelineCall
            .call(
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
          final containerUpcomingOneFixturesObjectIdStartEventTimelineResponse =
              snapshot.data!;

          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Visibility(
              visible:
                  (containerUpcomingOneFixturesObjectIdStartEventTimelineResponse
                              .jsonBody
                              .toList()
                              .map<BLESSfixtureStruct?>(
                                  BLESSfixtureStruct.maybeFromMap)
                              .toList() as Iterable<BLESSfixtureStruct?>)
                          .withoutNulls
                          .length >
                      0,
              child: FutureBuilder<ApiCallResponse>(
                future: BackendlessDatabaseGroup
                    .checkForPollsWithRelatedMatchesCall
                    .call(
                  currentTime: getCurrentTimestamp.millisecondsSinceEpoch,
                  matchObjectId:
                      (containerUpcomingOneFixturesObjectIdStartEventTimelineResponse
                              .jsonBody
                              .toList()
                              .map<BLESSfixtureStruct?>(
                                  BLESSfixtureStruct.maybeFromMap)
                              .toList() as Iterable<BLESSfixtureStruct?>)
                          .withoutNulls
                          .firstOrNull
                          ?.objectId,
                  bLProjectId: FFLibraryValues().BLProjectId,
                  bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
                  headerName: FFAppState().userToken != ''
                      ? 'user-token'
                      : 'Content-Type',
                  headerValue: FFAppState().userToken != ''
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
                  final stackCheckForPollsWithRelatedMatchesResponse =
                      snapshot.data!;

                  return Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: valueOrDefault<double>(
                      (bool live, int homeScorers, int awayScorers) {
                        return !live
                            ? 420.0
                            : (homeScorers == 0 && awayScorers == 0)
                                ? 330.0
                                : (homeScorers > awayScorers
                                            ? homeScorers
                                            : awayScorers) >
                                        3
                                    ? 400.0
                                    : 330.0 +
                                        (homeScorers > awayScorers
                                                ? homeScorers
                                                : awayScorers) *
                                            (70.0 / 4.0);
                      }(
                          (getCurrentTimestamp.millisecondsSinceEpoch >
                              (containerUpcomingOneFixturesObjectIdStartEventTimelineResponse.jsonBody
                                          .toList()
                                          .map<BLESSfixtureStruct?>(
                                              BLESSfixtureStruct.maybeFromMap)
                                          .toList()
                                      as Iterable<BLESSfixtureStruct?>)
                                  .withoutNulls
                                  .firstOrNull!
                                  .start),
                          (containerUpcomingOneFixturesObjectIdStartEventTimelineResponse.jsonBody
                                  .toList()
                                  .map<BLESSfixtureStruct?>(
                                      BLESSfixtureStruct.maybeFromMap)
                                  .toList() as Iterable<BLESSfixtureStruct?>)
                              .withoutNulls
                              .firstOrNull!
                              .eventTimeline
                              .where((e) =>
                                  (e.typeId == 14) &&
                                  (e.participantId ==
                                      (containerUpcomingOneFixturesObjectIdStartEventTimelineResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>)
                                          .withoutNulls
                                          .firstOrNull
                                          ?.homeTeamId))
                              .toList()
                              .length,
                          (containerUpcomingOneFixturesObjectIdStartEventTimelineResponse
                                  .jsonBody
                                  .toList()
                                  .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
                                  .toList() as Iterable<BLESSfixtureStruct?>)
                              .withoutNulls
                              .firstOrNull!
                              .eventTimeline
                              .where((e) => (e.typeId == 14) && (e.participantId == (containerUpcomingOneFixturesObjectIdStartEventTimelineResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.awayTeamId))
                              .toList()
                              .length),
                      420.0,
                    ),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final teamFixture =
                                      widget.teamObjectIds!.toList();

                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    child: Stack(
                                      children: [
                                        PageView.builder(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(
                                                  initialPage: max(
                                                      0,
                                                      min(
                                                          0,
                                                          teamFixture.length -
                                                              1))),
                                          onPageChanged: (_) async {
                                            safeSetState(() {
                                              _model.clearTopBitHomeCacheKey(
                                                  _model
                                                      .apiRequestLastUniqueKey);
                                              _model.apiRequestCompleted =
                                                  false;
                                            });
                                            await _model
                                                .waitForApiRequestCompleted();
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemCount: teamFixture.length,
                                          itemBuilder:
                                              (context, teamFixtureIndex) {
                                            final teamFixtureItem =
                                                teamFixture[teamFixtureIndex];
                                            return FutureBuilder<
                                                ApiCallResponse>(
                                              future: _model
                                                  .topBitHome(
                                                uniqueQueryKey:
                                                    teamFixtureIndex.toString(),
                                                requestFn: () =>
                                                    BackendlessDatabaseGroup
                                                        .topLevelFixtureDetailsCall
                                                        .call(
                                                  time: getCurrentTimestamp
                                                      .millisecondsSinceEpoch,
                                                  teamObjectId:
                                                      FFLibraryValues()
                                                          .focusTeamObjectId,
                                                  bLProjectId: FFLibraryValues()
                                                      .BLProjectId,
                                                  bLRestAPIKey:
                                                      FFLibraryValues()
                                                          .BLRestAPIKey,
                                                  headerName: 'Content-Type',
                                                  headerValue:
                                                      'application/json',
                                                ),
                                              )
                                                  .then((result) {
                                                try {
                                                  _model.apiRequestCompleted =
                                                      true;
                                                  _model.apiRequestLastUniqueKey =
                                                      teamFixtureIndex
                                                          .toString();
                                                } finally {}
                                                return result;
                                              }),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          SpinKitWanderingCubes(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final getObjectIdTopLevelFixtureDetailsResponse =
                                                    snapshot.data!;

                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    var _shouldSetState = false;
                                                    _model.apiResultv7z =
                                                        await BackendlessDatabaseGroup
                                                            .upcomingOneFixturesCall
                                                            .call(
                                                      time: getCurrentTimestamp
                                                          .millisecondsSinceEpoch,
                                                      teamObjectId: widget
                                                          .teamObjectIds
                                                          ?.elementAtOrNull(_model
                                                              .pageViewCurrentIndex),
                                                      bLProjectId:
                                                          FFLibraryValues()
                                                              .BLProjectId,
                                                      bLRestAPIKey:
                                                          FFLibraryValues()
                                                              .BLRestAPIKey,
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.apiResultv7z
                                                            ?.succeeded ??
                                                        true)) {
                                                      if (((_model.apiResultv7z
                                                                              ?.jsonBody ??
                                                                          '')
                                                                      .toList()
                                                                      .map<BLESSfixtureStruct?>(
                                                                          BLESSfixtureStruct
                                                                              .maybeFromMap)
                                                                      .toList()
                                                                  as Iterable<
                                                                      BLESSfixtureStruct?>)
                                                              .withoutNulls
                                                              .length !=
                                                          0) {
                                                        if (((_model.apiResultv7z?.jsonBody ??
                                                                            '')
                                                                        .toList()
                                                                        .map<BLESSfixtureStruct?>(BLESSfixtureStruct
                                                                            .maybeFromMap)
                                                                        .toList()
                                                                    as Iterable<
                                                                        BLESSfixtureStruct?>)
                                                                .withoutNulls
                                                                .firstOrNull!
                                                                .start >
                                                            getCurrentTimestamp
                                                                .millisecondsSinceEpoch) {
                                                          await widget
                                                              .lGCFixture
                                                              ?.call(
                                                            (getObjectIdTopLevelFixtureDetailsResponse
                                                                        .jsonBody
                                                                        .toList()
                                                                        .map<BLESSfixtureStruct?>(BLESSfixtureStruct
                                                                            .maybeFromMap)
                                                                        .toList()
                                                                    as Iterable<
                                                                        BLESSfixtureStruct?>)
                                                                .withoutNulls
                                                                .firstOrNull!
                                                                .objectId,
                                                          );
                                                        } else {
                                                          await widget.lGCLive
                                                              ?.call(
                                                            (getObjectIdTopLevelFixtureDetailsResponse
                                                                        .jsonBody
                                                                        .toList()
                                                                        .map<BLESSfixtureStruct?>(BLESSfixtureStruct
                                                                            .maybeFromMap)
                                                                        .toList()
                                                                    as Iterable<
                                                                        BLESSfixtureStruct?>)
                                                                .withoutNulls
                                                                .firstOrNull!
                                                                .objectId,
                                                          );
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'No Fixture Found',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1850),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Failed to fetch',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  1850),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.network(
                                                          (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<
                                                                              BLESSfixtureStruct?>)
                                                                          .withoutNulls
                                                                          .firstOrNull
                                                                          ?.matchBackground !=
                                                                      null &&
                                                                  (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<
                                                                              BLESSfixtureStruct?>)
                                                                          .withoutNulls
                                                                          .firstOrNull
                                                                          ?.matchBackground !=
                                                                      ''
                                                              ? (getObjectIdTopLevelFixtureDetailsResponse
                                                                      .jsonBody
                                                                      .toList()
                                                                      .map<BLESSfixtureStruct?>(
                                                                          BLESSfixtureStruct
                                                                              .maybeFromMap)
                                                                      .toList() as Iterable<BLESSfixtureStruct?>)
                                                                  .withoutNulls
                                                                  .firstOrNull!
                                                                  .matchBackground
                                                              : widget.bgImage!,
                                                        ).image,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0x1D000000),
                                                            Colors.black
                                                          ],
                                                          stops: [0.0, 0.9],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (!(containerUpcomingOneFixturesObjectIdStartEventTimelineResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.scoreOnlyFT)
                                                                                      Text(
                                                                                        valueOrDefault<String>(
                                                                                          valueOrDefault<String>(
                                                                                            (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.team.name,
                                                                                            'MEN\'S TEAM',
                                                                                          ).toUpperCase(),
                                                                                          'MEN\'S TEAM',
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          letterSpacing: 2.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          shadows: [
                                                                                            Shadow(
                                                                                              color: Color(0x6818191A),
                                                                                              offset: Offset(2.0, 2.0),
                                                                                              blurRadius: 5.0,
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    if ((containerUpcomingOneFixturesObjectIdStartEventTimelineResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.scoreOnlyFT ?? true)
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.info_outline,
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            size: 18.0,
                                                                                          ),
                                                                                          Text(
                                                                                            'SCORE ONLY SHOWN AT FT',
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              fontSize: 15.0,
                                                                                              letterSpacing: 1.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              shadows: [
                                                                                                Shadow(
                                                                                                  color: Color(0x6818191A),
                                                                                                  offset: Offset(2.0, 2.0),
                                                                                                  blurRadius: 5.0,
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 5.0)),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Container(
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: MediaQuery.sizeOf(context).width * 0.31,
                                                                                        ),
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                child: Image.network(
                                                                                                  () {
                                                                                                    if ((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.homeAbr == 'TEL') {
                                                                                                      return 'https://api.touchlineclub.com:7500/6B1865C5-E9FE-2985-FF3A-58F30C754F00/C7DEECF4-82EB-4F42-86BD-49ACA7E19114/files/buckWhiteFull.png';
                                                                                                    } else if (((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.homeTeamName == 'Kidderminster Harriers') || ((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.homeTeamName == 'Harriers')) {
                                                                                                      return 'https://api.touchlineclub.com:7500/6D654B32-2E5D-4E11-98F9-BACF8B9930B5/C7DEECF4-82EB-4F42-86BD-49ACA7E19114/files/Harriers%20Logo%20PNG%20White.png';
                                                                                                    } else {
                                                                                                      return (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.homeBadge;
                                                                                                    }
                                                                                                  }(),
                                                                                                  width: 75.0,
                                                                                                  height: 90.0,
                                                                                                  fit: BoxFit.contain,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (getCurrentTimestamp.millisecondsSinceEpoch < (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start)
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.homeTeamName,
                                                                                                  'Home',
                                                                                                ),
                                                                                                textAlign: TextAlign.center,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if ((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.leagueBadgeUrl != null && (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.leagueBadgeUrl != '')
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                child: Image.network(
                                                                                                  (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.leagueBadgeUrl,
                                                                                                  height: 21.0,
                                                                                                  fit: BoxFit.contain,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (valueOrDefault<bool>(
                                                                                            (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.isPostponed,
                                                                                            false,
                                                                                          ))
                                                                                            Text(
                                                                                              'P-P',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    fontSize: 26.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    lineHeight: 1.4,
                                                                                                  ),
                                                                                            ),
                                                                                          if ((getCurrentTimestamp.millisecondsSinceEpoch > (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start) &&
                                                                                              !valueOrDefault<bool>(
                                                                                                (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.isPostponed,
                                                                                                false,
                                                                                              ) &&
                                                                                              !valueOrDefault<bool>(
                                                                                                (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.scoreOnlyFT,
                                                                                                false,
                                                                                              ))
                                                                                            Text(
                                                                                              '${(getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.homeGoals.toString()} - ${(getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.awayGoals.toString()}',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    fontSize: 26.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          if ((getCurrentTimestamp.millisecondsSinceEpoch > (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start) &&
                                                                                              !valueOrDefault<bool>(
                                                                                                (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.isPostponed,
                                                                                                false,
                                                                                              ) &&
                                                                                              valueOrDefault<bool>(
                                                                                                (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.penaltyShootout,
                                                                                                false,
                                                                                              ))
                                                                                            Text(
                                                                                              '(${valueOrDefault<String>(
                                                                                                (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.homePenalties.toString(),
                                                                                                '0',
                                                                                              )}) - (${valueOrDefault<String>(
                                                                                                (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.awayPenalties.toString(),
                                                                                                '0',
                                                                                              )})',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          if (valueOrDefault<bool>(
                                                                                            getCurrentTimestamp.millisecondsSinceEpoch < (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start,
                                                                                            true,
                                                                                          ))
                                                                                            Text(
                                                                                              dateTimeFormat("Hm", functions.convertFromMills((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start)),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    fontSize: 26.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    lineHeight: 1.4,
                                                                                                  ),
                                                                                            ),
                                                                                          if (valueOrDefault<bool>(
                                                                                            getCurrentTimestamp.millisecondsSinceEpoch < (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start,
                                                                                            true,
                                                                                          ))
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 46.0),
                                                                                              child: Text(
                                                                                                dateTimeFormat("MMMEd", functions.convertFromMills((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start)),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: Color(0xFFD9D9D9),
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      lineHeight: 1.4,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          if (valueOrDefault<bool>(
                                                                                            (getCurrentTimestamp.millisecondsSinceEpoch > (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start) && !(getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.isPostponed,
                                                                                            true,
                                                                                          ))
                                                                                            Padding(
                                                                                              padding: EdgeInsets.all(8.0),
                                                                                              child: Container(
                                                                                                width: valueOrDefault<double>(
                                                                                                  (String display) {
                                                                                                    return display.length <= 2
                                                                                                        ? 25.0
                                                                                                        : display.length == 3
                                                                                                            ? 40.0
                                                                                                            : display.length <= 7
                                                                                                                ? 50.0
                                                                                                                : 70.0;
                                                                                                  }(valueOrDefault<String>(
                                                                                                    (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.outputStatus,
                                                                                                    'Not Started',
                                                                                                  )),
                                                                                                  70.0,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 6.0, 4.0, 0.0),
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.outputStatus,
                                                                                                          'Not Started',
                                                                                                        ),
                                                                                                        textAlign: TextAlign.center,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.inter(
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              fontSize: valueOrDefault<double>(
                                                                                                                (String display) {
                                                                                                                  return display.length > 7 ? 11.0 : 15.0;
                                                                                                                }(valueOrDefault<String>(
                                                                                                                  (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.outputStatus,
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
                                                                                                    if (getCurrentTimestamp.millisecondsSinceEpoch < (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.end)
                                                                                                      Lottie.asset(
                                                                                                        'assets/jsons/LiveAnimationWhite.json',
                                                                                                        width: 70.0,
                                                                                                        height: 2.0,
                                                                                                        fit: BoxFit.fitWidth,
                                                                                                        animate: true,
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Container(
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: MediaQuery.sizeOf(context).width * 0.31,
                                                                                        ),
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                                  child: Image.network(
                                                                                                    () {
                                                                                                      if ((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.awayAbr == 'TEL') {
                                                                                                        return 'https://api.touchlineclub.com:7500/6B1865C5-E9FE-2985-FF3A-58F30C754F00/C7DEECF4-82EB-4F42-86BD-49ACA7E19114/files/buckWhiteFull.png';
                                                                                                      } else if (((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.awayTeamName == 'Kidderminster Harriers') || ((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.awayTeamName == 'Harriers')) {
                                                                                                        return 'https://api.touchlineclub.com:7500/6D654B32-2E5D-4E11-98F9-BACF8B9930B5/C7DEECF4-82EB-4F42-86BD-49ACA7E19114/files/Harriers%20Logo%20PNG%20White.png';
                                                                                                      } else {
                                                                                                        return (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.awayBadge;
                                                                                                      }
                                                                                                    }(),
                                                                                                    width: 75.0,
                                                                                                    height: 90.0,
                                                                                                    fit: BoxFit.contain,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (getCurrentTimestamp.millisecondsSinceEpoch < (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start)
                                                                                              Text(
                                                                                                valueOrDefault<String>(
                                                                                                  (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.awayTeamName,
                                                                                                  'Away',
                                                                                                ),
                                                                                                textAlign: TextAlign.center,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              if ((getCurrentTimestamp.millisecondsSinceEpoch > (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start) && ((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.eventTimeline.where((e) => e.typeId == 14).toList().length != 0))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          flex: 3,
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final goalEvents = ((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.eventTimeline.where((e) => (e.typeId == 14) && (e.participantId == (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.homeTeamId)).toList().toList() ?? []).take(4).toList();

                                                                                              return ListView.separated(
                                                                                                padding: EdgeInsets.zero,
                                                                                                primary: false,
                                                                                                shrinkWrap: true,
                                                                                                scrollDirection: Axis.vertical,
                                                                                                itemCount: goalEvents.length,
                                                                                                separatorBuilder: (_, __) => SizedBox(height: 2.0),
                                                                                                itemBuilder: (context, goalEventsIndex) {
                                                                                                  final goalEventsItem = goalEvents[goalEventsIndex];
                                                                                                  return Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                goalEventsIndex == 3 ? '+ ${((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.eventTimeline.where((e) => (e.participantId == (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.homeTeamId) && (e.typeId == 14)).toList().length - 3).toString()} more' : goalEventsItem.playerName,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FontWeight.w300,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      color: Colors.white,
                                                                                                                      fontSize: 12.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w300,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  if (goalEventsIndex != 3)
                                                                                                                    Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        goalEventsItem.minute.toString(),
                                                                                                                        '00',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            font: GoogleFonts.inter(
                                                                                                                              fontWeight: FontWeight.w300,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                            ),
                                                                                                                            color: Colors.white,
                                                                                                                            fontSize: 12.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w300,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  if (valueOrDefault<bool>(
                                                                                                                    (goalEventsItem.extraMinute != null) && (goalEventsItem.extraMinute != 0) && (goalEventsIndex != 3),
                                                                                                                    false,
                                                                                                                  ))
                                                                                                                    Text(
                                                                                                                      '+${goalEventsItem.extraMinute.toString()}',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            font: GoogleFonts.inter(
                                                                                                                              fontWeight: FontWeight.w300,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                            ),
                                                                                                                            color: Colors.white,
                                                                                                                            fontSize: 12.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w300,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  if (goalEventsIndex != 3)
                                                                                                                    Text(
                                                                                                                      '\'',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            font: GoogleFonts.inter(
                                                                                                                              fontWeight: FontWeight.w300,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                            ),
                                                                                                                            color: Colors.white,
                                                                                                                            fontSize: 12.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w300,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ].divide(SizedBox(width: 5.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, -1.0),
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: Opacity(
                                                                                                opacity: 0.9,
                                                                                                child: Icon(
                                                                                                  Icons.sports_soccer,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  size: 16.0,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (getCurrentTimestamp.millisecondsSinceEpoch > (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start)
                                                                                          Expanded(
                                                                                            flex: 3,
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                final goalEvents = ((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.eventTimeline.where((e) => (e.typeId == 14) && (e.participantId == (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.awayTeamId)).toList().toList() ?? []).take(4).toList();

                                                                                                return ListView.separated(
                                                                                                  padding: EdgeInsets.zero,
                                                                                                  primary: false,
                                                                                                  shrinkWrap: true,
                                                                                                  scrollDirection: Axis.vertical,
                                                                                                  itemCount: goalEvents.length,
                                                                                                  separatorBuilder: (_, __) => SizedBox(height: 2.0),
                                                                                                  itemBuilder: (context, goalEventsIndex) {
                                                                                                    final goalEventsItem = goalEvents[goalEventsIndex];
                                                                                                    return Visibility(
                                                                                                      visible: goalEventsItem.typeId == 14,
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          if (goalEventsItem.participantId == (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.awayTeamId)
                                                                                                            Expanded(
                                                                                                              child: Container(
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        goalEventsIndex == 3 ? '+ ${((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.eventTimeline.where((e) => (e.participantId == (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.awayTeamId) && (e.typeId == 14)).toList().length - 3).toString()} more' : goalEventsItem.playerName,
                                                                                                                        'Player name',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            font: GoogleFonts.inter(
                                                                                                                              fontWeight: FontWeight.w300,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                            ),
                                                                                                                            color: Colors.white,
                                                                                                                            fontSize: 12.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w300,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        if (goalEventsIndex != 3)
                                                                                                                          Text(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              goalEventsItem.minute.toString(),
                                                                                                                              '00',
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                    fontWeight: FontWeight.w300,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                                  color: Colors.white,
                                                                                                                                  fontSize: 12.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w300,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        if (valueOrDefault<bool>(
                                                                                                                          (goalEventsItem.extraMinute != null) && (goalEventsItem.extraMinute != 0) && (goalEventsIndex != 3),
                                                                                                                          false,
                                                                                                                        ))
                                                                                                                          Text(
                                                                                                                            '+${goalEventsItem.extraMinute.toString()}',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                    fontWeight: FontWeight.w300,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                                  color: Colors.white,
                                                                                                                                  fontSize: 12.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w300,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        if (goalEventsIndex != 3)
                                                                                                                          Text(
                                                                                                                            '\'',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                    fontWeight: FontWeight.w300,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                                  color: Colors.white,
                                                                                                                                  fontSize: 12.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FontWeight.w300,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ].divide(SizedBox(width: 5.0)),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                        ],
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
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].addToStart(
                                                                        SizedBox(
                                                                            height:
                                                                                75.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if ((getCurrentTimestamp
                                                                              .millisecondsSinceEpoch <
                                                                          (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>)
                                                                              .withoutNulls
                                                                              .firstOrNull!
                                                                              .start) &&
                                                                      !(getObjectIdTopLevelFixtureDetailsResponse
                                                                              .jsonBody
                                                                              .toList()
                                                                              .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
                                                                              .toList() as Iterable<BLESSfixtureStruct?>)
                                                                          .withoutNulls
                                                                          .firstOrNull!
                                                                          .isPostponed)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          48.0,
                                                                          12.0,
                                                                          48.0,
                                                                          6.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              AnimatedDefaultTextStyle(
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.rubik(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 28.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                duration: Duration(milliseconds: 600),
                                                                                curve: Curves.easeInOut,
                                                                                child: Text(
                                                                                  key: ValueKey(getCurrentTimestamp.secondsSinceEpoch.toString()),
                                                                                  formatNumber(
                                                                                    ((((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start / 1000) - getCurrentTimestamp.secondsSinceEpoch) / 86400).floor(),
                                                                                    formatType: FormatType.custom,
                                                                                    format: '00',
                                                                                    locale: '',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'D',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.rubik(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault<Color>(
                                                                                        widget.altTimeColours != null ? widget.altTimeColours : FlutterFlowTheme.of(context).primary,
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 3.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                ':',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.bebasNeue(
                                                                                        fontWeight: FontWeight.w100,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 22.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w100,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 3.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              AnimatedDefaultTextStyle(
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.rubik(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 28.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                duration: Duration(milliseconds: 600),
                                                                                curve: Curves.easeInOut,
                                                                                child: Text(
                                                                                  key: ValueKey(getCurrentTimestamp.secondsSinceEpoch.toString()),
                                                                                  formatNumber(
                                                                                    (((((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start / 1000) - getCurrentTimestamp.secondsSinceEpoch) / 3600) % 24).floor(),
                                                                                    formatType: FormatType.custom,
                                                                                    format: '00',
                                                                                    locale: '',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'H',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault<Color>(
                                                                                        widget.altTimeColours != null ? widget.altTimeColours : FlutterFlowTheme.of(context).primary,
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 3.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                ':',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.bebasNeue(
                                                                                        fontWeight: FontWeight.w100,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 22.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w100,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 3.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              AnimatedDefaultTextStyle(
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.rubik(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      fontSize: 28.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                duration: Duration(milliseconds: 600),
                                                                                curve: Curves.easeInOut,
                                                                                child: Text(
                                                                                  key: ValueKey(getCurrentTimestamp.secondsSinceEpoch.toString()),
                                                                                  formatNumber(
                                                                                    ((((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start / 1000) - getCurrentTimestamp.secondsSinceEpoch) / 60) % 60,
                                                                                    formatType: FormatType.custom,
                                                                                    format: '00',
                                                                                    locale: '',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'M',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault<Color>(
                                                                                        widget.altTimeColours != null ? widget.altTimeColours : FlutterFlowTheme.of(context).primary,
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 3.0)),
                                                                          ),
                                                                        ].divide(SizedBox(width: 12.0)),
                                                                      ),
                                                                    ),
                                                                  if ((getCurrentTimestamp
                                                                              .millisecondsSinceEpoch <
                                                                          (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>)
                                                                              .withoutNulls
                                                                              .firstOrNull!
                                                                              .start) &&
                                                                      ((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.location !=
                                                                              null &&
                                                                          (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.location !=
                                                                              ''))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>)
                                                                              .withoutNulls
                                                                              .firstOrNull
                                                                              ?.location,
                                                                          'Stadium Name',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.5,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            22.0,
                                                                            0.0,
                                                                            22.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Visibility(
                                                                        visible:
                                                                            (getCurrentTimestamp.millisecondsSinceEpoch < (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start) &&
                                                                                !(getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.isPostponed,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              if ((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.predictor ?? true)
                                                                                Expanded(
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      await widget.predictorAction?.call();
                                                                                    },
                                                                                    text: 'Play Predictor',
                                                                                    icon: Icon(
                                                                                      Icons.sports_soccer_outlined,
                                                                                      size: 16.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: 35.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      color: Color(0x00FF1D3B),
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                            color: Colors.white,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                      elevation: 2.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        width: 0.0,
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
                                                                                  ),
                                                                                ),
                                                                              if (((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.homeAbr == widget.teamAbr) && (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.tickets)
                                                                                Expanded(
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      await widget.ticketsAction?.call();
                                                                                    },
                                                                                    text: 'Get Tickets',
                                                                                    icon: FaIcon(
                                                                                      FontAwesomeIcons.ticketAlt,
                                                                                      size: 16.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: 35.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                            color: Colors.white,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                      elevation: 2.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        width: 0.0,
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
                                                                                  ),
                                                                                ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            22.0,
                                                                            0.0,
                                                                            22.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Visibility(
                                                                        visible: (getCurrentTimestamp.millisecondsSinceEpoch >
                                                                                (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start) &&
                                                                            !(getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.isPostponed &&
                                                                            valueOrDefault<bool>(
                                                                              (stackCheckForPollsWithRelatedMatchesResponse.jsonBody.toList().map<PollStruct?>(PollStruct.maybeFromMap).toList() as Iterable<PollStruct?>).withoutNulls.length == 0,
                                                                              false,
                                                                            ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      var _shouldSetState = false;
                                                                                      _model.apiResultv7zCopy = await BackendlessDatabaseGroup.upcomingOneFixturesCall.call(
                                                                                        time: getCurrentTimestamp.millisecondsSinceEpoch,
                                                                                        teamObjectId: widget.teamObjectIds?.elementAtOrNull(_model.pageViewCurrentIndex),
                                                                                        bLProjectId: FFLibraryValues().BLProjectId,
                                                                                        bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
                                                                                      );

                                                                                      _shouldSetState = true;
                                                                                      if ((_model.apiResultv7zCopy?.succeeded ?? true)) {
                                                                                        if (((_model.apiResultv7zCopy?.jsonBody ?? '').toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.length != 0) {
                                                                                          if ((getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start > getCurrentTimestamp.millisecondsSinceEpoch) {
                                                                                            await widget.lGCFixture?.call(
                                                                                              (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.objectId,
                                                                                            );
                                                                                          } else {
                                                                                            await widget.lGCLive?.call(
                                                                                              (getObjectIdTopLevelFixtureDetailsResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.objectId,
                                                                                            );
                                                                                          }
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'No Fixture Found',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 1850),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                            ),
                                                                                          );
                                                                                          if (_shouldSetState) safeSetState(() {});
                                                                                          return;
                                                                                        }
                                                                                      } else {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Failed to fetch',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 1850),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                          ),
                                                                                        );
                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                        return;
                                                                                      }

                                                                                      if (_shouldSetState) safeSetState(() {});
                                                                                    },
                                                                                    text: 'Live Match Centre',
                                                                                    icon: Icon(
                                                                                      Icons.east,
                                                                                      size: 14.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                      height: 35.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                      iconAlignment: IconAlignment.end,
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                            color: Colors.white,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                      elevation: 2.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        width: 0.0,
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
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
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
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 14.0),
                                            child: smooth_page_indicator
                                                .SmoothPageIndicator(
                                              controller: _model
                                                      .pageViewController ??=
                                                  PageController(
                                                      initialPage: max(
                                                          0,
                                                          min(
                                                              0,
                                                              teamFixture
                                                                      .length -
                                                                  1))),
                                              count: teamFixture.length,
                                              axisDirection: Axis.horizontal,
                                              onDotClicked: (i) async {
                                                await _model.pageViewController!
                                                    .animateToPage(
                                                  i,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                                safeSetState(() {});
                                              },
                                              effect: smooth_page_indicator
                                                  .SlideEffect(
                                                spacing: 8.0,
                                                radius: 8.0,
                                                dotWidth: 15.0,
                                                dotHeight: 6.0,
                                                dotColor: valueOrDefault<Color>(
                                                  widget.teamObjectIds!
                                                              .length <=
                                                          1
                                                      ? Colors.black
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                                ),
                                                activeDotColor:
                                                    valueOrDefault<Color>(
                                                  widget.teamObjectIds!
                                                              .length <=
                                                          1
                                                      ? Colors.black
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                paintStyle: PaintingStyle.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        if (!(containerUpcomingOneFixturesObjectIdStartEventTimelineResponse
                                .jsonBody
                                .toList()
                                .map<BLESSfixtureStruct?>(
                                    BLESSfixtureStruct.maybeFromMap)
                                .toList() as Iterable<BLESSfixtureStruct?>)
                            .withoutNulls
                            .firstOrNull!
                            .scoreOnlyFT)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 68.0, 0.0, 0.0),
                            child: Container(
                              width: 80.0,
                              height: 28.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRBottomRight?.toDouble(),
                                    0.0,
                                  )),
                                  topLeft: Radius.circular(0.0),
                                  topRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRTopRight?.toDouble(),
                                    0.0,
                                  )),
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 3.0, 13.0, 4.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      (containerUpcomingOneFixturesObjectIdStartEventTimelineResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<BLESSfixtureStruct?>(
                                                              BLESSfixtureStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          BLESSfixtureStruct?>)
                                                  .withoutNulls
                                                  .firstOrNull!
                                                  .start <
                                              getCurrentTimestamp
                                                  .millisecondsSinceEpoch
                                          ? 'LIVE'
                                          : 'UP NEXT',
                                      'UP NEXT',
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (valueOrDefault<bool>(
                          (stackCheckForPollsWithRelatedMatchesResponse.jsonBody
                                      .toList()
                                      .map<PollStruct?>(PollStruct.maybeFromMap)
                                      .toList() as Iterable<PollStruct?>)
                                  .withoutNulls
                                  .length !=
                              0,
                          false,
                        ))
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 5.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await widget.pollAction?.call(
                                    (stackCheckForPollsWithRelatedMatchesResponse
                                            .jsonBody
                                            .toList()
                                            .map<PollStruct?>(
                                                PollStruct.maybeFromMap)
                                            .toList() as Iterable<PollStruct?>)
                                        .withoutNulls
                                        .firstOrNull!
                                        .objectId,
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        26.0, 8.0, 26.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.bar_chart,
                                          color: valueOrDefault<Color>(
                                            widget.onPrimary,
                                            Colors.white,
                                          ),
                                          size: 24.0,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                'VOTE: ${valueOrDefault<String>(
                                                  (stackCheckForPollsWithRelatedMatchesResponse
                                                              .jsonBody
                                                              .toList()
                                                              .map<PollStruct?>(
                                                                  PollStruct
                                                                      .maybeFromMap)
                                                              .toList()
                                                          as Iterable<
                                                              PollStruct?>)
                                                      .withoutNulls
                                                      .firstOrNull
                                                      ?.title,
                                                  'Poll Title',
                                                )}',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 15.0,
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
                                          ),
                                        ),
                                        Icon(
                                          Icons
                                              .keyboard_double_arrow_right_rounded,
                                          color: valueOrDefault<Color>(
                                            widget.onPrimary,
                                            Colors.white,
                                          ),
                                          size: 26.0,
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
