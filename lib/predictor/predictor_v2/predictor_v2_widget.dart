import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'predictor_v2_model.dart';
export 'predictor_v2_model.dart';

class PredictorV2Widget extends StatefulWidget {
  const PredictorV2Widget({
    super.key,
    required this.userEmail,
    required this.userName,
    required this.userUID,
    required this.backArrowColour,
    this.gradientCol1,
    this.gradientCol2,
    String? sponsorName,
    Color? sponsorColour,
    required this.sponsorImage,
  })  : this.sponsorName = sponsorName ?? 'Sponsor',
        this.sponsorColour = sponsorColour ?? const Color(0xFFBA0808);

  final String? userEmail;
  final String? userName;
  final String? userUID;
  final Color? backArrowColour;

  /// default primary
  final Color? gradientCol1;

  /// default accent 1
  final Color? gradientCol2;

  final String sponsorName;
  final Color sponsorColour;
  final String? sponsorImage;

  @override
  State<PredictorV2Widget> createState() => _PredictorV2WidgetState();
}

class _PredictorV2WidgetState extends State<PredictorV2Widget>
    with TickerProviderStateMixin {
  late PredictorV2Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PredictorV2Model());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.6, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.6, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 50.0, 10.0, 6.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Icon(
                      Icons.keyboard_backspace,
                      color: widget.backArrowColour,
                      size: 40.0,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: BackendlessDatabaseGroup.predictorNextGameCall.call(
                      time: getCurrentTimestamp.millisecondsSinceEpoch,
                      teamObjectId: FFLibraryValues().focusTeamObjectId,
                      bLProjectId: FFLibraryValues().BLProjectId,
                      bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
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
                      final containerPredictorNextGameResponse = snapshot.data!;

                      return Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: BackendlessDatabaseGroup
                                .playerNewPredictorCall
                                .call(
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              final columnPlayerNewPredictorResponse =
                                  snapshot.data!;

                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 125.0,
                                          height: 125.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                valueOrDefault<Color>(
                                                  widget.gradientCol2,
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                                ),
                                                valueOrDefault<Color>(
                                                  widget.gradientCol1,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                )
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              end: AlignmentDirectional(
                                                  1.0, 1.0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.asset(
                                                'assets/images/Harriers_Logo_PNG_White.png',
                                                width: 200.0,
                                                height: 200.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation1']!),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  FFLibraryValues()
                                                      .NicknamePlural,
                                                  'Nickname',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 26.0,
                                                          letterSpacing: 0.5,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation1']!),
                                              Text(
                                                'PREDICTOR',
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
                                                      fontSize: 55.0,
                                                      letterSpacing: 1.5,
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
                                              ).animateOnPageLoad(animationsMap[
                                                  'textOnPageLoadAnimation2']!),
                                              Text(
                                                'POWERED BY',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                            ].divide(SizedBox(height: 2.0)),
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            widget.sponsorColour,
                                            Colors.black,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              widget.sponsorImage!,
                                              width: 200.0,
                                              height: 200.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation2']!),
                                    ),
                                    if (valueOrDefault<bool>(
                                      _model.page == 1,
                                      true,
                                    ))
                                      FutureBuilder<ApiCallResponse>(
                                        future: BackendlessDatabaseGroup
                                            .checkIfTheyvePlayedPredictorThisWeekCall
                                            .call(
                                          matchObjectId:
                                              (containerPredictorNextGameResponse
                                                          .jsonBody
                                                          .toList()
                                                          .map<BLESSfixtureStruct?>(
                                                              BLESSfixtureStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          BLESSfixtureStruct?>)
                                                  .withoutNulls
                                                  .firstOrNull
                                                  ?.objectId,
                                          uid: widget.userUID,
                                          bLProjectId:
                                              FFLibraryValues().BLProjectId,
                                          bLRestAPIKey:
                                              FFLibraryValues().BLRestAPIKey,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final pageoneCheckIfTheyvePlayedPredictorThisWeekResponse =
                                              snapshot.data!;

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'CURRENT MATCH',
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
                                                                    .secondaryText,
                                                                fontSize: 12.0,
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
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      14.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          (containerPredictorNextGameResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>)
                                                                              .withoutNulls
                                                                              .firstOrNull!
                                                                              .homeBadge,
                                                                          width:
                                                                              60.0,
                                                                          height:
                                                                              60.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          (containerPredictorNextGameResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>)
                                                                              .withoutNulls
                                                                              .firstOrNull
                                                                              ?.homeTeamName,
                                                                          'Telford',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'VS',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.bebasNeue(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 26.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.18,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          'Enter by: ${dateTimeFormat("d/M h:mm a", functions.convertFromMills((containerPredictorNextGameResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull!.start))}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          (containerPredictorNextGameResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>)
                                                                              .withoutNulls
                                                                              .firstOrNull!
                                                                              .awayBadge,
                                                                          width:
                                                                              60.0,
                                                                          height:
                                                                              60.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          (containerPredictorNextGameResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>)
                                                                              .withoutNulls
                                                                              .firstOrNull
                                                                              ?.awayTeamName,
                                                                          'Telford',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Opacity(
                                                          opacity: (pageoneCheckIfTheyvePlayedPredictorThisWeekResponse
                                                                          .jsonBody
                                                                          .toList()
                                                                          .map<ObjectIdOnlyStruct?>(
                                                                              ObjectIdOnlyStruct.maybeFromMap)
                                                                          .toList() as Iterable<ObjectIdOnlyStruct?>)
                                                                      .withoutNulls
                                                                      .length >
                                                                  0
                                                              ? 0.6
                                                              : 1.0,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed: ((pageoneCheckIfTheyvePlayedPredictorThisWeekResponse
                                                                              .jsonBody
                                                                              .toList()
                                                                              .map<ObjectIdOnlyStruct?>(ObjectIdOnlyStruct.maybeFromMap)
                                                                              .toList() as Iterable<ObjectIdOnlyStruct?>)
                                                                          .withoutNulls
                                                                          .length >
                                                                      0)
                                                                  ? null
                                                                  : () async {
                                                                      if (getCurrentTimestamp
                                                                              .millisecondsSinceEpoch ==
                                                                          (containerPredictorNextGameResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>)
                                                                              .withoutNulls
                                                                              .firstOrNull
                                                                              ?.start) {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return WebViewAware(
                                                                              child: AlertDialog(
                                                                                title: Text('Deadline passed!'),
                                                                                content: Text('Not able to play Predictor after KO time!'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          },
                                                                        );
                                                                        return;
                                                                      } else {
                                                                        _model.page =
                                                                            2;
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    },
                                                              text: 'Enter Now',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 40.0,
                                                                padding: EdgeInsetsDirectional
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .bebasNeue(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          25.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
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
                                                            if ((pageoneCheckIfTheyvePlayedPredictorThisWeekResponse
                                                                        .jsonBody
                                                                        .toList()
                                                                        .map<ObjectIdOnlyStruct?>(
                                                                            ObjectIdOnlyStruct.maybeFromMap)
                                                                        .toList() as Iterable<ObjectIdOnlyStruct?>)
                                                                    .withoutNulls
                                                                    .length >
                                                                0)
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'You\'ve already entered this match!',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
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
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                        lineHeight:
                                                                            1.0,
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
                                              ),
                                              Opacity(
                                                opacity: 0.0,
                                                child: Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons.tasks,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 15.0,
                                                      ),
                                                      Text(
                                                        'View Predictor Table >',
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
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    if (_model.page == 2)
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
                                                padding: EdgeInsets.all(10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'STEP 1/2',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                                      'SCORE',
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
                                                                fontSize: 45.0,
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
                                                                lineHeight: 1.0,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  14.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  (containerPredictorNextGameResponse
                                                                          .jsonBody
                                                                          .toList()
                                                                          .map<BLESSfixtureStruct?>(
                                                                              BLESSfixtureStruct.maybeFromMap)
                                                                          .toList() as Iterable<BLESSfixtureStruct?>)
                                                                      .withoutNulls
                                                                      .firstOrNull!
                                                                      .homeBadge,
                                                                  width: 65.0,
                                                                  height: 65.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 45.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              valueOrDefault<double>(
                                                                        FFLibraryValues()
                                                                            .BRBottomLeft
                                                                            ?.toDouble(),
                                                                        0.0,
                                                                      )),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              valueOrDefault<double>(
                                                                        FFLibraryValues()
                                                                            .BRBottomRight
                                                                            ?.toDouble(),
                                                                        0.0,
                                                                      )),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              valueOrDefault<double>(
                                                                        FFLibraryValues()
                                                                            .BRTopLeft
                                                                            ?.toDouble(),
                                                                        0.0,
                                                                      )),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              valueOrDefault<double>(
                                                                        FFLibraryValues()
                                                                            .BRTopRight
                                                                            ?.toDouble(),
                                                                        0.0,
                                                                      )),
                                                                    ),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0x00E0E3E7),
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      FlutterFlowCountController(
                                                                    decrementIconBuilder:
                                                                        (enabled) =>
                                                                            FaIcon(
                                                                      FontAwesomeIcons
                                                                          .minus,
                                                                      color: enabled
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondaryText
                                                                          : FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    incrementIconBuilder:
                                                                        (enabled) =>
                                                                            FaIcon(
                                                                      FontAwesomeIcons
                                                                          .plus,
                                                                      color: enabled
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    countBuilder:
                                                                        (count) =>
                                                                            Text(
                                                                      count
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                          ),
                                                                    ),
                                                                    count: _model
                                                                            .homeScoreValue ??=
                                                                        _model
                                                                            .homeScore,
                                                                    updateCount:
                                                                        (count) =>
                                                                            safeSetState(() =>
                                                                                _model.homeScoreValue = count),
                                                                    stepSize: 1,
                                                                    minimum: 0,
                                                                    maximum: 25,
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 5.0)),
                                                          ),
                                                          Text(
                                                            'VS',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                  fontSize:
                                                                      26.0,
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
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  (containerPredictorNextGameResponse
                                                                          .jsonBody
                                                                          .toList()
                                                                          .map<BLESSfixtureStruct?>(
                                                                              BLESSfixtureStruct.maybeFromMap)
                                                                          .toList() as Iterable<BLESSfixtureStruct?>)
                                                                      .withoutNulls
                                                                      .firstOrNull!
                                                                      .awayBadge,
                                                                  width: 65.0,
                                                                  height: 65.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 45.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              valueOrDefault<double>(
                                                                        FFLibraryValues()
                                                                            .BRBottomLeft
                                                                            ?.toDouble(),
                                                                        0.0,
                                                                      )),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              valueOrDefault<double>(
                                                                        FFLibraryValues()
                                                                            .BRBottomRight
                                                                            ?.toDouble(),
                                                                        0.0,
                                                                      )),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              valueOrDefault<double>(
                                                                        FFLibraryValues()
                                                                            .BRTopLeft
                                                                            ?.toDouble(),
                                                                        0.0,
                                                                      )),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              valueOrDefault<double>(
                                                                        FFLibraryValues()
                                                                            .BRTopRight
                                                                            ?.toDouble(),
                                                                        0.0,
                                                                      )),
                                                                    ),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Color(
                                                                          0x00E0E3E7),
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      FlutterFlowCountController(
                                                                    decrementIconBuilder:
                                                                        (enabled) =>
                                                                            FaIcon(
                                                                      FontAwesomeIcons
                                                                          .minus,
                                                                      color: enabled
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondaryText
                                                                          : FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    incrementIconBuilder:
                                                                        (enabled) =>
                                                                            FaIcon(
                                                                      FontAwesomeIcons
                                                                          .plus,
                                                                      color: enabled
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    countBuilder:
                                                                        (count) =>
                                                                            Text(
                                                                      count
                                                                          .toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                          ),
                                                                    ),
                                                                    count: _model
                                                                            .awayScoreValue ??=
                                                                        _model
                                                                            .awayScore,
                                                                    updateCount:
                                                                        (count) =>
                                                                            safeSetState(() =>
                                                                                _model.awayScoreValue = count),
                                                                    stepSize: 1,
                                                                    minimum: 0,
                                                                    maximum: 25,
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 5.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    ),
                                                    Row(
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
                                                              _model.page =
                                                                  _model.page +
                                                                      -1;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: 'Back',
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
                                                                  .secondaryText,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .bebasNeue(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            25.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
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
                                                        Expanded(
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              _model.page =
                                                                  _model.page +
                                                                      1;
                                                              _model.homeScore =
                                                                  _model
                                                                      .homeScoreValue!;
                                                              _model.awayScore =
                                                                  _model
                                                                      .awayScoreValue!;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: 'Next',
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
                                                                            .bebasNeue(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            25.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
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
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
                                                    Text(
                                                      'STEP 2/2',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                                      'FIRST ${FFLibraryValues().ClubShortName} SCORER',
                                                      textAlign:
                                                          TextAlign.center,
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
                                                                fontSize: 45.0,
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
                                                                lineHeight: 1.0,
                                                              ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final player = (columnPlayerNewPredictorResponse
                                                                        .jsonBody
                                                                        .toList()
                                                                        .map<PlayerStruct?>(PlayerStruct
                                                                            .maybeFromMap)
                                                                        .toList()
                                                                    as Iterable<
                                                                        PlayerStruct?>)
                                                                .withoutNulls
                                                                .toList() ??
                                                            [];

                                                        return SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: List.generate(
                                                                    player
                                                                        .length,
                                                                    (playerIndex) {
                                                              final playerItem =
                                                                  player[
                                                                      playerIndex];
                                                              return InkWell(
                                                                splashColor: Colors
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
                                                                  _model.telfordPlayerIndexSelected =
                                                                      playerIndex;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFLibraryValues()
                                                                          .BRBottomLeft
                                                                          ?.toDouble(),
                                                                      0.0,
                                                                    )),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            valueOrDefault<double>(
                                                                      FFLibraryValues()
                                                                          .BRBottomRight
                                                                          ?.toDouble(),
                                                                      0.0,
                                                                    )),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                      FFLibraryValues()
                                                                          .BRTopLeft
                                                                          ?.toDouble(),
                                                                      0.0,
                                                                    )),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            valueOrDefault<double>(
                                                                      FFLibraryValues()
                                                                          .BRTopRight
                                                                          ?.toDouble(),
                                                                      0.0,
                                                                    )),
                                                                  ),
                                                                  child:
                                                                      AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            360),
                                                                    curve: Curves
                                                                        .easeInOut,
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
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
                                                                          FFLibraryValues()
                                                                              .BRTopLeft
                                                                              ?.toDouble(),
                                                                          0.0,
                                                                        )),
                                                                        topRight:
                                                                            Radius.circular(valueOrDefault<double>(
                                                                          FFLibraryValues()
                                                                              .BRTopRight
                                                                              ?.toDouble(),
                                                                          0.0,
                                                                        )),
                                                                      ),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          _model.telfordPlayerIndexSelected == playerIndex
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : FlutterFlowTheme.of(context).secondaryBackground,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                        ),
                                                                        width:
                                                                            4.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Opacity(
                                                                          opacity:
                                                                              0.5,
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              playerItem.playerPictureurl,
                                                                              width: 300.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                4.0,
                                                                                4.0,
                                                                                8.0),
                                                                            child:
                                                                                Text(
                                                                              playerItem.playerName,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            })
                                                                .divide(SizedBox(
                                                                    width:
                                                                        12.0))
                                                                .addToStart(
                                                                    SizedBox(
                                                                        width:
                                                                            10.0))
                                                                .addToEnd(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                _model.page =
                                                                    _model.page +
                                                                        -1;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              text: 'Back',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
                                                                padding: EdgeInsetsDirectional
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .bebasNeue(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          25.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
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
                                                          Expanded(
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                _model.page =
                                                                    _model.page +
                                                                        2;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              text: 'Next',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
                                                                padding: EdgeInsetsDirectional
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .bebasNeue(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          25.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
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
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (_model.page == 5)
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'SUBMIT PREDICTIONS',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                                      'YOUR PICKS',
                                                      textAlign:
                                                          TextAlign.center,
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
                                                                fontSize: 45.0,
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
                                                                lineHeight: 1.0,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .sports_soccer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Score:',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
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
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${(containerPredictorNextGameResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.homeAbr} ${_model.homeScore.toString()} - ${_model.awayScore.toString()} ${(containerPredictorNextGameResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList() as Iterable<BLESSfixtureStruct?>).withoutNulls.firstOrNull?.awayAbr}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .tshirt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'First ${FFLibraryValues().ClubABR} Scorer:',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
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
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                ((columnPlayerNewPredictorResponse
                                                                            .jsonBody
                                                                            .toList()
                                                                            .map<PlayerStruct?>(PlayerStruct.maybeFromMap)
                                                                            .toList() as Iterable<PlayerStruct?>)
                                                                        .withoutNulls
                                                                        .elementAtOrNull(_model.telfordPlayerIndexSelected))
                                                                    ?.playerName,
                                                                'PlayerName',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                _model.page =
                                                                    _model.page +
                                                                        -2;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              text: 'Back',
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 40.0,
                                                                padding: EdgeInsetsDirectional
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .bebasNeue(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          25.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
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
                                                          Expanded(
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                var _shouldSetState =
                                                                    false;
                                                                if (widget.userEmail ==
                                                                        null ||
                                                                    widget.userEmail ==
                                                                        '') {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          title:
                                                                              Text('No Bucks Account'),
                                                                          content:
                                                                              Text('Sign up with email, Google or Apple to play the Predictor'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                  Navigator.pop(
                                                                      context);
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                } else {
                                                                  if (getCurrentTimestamp
                                                                          .millisecondsSinceEpoch >
                                                                      (containerPredictorNextGameResponse
                                                                              .jsonBody
                                                                              .toList()
                                                                              .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
                                                                              .toList() as Iterable<BLESSfixtureStruct?>)
                                                                          .withoutNulls
                                                                          .firstOrNull!
                                                                          .start) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            title:
                                                                                Text('Deadline passed!'),
                                                                            content:
                                                                                Text('This will not be counted'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                    Navigator.pop(
                                                                        context);
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  } else {
                                                                    _model.apiResultsia =
                                                                        await BackendlessDatabaseGroup
                                                                            .playPredictorOneCall
                                                                            .call(
                                                                      awayScore:
                                                                          _model
                                                                              .awayScore,
                                                                      homeScore:
                                                                          _model
                                                                              .homeScore,
                                                                      email: widget
                                                                          .userEmail,
                                                                      name: widget
                                                                          .userName,
                                                                      scorerName:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        ((columnPlayerNewPredictorResponse.jsonBody.toList().map<PlayerStruct?>(PlayerStruct.maybeFromMap).toList() as Iterable<PlayerStruct?>).withoutNulls.elementAtOrNull(_model.telfordPlayerIndexSelected))
                                                                            ?.playerName,
                                                                        'Player Name',
                                                                      ),
                                                                      uid: widget
                                                                          .userUID,
                                                                      bLProjectId:
                                                                          FFLibraryValues()
                                                                              .BLProjectId,
                                                                      bLRestAPIKey:
                                                                          FFLibraryValues()
                                                                              .BLRestAPIKey,
                                                                      headerName: FFAppState().userToken != ''
                                                                          ? 'user-token'
                                                                          : 'Content-Type',
                                                                      headerValue: FFAppState().userToken !=
                                                                                  ''
                                                                          ? FFAppState()
                                                                              .userToken
                                                                          : 'application/json',
                                                                    );

                                                                    _shouldSetState =
                                                                        true;
                                                                    if ((_model
                                                                            .apiResultsia
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      _model.apiResult788 = await BackendlessDatabaseGroup
                                                                          .playPredictorTwoCall
                                                                          .call(
                                                                        objectId: BackendlessDatabaseGroup
                                                                            .playPredictorOneCall
                                                                            .objectId(
                                                                          (_model.apiResultsia?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        objectIdToAdd: (containerPredictorNextGameResponse.jsonBody.toList().map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap).toList()
                                                                                as Iterable<BLESSfixtureStruct?>)
                                                                            .withoutNulls
                                                                            .firstOrNull
                                                                            ?.objectId,
                                                                        bLProjectId:
                                                                            FFLibraryValues().BLProjectId,
                                                                        bLRestAPIKey:
                                                                            FFLibraryValues().BLRestAPIKey,
                                                                        headerName: FFAppState().userToken != ''
                                                                            ? 'user-token'
                                                                            : 'Content-Type',
                                                                        headerValue: FFAppState().userToken != ''
                                                                            ? FFAppState().userToken
                                                                            : 'application/json',
                                                                      );

                                                                      _shouldSetState =
                                                                          true;
                                                                      if ((_model
                                                                              .apiResult788
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Predictions Entered!',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).success,
                                                                          ),
                                                                        );
                                                                        context
                                                                            .safePop();
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'That failed. Please try again.',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        );
                                                                      }
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'That failed. Please try again.',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                      );
                                                                    }
                                                                  }
                                                                }

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                              },
                                                              text: 'Submit',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                padding: EdgeInsetsDirectional
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .bebasNeue(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          25.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
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
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
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
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
