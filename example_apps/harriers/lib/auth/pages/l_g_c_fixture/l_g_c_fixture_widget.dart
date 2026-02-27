import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import "package:touchline_template_puum0i/backend/schema/structs/index.dart"
    as touchline_template_puum0i_data_schema;
import '/index.dart';
import 'package:touchline_template_puum0i/backend/api_requests/api_calls.dart'
    as touchline_template_puum0i_api_calls_util;
import 'package:touchline_template_puum0i/cms/combined_c_m_s_v1/combined_c_m_s_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/components/live_text_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/components/match_sponsors_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:touchline_template_puum0i/league_table/league_table_v2/league_table_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/lineups/lineups_v1/lineups_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/predictor/polls_voting/polls_voting_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/latest_news_title_v2/latest_news_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/league_table_title_v2/league_table_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/top_bit/top_bit_v3_specific/top_bit_v3_specific_widget.dart'
    as touchline_template_puum0i;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'l_g_c_fixture_model.dart';
export 'l_g_c_fixture_model.dart';

class LGCFixtureWidget extends StatefulWidget {
  const LGCFixtureWidget({
    super.key,
    required this.objectId,
  });

  final String? objectId;

  static String routeName = 'LGCFixture';
  static String routePath = '/lGCFixture';

  @override
  State<LGCFixtureWidget> createState() => _LGCFixtureWidgetState();
}

class _LGCFixtureWidgetState extends State<LGCFixtureWidget> {
  late LGCFixtureModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LGCFixtureModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LGCFixture'});
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
        final lGCFixtureGetSpecificFixtureResponse = snapshot.data!;

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
                                    'L_G_C_FIXTURE_Container_l0gdc1lf_CALLBAC');
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
                                    'L_G_C_FIXTURE_Container_l0gdc1lf_CALLBAC');
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
                                    'L_G_C_FIXTURE_Container_l0gdc1lf_CALLBAC');
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FlutterFlowChoiceChips(
                                    options: [
                                      ChipData('Overview'),
                                      ChipData('Live Text'),
                                      ChipData('Lineups')
                                    ],
                                    onChanged: (val) => safeSetState(() =>
                                        _model.choiceChipsValue =
                                            val?.firstOrNull),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      iconColor:
                                          FlutterFlowTheme.of(context).info,
                                      iconSize: 15.0,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15.0, 8.0, 15.0, 8.0),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      iconSize: 16.0,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15.0, 8.0, 15.0, 8.0),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    chipSpacing: 16.0,
                                    rowSpacing: 8.0,
                                    multiselect: false,
                                    initialized:
                                        _model.choiceChipsValue != null,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      ['Overview'],
                                    ),
                                    wrapped: false,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (_model.choiceChipsValue == 'Overview')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  touchline_template_puum0i_util.wrapWithModel(
                                    model: _model.leagueTableTitleV2Model,
                                    updateCallback: () => safeSetState(() {}),
                                    child: touchline_template_puum0i
                                        .LeagueTableTitleV2Widget(),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: touchline_template_puum0i_util
                                        .wrapWithModel(
                                      model: _model.leagueTableV2Model,
                                      updateCallback: () => safeSetState(() {}),
                                      child: touchline_template_puum0i
                                          .LeagueTableV2Widget(
                                        teamName: 'Kidderminster Harriers',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (_model.choiceChipsValue == 'Overview')
                          Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: touchline_template_puum0i_util
                                            .wrapWithModel(
                                          model: _model.latestNewsTitleV2Model,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: touchline_template_puum0i
                                              .LatestNewsTitleV2Widget(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (getRemoteConfigBool(
                                            'combinedNewsFeed'))
                                          touchline_template_puum0i_util
                                              .wrapWithModel(
                                            model: _model.combinedCMSV1Model,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: touchline_template_puum0i
                                                .CombinedCMSV1Widget(
                                              numberToFetch: 5,
                                              clickAction:
                                                  (cmsPostObjectId) async {
                                                logFirebaseEvent(
                                                    'L_G_C_FIXTURE_Container_mf3lqk2j_CALLBAC');
                                                logFirebaseEvent(
                                                    'CombinedCMSV1_navigate_to');

                                                context.pushNamed(
                                                  CmsPostWidget.routeName,
                                                  queryParameters: {
                                                    'objectId': serializeParam(
                                                      cmsPostObjectId,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                    ),
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                      ].divide(SizedBox(height: 5.0)),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        if (_model.choiceChipsValue == 'Live Text')
                          touchline_template_puum0i_util.wrapWithModel(
                            model: _model.liveTextV1Model,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: touchline_template_puum0i.LiveTextV1Widget(
                              matchObjectId: widget.objectId!,
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
                                            lGCFixtureGetSpecificFixtureResponse
                                                .jsonBody)!
                                    .homeTeamName,
                                awayTeamName: touchline_template_puum0i_data_schema
                                            .BLESSfixtureStruct
                                        .maybeFromMap(
                                            lGCFixtureGetSpecificFixtureResponse
                                                .jsonBody)!
                                    .awayTeamName,
                                homeTeamBadge: touchline_template_puum0i_data_schema
                                            .BLESSfixtureStruct
                                        .maybeFromMap(
                                            lGCFixtureGetSpecificFixtureResponse
                                                .jsonBody)!
                                    .homeBadge,
                                awayTeamBadge: touchline_template_puum0i_data_schema
                                            .BLESSfixtureStruct
                                        .maybeFromMap(
                                            lGCFixtureGetSpecificFixtureResponse
                                                .jsonBody)!
                                    .awayBadge,
                                listPlayerData:
                                    touchline_template_puum0i_data_schema
                                                .BLESSfixtureStruct
                                            .maybeFromMap(
                                                lGCFixtureGetSpecificFixtureResponse
                                                    .jsonBody)!
                                        .homeLineupJSON,
                                awayTeamData: touchline_template_puum0i_data_schema
                                            .BLESSfixtureStruct
                                        .maybeFromMap(
                                            lGCFixtureGetSpecificFixtureResponse
                                                .jsonBody)!
                                    .awayLineupJSON,
                                userName: currentUserDisplayName,
                                objectId: widget.objectId!,
                                lineupsOnOff: touchline_template_puum0i_data_schema
                                            .BLESSfixtureStruct
                                        .maybeFromMap(
                                            lGCFixtureGetSpecificFixtureResponse
                                                .jsonBody)!
                                    .lineupsOnOff,
                                lineupsBuilderOnOff:
                                    touchline_template_puum0i_data_schema
                                                .BLESSfixtureStruct
                                            .maybeFromMap(
                                                lGCFixtureGetSpecificFixtureResponse
                                                    .jsonBody)!
                                        .lineupsBuilderOnOff,
                                userEmail: currentUserEmail,
                                start: touchline_template_puum0i_data_schema
                                            .BLESSfixtureStruct
                                        .maybeFromMap(
                                            lGCFixtureGetSpecificFixtureResponse
                                                .jsonBody)!
                                    .start,
                                squadPlayerClickAction: (playerObjectId) async {
                                  logFirebaseEvent(
                                      'L_G_C_FIXTURE_Container_yy206f2v_CALLBAC');
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: touchline_template_puum0i_util.wrapWithModel(
                            model: _model.matchSponsorsModel,
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child:
                                touchline_template_puum0i.MatchSponsorsWidget(
                              matchSponsors: touchline_template_puum0i_data_schema
                                          .BLESSfixtureStruct
                                      .maybeFromMap(
                                          lGCFixtureGetSpecificFixtureResponse
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
