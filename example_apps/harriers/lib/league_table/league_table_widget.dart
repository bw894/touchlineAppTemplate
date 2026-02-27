import '/flutter_flow/flutter_flow_util.dart';
import 'package:touchline_template_puum0i/app_bar/app_bar_v1/app_bar_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/components/full_league_table_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'league_table_model.dart';
export 'league_table_model.dart';

class LeagueTableWidget extends StatefulWidget {
  const LeagueTableWidget({super.key});

  static String routeName = 'LeagueTable';
  static String routePath = '/leagueTable';

  @override
  State<LeagueTableWidget> createState() => _LeagueTableWidgetState();
}

class _LeagueTableWidgetState extends State<LeagueTableWidget> {
  late LeagueTableModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeagueTableModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LeagueTable'});
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              touchline_template_puum0i_util.wrapWithModel(
                model: _model.appBarV1Model,
                updateCallback: () => safeSetState(() {}),
                child: touchline_template_puum0i.AppBarV1Widget(
                  backgroundColour: FlutterFlowTheme.of(context).primary,
                  badgeURL: FFAppConstants.clubBadgeOnPrimary,
                  iconColour: FlutterFlowTheme.of(context).secondaryBackground,
                  backButtonReq: true,
                ),
              ),
              touchline_template_puum0i_util.wrapWithModel(
                model: _model.fullLeagueTableV1Model,
                updateCallback: () => safeSetState(() {}),
                child: touchline_template_puum0i.FullLeagueTableV1Widget(
                  teamName: 'Kidderminster Harriers',
                  autoPromotionIndex: 0,
                  playoffIndex: 6,
                  relegationIndex: 19,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
