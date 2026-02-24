import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'rsvp_component_widget.dart' show RsvpComponentWidget;
import 'package:flutter/material.dart';

class RsvpComponentModel extends FlutterFlowModel<RsvpComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (Update Event RSVP)] action in ChoiceChips widget.
  ApiCallResponse? apiResult85o;
  // Stores action output result for [Backend Call - API (Add New Event RSVP)] action in ChoiceChips widget.
  ApiCallResponse? apiResult8xy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
