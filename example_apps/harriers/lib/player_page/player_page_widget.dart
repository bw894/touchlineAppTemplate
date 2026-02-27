import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:touchline_template_puum0i/app_bar/app_bar_v1/app_bar_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:touchline_template_puum0i/squad_hub/player_profile_page_v5_adv/player_profile_page_v5_adv_widget.dart'
    as touchline_template_puum0i;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'player_page_model.dart';
export 'player_page_model.dart';

class PlayerPageWidget extends StatefulWidget {
  const PlayerPageWidget({
    super.key,
    required this.objectId,
  });

  final String? objectId;

  static String routeName = 'playerPage';
  static String routePath = '/playerPage';

  @override
  State<PlayerPageWidget> createState() => _PlayerPageWidgetState();
}

class _PlayerPageWidgetState extends State<PlayerPageWidget> {
  late PlayerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'playerPage'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/bg3-min.png',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      touchline_template_puum0i_util.wrapWithModel(
                        model: _model.appBarV1Model,
                        updateCallback: () => safeSetState(() {}),
                        child: touchline_template_puum0i.AppBarV1Widget(
                          backgroundColour:
                              FlutterFlowTheme.of(context).primary,
                          badgeURL: FFAppConstants.clubBadgeOnPrimary,
                          iconColour:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          backButtonReq: true,
                        ),
                      ),
                      touchline_template_puum0i_util.wrapWithModel(
                        model: _model.playerProfilePageV5AdvModel,
                        updateCallback: () => safeSetState(() {}),
                        child: touchline_template_puum0i
                            .PlayerProfilePageV5AdvWidget(
                          playerObjectId: widget.objectId!,
                          sponsorshipBuyClickAction: (sponsorshipDealObjectId,
                              value, playerName, shortDisplay) async {},
                        ),
                      ),
                    ],
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
        ),
      ),
    );
  }
}
