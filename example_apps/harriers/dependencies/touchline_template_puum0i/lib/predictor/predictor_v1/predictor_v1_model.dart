import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'predictor_v1_widget.dart' show PredictorV1Widget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PredictorV1Model extends FlutterFlowModel<PredictorV1Widget> {
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
