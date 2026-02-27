import '/flutter_flow/flutter_flow_util.dart';
import 'league_table_widget.dart' show LeagueTableWidget;
import 'package:touchline_template_puum0i/app_bar/app_bar_v1/app_bar_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/components/full_league_table_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:flutter/material.dart';

class LeagueTableModel extends FlutterFlowModel<LeagueTableWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appBarV1 component.
  late touchline_template_puum0i.AppBarV1Model appBarV1Model;
  // Model for FullLeagueTableV1 component.
  late touchline_template_puum0i.FullLeagueTableV1Model fullLeagueTableV1Model;

  @override
  void initState(BuildContext context) {
    appBarV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.AppBarV1Model());
    fullLeagueTableV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.FullLeagueTableV1Model());
  }

  @override
  void dispose() {
    appBarV1Model.dispose();
    fullLeagueTableV1Model.dispose();
  }
}
