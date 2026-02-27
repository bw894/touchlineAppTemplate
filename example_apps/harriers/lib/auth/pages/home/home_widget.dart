import '/auth/account_drop_down_kidderminster/account_drop_down_kidderminster_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import "package:touchline_template_puum0i/backend/schema/structs/index.dart"
    as touchline_template_puum0i_data_schema;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:touchline_template_puum0i/actions/actions.dart'
    as touchline_template_puum0i_action_blocks;
import 'package:touchline_template_puum0i/app_state.dart'
    as touchline_template_puum0i_app_state;
import 'package:touchline_template_puum0i/backend/api_requests/api_calls.dart'
    as touchline_template_puum0i_api_calls_util;
import 'package:touchline_template_puum0i/cms/combined_c_m_s_v1/combined_c_m_s_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/components/sponsor_ad_carousel_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/components/vote_non_fixture_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/custom_code/actions/index.dart'
    as touchline_template_puum0i_actions;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:touchline_template_puum0i/index.dart'
    as $touchline_template_puum0i;
import 'package:touchline_template_puum0i/league_table/league_table_v2/league_table_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/next_fixture_sliders/next_fixtures_slider_v2/next_fixtures_slider_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/predictor/polls_voting/polls_voting_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/social_icons/social_icons_v2/social_icons_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/squad_hub/squad_hub_slider_v3/squad_hub_slider_v3_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/customtitlev1/customtitlev1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/league_table_title_v2/league_table_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/next_up_title_v2/next_up_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/social_media_title_v2/social_media_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/squad_hub_title_v2/squad_hub_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/vote_now_title_v2/vote_now_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/x_latest_title_v2/x_latest_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/top_bit/top_bit_v3_home/top_bit_v3_home_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/x_feed/x_feed_v3/x_feed_v3_widget.dart'
    as touchline_template_puum0i;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Home'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_Home_ON_INIT_STATE');
      logFirebaseEvent('Home_custom_action');
      await actions.startDynalinkListener(
        context,
      );
      logFirebaseEvent('Home_action_block');
      _model.newToken =
          await touchline_template_puum0i_action_blocks.initalRoute(
        context,
        authEmail: currentUserEmail,
        authUserToken: valueOrDefault(currentUserDocument?.authToken, ''),
        uid: currentUserUid,
      );
      if ((_model.newToken != null && _model.newToken != '') &&
          (_model.newToken != 'failed')) {
        logFirebaseEvent('Home_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          authToken: _model.newToken,
        ));
      }
      logFirebaseEvent('Home_custom_action');
      _model.bottomPadding =
          await touchline_template_puum0i_actions.setNavBarPadding(
        context,
      );
      logFirebaseEvent('Home_update_app_state');
      touchline_template_puum0i_app_state.FFAppState().bottomPaddingHeight =
          _model.bottomPadding!;
      touchline_template_puum0i_app_state.FFAppState().update(() {});
      logFirebaseEvent('Home_action_block');
      await touchline_template_puum0i_action_blocks.launchCampaigns(context);
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
    context.watch<touchline_template_puum0i_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: FutureBuilder<
            touchline_template_puum0i_api_calls_util.ApiCallResponse>(
          future: touchline_template_puum0i_api_calls_util
              .BackendlessDatabaseGroup.upcomingOneFixturesCall
              .call(
            time: getCurrentTimestamp.millisecondsSinceEpoch,
            bLProjectId: FFAppConstants.BLProjectId,
            bLRestAPIKey: FFAppConstants.BLRestAPIKey,
            teamObjectId: FFAppConstants.focusTeamId,
            headerName: 'Content-Type',
            headerValue: 'application/json',
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 45.0,
                  height: 45.0,
                  child: SpinKitFoldingCube(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 45.0,
                  ),
                ),
              );
            }
            final stackUpcomingOneFixturesResponse = snapshot.data!;

            return Stack(
              children: [
                Opacity(
                  opacity: 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/bg3-min.png',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) =>
                            touchline_template_puum0i_util.wrapWithModel(
                          model: _model.topBitV3HomeModel,
                          updateCallback: () => safeSetState(() {}),
                          child: touchline_template_puum0i.TopBitV3HomeWidget(
                            bgImage: FFAppConstants.bgImage,
                            onPrimary: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            altTimeColours:
                                FlutterFlowTheme.of(context).primary,
                            teamAbr: FFAppConstants.ClubABR,
                            teamObjectIds:
                                touchline_template_puum0i_app_state.FFAppState()
                                            .currentUser
                                            .teams
                                            .length ==
                                        0
                                    ? FFAppConstants.backupTeamIds
                                    : touchline_template_puum0i_app_state
                                            .FFAppState()
                                        .currentUser
                                        .teams
                                        .sortedList(
                                            keyOf: (e) => e.sortOrder,
                                            desc: false)
                                        .map((e) => e.objectId)
                                        .toList(),
                            lGCFixture: (matchObjectId) async {
                              logFirebaseEvent(
                                  'HOME_PAGE_Container_5tw1vmxo_CALLBACK');
                              logFirebaseEvent('TopBitV3Home_navigate_to');

                              context.pushNamed(
                                LGCFixtureWidget.routeName,
                                queryParameters: {
                                  'objectId': serializeParam(
                                    matchObjectId,
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
                            lGCLive: (matchObjectId) async {
                              logFirebaseEvent(
                                  'HOME_PAGE_Container_5tw1vmxo_CALLBACK');
                              logFirebaseEvent('TopBitV3Home_navigate_to');

                              context.pushNamed(
                                LGCLiveWidget.routeName,
                                queryParameters: {
                                  'objectId': serializeParam(
                                    matchObjectId,
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
                            ticketsAction: () async {
                              logFirebaseEvent(
                                  'HOME_PAGE_Container_5tw1vmxo_CALLBACK');
                              logFirebaseEvent('TopBitV3Home_navigate_to');

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
                                  'HOME_PAGE_Container_5tw1vmxo_CALLBACK');
                              logFirebaseEvent('TopBitV3Home_navigate_to');

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
                                  'HOME_PAGE_Container_5tw1vmxo_CALLBACK');
                              logFirebaseEvent('TopBitV3Home_alert_dialog');
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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ((stackUpcomingOneFixturesResponse.jsonBody
                                          .toList()
                                          .map<
                                                  touchline_template_puum0i_data_schema
                                                  .BLESSfixtureStruct?>(
                                              touchline_template_puum0i_data_schema
                                                  .BLESSfixtureStruct.maybeFromMap)
                                          .toList()
                                      as Iterable<
                                          touchline_template_puum0i_data_schema
                                          .BLESSfixtureStruct?>)
                                  .withoutNulls
                                  .length !=
                              0)
                            Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  touchline_template_puum0i_util.wrapWithModel(
                                    model: _model.nextUpTitleV2Model,
                                    updateCallback: () => safeSetState(() {}),
                                    child: touchline_template_puum0i
                                        .NextUpTitleV2Widget(),
                                  ),
                                  touchline_template_puum0i_util.wrapWithModel(
                                    model: _model.nextFixturesSliderV2Model,
                                    updateCallback: () => safeSetState(() {}),
                                    child: touchline_template_puum0i
                                        .NextFixturesSliderV2Widget(
                                      fixtureAction: (matchObjectId) async {
                                        logFirebaseEvent(
                                            'HOME_PAGE_Container_3qgzefmm_CALLBACK');
                                        logFirebaseEvent(
                                            'NextFixturesSliderV2_navigate_to');

                                        context.pushNamed(
                                          LGCFixtureWidget.routeName,
                                          queryParameters: {
                                            'objectId': serializeParam(
                                              matchObjectId,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent('HOME_PAGE_THETABLE_ON_TAP');
                              logFirebaseEvent('THETABLE_navigate_to');

                              context.pushNamed(
                                LeagueTableWidget.routeName,
                                extra: <String, dynamic>{
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                  ),
                                },
                              );
                            },
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
                          FutureBuilder<
                              touchline_template_puum0i_api_calls_util
                              .ApiCallResponse>(
                            future: touchline_template_puum0i_api_calls_util
                                .BackendlessDatabaseGroup.checkForAllPollsCall
                                .call(
                              currentTime:
                                  getCurrentTimestamp.millisecondsSinceEpoch,
                              bLProjectId: FFAppConstants.BLProjectId,
                              bLRestAPIKey: FFAppConstants.BLRestAPIKey,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 45.0,
                                    height: 45.0,
                                    child: SpinKitFoldingCube(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 45.0,
                                    ),
                                  ),
                                );
                              }
                              final votenowCheckForAllPollsResponse =
                                  snapshot.data!;

                              return Container(
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: (votenowCheckForAllPollsResponse
                                                  .jsonBody
                                                  .toList()
                                                  .map<
                                                          touchline_template_puum0i_data_schema
                                                          .PollStruct?>(
                                                      touchline_template_puum0i_data_schema
                                                          .PollStruct.maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  touchline_template_puum0i_data_schema
                                                  .PollStruct?>)
                                          .withoutNulls
                                          .length !=
                                      0,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      touchline_template_puum0i_util
                                          .wrapWithModel(
                                        model: _model.voteNowTitleV2Model,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: touchline_template_puum0i
                                            .VoteNowTitleV2Widget(),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: touchline_template_puum0i_util
                                            .wrapWithModel(
                                          model: _model.voteNonFixtureV1Model,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: touchline_template_puum0i
                                              .VoteNonFixtureV1Widget(
                                            polls: (votenowCheckForAllPollsResponse
                                                        .jsonBody
                                                        .toList()
                                                        .map<
                                                                touchline_template_puum0i_data_schema
                                                                .PollStruct?>(
                                                            touchline_template_puum0i_data_schema
                                                                .PollStruct
                                                                .maybeFromMap)
                                                        .toList()
                                                    as Iterable<
                                                        touchline_template_puum0i_data_schema
                                                        .PollStruct?>)
                                                .withoutNulls,
                                            onTap: (pollObjectId) async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_Container_uto3y12o_CALLBACK');
                                              logFirebaseEvent(
                                                  'VoteNonFixtureV1_navigate_to');

                                              context.pushNamed(
                                                $touchline_template_puum0i
                                                    .InteractiveHubWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'objectId': serializeParam(
                                                    pollObjectId,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  '__transition_info__touchline_template_puum0i':
                                                      TransitionInfo(
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
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          touchline_template_puum0i_util.wrapWithModel(
                            model: _model.sponsorAdCarouselV1Model,
                            updateCallback: () => safeSetState(() {}),
                            child: touchline_template_puum0i
                                .SponsorAdCarouselV1Widget(
                              locationKey: 'home',
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 6.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HOME_PAGE_Container_r9bhihwx_ON_TAP');
                                      logFirebaseEvent(
                                          'CUSTOMTITLEV1_navigate_to');

                                      context.pushNamed(
                                        NewsArchiveNewWidget.routeName,
                                        extra: <String, dynamic>{
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    },
                                    child: touchline_template_puum0i_util
                                        .wrapWithModel(
                                      model: _model.customtitlev1Model,
                                      updateCallback: () => safeSetState(() {}),
                                      child: touchline_template_puum0i
                                          .Customtitlev1Widget(
                                        part1: 'CLUB',
                                        part2: 'LATEST',
                                      ),
                                    ),
                                  ),
                                ),
                                touchline_template_puum0i_util.wrapWithModel(
                                  model: _model.combinedCMSV1Model,
                                  updateCallback: () => safeSetState(() {}),
                                  child: touchline_template_puum0i
                                      .CombinedCMSV1Widget(
                                    numberToFetch: 5,
                                    clickAction: (cmsPostObjectId) async {
                                      logFirebaseEvent(
                                          'HOME_PAGE_Container_26agwwp3_CALLBACK');
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
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                touchline_template_puum0i_util.wrapWithModel(
                                  model: _model.squadHubTitleV2Model,
                                  updateCallback: () => safeSetState(() {}),
                                  child: touchline_template_puum0i
                                      .SquadHubTitleV2Widget(),
                                ),
                                touchline_template_puum0i_util.wrapWithModel(
                                  model: _model.squadHubSliderV3Model,
                                  updateCallback: () => safeSetState(() {}),
                                  child: touchline_template_puum0i
                                      .SquadHubSliderV3Widget(
                                    tapAction: (playerObjectId) async {
                                      logFirebaseEvent(
                                          'HOME_PAGE_Container_pafpvoif_CALLBACK');
                                      logFirebaseEvent(
                                          'SquadHubSliderV3_navigate_to');

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
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: touchline_template_puum0i_util
                                      .wrapWithModel(
                                    model: _model.xLatestTitleV2Model,
                                    updateCallback: () => safeSetState(() {}),
                                    child: touchline_template_puum0i
                                        .XLatestTitleV2Widget(),
                                  ),
                                ),
                                touchline_template_puum0i_util.wrapWithModel(
                                  model: _model.xFeedV3Model,
                                  updateCallback: () => safeSetState(() {}),
                                  child:
                                      touchline_template_puum0i.XFeedV3Widget(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                touchline_template_puum0i_util.wrapWithModel(
                                  model: _model.socialMediaTitleV2Model,
                                  updateCallback: () => safeSetState(() {}),
                                  child: touchline_template_puum0i
                                      .SocialMediaTitleV2Widget(),
                                ),
                                touchline_template_puum0i_util.wrapWithModel(
                                  model: _model.socialIconsV2Model,
                                  updateCallback: () => safeSetState(() {}),
                                  child: touchline_template_puum0i
                                      .SocialIconsV2Widget(
                                    tikTokOnOFF: true,
                                    facebookOnOFF: true,
                                    instagramOnOFF: true,
                                    xOnOFF: true,
                                    tiktokLink:
                                        'https://www.tiktok.com/@khfcofficial?lang=en',
                                    fbLink:
                                        'https://www.facebook.com/khfcofficial',
                                    instaLink:
                                        'https://www.instagram.com/khfcofficial/?hl=en',
                                    xLink: 'https://x.com/khfcofficial',
                                    ytOnOff: true,
                                    ytLink:
                                        'https://www.youtube.com/@khfcofficial',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 32.0))
                            .around(SizedBox(height: 32.0)),
                      ),
                    ].addToEnd(SizedBox(height: 75.0)),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.9, -0.85),
                  child: Builder(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent('HOME_PAGE_Container_4k1h2voe_ON_TAP');
                        logFirebaseEvent('Container_alert_dialog');
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
                                    FocusScope.of(dialogContext).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: AccountDropDownKidderminsterWidget(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5.0,
                        shape: const CircleBorder(),
                        child: ClipOval(
                          child: Container(
                            width: 65.0,
                            height: 65.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                width: 2.0,
                              ),
                            ),
                            child: AuthUserStreamWidget(
                              builder: (context) => ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    currentUserPhoto,
                                    'https://api.kibouapp.co.uk/6D654B32-2E5D-4E11-98F9-BACF8B9930B5/C7DEECF4-82EB-4F42-86BD-49ACA7E19114/files/Harriers+Logo+PNG+White.png',
                                  ),
                                  width: 1.0,
                                  height: 200.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navbarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavbarWidget(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
