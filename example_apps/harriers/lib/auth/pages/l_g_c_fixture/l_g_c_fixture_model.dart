import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'l_g_c_fixture_widget.dart' show LGCFixtureWidget;
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
import 'package:touchline_template_puum0i/titles/latest_news_title_v2/latest_news_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/titles/league_table_title_v2/league_table_title_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/top_bit/top_bit_v3_specific/top_bit_v3_specific_widget.dart'
    as touchline_template_puum0i;
import 'package:flutter/material.dart';

class LGCFixtureModel extends FlutterFlowModel<LGCFixtureWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TopBitV3Specific component.
  late touchline_template_puum0i.TopBitV3SpecificModel topBitV3SpecificModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for LeagueTableTitleV2 component.
  late touchline_template_puum0i.LeagueTableTitleV2Model
      leagueTableTitleV2Model;
  // Model for LeagueTableV2 component.
  late touchline_template_puum0i.LeagueTableV2Model leagueTableV2Model;
  // Model for LatestNewsTitleV2 component.
  late touchline_template_puum0i.LatestNewsTitleV2Model latestNewsTitleV2Model;
  // Model for CombinedCMSV1 component.
  late touchline_template_puum0i.CombinedCMSV1Model combinedCMSV1Model;
  // Model for liveTextV1 component.
  late touchline_template_puum0i.LiveTextV1Model liveTextV1Model;
  // Model for LineupsV1 component.
  late touchline_template_puum0i.LineupsV1Model lineupsV1Model;
  // Model for matchSponsors component.
  late touchline_template_puum0i.MatchSponsorsModel matchSponsorsModel;

  @override
  void initState(BuildContext context) {
    topBitV3SpecificModel = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.TopBitV3SpecificModel());
    leagueTableTitleV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.LeagueTableTitleV2Model());
    leagueTableV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.LeagueTableV2Model());
    latestNewsTitleV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.LatestNewsTitleV2Model());
    combinedCMSV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.CombinedCMSV1Model());
    liveTextV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.LiveTextV1Model());
    lineupsV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.LineupsV1Model());
    matchSponsorsModel = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.MatchSponsorsModel());
  }

  @override
  void dispose() {
    topBitV3SpecificModel.dispose();
    leagueTableTitleV2Model.dispose();
    leagueTableV2Model.dispose();
    latestNewsTitleV2Model.dispose();
    combinedCMSV1Model.dispose();
    liveTextV1Model.dispose();
    lineupsV1Model.dispose();
    matchSponsorsModel.dispose();
  }
}
