import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import "package:touchline_template_puum0i/backend/schema/structs/index.dart"
    as touchline_template_puum0i_data_schema;
import '/index.dart';
import 'package:touchline_template_puum0i/backend/api_requests/api_calls.dart'
    as touchline_template_puum0i_api_calls_util;
import 'package:touchline_template_puum0i/components/full_league_table_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/components/live_text_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/components/match_sponsors_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:touchline_template_puum0i/lineups/lineups_v1/lineups_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/predictor/polls_voting/polls_voting_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/stats/stats_v1/stats_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/todays_games/todays_games/todays_games_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/top_bit/top_bit_v3_specific/top_bit_v3_specific_widget.dart'
    as touchline_template_puum0i;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'l_g_c_live_model.dart';
export 'l_g_c_live_model.dart';

class LGCLiveWidget extends StatefulWidget {
  const LGCLiveWidget({
    super.key,
    required this.objectId,
  });

  final String? objectId;

  static String routeName = 'LGCLive';
  static String routePath = '/lGCLive';

  @override
  State<LGCLiveWidget> createState() => _LGCLiveWidgetState();
}

class _LGCLiveWidgetState extends State<LGCLiveWidget> {
  late LGCLiveModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LGCLiveModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LGCLive'});
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
        final lGCLiveGetSpecificFixtureResponse = snapshot.data!;

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
                                    'L_G_C_LIVE_Container_qr1s7x22_CALLBACK');
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
                                    'L_G_C_LIVE_Container_qr1s7x22_CALLBACK');
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
                                    'L_G_C_LIVE_Container_qr1s7x22_CALLBACK');
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FlutterFlowChoiceChips(
                                    options: [
                                      ChipData('Live Text'),
                                      ChipData('Lineups'),
                                      ChipData('Stats'),
                                      ChipData('Scores'),
                                      ChipData('Table')
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
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
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
                                    chipSpacing: 8.0,
                                    rowSpacing: 8.0,
                                    multiselect: false,
                                    initialized:
                                        _model.choiceChipsValue != null,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      ['Lineups'],
                                    ),
                                    wrapped: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_model.choiceChipsValue == 'Live Text')
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              touchline_template_puum0i_util.wrapWithModel(
                                model: _model.liveTextV1Model,
                                updateCallback: () => safeSetState(() {}),
                                child:
                                    touchline_template_puum0i.LiveTextV1Widget(
                                  matchObjectId: widget.objectId!,
                                ),
                              ),
                            ]
                                .addToStart(SizedBox(height: 15.0))
                                .addToEnd(SizedBox(height: 40.0)),
                          ),
                        if (_model.choiceChipsValue == 'Lineups')
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) =>
                                    touchline_template_puum0i_util
                                        .wrapWithModel(
                                  model: _model.lineupsV1Model,
                                  updateCallback: () => safeSetState(() {}),
                                  child:
                                      touchline_template_puum0i.LineupsV1Widget(
                                    headerColour: Colors.black,
                                    homeTeamName:
                                        touchline_template_puum0i_data_schema
                                                    .BLESSfixtureStruct
                                                .maybeFromMap(
                                                    lGCLiveGetSpecificFixtureResponse
                                                        .jsonBody)!
                                            .homeTeamName,
                                    awayTeamName:
                                        touchline_template_puum0i_data_schema
                                                    .BLESSfixtureStruct
                                                .maybeFromMap(
                                                    lGCLiveGetSpecificFixtureResponse
                                                        .jsonBody)!
                                            .awayTeamName,
                                    homeTeamBadge:
                                        touchline_template_puum0i_data_schema
                                                    .BLESSfixtureStruct
                                                .maybeFromMap(
                                                    lGCLiveGetSpecificFixtureResponse
                                                        .jsonBody)!
                                            .homeBadge,
                                    awayTeamBadge:
                                        touchline_template_puum0i_data_schema
                                                    .BLESSfixtureStruct
                                                .maybeFromMap(
                                                    lGCLiveGetSpecificFixtureResponse
                                                        .jsonBody)!
                                            .awayBadge,
                                    listPlayerData:
                                        touchline_template_puum0i_data_schema
                                                    .BLESSfixtureStruct
                                                .maybeFromMap(
                                                    lGCLiveGetSpecificFixtureResponse
                                                        .jsonBody)!
                                            .homeLineupJSON,
                                    awayTeamData:
                                        touchline_template_puum0i_data_schema
                                                    .BLESSfixtureStruct
                                                .maybeFromMap(
                                                    lGCLiveGetSpecificFixtureResponse
                                                        .jsonBody)!
                                            .awayLineupJSON,
                                    userName: currentUserDisplayName,
                                    objectId: widget.objectId!,
                                    lineupsOnOff:
                                        touchline_template_puum0i_data_schema
                                                    .BLESSfixtureStruct
                                                .maybeFromMap(
                                                    lGCLiveGetSpecificFixtureResponse
                                                        .jsonBody)!
                                            .lineupsOnOff,
                                    lineupsBuilderOnOff:
                                        touchline_template_puum0i_data_schema
                                                    .BLESSfixtureStruct
                                                .maybeFromMap(
                                                    lGCLiveGetSpecificFixtureResponse
                                                        .jsonBody)!
                                            .lineupsBuilderOnOff,
                                    userEmail: currentUserEmail,
                                    start: touchline_template_puum0i_data_schema
                                                .BLESSfixtureStruct
                                            .maybeFromMap(
                                                lGCLiveGetSpecificFixtureResponse
                                                    .jsonBody)!
                                        .start,
                                    squadPlayerClickAction:
                                        (playerObjectId) async {
                                      logFirebaseEvent(
                                          'L_G_C_LIVE_Container_mh58ke40_CALLBACK');
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
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ].addToEnd(SizedBox(height: 40.0)),
                          ),
                        if (_model.choiceChipsValue == 'Stats')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 12.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 40.0),
                                child: touchline_template_puum0i_util
                                    .wrapWithModel(
                                  model: _model.statsV1Model,
                                  updateCallback: () => safeSetState(() {}),
                                  child:
                                      touchline_template_puum0i.StatsV1Widget(
                                    matchObjectId: widget.objectId!,
                                    homeImage: touchline_template_puum0i_data_schema
                                                .BLESSfixtureStruct
                                            .maybeFromMap(
                                                lGCLiveGetSpecificFixtureResponse
                                                    .jsonBody)!
                                        .homeBadge,
                                    awayImage: touchline_template_puum0i_data_schema
                                                .BLESSfixtureStruct
                                            .maybeFromMap(
                                                lGCLiveGetSpecificFixtureResponse
                                                    .jsonBody)!
                                        .awayBadge,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (_model.choiceChipsValue == 'Scores')
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(
                                      'assets/jsons/Animation_-_1738025204020.json',
                                      width: 25.0,
                                      height: 25.0,
                                      fit: BoxFit.contain,
                                      animate: true,
                                    ),
                                    Text(
                                      'LIVE SCORES',
                                      style: FlutterFlowTheme.of(context)
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
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              touchline_template_puum0i_util.wrapWithModel(
                                model: _model.todaysGamesModel,
                                updateCallback: () => safeSetState(() {}),
                                child:
                                    touchline_template_puum0i.TodaysGamesWidget(
                                  otherGames: touchline_template_puum0i_data_schema
                                              .BLESSfixtureStruct
                                          .maybeFromMap(
                                              lGCLiveGetSpecificFixtureResponse
                                                  .jsonBody)!
                                      .otherGames,
                                ),
                              ),
                            ],
                          ),
                        if (_model.choiceChipsValue == 'Table')
                          SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                touchline_template_puum0i_util.wrapWithModel(
                                  model: _model.fullLeagueTableV1Model,
                                  updateCallback: () => safeSetState(() {}),
                                  child: touchline_template_puum0i
                                      .FullLeagueTableV1Widget(
                                    teamName: 'Kidderminster Harriers',
                                    autoPromotionIndex: 0,
                                    playoffIndex: 6,
                                    relegationIndex: 19,
                                  ),
                                ),
                              ],
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
                                              lGCLiveGetSpecificFixtureResponse
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
