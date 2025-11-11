import '/backend/api_requests/api_calls.dart';
import '/components/indiv_penalty_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'top_bit_v3_specific_widget.dart' show TopBitV3SpecificWidget;
import 'package:flutter/material.dart';

class TopBitV3SpecificModel extends FlutterFlowModel<TopBitV3SpecificWidget> {
  ///  Local state fields for this component.

  List<String> temp = [];
  void addToTemp(String item) => temp.add(item);
  void removeFromTemp(String item) => temp.remove(item);
  void removeAtIndexFromTemp(int index) => temp.removeAt(index);
  void insertAtIndexInTemp(int index, String item) => temp.insert(index, item);
  void updateTempAtIndex(int index, Function(String) updateFn) =>
      temp[index] = updateFn(temp[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (UpcomingOneFixtures)] action in TopBitV3Specific widget.
  ApiCallResponse? fixt;
  InstantTimer? refreshStats;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Models for indivPenalty dynamic component.
  late FlutterFlowDynamicModels<IndivPenaltyModel> indivPenaltyModels1;
  // Models for indivPenalty dynamic component.
  late FlutterFlowDynamicModels<IndivPenaltyModel> indivPenaltyModels2;

  @override
  void initState(BuildContext context) {
    indivPenaltyModels1 = FlutterFlowDynamicModels(() => IndivPenaltyModel());
    indivPenaltyModels2 = FlutterFlowDynamicModels(() => IndivPenaltyModel());
  }

  @override
  void dispose() {
    refreshStats?.cancel();
    indivPenaltyModels1.dispose();
    indivPenaltyModels2.dispose();
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
