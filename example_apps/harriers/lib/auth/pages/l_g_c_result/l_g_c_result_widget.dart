import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import "package:touchline_template_puum0i/backend/schema/structs/index.dart"
    as touchline_template_puum0i_data_schema;
import '/index.dart';
import 'package:touchline_template_puum0i/backend/api_requests/api_calls.dart'
    as touchline_template_puum0i_api_calls_util;
import 'package:touchline_template_puum0i/components/match_sponsors_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/custom_code/actions/index.dart'
    as touchline_template_puum0i_actions;
import 'package:touchline_template_puum0i/custom_code/widgets/index.dart'
    as touchline_template_puum0i_custom_widgets;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:touchline_template_puum0i/lineups/lineups_v1/lineups_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/other_l_g_c/match_gallery_v1/match_gallery_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/predictor/polls_voting/polls_voting_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/stats/stats_v1/stats_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/top_bit/top_bit_v3_specific/top_bit_v3_specific_widget.dart'
    as touchline_template_puum0i;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'l_g_c_result_model.dart';
export 'l_g_c_result_model.dart';

class LGCResultWidget extends StatefulWidget {
  const LGCResultWidget({
    super.key,
    required this.objectId,
  });

  final String? objectId;

  static String routeName = 'LGCResult';
  static String routePath = '/lGCResult';

  @override
  State<LGCResultWidget> createState() => _LGCResultWidgetState();
}

class _LGCResultWidgetState extends State<LGCResultWidget> {
  late LGCResultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LGCResultModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LGCResult'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('L_G_C_RESULT_LGCResult_ON_INIT_STATE');
      logFirebaseEvent('LGCResult_backend_call');
      _model.getFixture = await touchline_template_puum0i_api_calls_util
          .BackendlessDatabaseGroup.getSpecificFixtureCall
          .call(
        objectId: widget.objectId,
        bLProjectId: FFAppConstants.BLProjectId,
        bLRestAPIKey: FFAppConstants.BLRestAPIKey,
      );

      logFirebaseEvent('LGCResult_custom_action');
      _model.decodeHTML =
          await touchline_template_puum0i_actions.fixBackendlessText(
        touchline_template_puum0i_data_schema.BLESSfixtureStruct.maybeFromMap(
                (_model.getFixture?.jsonBody ?? ''))!
            .report,
      );
      logFirebaseEvent('LGCResult_update_page_state');
      _model.reportContent = _model.decodeHTML!;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<
        touchline_template_puum0i_api_calls_util.ApiCallResponse>(
      future: touchline_template_puum0i_api_calls_util
          .BackendlessDatabaseGroup.getSpecificFixtureCall
          .call(
        objectId: widget.objectId,
        bLProjectId: FFAppConstants.BLProjectId,
        bLRestAPIKey: FFAppConstants.BLRestAPIKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 45.0,
                height: 45.0,
                child: SpinKitFoldingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 45.0,
                ),
              ),
            ),
          );
        }
        final lGCResultGetSpecificFixtureResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) =>
                              touchline_template_puum0i_util.wrapWithModel(
                            model: _model.topBitV3SpecificModel,
                            updateCallback: () => safeSetState(() {}),
                            child: touchline_template_puum0i
                                .TopBitV3SpecificWidget(
                              bgImage: FFAppConstants.bgImage,
                              teamAbr: FFAppConstants.ClubABR,
                              matchObjectId: widget.objectId!,
                              onPrimary: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              altTimeColours:
                                  FlutterFlowTheme.of(context).primary,
                              ticketsAction: () async {
                                logFirebaseEvent(
                                    'L_G_C_RESULT_Container_xtvm4t5d_CALLBACK');
                                logFirebaseEvent(
                                    'TopBitV3Specific_navigate_to');

                                context.pushNamed(
                                  TicketsWidget.routeName,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                              predictorAction: () async {
                                logFirebaseEvent(
                                    'L_G_C_RESULT_Container_xtvm4t5d_CALLBACK');
                                logFirebaseEvent(
                                    'TopBitV3Specific_navigate_to');

                                context.pushNamed(
                                  PredictorWidget.routeName,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              },
                              pollAction: (pollObjectId) async {
                                logFirebaseEvent(
                                    'L_G_C_RESULT_Container_xtvm4t5d_CALLBACK');
                                logFirebaseEvent(
                                    'TopBitV3Specific_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: touchline_template_puum0i
                                              .PollsVotingWidget(
                                            userEmail: currentUserEmail,
                                            pollObjectId: pollObjectId,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FlutterFlowChoiceChips(
                              options: [
                                ChipData('Watch'),
                                ChipData('Report'),
                                ChipData('Stats'),
                                ChipData('Lineups'),
                                ChipData('Gallery')
                              ],
                              onChanged: (val) => safeSetState(() =>
                                  _model.choiceChipsValue = val?.firstOrNull),
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                iconColor: FlutterFlowTheme.of(context).info,
                                iconSize: 15.0,
                                labelPadding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 8.0, 15.0, 8.0),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 16.0,
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              chipSpacing: 16.0,
                              rowSpacing: 8.0,
                              multiselect: false,
                              initialized: _model.choiceChipsValue != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                ['Watch'],
                              ),
                              wrapped: false,
                            ),
                          ),
                        ),
                        if (_model.choiceChipsValue == 'Watch')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  if ((touchline_template_puum0i_data_schema.BLESSfixtureStruct.maybeFromMap(
                                                      lGCResultGetSpecificFixtureResponse
                                                          .jsonBody)
                                                  ?.interview !=
                                              null &&
                                          touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct
                                                      .maybeFromMap(
                                                          lGCResultGetSpecificFixtureResponse
                                                              .jsonBody)
                                                  ?.interview !=
                                              '') ||
                                      (touchline_template_puum0i_data_schema.BLESSfixtureStruct.maybeFromMap(
                                                      lGCResultGetSpecificFixtureResponse
                                                          .jsonBody)
                                                  ?.highlights !=
                                              null &&
                                          touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct
                                                      .maybeFromMap(lGCResultGetSpecificFixtureResponse.jsonBody)
                                                  ?.highlights !=
                                              ''))
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible: touchline_template_puum0i_data_schema
                                                                .BLESSfixtureStruct
                                                            .maybeFromMap(
                                                                lGCResultGetSpecificFixtureResponse
                                                                    .jsonBody)
                                                        ?.interview !=
                                                    null &&
                                                touchline_template_puum0i_data_schema
                                                                .BLESSfixtureStruct
                                                            .maybeFromMap(
                                                                lGCResultGetSpecificFixtureResponse
                                                                    .jsonBody)
                                                        ?.interview !=
                                                    '',
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Text(
                                                          'INTERVIEW',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .bebasNeue(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 38.0,
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
                                                      Icon(
                                                        Icons.chevron_right,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 5.0,
                                                                5.0, 5.0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 3.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: ((MediaQuery.sizeOf(
                                                                              context)
                                                                          .width -
                                                                      40) /
                                                                  16) *
                                                              9,
                                                          child: touchline_template_puum0i_custom_widgets
                                                              .YouTubeEmbedWidget(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: ((MediaQuery.sizeOf(context)
                                                                            .width -
                                                                        40) /
                                                                    16) *
                                                                9,
                                                            url: touchline_template_puum0i_data_schema
                                                                        .BLESSfixtureStruct
                                                                    .maybeFromMap(
                                                                        lGCResultGetSpecificFixtureResponse
                                                                            .jsonBody)!
                                                                .interview,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible: touchline_template_puum0i_data_schema
                                                                .BLESSfixtureStruct
                                                            .maybeFromMap(
                                                                lGCResultGetSpecificFixtureResponse
                                                                    .jsonBody)
                                                        ?.highlights !=
                                                    null &&
                                                touchline_template_puum0i_data_schema
                                                                .BLESSfixtureStruct
                                                            .maybeFromMap(
                                                                lGCResultGetSpecificFixtureResponse
                                                                    .jsonBody)
                                                        ?.highlights !=
                                                    '',
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Text(
                                                          'HIGHLIGHTS',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .bebasNeue(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 38.0,
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
                                                      Icon(
                                                        Icons.chevron_right,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.0, 5.0,
                                                                5.0, 5.0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 3.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: ((MediaQuery.sizeOf(
                                                                              context)
                                                                          .width -
                                                                      40) /
                                                                  16) *
                                                              9,
                                                          child: touchline_template_puum0i_custom_widgets
                                                              .YouTubeEmbedWidget(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: ((MediaQuery.sizeOf(context)
                                                                            .width -
                                                                        40) /
                                                                    16) *
                                                                9,
                                                            url: touchline_template_puum0i_data_schema
                                                                        .BLESSfixtureStruct
                                                                    .maybeFromMap(
                                                                        lGCResultGetSpecificFixtureResponse
                                                                            .jsonBody)!
                                                                .highlights,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].addToEnd(SizedBox(height: 80.0)),
                                    ),
                                  if ((touchline_template_puum0i_data_schema.BLESSfixtureStruct.maybeFromMap(
                                                      lGCResultGetSpecificFixtureResponse
                                                          .jsonBody)
                                                  ?.interview ==
                                              null ||
                                          touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct
                                                      .maybeFromMap(
                                                          lGCResultGetSpecificFixtureResponse
                                                              .jsonBody)
                                                  ?.interview ==
                                              '') &&
                                      (touchline_template_puum0i_data_schema.BLESSfixtureStruct.maybeFromMap(
                                                      lGCResultGetSpecificFixtureResponse
                                                          .jsonBody)
                                                  ?.highlights ==
                                              null ||
                                          touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct
                                                      .maybeFromMap(lGCResultGetSpecificFixtureResponse.jsonBody)
                                                  ?.highlights ==
                                              ''))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: Icon(
                                                Icons.video_collection,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 60.0,
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Text(
                                                'VIDEOS',
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.bebasNeue(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      fontSize: 50.0,
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
                                            Text(
                                              'WILL BE PUBLISHED HERE AFTER \nMATCH CONCLUSION ',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
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
                            ),
                          ),
                        if (_model.choiceChipsValue == 'Report')
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            child: Stack(
                              children: [
                                if (touchline_template_puum0i_data_schema
                                                    .BLESSfixtureStruct
                                                .maybeFromMap(
                                                    lGCResultGetSpecificFixtureResponse
                                                        .jsonBody)
                                            ?.report ==
                                        null ||
                                    touchline_template_puum0i_data_schema
                                                    .BLESSfixtureStruct
                                                .maybeFromMap(
                                                    lGCResultGetSpecificFixtureResponse
                                                        .jsonBody)
                                            ?.report ==
                                        '')
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Icon(
                                              Icons.newspaper,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 60.0,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Text(
                                              'REPORT',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.bebasNeue(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 50.0,
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
                                          Text(
                                            'WILL BE PUBLISHED HERE AFTER \nMATCH CONCLUSION ',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (touchline_template_puum0i_data_schema
                                                    .BLESSfixtureStruct
                                                .maybeFromMap(
                                                    lGCResultGetSpecificFixtureResponse
                                                        .jsonBody)
                                            ?.report !=
                                        null &&
                                    touchline_template_puum0i_data_schema
                                                    .BLESSfixtureStruct
                                                .maybeFromMap(
                                                    lGCResultGetSpecificFixtureResponse
                                                        .jsonBody)
                                            ?.report !=
                                        '')
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 0.0),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.newspaper,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 35.0,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'MATCH REPORT',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .bebasNeue(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 44.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child:
                                                  touchline_template_puum0i_custom_widgets
                                                      .ResponsiveHtmlViewer2(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 400.0,
                                                htmlContent:
                                                    _model.reportContent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        if (_model.choiceChipsValue == 'Stats')
                          touchline_template_puum0i_util.wrapWithModel(
                            model: _model.statsV1Model,
                            updateCallback: () => safeSetState(() {}),
                            child: touchline_template_puum0i.StatsV1Widget(
                              matchObjectId: widget.objectId!,
                              homeImage: touchline_template_puum0i_data_schema
                                          .BLESSfixtureStruct
                                      .maybeFromMap(
                                          lGCResultGetSpecificFixtureResponse
                                              .jsonBody)!
                                  .homeBadge,
                              awayImage: touchline_template_puum0i_data_schema
                                          .BLESSfixtureStruct
                                      .maybeFromMap(
                                          lGCResultGetSpecificFixtureResponse
                                              .jsonBody)!
                                  .awayBadge,
                            ),
                          ),
                        if (_model.choiceChipsValue == 'Lineups')
                          AuthUserStreamWidget(
                            builder: (context) =>
                                touchline_template_puum0i_util.wrapWithModel(
                              model: _model.lineupsV1Model,
                              updateCallback: () => safeSetState(() {}),
                              child: touchline_template_puum0i.LineupsV1Widget(
                                headerColour: Colors.black,
                                homeTeamName: touchline_template_puum0i_data_schema
                                            .BLESSfixtureStruct
                                        .maybeFromMap(
                                            lGCResultGetSpecificFixtureResponse
                                                .jsonBody)!
                                    .homeTeamName,
                                awayTeamName: touchline_template_puum0i_data_schema
                                            .BLESSfixtureStruct
                                        .maybeFromMap(
                                            lGCResultGetSpecificFixtureResponse
                                                .jsonBody)!
                                    .awayTeamName,
                                homeTeamBadge:
                                    touchline_template_puum0i_data_schema
                                                .BLESSfixtureStruct
                                            .maybeFromMap(
                                                lGCResultGetSpecificFixtureResponse
                                                    .jsonBody)!
                                        .homeBadge,
                                awayTeamBadge:
                                    touchline_template_puum0i_data_schema
                                                .BLESSfixtureStruct
                                            .maybeFromMap(
                                                lGCResultGetSpecificFixtureResponse
                                                    .jsonBody)!
                                        .awayBadge,
                                listPlayerData:
                                    touchline_template_puum0i_data_schema
                                                .BLESSfixtureStruct
                                            .maybeFromMap(
                                                lGCResultGetSpecificFixtureResponse
                                                    .jsonBody)!
                                        .homeLineupJSON,
                                awayTeamData: touchline_template_puum0i_data_schema
                                            .BLESSfixtureStruct
                                        .maybeFromMap(
                                            lGCResultGetSpecificFixtureResponse
                                                .jsonBody)!
                                    .awayLineupJSON,
                                userName: currentUserDisplayName,
                                objectId: widget.objectId!,
                                lineupsOnOff: touchline_template_puum0i_data_schema
                                            .BLESSfixtureStruct
                                        .maybeFromMap(
                                            lGCResultGetSpecificFixtureResponse
                                                .jsonBody)!
                                    .lineupsOnOff,
                                lineupsBuilderOnOff:
                                    touchline_template_puum0i_data_schema
                                                .BLESSfixtureStruct
                                            .maybeFromMap(
                                                lGCResultGetSpecificFixtureResponse
                                                    .jsonBody)!
                                        .lineupsBuilderOnOff,
                                userEmail: currentUserEmail,
                                start: touchline_template_puum0i_data_schema
                                            .BLESSfixtureStruct
                                        .maybeFromMap(
                                            lGCResultGetSpecificFixtureResponse
                                                .jsonBody)!
                                    .start,
                                squadPlayerClickAction: (playerObjectId) async {
                                  logFirebaseEvent(
                                      'L_G_C_RESULT_Container_eagss4x4_CALLBACK');
                                  logFirebaseEvent('LineupsV1_navigate_to');

                                  context.pushNamed(
                                    PlayerPageWidget.routeName,
                                    queryParameters: {
                                      'objectId': serializeParam(
                                        playerObjectId,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        if (_model.choiceChipsValue == 'Gallery')
                          touchline_template_puum0i_util.wrapWithModel(
                            model: _model.matchGalleryV1Model,
                            updateCallback: () => safeSetState(() {}),
                            child:
                                touchline_template_puum0i.MatchGalleryV1Widget(
                              matchObjectId: widget.objectId!,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: touchline_template_puum0i_util.wrapWithModel(
                            model: _model.matchSponsorsModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child:
                                touchline_template_puum0i.MatchSponsorsWidget(
                              matchSponsors:
                                  touchline_template_puum0i_data_schema
                                              .BLESSfixtureStruct
                                          .maybeFromMap(
                                              lGCResultGetSpecificFixtureResponse
                                                  .jsonBody)
                                      ?.sponsorship,
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
        );
      },
    );
  }
}
