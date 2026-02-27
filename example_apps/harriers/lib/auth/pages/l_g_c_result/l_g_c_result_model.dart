import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'l_g_c_result_widget.dart' show LGCResultWidget;
import 'package:touchline_template_puum0i/backend/api_requests/api_calls.dart'
    as touchline_template_puum0i_api_calls_util;
import 'package:touchline_template_puum0i/components/match_sponsors_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:touchline_template_puum0i/lineups/lineups_v1/lineups_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/other_l_g_c/match_gallery_v1/match_gallery_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/stats/stats_v1/stats_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/top_bit/top_bit_v3_specific/top_bit_v3_specific_widget.dart'
    as touchline_template_puum0i;
import 'package:flutter/material.dart';

class LGCResultModel extends FlutterFlowModel<LGCResultWidget> {
  ///  Local state fields for this page.

  String reportContent = 'testContent';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetSpecificFixture)] action in LGCResult widget.
  touchline_template_puum0i_api_calls_util.ApiCallResponse? getFixture;
  // Stores action output result for [Custom Action - fixBackendlessText] action in LGCResult widget.
  String? decodeHTML;
  // Model for TopBitV3Specific component.
  late touchline_template_puum0i.TopBitV3SpecificModel topBitV3SpecificModel;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for StatsV1 component.
  late touchline_template_puum0i.StatsV1Model statsV1Model;
  // Model for LineupsV1 component.
  late touchline_template_puum0i.LineupsV1Model lineupsV1Model;
  // Model for matchGalleryV1 component.
  late touchline_template_puum0i.MatchGalleryV1Model matchGalleryV1Model;
  // Model for matchSponsors component.
  late touchline_template_puum0i.MatchSponsorsModel matchSponsorsModel;

  @override
  void initState(BuildContext context) {
    topBitV3SpecificModel = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.TopBitV3SpecificModel());
    statsV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.StatsV1Model());
    lineupsV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.LineupsV1Model());
    matchGalleryV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.MatchGalleryV1Model());
    matchSponsorsModel = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.MatchSponsorsModel());
  }

  @override
  void dispose() {
    topBitV3SpecificModel.dispose();
    statsV1Model.dispose();
    lineupsV1Model.dispose();
    matchGalleryV1Model.dispose();
    matchSponsorsModel.dispose();
  }
}
