import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'polls_voting_widget.dart' show PollsVotingWidget;
import 'package:flutter/material.dart';

class PollsVotingModel extends FlutterFlowModel<PollsVotingWidget> {
  ///  Local state fields for this component.

  int page = 1;

  int? indexSelected;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (AddVoteToPoll)] action in Button widget.
  ApiCallResponse? addVote;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
