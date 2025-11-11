import '/components/rsvp_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'team_event_widget.dart' show TeamEventWidget;
import 'package:flutter/material.dart';

class TeamEventModel extends FlutterFlowModel<TeamEventWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for rsvpComponent dynamic component.
  late FlutterFlowDynamicModels<RsvpComponentModel> rsvpComponentModels;

  @override
  void initState(BuildContext context) {
    rsvpComponentModels = FlutterFlowDynamicModels(() => RsvpComponentModel());
  }

  @override
  void dispose() {
    rsvpComponentModels.dispose();
  }
}
