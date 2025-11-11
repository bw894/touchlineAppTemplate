import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'interactive_hub_model.dart';
export 'interactive_hub_model.dart';

class InteractiveHubWidget extends StatefulWidget {
  const InteractiveHubWidget({
    super.key,
    required this.objectId,
  });

  final String? objectId;

  static String routeName = 'interactiveHub';
  static String routePath = '/play';

  @override
  State<InteractiveHubWidget> createState() => _InteractiveHubWidgetState();
}

class _InteractiveHubWidgetState extends State<InteractiveHubWidget>
    with TickerProviderStateMixin {
  late InteractiveHubModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InteractiveHubModel());

    animationsMap.addAll({
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.05, 1.05),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: BackendlessDatabaseGroup.getSpecificGenericPollCall.call(
        pollObjectId: widget.objectId,
        bLProjectId: FFLibraryValues().BLProjectId,
        bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
        headerName: 'Content-Type',
        headerValue: 'application/json',
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitWanderingCubes(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final interactiveHubGetSpecificGenericPollResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 46.0,
                          hoverColor: Color(0x3214181B),
                          hoverIconColor:
                              FlutterFlowTheme.of(context).primaryText,
                          icon: Icon(
                            Icons.west,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          ),
                          onPressed: () async {
                            context.safePop();
                          },
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.0),
                        child: Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0x4EFFFFFF), Color(0x00FFFFFF)],
                                stops: [0.0, 1.0],
                                begin: AlignmentDirectional(-1.0, -1.0),
                                end: AlignmentDirectional(1.0, 1.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.network(
                                  FFLibraryValues().ClubBadgeOnPrimary !=
                                              null &&
                                          FFLibraryValues()
                                                  .ClubBadgeOnPrimary !=
                                              ''
                                      ? FFLibraryValues().ClubBadgeOnPrimary!
                                      : FFLibraryValues().ClubBadge!,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: Text(
                          'PLAY',
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
                                    fontSize: 45.0,
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
                      if (_model.page == 1)
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (PollStruct.maybeFromMap(
                                                interactiveHubGetSpecificGenericPollResponse
                                                    .jsonBody)
                                            ?.style ==
                                        'POLL')
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.bar_chart,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 18.0,
                                          ),
                                          Text(
                                            'POLL',
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
                                                      .primary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                    if (PollStruct.maybeFromMap(
                                                interactiveHubGetSpecificGenericPollResponse
                                                    .jsonBody)
                                            ?.style ==
                                        'QUIZ')
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.quiz_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 18.0,
                                          ),
                                          Text(
                                            'QUIZ',
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
                                                      .primary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                    if (PollStruct.maybeFromMap(
                                                interactiveHubGetSpecificGenericPollResponse
                                                    .jsonBody)
                                            ?.style ==
                                        'FORM')
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.format_align_left,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 18.0,
                                          ),
                                          Text(
                                            'FORM',
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
                                                      .primary,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 15.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      PollStruct.maybeFromMap(
                                              interactiveHubGetSpecificGenericPollResponse
                                                  .jsonBody)
                                          ?.title,
                                      'Title',
                                    ),
                                    textAlign: TextAlign.center,
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
                                          fontSize: 24.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                if (PollStruct.maybeFromMap(
                                            interactiveHubGetSpecificGenericPollResponse
                                                .jsonBody)
                                        ?.style ==
                                    'POLL')
                                  FutureBuilder<ApiCallResponse>(
                                    future: BackendlessDatabaseGroup
                                        .checkIfUserHasVotedCall
                                        .call(
                                      userEmail: FFAppState().currentUser.email,
                                      pollObjectId: widget.objectId,
                                      bLProjectId:
                                          FFLibraryValues().BLProjectId,
                                      bLRestAPIKey:
                                          FFLibraryValues().BLRestAPIKey,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final pOLLDeciderCheckIfUserHasVotedResponse =
                                          snapshot.data!;

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Opacity(
                                            opacity: (pOLLDeciderCheckIfUserHasVotedResponse
                                                                .jsonBody
                                                                .toList()
                                                                .map<PollStruct?>(
                                                                    PollStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                PollStruct?>)
                                                        .withoutNulls
                                                        .length >
                                                    0
                                                ? 0.6
                                                : 1.0,
                                            child: FFButtonWidget(
                                              onPressed: ((pOLLDeciderCheckIfUserHasVotedResponse
                                                                  .jsonBody
                                                                  .toList()
                                                                  .map<PollStruct?>(
                                                                      PollStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  PollStruct?>)
                                                          .withoutNulls
                                                          .length >
                                                      0)
                                                  ? null
                                                  : () async {
                                                      _model.page =
                                                          _model.page + 1;
                                                      safeSetState(() {});
                                                    },
                                              text: 'Vote Now',
                                              icon: Icon(
                                                Icons.east,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconAlignment:
                                                    IconAlignment.end,
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                disabledColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                disabledTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                          ),
                                          if ((pOLLDeciderCheckIfUserHasVotedResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<PollStruct?>(
                                                              PollStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<PollStruct?>)
                                                  .withoutNulls
                                                  .length >
                                              0)
                                            Text(
                                              'You\'ve already voted in this poll!',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                          if ((pOLLDeciderCheckIfUserHasVotedResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<PollStruct?>(
                                                              PollStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<PollStruct?>)
                                                  .withoutNulls
                                                  .length ==
                                              0)
                                            Text(
                                              'Expires: ${dateTimeFormat("EEEE, d MMM @ H:m", DateTime.fromMillisecondsSinceEpoch(valueOrDefault<int>(
                                                    PollStruct.maybeFromMap(
                                                            interactiveHubGetSpecificGenericPollResponse
                                                                .jsonBody)
                                                        ?.endDatetime,
                                                    0,
                                                  )))}',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                        ].divide(SizedBox(height: 5.0)),
                                      );
                                    },
                                  ),
                                if (PollStruct.maybeFromMap(
                                            interactiveHubGetSpecificGenericPollResponse
                                                .jsonBody)
                                        ?.style ==
                                    'QUIZ')
                                  FutureBuilder<ApiCallResponse>(
                                    future: BackendlessDatabaseGroup
                                        .checkIfUserHasPlayedQuizCall
                                        .call(
                                      userObjectId:
                                          FFAppState().currentUser.objectId,
                                      pollObjectId: widget.objectId,
                                      bLProjectId:
                                          FFLibraryValues().BLProjectId,
                                      bLRestAPIKey:
                                          FFLibraryValues().BLRestAPIKey,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final qUIZDeciderCheckIfUserHasPlayedQuizResponse =
                                          snapshot.data!;

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Opacity(
                                            opacity: (qUIZDeciderCheckIfUserHasPlayedQuizResponse
                                                                .jsonBody
                                                                .toList()
                                                                .map<PollStruct?>(
                                                                    PollStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                PollStruct?>)
                                                        .withoutNulls
                                                        .length >
                                                    0
                                                ? 0.6
                                                : 1.0,
                                            child: FFButtonWidget(
                                              onPressed: ((qUIZDeciderCheckIfUserHasPlayedQuizResponse
                                                                  .jsonBody
                                                                  .toList()
                                                                  .map<PollStruct?>(
                                                                      PollStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  PollStruct?>)
                                                          .withoutNulls
                                                          .length >
                                                      0)
                                                  ? null
                                                  : () async {
                                                      _model.page =
                                                          _model.page + 1;
                                                      _model.totalPointsAvailable =
                                                          PollStruct.maybeFromMap(
                                                                  interactiveHubGetSpecificGenericPollResponse
                                                                      .jsonBody)
                                                              ?.quizQuestions
                                                              .length;
                                                      safeSetState(() {});
                                                      if ((PollStruct.maybeFromMap(
                                                                      interactiveHubGetSpecificGenericPollResponse
                                                                          .jsonBody)
                                                                  ?.quizQuestions
                                                                  .sortedList(
                                                                      keyOf: (e) => e
                                                                          .sortOrder,
                                                                      desc:
                                                                          false)
                                                                  .firstOrNull
                                                                  ?.time ==
                                                              0) ||
                                                          (PollStruct.maybeFromMap(
                                                                      interactiveHubGetSpecificGenericPollResponse
                                                                          .jsonBody)
                                                                  ?.quizQuestions
                                                                  .sortedList(
                                                                      keyOf: (e) => e
                                                                          .sortOrder,
                                                                      desc:
                                                                          false)
                                                                  .firstOrNull
                                                                  ?.time ==
                                                              null)) {
                                                        _model.currentTimerValue =
                                                            1.0;
                                                        _model.showCorrectAnswers =
                                                            false;
                                                      } else {
                                                        _model.currentTimerValue =
                                                            PollStruct.maybeFromMap(
                                                                    interactiveHubGetSpecificGenericPollResponse
                                                                        .jsonBody)
                                                                ?.quizQuestions
                                                                .sortedList(
                                                                    keyOf: (e) =>
                                                                        e.sortOrder,
                                                                    desc: false)
                                                                .firstOrNull
                                                                ?.time
                                                                .toDouble();
                                                        _model.showCorrectAnswers =
                                                            false;
                                                        _model.q1Only =
                                                            InstantTimer
                                                                .periodic(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  100),
                                                          callback:
                                                              (timer) async {
                                                            if (_model
                                                                    .currentTimerValue! >
                                                                0.1) {
                                                              _model.currentTimerValue =
                                                                  _model.currentTimerValue! +
                                                                      -0.1;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.q1Only
                                                                  ?.cancel();
                                                              _model.showCorrectAnswers =
                                                                  true;
                                                              _model
                                                                  .addToQuizEntry(
                                                                      0);
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          startImmediately:
                                                              true,
                                                        );
                                                      }
                                                    },
                                              text: 'Play Now',
                                              icon: Icon(
                                                Icons.east,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconAlignment:
                                                    IconAlignment.end,
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                disabledColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                disabledTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                          ),
                                          if ((qUIZDeciderCheckIfUserHasPlayedQuizResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<PollStruct?>(
                                                              PollStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<PollStruct?>)
                                                  .withoutNulls
                                                  .length >
                                              0)
                                            Text(
                                              'You\'ve already played this quiz!',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                          if ((qUIZDeciderCheckIfUserHasPlayedQuizResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<PollStruct?>(
                                                              PollStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<PollStruct?>)
                                                  .withoutNulls
                                                  .length ==
                                              0)
                                            Text(
                                              'Expires: ${dateTimeFormat("EEEE, d MMM @ H:m", DateTime.fromMillisecondsSinceEpoch(valueOrDefault<int>(
                                                    PollStruct.maybeFromMap(
                                                            interactiveHubGetSpecificGenericPollResponse
                                                                .jsonBody)
                                                        ?.endDatetime,
                                                    0,
                                                  )))}',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                        ].divide(SizedBox(height: 5.0)),
                                      );
                                    },
                                  ),
                                if (PollStruct.maybeFromMap(
                                            interactiveHubGetSpecificGenericPollResponse
                                                .jsonBody)
                                        ?.style ==
                                    'FORM')
                                  FutureBuilder<ApiCallResponse>(
                                    future: BackendlessDatabaseGroup
                                        .checkIfUserHasSubmittedAFormCall
                                        .call(
                                      userObjectId:
                                          FFAppState().currentUser.objectId,
                                      pollObjectId: widget.objectId,
                                      bLProjectId:
                                          FFLibraryValues().BLProjectId,
                                      bLRestAPIKey:
                                          FFLibraryValues().BLRestAPIKey,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final fORMDeciderCheckIfUserHasSubmittedAFormResponse =
                                          snapshot.data!;

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Opacity(
                                            opacity: (fORMDeciderCheckIfUserHasSubmittedAFormResponse
                                                                .jsonBody
                                                                .toList()
                                                                .map<PollStruct?>(
                                                                    PollStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                PollStruct?>)
                                                        .withoutNulls
                                                        .length >
                                                    0
                                                ? 0.6
                                                : 1.0,
                                            child: FFButtonWidget(
                                              onPressed: ((fORMDeciderCheckIfUserHasSubmittedAFormResponse
                                                                  .jsonBody
                                                                  .toList()
                                                                  .map<PollStruct?>(
                                                                      PollStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  PollStruct?>)
                                                          .withoutNulls
                                                          .length >
                                                      0)
                                                  ? null
                                                  : () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                              text: 'Submit Now',
                                              icon: Icon(
                                                Icons.east,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconAlignment:
                                                    IconAlignment.end,
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                disabledColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                disabledTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            ((fORMDeciderCheckIfUserHasSubmittedAFormResponse
                                                                .jsonBody
                                                                .toList()
                                                                .map<PollStruct?>(
                                                                    PollStruct
                                                                        .maybeFromMap)
                                                                .toList()
                                                            as Iterable<
                                                                PollStruct?>)
                                                        .withoutNulls
                                                        .length >
                                                    0)
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
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
                                          if ((fORMDeciderCheckIfUserHasSubmittedAFormResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<PollStruct?>(
                                                              PollStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<PollStruct?>)
                                                  .withoutNulls
                                                  .length ==
                                              0)
                                            Text(
                                              'Expires: ${dateTimeFormat("EEEE, d MMM @ H:m", DateTime.fromMillisecondsSinceEpoch(valueOrDefault<int>(
                                                    PollStruct.maybeFromMap(
                                                            interactiveHubGetSpecificGenericPollResponse
                                                                .jsonBody)
                                                        ?.endDatetime,
                                                    0,
                                                  )))}',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                        ].divide(SizedBox(height: 5.0)),
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      if ((PollStruct.maybeFromMap(
                                      interactiveHubGetSpecificGenericPollResponse
                                          .jsonBody)
                                  ?.style ==
                              'POLL') &&
                          (_model.page == 2))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Builder(
                                    builder: (context) {
                                      final option = PollStruct.maybeFromMap(
                                                  interactiveHubGetSpecificGenericPollResponse
                                                      .jsonBody)
                                              ?.options
                                              .sortedList(
                                                  keyOf: (e) => e.sortOrder,
                                                  desc: false)
                                              .toList() ??
                                          [];

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: option.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 13.0),
                                        itemBuilder: (context, optionIndex) {
                                          final optionItem =
                                              option[optionIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if ((optionIndex ==
                                                      _model.indexSelected) &&
                                                  (_model.indexSelected !=
                                                      null)) {
                                                _model.indexSelected = null;
                                                safeSetState(() {});
                                              } else {
                                                _model.indexSelected =
                                                    optionIndex;
                                                safeSetState(() {});
                                              }
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 370),
                                                curve: Curves.easeInOut,
                                                width: 100.0,
                                                height: 70.0,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    () {
                                                      if (_model
                                                              .indexSelected ==
                                                          null) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (_model
                                                              .indexSelected ==
                                                          optionIndex) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .primary;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      }
                                                    }(),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Visibility(
                                                              visible: optionItem
                                                                          .image !=
                                                                      '',
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child: Image
                                                                    .network(
                                                                  optionItem
                                                                      .image,
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.18,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (valueOrDefault<
                                                                  bool>(
                                                                _model.indexSelected !=
                                                                    optionIndex,
                                                                true,
                                                              ) ||
                                                              (_model.indexSelected ==
                                                                  null))
                                                            Expanded(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Text(
                                                                  optionItem
                                                                      .optionTitle,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (valueOrDefault<
                                                              bool>(
                                                            _model.indexSelected ==
                                                                optionIndex,
                                                            false,
                                                          ))
                                                            Expanded(
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Text(
                                                                  optionItem
                                                                      .optionTitle,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            13.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                    if (valueOrDefault<bool>(
                                                      _model.indexSelected ==
                                                          optionIndex,
                                                      false,
                                                    ))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .radio_button_checked_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 18.0,
                                                        ),
                                                      ),
                                                    if (valueOrDefault<bool>(
                                                          _model.indexSelected !=
                                                              optionIndex,
                                                          true,
                                                        ) ||
                                                        (_model.indexSelected ==
                                                            null))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .radio_button_off,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 18.0,
                                                        ),
                                                      ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                if (_model.indexSelected != null)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 14.0, 20.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        if (_model.indexSelected == null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Please select option!',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 2150),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        _model.addVote =
                                            await AddVoteToPollCall.call(
                                          bLappId:
                                              FFLibraryValues().BLProjectId,
                                          bLRestApiKey:
                                              FFLibraryValues().BLRestAPIKey,
                                          optionObjectId: (PollStruct.maybeFromMap(
                                                      interactiveHubGetSpecificGenericPollResponse
                                                          .jsonBody)
                                                  ?.options
                                                  .sortedList(
                                                      keyOf: (e) => e.sortOrder,
                                                      desc: false)
                                                  .elementAtOrNull(
                                                      _model.indexSelected!))
                                              ?.objectId,
                                          userEmail:
                                              FFAppState().currentUser.email,
                                        );

                                        _shouldSetState = true;
                                        if (!(_model.addVote?.succeeded ??
                                            true)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Failed to add vote!',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 2150),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        _model.page = _model.page + 1;
                                        safeSetState(() {});
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                      },
                                      text: 'Confirm Vote',
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconAlignment: IconAlignment.end,
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'buttonOnActionTriggerAnimation']!,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      if ((PollStruct.maybeFromMap(
                                      interactiveHubGetSpecificGenericPollResponse
                                          .jsonBody)
                                  ?.style ==
                              'POLL') &&
                          (_model.page == 3))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'VOTE CONFIRMED',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  'THANKS FOR VOTING',
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
                                        fontSize: 34.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.0,
                                      ),
                                ),
                                Icon(
                                  Icons.check_circle_outline,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.safePop();
                                          },
                                          text: 'Back Home',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                      if (valueOrDefault<bool>(
                        (_model.page > 1) &&
                            (_model.page < 99) &&
                            (PollStruct.maybeFromMap(
                                        interactiveHubGetSpecificGenericPollResponse
                                            .jsonBody)
                                    ?.style ==
                                'QUIZ'),
                        true,
                      ))
                        Container(
                          child: Builder(
                            builder: (context) {
                              final question = PollStruct.maybeFromMap(
                                          interactiveHubGetSpecificGenericPollResponse
                                              .jsonBody)
                                      ?.quizQuestions
                                      .sortedList(
                                          keyOf: (e) => e.sortOrder,
                                          desc: false)
                                      .toList() ??
                                  [];

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: question.length,
                                itemBuilder: (context, questionIndex) {
                                  final questionItem = question[questionIndex];
                                  return Visibility(
                                    visible: valueOrDefault<bool>(
                                      questionIndex == (_model.page - 2),
                                      true,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14.0),
                                      child: Container(
                                        width: 350.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (questionItem.time != 0)
                                                Container(
                                                  width: 350.0,
                                                  height: 12.0,
                                                  child: Opacity(
                                                    opacity:
                                                        questionItem.time == 0
                                                            ? 0.0
                                                            : 1.0,
                                                    child:
                                                        LinearPercentIndicator(
                                                      percent: (questionItem
                                                                      .time ==
                                                                  0) ||
                                                              (questionItem
                                                                      .time ==
                                                                  null)
                                                          ? 0.99
                                                          : ((questionItem.time
                                                                      .toDouble() -
                                                                  (_model
                                                                      .currentTimerValue!)) /
                                                              questionItem.time
                                                                  .toDouble()),
                                                      width: 350.0,
                                                      lineHeight: 12.0,
                                                      animation: true,
                                                      animateFromLastPercent:
                                                          true,
                                                      progressColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      padding: EdgeInsets.zero,
                                                    ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.timer_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 20.0,
                                                    ),
                                                    Text(
                                                      (questionItem.time ==
                                                                  0) ||
                                                              (questionItem
                                                                      .time ==
                                                                  null)
                                                          ? 'No Time Limit'
                                                          : '${valueOrDefault<String>(
                                                              questionItem.time
                                                                  .toString(),
                                                              '10',
                                                            )} Seconds',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
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
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Text(
                                                  'Question ${(_model.page - 1).toString()}',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .bebasNeue(
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
                                                        fontSize: 34.0,
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
                                              if ((questionItem.image !=
                                                          '') &&
                                                  (questionItem.image !=
                                                      'null'))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: Image.network(
                                                      questionItem.image,
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 200.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        questionItem.title,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        30.0, 0.0, 30.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final quizOption =
                                                        questionItem
                                                            .questionOptions
                                                            .sortedList(
                                                                keyOf: (e) =>
                                                                    e.sortOrder,
                                                                desc: false)
                                                            .toList();

                                                    return ListView.separated(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                        0,
                                                        12.0,
                                                        0,
                                                        0,
                                                      ),
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          quizOption.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 8.0),
                                                      itemBuilder: (context,
                                                          quizOptionIndex) {
                                                        final quizOptionItem =
                                                            quizOption[
                                                                quizOptionIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (_model
                                                                .showCorrectAnswers) {
                                                              return;
                                                            }

                                                            _model.showCorrectAnswers =
                                                                true;
                                                            safeSetState(() {});
                                                            if (quizOptionItem
                                                                .correct) {
                                                              _model.currentPointsScore =
                                                                  _model.currentPointsScore +
                                                                      1;
                                                              _model
                                                                  .addToQuizEntry(
                                                                      1);
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model
                                                                  .addToQuizEntry(
                                                                      0);
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            _model.q2Onwards
                                                                ?.cancel();
                                                            _model.q1Only
                                                                ?.cancel();
                                                          },
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12.0),
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (!valueOrDefault<
                                                                    bool>(
                                                                  _model
                                                                      .showCorrectAnswers,
                                                                  true,
                                                                ))
                                                                  Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              23.0),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        () {
                                                                          if (quizOptionIndex ==
                                                                              0) {
                                                                            return 'A';
                                                                          } else if (quizOptionIndex ==
                                                                              1) {
                                                                            return 'B';
                                                                          } else if (quizOptionIndex ==
                                                                              2) {
                                                                            return 'C';
                                                                          } else if (quizOptionIndex ==
                                                                              3) {
                                                                            return 'D';
                                                                          } else if (quizOptionIndex ==
                                                                              4) {
                                                                            return 'E';
                                                                          } else if (quizOptionIndex ==
                                                                              5) {
                                                                            return 'F';
                                                                          } else if (quizOptionIndex ==
                                                                              6) {
                                                                            return 'G';
                                                                          } else if (quizOptionIndex ==
                                                                              7) {
                                                                            return 'H';
                                                                          } else if (quizOptionIndex ==
                                                                              8) {
                                                                            return 'I';
                                                                          } else if (quizOptionIndex ==
                                                                              9) {
                                                                            return 'J';
                                                                          } else {
                                                                            return 'A';
                                                                          }
                                                                        }(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (!quizOptionItem
                                                                        .correct &&
                                                                    _model
                                                                        .showCorrectAnswers)
                                                                  Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .predictorRed,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              23.0),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .close_sharp,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                if (quizOptionItem
                                                                        .correct &&
                                                                    _model
                                                                        .showCorrectAnswers)
                                                                  Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .predictorGreen,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              23.0),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .check_sharp,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      quizOptionItem
                                                                          .title,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                15.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                              if (_model.showCorrectAnswers)
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                30.0,
                                                                20.0,
                                                                30.0,
                                                                15.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (questionIndex ==
                                                            (PollStruct.maybeFromMap(
                                                                        interactiveHubGetSpecificGenericPollResponse
                                                                            .jsonBody)!
                                                                    .quizQuestions
                                                                    .length -
                                                                1)) {
                                                          _model.page = 100;
                                                          safeSetState(() {});
                                                          _model.apiResultk0w =
                                                              await BackendlessDatabaseGroup
                                                                  .addQuizEntryCall
                                                                  .call(
                                                            email: FFAppState()
                                                                .currentUser
                                                                .email,
                                                            name: FFAppState()
                                                                .currentUser
                                                                .name,
                                                            pointsScored: _model
                                                                .currentPointsScore,
                                                            totalPointsAvailable:
                                                                _model
                                                                    .totalPointsAvailable,
                                                            ownerId: FFAppState()
                                                                .currentUserObjectId,
                                                            bLProjectId:
                                                                FFLibraryValues()
                                                                    .BLProjectId,
                                                            bLRestAPIKey:
                                                                FFLibraryValues()
                                                                    .BLRestAPIKey,
                                                            headerName:
                                                                'user-token',
                                                            headerValue:
                                                                FFAppState()
                                                                    .userToken,
                                                            breakdownJson: functions
                                                                .intListToJson(_model
                                                                    .quizEntry
                                                                    .toList()),
                                                          );

                                                          if ((_model
                                                                  .apiResultk0w
                                                                  ?.succeeded ??
                                                              true)) {
                                                            _model.apiResult05r =
                                                                await BackendlessDatabaseGroup
                                                                    .addQuizEntryToPollCall
                                                                    .call(
                                                              pollObjectId:
                                                                  widget
                                                                      .objectId,
                                                              quizEntryObjectId:
                                                                  QuizEntriesStruct.maybeFromMap(
                                                                          (_model.apiResultk0w?.jsonBody ??
                                                                              ''))
                                                                      ?.objectId,
                                                              bLProjectId:
                                                                  FFLibraryValues()
                                                                      .BLProjectId,
                                                              bLRestAPIKey:
                                                                  FFLibraryValues()
                                                                      .BLRestAPIKey,
                                                              headerName:
                                                                  'user-token',
                                                              headerValue:
                                                                  FFAppState()
                                                                      .userToken,
                                                            );
                                                          }
                                                        } else {
                                                          _model.page =
                                                              _model.page + 1;
                                                          safeSetState(() {});
                                                          if (((PollStruct.maybeFromMap(interactiveHubGetSpecificGenericPollResponse
                                                                              .jsonBody)
                                                                          ?.quizQuestions
                                                                          .sortedList(
                                                                              keyOf: (e) => e
                                                                                  .sortOrder,
                                                                              desc:
                                                                                  false)
                                                                          .elementAtOrNull(questionIndex +
                                                                              1))
                                                                      ?.time ==
                                                                  0) ||
                                                              ((PollStruct.maybeFromMap(interactiveHubGetSpecificGenericPollResponse
                                                                              .jsonBody)
                                                                          ?.quizQuestions
                                                                          .sortedList(
                                                                              keyOf: (e) => e.sortOrder,
                                                                              desc: false)
                                                                          .elementAtOrNull(questionIndex + 1))
                                                                      ?.time ==
                                                                  null)) {
                                                            _model.currentTimerValue =
                                                                1.0;
                                                            _model.showCorrectAnswers =
                                                                false;
                                                          } else {
                                                            _model
                                                                .currentTimerValue = (PollStruct.maybeFromMap(
                                                                        interactiveHubGetSpecificGenericPollResponse
                                                                            .jsonBody)
                                                                    ?.quizQuestions
                                                                    .sortedList(
                                                                        keyOf: (e) => e
                                                                            .sortOrder,
                                                                        desc:
                                                                            false)
                                                                    .elementAtOrNull(
                                                                        questionIndex +
                                                                            1))
                                                                ?.time
                                                                .toDouble();
                                                            _model.showCorrectAnswers =
                                                                false;
                                                            _model.q2Onwards =
                                                                InstantTimer
                                                                    .periodic(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      100),
                                                              callback:
                                                                  (timer) async {
                                                                if (_model
                                                                        .currentTimerValue! >
                                                                    0.1) {
                                                                  _model.currentTimerValue =
                                                                      _model.currentTimerValue! +
                                                                          -0.1;
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model
                                                                      .q2Onwards
                                                                      ?.cancel();
                                                                  _model.showCorrectAnswers =
                                                                      true;
                                                                  _model
                                                                      .addToQuizEntry(
                                                                          0);
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              startImmediately:
                                                                  true,
                                                            );
                                                          }
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      text: questionItem
                                                                  .sortOrder ==
                                                              PollStruct.maybeFromMap(
                                                                      interactiveHubGetSpecificGenericPollResponse
                                                                          .jsonBody)
                                                                  ?.quizQuestions
                                                                  .sortedList(
                                                                      keyOf: (e) => e
                                                                          .sortOrder,
                                                                      desc:
                                                                          false)
                                                                  .lastOrNull
                                                                  ?.sortOrder
                                                          ? 'Finish Quiz'
                                                          : 'Next Question',
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 40.0,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      if ((PollStruct.maybeFromMap(
                                      interactiveHubGetSpecificGenericPollResponse
                                          .jsonBody)
                                  ?.style ==
                              'QUIZ') &&
                          (_model.page == 100))
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'THANKS FOR PLAYING!',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  'YOUR SCORE',
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
                                            .primaryText,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  '${valueOrDefault<String>(
                                    formatNumber(
                                      (_model.currentPointsScore /
                                              (_model.totalPointsAvailable!)) *
                                          100,
                                      formatType: FormatType.custom,
                                      format: '#00',
                                      locale: 'en_GB',
                                    ),
                                    '100',
                                  )}%',
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
                                        fontSize: 70.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.0,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            context.safePop();
                                          },
                                          text: 'Go Back',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ].divide(SizedBox(height: 8.0)),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
