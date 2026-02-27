import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import "package:touchline_template_puum0i/backend/schema/structs/index.dart"
    as touchline_template_puum0i_data_schema;
import '/index.dart';
import 'package:touchline_template_puum0i/app_state.dart'
    as touchline_template_puum0i_app_state;
import 'package:touchline_template_puum0i/backend/api_requests/api_calls.dart'
    as touchline_template_puum0i_api_calls_util;
import 'package:touchline_template_puum0i/flutter_flow/custom_functions.dart'
    as touchline_template_puum0i_functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<touchline_template_puum0i_app_state.FFAppState>();

    return Container(
      width: double.infinity,
      height: valueOrDefault<double>(
        touchline_template_puum0i_app_state.FFAppState().bottomPaddingHeight +
            90,
        90.0,
      ),
      decoration: BoxDecoration(
        color: Color(0x00EEEEEE),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: valueOrDefault<double>(
                    touchline_template_puum0i_app_state.FFAppState()
                            .bottomPaddingHeight +
                        80,
                    80.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0x1A57636C),
                        offset: Offset(
                          0.0,
                          -10.0,
                        ),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                hoverIconColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.home_rounded,
                  color: valueOrDefault<Color>(
                    () {
                      if ('kidderminsterharriers://kidderminsterharriers.com${GoRouterState.of(context).uri.toString()}' ==
                          'kidderminsterharriers://kidderminsterharriers.com/home') {
                        return FlutterFlowTheme.of(context).primary;
                      } else if ('kidderminsterharriers://kidderminsterharriers.com${GoRouterState.of(context).uri.toString()}' ==
                          'kidderminsterharriers://kidderminsterharriers.com/') {
                        return FlutterFlowTheme.of(context).primary;
                      } else {
                        return Color(0xFF9299A1);
                      }
                    }(),
                    Color(0xFF9299A1),
                  ),
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('NAVBAR_COMP_home_rounded_ICN_ON_TAP');
                  if ('kidderminsterharriers://kidderminsterharriers.com${GoRouterState.of(context).uri.toString()}' ==
                      'kidderminsterharriers://kidderminsterharriers.com/home') {
                    return;
                  }

                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(
                    HomeWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                hoverIconColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.calendar_today,
                  color: valueOrDefault<Color>(
                    'kidderminsterharriers://kidderminsterharriers.com${GoRouterState.of(context).uri.toString()}' ==
                            'kidderminsterharriers://kidderminsterharriers.com/games'
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0xFF9299A1),
                    Color(0xFF9299A1),
                  ),
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('NAVBAR_COMP_calendar_today_ICN_ON_TAP');
                  if ('kidderminsterharriers://kidderminsterharriers.com${GoRouterState.of(context).uri.toString()}' ==
                      'kidderminsterharriers://kidderminsterharriers.com/games') {
                    return;
                  }

                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(
                    GamesWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FutureBuilder<
                      touchline_template_puum0i_api_calls_util.ApiCallResponse>(
                    future: touchline_template_puum0i_api_calls_util
                        .BackendlessDatabaseGroup
                        .upcomingOneFixturesStartEndCall
                        .call(
                      time: getCurrentTimestamp.millisecondsSinceEpoch,
                      teamObjectId: FFAppConstants.focusTeamId,
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
                              color: FlutterFlowTheme.of(context).primary,
                              size: 45.0,
                            ),
                          ),
                        );
                      }
                      final stackUpcomingOneFixturesStartEndResponse =
                          snapshot.data!;

                      return Stack(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        children: [
                          if (!valueOrDefault<bool>(
                            touchline_template_puum0i_functions
                                .isWithinEventWindow(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        valueOrDefault<int>(
                                      (stackUpcomingOneFixturesStartEndResponse
                                                  .jsonBody
                                                  .toList()
                                                  .map<
                                                          touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct?>(
                                                      touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  touchline_template_puum0i_data_schema
                                                  .BLESSfixtureStruct?>)
                                          .withoutNulls
                                          .firstOrNull
                                          ?.start,
                                      0,
                                    )),
                                    DateTime.fromMillisecondsSinceEpoch(
                                        valueOrDefault<int>(
                                      (stackUpcomingOneFixturesStartEndResponse
                                                  .jsonBody
                                                  .toList()
                                                  .map<
                                                          touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct?>(
                                                      touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  touchline_template_puum0i_data_schema
                                                  .BLESSfixtureStruct?>)
                                          .withoutNulls
                                          .firstOrNull
                                          ?.end,
                                      0,
                                    )),
                                    getCurrentTimestamp),
                            true,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'NAVBAR_COMP_Container_lp0rwlf7_ON_TAP');
                                  logFirebaseEvent('Container_navigate_to');

                                  context.pushNamed(
                                    MyClubFolderWidget.routeName,
                                    queryParameters: {
                                      'rootKey': serializeParam(
                                        'root',
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
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.asset(
                                      'assets/images/Kidderminster_App_icon_-_android.png',
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (valueOrDefault<bool>(
                            touchline_template_puum0i_functions
                                .isWithinEventWindow(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        valueOrDefault<int>(
                                      (stackUpcomingOneFixturesStartEndResponse
                                                  .jsonBody
                                                  .toList()
                                                  .map<
                                                          touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct?>(
                                                      touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  touchline_template_puum0i_data_schema
                                                  .BLESSfixtureStruct?>)
                                          .withoutNulls
                                          .firstOrNull
                                          ?.start,
                                      0,
                                    )),
                                    DateTime.fromMillisecondsSinceEpoch(
                                        valueOrDefault<int>(
                                      (stackUpcomingOneFixturesStartEndResponse
                                                  .jsonBody
                                                  .toList()
                                                  .map<
                                                          touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct?>(
                                                      touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  touchline_template_puum0i_data_schema
                                                  .BLESSfixtureStruct?>)
                                          .withoutNulls
                                          .firstOrNull
                                          ?.end,
                                      0,
                                    )),
                                    getCurrentTimestamp),
                            false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'NAVBAR_COMP_Container_fchlqwph_ON_TAP');
                                  if (getCurrentTimestamp
                                          .millisecondsSinceEpoch >
                                      (stackUpcomingOneFixturesStartEndResponse
                                                  .jsonBody
                                                  .toList()
                                                  .map<
                                                          touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct?>(
                                                      touchline_template_puum0i_data_schema
                                                          .BLESSfixtureStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  touchline_template_puum0i_data_schema
                                                  .BLESSfixtureStruct?>)
                                          .withoutNulls
                                          .firstOrNull!
                                          .start) {
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      LGCLiveWidget.routeName,
                                      queryParameters: {
                                        'objectId': serializeParam(
                                          (stackUpcomingOneFixturesStartEndResponse
                                                      .jsonBody
                                                      .toList()
                                                      .map<
                                                              touchline_template_puum0i_data_schema
                                                              .BLESSfixtureStruct?>(
                                                          touchline_template_puum0i_data_schema
                                                              .BLESSfixtureStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      touchline_template_puum0i_data_schema
                                                      .BLESSfixtureStruct?>)
                                              .withoutNulls
                                              .firstOrNull
                                              ?.objectId,
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
                                  } else {
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      LGCFixtureWidget.routeName,
                                      queryParameters: {
                                        'objectId': serializeParam(
                                          (stackUpcomingOneFixturesStartEndResponse
                                                      .jsonBody
                                                      .toList()
                                                      .map<
                                                              touchline_template_puum0i_data_schema
                                                              .BLESSfixtureStruct?>(
                                                          touchline_template_puum0i_data_schema
                                                              .BLESSfixtureStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      touchline_template_puum0i_data_schema
                                                      .BLESSfixtureStruct?>)
                                              .withoutNulls
                                              .firstOrNull
                                              ?.objectId,
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
                                  }
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Lottie.asset(
                                        'assets/jsons/live-white.json',
                                        width: 300.0,
                                        height: 300.0,
                                        fit: BoxFit.fitWidth,
                                        animate: true,
                                      ),
                                      Opacity(
                                        opacity: 0.8,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.sports_soccer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 30.0,
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
                        ],
                      );
                    },
                  ),
                ],
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                hoverIconColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.store,
                  color: valueOrDefault<Color>(
                    'kidderminsterharriers://kidderminsterharriers.com${GoRouterState.of(context).uri.toString()}' ==
                            'kidderminsterharriers://kidderminsterharriers.com/merchShop'
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0xFF9299A1),
                    Color(0xFF9299A1),
                  ),
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('NAVBAR_COMP_store_ICN_ON_TAP');
                  if ('kidderminsterharriers://kidderminsterharriers.com${GoRouterState.of(context).uri.toString()}' ==
                      'kidderminsterharriers://kidderminsterharriers.com/merchShop') {
                    return;
                  }

                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed(
                    MerchShopWidget.routeName,
                    extra: <String, dynamic>{
                      '__transition_info__': TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                hoverIconColor: FlutterFlowTheme.of(context).primary,
                icon: FaIcon(
                  FontAwesomeIcons.ticketAlt,
                  color: valueOrDefault<Color>(
                    'kidderminsterharriers://kidderminsterharriers.com${GoRouterState.of(context).uri.toString()}' ==
                            'kidderminsterharriers://kidderminsterharriers.com/tickets'
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0xFF9299A1),
                    Color(0xFF9299A1),
                  ),
                  size: 24.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('NAVBAR_COMP_ticketAlt_ICN_ON_TAP');
                  if ('kidderminsterharriers://kidderminsterharriers.com${GoRouterState.of(context).uri.toString()}' ==
                      'kidderminsterharriers://kidderminsterharriers.com/tickets') {
                    return;
                  }

                  logFirebaseEvent('IconButton_navigate_to');

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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
