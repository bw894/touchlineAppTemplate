import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'l_g_c_live_widget.dart' show LGCLiveWidget;
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
import 'package:touchline_template_puum0i/stats/stats_v1/stats_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/todays_games/todays_games/todays_games_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/top_bit/top_bit_v3_specific/top_bit_v3_specific_widget.dart'
    as touchline_template_puum0i;
import 'package:flutter/material.dart';

class LGCLiveModel extends FlutterFlowModel<LGCLiveWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TopBitV3Specific component.
  late touchline_template_puum0i.TopBitV3SpecificModel topBitV3SpecificModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for liveTextV1 component.
  late touchline_template_puum0i.LiveTextV1Model liveTextV1Model;
  // Model for LineupsV1 component.
  late touchline_template_puum0i.LineupsV1Model lineupsV1Model;
  // Model for StatsV1 component.
  late touchline_template_puum0i.StatsV1Model statsV1Model;
  // Model for TodaysGames component.
  late touchline_template_puum0i.TodaysGamesModel todaysGamesModel;
  // Model for FullLeagueTableV1 component.
  late touchline_template_puum0i.FullLeagueTableV1Model fullLeagueTableV1Model;
  // Model for matchSponsors component.
  late touchline_template_puum0i.MatchSponsorsModel matchSponsorsModel;

  @override
  void initState(BuildContext context) {
    topBitV3SpecificModel = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.TopBitV3SpecificModel());
    liveTextV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.LiveTextV1Model());
    lineupsV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.LineupsV1Model());
    statsV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.StatsV1Model());
    todaysGamesModel = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.TodaysGamesModel());
    fullLeagueTableV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.FullLeagueTableV1Model());
    matchSponsorsModel = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.MatchSponsorsModel());
  }

  @override
  void dispose() {
    topBitV3SpecificModel.dispose();
    liveTextV1Model.dispose();
    lineupsV1Model.dispose();
    statsV1Model.dispose();
    todaysGamesModel.dispose();
    fullLeagueTableV1Model.dispose();
    matchSponsorsModel.dispose();
  }
}
