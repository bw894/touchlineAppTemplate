import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/view_lineups_builder_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/predictor/lineup_builder_v1/lineup_builder_v1_widget.dart';
import 'dart:ui';
import 'dart:async';
import 'lineups_v1_widget.dart' show LineupsV1Widget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LineupsV1Model extends FlutterFlowModel<LineupsV1Widget> {
  ///  State fields for stateful widgets in this component.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for viewLineupsBuilder component.
  late ViewLineupsBuilderModel viewLineupsBuilderModel;

  @override
  void initState(BuildContext context) {
    viewLineupsBuilderModel =
        createModel(context, () => ViewLineupsBuilderModel());
  }

  @override
  void dispose() {
    viewLineupsBuilderModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
