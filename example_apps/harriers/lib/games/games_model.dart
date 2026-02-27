import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'games_widget.dart' show GamesWidget;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:touchline_template_puum0i/games_page/games_page_v2/games_page_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:flutter/material.dart';

class GamesModel extends FlutterFlowModel<GamesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for GamesPageV2 component.
  late touchline_template_puum0i.GamesPageV2Model gamesPageV2Model;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    gamesPageV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.GamesPageV2Model());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    gamesPageV2Model.dispose();
    navbarModel.dispose();
  }
}
