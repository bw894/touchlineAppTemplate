import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/rsvp_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'team_event_widget.dart' show TeamEventWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
