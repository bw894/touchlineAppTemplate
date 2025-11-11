import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'team_select_widget.dart' show TeamSelectWidget;
import 'package:flutter/material.dart';

class TeamSelectModel extends FlutterFlowModel<TeamSelectWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Stores action output result for [Backend Call - API (Follow Public Team)] action in NotYetFollow widget.
  ApiCallResponse? apiResultevu;
  // Stores action output result for [Backend Call - API (Unfollow Team)] action in selected widget.
  ApiCallResponse? apiResultxwo;
  // Stores action output result for [Backend Call - API (Request A Private Team)] action in NotYetFollow widget.
  ApiCallResponse? apiResultq8a;
  // Stores action output result for [Backend Call - API (Add Team To Private Team Request)] action in NotYetFollow widget.
  ApiCallResponse? apiResultsa6;
  // Stores action output result for [Backend Call - API (Add User To Private Team Request)] action in NotYetFollow widget.
  ApiCallResponse? apiResultcrl;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Stores action output result for [Backend Call - API (Delete Request For Private Team)] action in NotYetFollow widget.
  ApiCallResponse? apiResultt77;
  // Stores action output result for [Backend Call - API (Delete Request For Private Team)] action in PENDING widget.
  ApiCallResponse? apiResulto7q;
  // Stores action output result for [Backend Call - API (Unfollow Team)] action in selected widget.
  ApiCallResponse? apiResultxwoCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
