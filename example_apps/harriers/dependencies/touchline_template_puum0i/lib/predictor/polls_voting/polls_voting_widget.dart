import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'polls_voting_model.dart';
export 'polls_voting_model.dart';

class PollsVotingWidget extends StatefulWidget {
  const PollsVotingWidget({
    super.key,
    required this.userEmail,
    required this.pollObjectId,
  });

  final String? userEmail;
  final String? pollObjectId;

  @override
  State<PollsVotingWidget> createState() => _PollsVotingWidgetState();
}

class _PollsVotingWidgetState extends State<PollsVotingWidget>
    with TickerProviderStateMixin {
  late PollsVotingModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PollsVotingModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 460.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 6.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_outlined,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: BackendlessDatabaseGroup.getSpecificPollCall.call(
                    pollObjectId: widget!.pollObjectId,
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
                    final containerGetSpecificPollResponse = snapshot.data!;

                    return Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
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
                        padding: EdgeInsets.all(20.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: BackendlessDatabaseGroup
                              .checkIfUserHasVotedCall
                              .call(
                            userEmail: widget!.userEmail,
                            pollObjectId: widget!.pollObjectId,
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
                            final columnCheckIfUserHasVotedResponse =
                                snapshot.data!;

                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        if (PollStruct.maybeFromMap(
                                                        containerGetSpecificPollResponse
                                                            .jsonBody)
                                                    ?.relatedMatch
                                                    ?.homeBadge !=
                                                null &&
                                            PollStruct.maybeFromMap(
                                                        containerGetSpecificPollResponse
                                                            .jsonBody)
                                                    ?.relatedMatch
                                                    ?.homeBadge !=
                                                '')
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              PollStruct.maybeFromMap(
                                                      containerGetSpecificPollResponse
                                                          .jsonBody)!
                                                  .relatedMatch
                                                  .homeBadge,
                                              width: 48.0,
                                              height: 48.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Text(
                                            'VOTE',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.bebasNeue(
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
                                                  fontSize: 48.0,
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
                                        if (PollStruct.maybeFromMap(
                                                        containerGetSpecificPollResponse
                                                            .jsonBody)
                                                    ?.relatedMatch
                                                    ?.awayBadge !=
                                                null &&
                                            PollStruct.maybeFromMap(
                                                        containerGetSpecificPollResponse
                                                            .jsonBody)
                                                    ?.relatedMatch
                                                    ?.awayBadge !=
                                                '')
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              PollStruct.maybeFromMap(
                                                      containerGetSpecificPollResponse
                                                          .jsonBody)!
                                                  .relatedMatch
                                                  .awayBadge,
                                              width: 48.0,
                                              height: 48.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                  ),
                                  if (valueOrDefault<bool>(
                                    _model.page == 1,
                                    true,
                                  ))
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 4.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                PollStruct.maybeFromMap(
                                                        containerGetSpecificPollResponse
                                                            .jsonBody)
                                                    ?.title,
                                                'Poll Title',
                                              ),
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.5,
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
                                        Builder(
                                          builder: (context) {
                                            final option = PollStruct.maybeFromMap(
                                                        containerGetSpecificPollResponse
                                                            .jsonBody)
                                                    ?.options
                                                    ?.sortedList(
                                                        keyOf: (e) =>
                                                            e.sortOrder,
                                                        desc: false)
                                                    ?.toList() ??
                                                [];

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: option.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 13.0),
                                              itemBuilder:
                                                  (context, optionIndex) {
                                                final optionItem =
                                                    option[optionIndex];
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
                                                    if ((optionIndex ==
                                                            _model
                                                                .indexSelected) &&
                                                        (_model.indexSelected !=
                                                            null)) {
                                                      _model.indexSelected =
                                                          null;
                                                      safeSetState(() {});
                                                    } else {
                                                      _model.indexSelected =
                                                          optionIndex;
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  child: ClipRRect(
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
                                                      topLeft: Radius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                        FFLibraryValues()
                                                            .BRTopLeft
                                                            ?.toDouble(),
                                                        0.0,
                                                      )),
                                                      topRight: Radius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                        FFLibraryValues()
                                                            .BRTopRight
                                                            ?.toDouble(),
                                                        0.0,
                                                      )),
                                                    ),
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 370),
                                                      curve: Curves.easeInOut,
                                                      width: 100.0,
                                                      height: 70.0,
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          () {
                                                            if (_model
                                                                    .indexSelected ==
                                                                null) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground;
                                                            } else if (_model
                                                                    .indexSelected ==
                                                                optionIndex) {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary;
                                                            } else {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground;
                                                            }
                                                          }(),
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Visibility(
                                                                    visible: optionItem.image !=
                                                                            null &&
                                                                        optionItem.image !=
                                                                            '',
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: Image
                                                                          .network(
                                                                        optionItem
                                                                            .image,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.18,
                                                                        height:
                                                                            200.0,
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
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        optionItem
                                                                            .optionTitle,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        optionItem
                                                                            .optionTitle,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 13.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ),
                                                          if (valueOrDefault<
                                                              bool>(
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 18.0,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                        ].divide(SizedBox(
                                                            width: 5.0)),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model.indexSelected !=
                                                        null)
                                                      Opacity(
                                                        opacity: valueOrDefault<
                                                            double>(
                                                          (columnCheckIfUserHasVotedResponse
                                                                          .jsonBody
                                                                          .toList()
                                                                          .map<PollStruct?>(
                                                                              PollStruct.maybeFromMap)
                                                                          .toList() as Iterable<PollStruct?>)
                                                                      .withoutNulls
                                                                      ?.length !=
                                                                  0
                                                              ? 0.5
                                                              : 1.0,
                                                          1.0,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed: ((columnCheckIfUserHasVotedResponse
                                                                            .jsonBody
                                                                            .toList()
                                                                            .map<PollStruct?>(PollStruct.maybeFromMap)
                                                                            .toList() as Iterable<PollStruct?>)
                                                                        .withoutNulls
                                                                        ?.length !=
                                                                    0)
                                                                ? null
                                                                : () async {
                                                                    var _shouldSetState =
                                                                        false;
                                                                    if (_model
                                                                            .indexSelected ==
                                                                        null) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Please select option!',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 2150),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).error,
                                                                        ),
                                                                      );
                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                    _model.addVote =
                                                                        await AddVoteToPollCall
                                                                            .call(
                                                                      bLappId:
                                                                          FFLibraryValues()
                                                                              .BLProjectId,
                                                                      bLRestApiKey:
                                                                          FFLibraryValues()
                                                                              .BLRestAPIKey,
                                                                      optionObjectId: (PollStruct.maybeFromMap(containerGetSpecificPollResponse.jsonBody)
                                                                              ?.options
                                                                              ?.elementAtOrNull(_model.indexSelected!))
                                                                          ?.objectId,
                                                                      userEmail:
                                                                          widget!
                                                                              .userEmail,
                                                                    );

                                                                    _shouldSetState =
                                                                        true;
                                                                    if (!(_model
                                                                            .addVote
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Failed to add vote!',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 2150),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).error,
                                                                        ),
                                                                      );
                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                      return;
                                                                    }
                                                                    _model.page =
                                                                        3;
                                                                    safeSetState(
                                                                        () {});
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                  },
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              (columnCheckIfUserHasVotedResponse
                                                                              .jsonBody
                                                                              .toList()
                                                                              .map<PollStruct?>(PollStruct.maybeFromMap)
                                                                              .toList() as Iterable<PollStruct?>)
                                                                          .withoutNulls
                                                                          ?.length !=
                                                                      0
                                                                  ? 'Already voted!'
                                                                  : 'Confirm Vote',
                                                              'Confirm Vote',
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: MediaQuery
                                                                          .sizeOf(
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
                                                              iconAlignment:
                                                                  IconAlignment
                                                                      .end,
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
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
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRBottomLeft
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRBottomRight
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRTopLeft
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                topRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRTopRight
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                              ),
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'buttonOnActionTriggerAnimation']!,
                                                          ),
                                                        ),
                                                      ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Voting Closes: ${dateTimeFormat("EEEE, d MMM @ HH:mm a", DateTime.fromMillisecondsSinceEpoch(valueOrDefault<int>(
                                                                    PollStruct.maybeFromMap(
                                                                            containerGetSpecificPollResponse.jsonBody)
                                                                        ?.endDatetime,
                                                                    0,
                                                                  )))}',
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
                                                                    lineHeight:
                                                                        1.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 10.0)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                  if (_model.page == 3)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'VOTE CONFIRMED',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                  Text(
                                                    'THANKS FOR VOTING',
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
                                                  Icon(
                                                    Icons.check_circle_outline,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            text: 'Close',
                                                            options:
                                                                FFButtonOptions(
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
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRBottomLeft
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRBottomRight
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRTopLeft
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                topRight: Radius
                                                                    .circular(
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
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
