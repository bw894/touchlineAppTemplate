import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'event_r_s_v_p_v1_widget.dart' show EventRSVPV1Widget;
import 'package:flutter/material.dart';

class EventRSVPV1Model extends FlutterFlowModel<EventRSVPV1Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (Remove RSVP for Team Event)] action in ChoiceChips widget.
  ApiCallResponse? apiResultkzf;
  // Stores action output result for [Backend Call - API (Remove RSVP for Team Event)] action in ChoiceChips widget.
  ApiCallResponse? apiResultkzf2;
  // Stores action output result for [Backend Call - API (Add RSVP to Team Event)] action in ChoiceChips widget.
  ApiCallResponse? apiResulttcq;
  // Stores action output result for [Backend Call - API (Remove RSVP for Team Event)] action in ChoiceChips widget.
  ApiCallResponse? apiResultkzf3;
  // Stores action output result for [Backend Call - API (Remove RSVP for Team Event)] action in ChoiceChips widget.
  ApiCallResponse? apiResultkzf4;
  // Stores action output result for [Backend Call - API (Add RSVP to Team Event)] action in ChoiceChips widget.
  ApiCallResponse? apiResulttcq2;
  // Stores action output result for [Backend Call - API (Remove RSVP for Team Event)] action in ChoiceChips widget.
  ApiCallResponse? apiResultkzf5;
  // Stores action output result for [Backend Call - API (Remove RSVP for Team Event)] action in ChoiceChips widget.
  ApiCallResponse? apiResultkzf6;
  // Stores action output result for [Backend Call - API (Add RSVP to Team Event)] action in ChoiceChips widget.
  ApiCallResponse? apiResulttcq3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
