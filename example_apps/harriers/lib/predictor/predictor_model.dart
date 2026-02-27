import '/flutter_flow/flutter_flow_util.dart';
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:touchline_template_puum0i/predictor/predictor_v2/predictor_v2_widget.dart'
    as touchline_template_puum0i;
import 'predictor_widget.dart' show PredictorWidget;
import 'package:flutter/material.dart';

class PredictorModel extends FlutterFlowModel<PredictorWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PredictorV2 component.
  late touchline_template_puum0i.PredictorV2Model predictorV2Model;

  @override
  void initState(BuildContext context) {
    predictorV2Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.PredictorV2Model());
  }

  @override
  void dispose() {
    predictorV2Model.dispose();
  }
}
