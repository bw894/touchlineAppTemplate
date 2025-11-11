import '/backend/api_requests/api_calls.dart';
import '/components/view_lineups_builder_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'lineups_v1_widget.dart' show LineupsV1Widget;
import 'package:flutter/material.dart';

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
