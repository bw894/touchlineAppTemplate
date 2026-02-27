import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:touchline_template_puum0i/app_bar/app_bar_v1/app_bar_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:touchline_template_puum0i/squad_hub/player_profile_page_v5_adv/player_profile_page_v5_adv_widget.dart'
    as touchline_template_puum0i;
import 'player_page_widget.dart' show PlayerPageWidget;
import 'package:flutter/material.dart';

class PlayerPageModel extends FlutterFlowModel<PlayerPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appBarV1 component.
  late touchline_template_puum0i.AppBarV1Model appBarV1Model;
  // Model for PlayerProfilePageV5Adv component.
  late touchline_template_puum0i.PlayerProfilePageV5AdvModel
      playerProfilePageV5AdvModel;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    appBarV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.AppBarV1Model());
    playerProfilePageV5AdvModel = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.PlayerProfilePageV5AdvModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    appBarV1Model.dispose();
    playerProfilePageV5AdvModel.dispose();
    navbarModel.dispose();
  }
}
