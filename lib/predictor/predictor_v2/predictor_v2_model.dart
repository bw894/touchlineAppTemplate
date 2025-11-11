import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'predictor_v2_widget.dart' show PredictorV2Widget;
import 'package:flutter/material.dart';

class PredictorV2Model extends FlutterFlowModel<PredictorV2Widget> {
  ///  Local state fields for this component.

  int telfordPlayerIndexSelected = 0;

  int page = 1;

  int homeScore = 0;

  int awayScore = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for homeScore widget.
  int? homeScoreValue;
  // State field(s) for awayScore widget.
  int? awayScoreValue;
  // Stores action output result for [Backend Call - API (playPredictorOne)] action in Button widget.
  ApiCallResponse? apiResultsia;
  // Stores action output result for [Backend Call - API (playPredictorTwo)] action in Button widget.
  ApiCallResponse? apiResult788;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
