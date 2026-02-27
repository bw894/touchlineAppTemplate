import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:touchline_template_puum0i/games_page/games_page_v2/games_page_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'games_model.dart';
export 'games_model.dart';

class GamesWidget extends StatefulWidget {
  const GamesWidget({super.key});

  static String routeName = 'Games';
  static String routePath = '/games';

  @override
  State<GamesWidget> createState() => _GamesWidgetState();
}

class _GamesWidgetState extends State<GamesWidget> {
  late GamesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GamesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Games'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
              child: touchline_template_puum0i_util.wrapWithModel(
                model: _model.gamesPageV2Model,
                updateCallback: () => safeSetState(() {}),
                child: touchline_template_puum0i.GamesPageV2Widget(
                  syncFixturesLink:
                      'https://api.kibouapp.co.uk/6D654B32-2E5D-4E11-98F9-BACF8B9930B5/C7DEECF4-82EB-4F42-86BD-49ACA7E19114/files/fixtures/fixtures.ics',
                  resultAction: (matchObjectId) async {
                    logFirebaseEvent('GAMES_PAGE_Container_f69jx6fz_CALLBACK');
                    logFirebaseEvent('GamesPageV2_navigate_to');

                    context.pushNamed(
                      LGCResultWidget.routeName,
                      queryParameters: {
                        'objectId': serializeParam(
                          matchObjectId,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                  fixtureAction: (matchObjectId) async {
                    logFirebaseEvent('GAMES_PAGE_Container_f69jx6fz_CALLBACK');
                    logFirebaseEvent('GamesPageV2_navigate_to');

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
                  ticketingAction: () async {
                    logFirebaseEvent('GAMES_PAGE_Container_f69jx6fz_CALLBACK');
                    logFirebaseEvent('GamesPageV2_navigate_to');

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
                    logFirebaseEvent('GAMES_PAGE_Container_f69jx6fz_CALLBACK');
                    logFirebaseEvent('GamesPageV2_navigate_to');

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
                  eventTapAction: (objectId) async {
                    logFirebaseEvent('GAMES_PAGE_Container_f69jx6fz_CALLBACK');
                    logFirebaseEvent('GamesPageV2_navigate_to');

                    context.pushNamed(
                      EventPageWidget.routeName,
                      queryParameters: {
                        'objectId': serializeParam(
                          objectId,
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
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navbarModel,
                updateCallback: () => safeSetState(() {}),
                child: NavbarWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
