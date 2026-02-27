import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'polls_voting_widget.dart' show PollsVotingWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
