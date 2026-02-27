import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'interactive_hub_widget.dart' show InteractiveHubWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class InteractiveHubModel extends FlutterFlowModel<InteractiveHubWidget> {
  ///  Local state fields for this page.

  int page = 1;

  /// used for the polls
  int? indexSelected;

  double? currentTimerValue;

  bool showCorrectAnswers = false;

  int? totalPointsAvailable;

  int currentPointsScore = 0;

  List<int> quizEntry = [];
  void addToQuizEntry(int item) => quizEntry.add(item);
  void removeFromQuizEntry(int item) => quizEntry.remove(item);
  void removeAtIndexFromQuizEntry(int index) => quizEntry.removeAt(index);
  void insertAtIndexInQuizEntry(int index, int item) =>
      quizEntry.insert(index, item);
  void updateQuizEntryAtIndex(int index, Function(int) updateFn) =>
      quizEntry[index] = updateFn(quizEntry[index]);

  ///  State fields for stateful widgets in this page.

  InstantTimer? q1Only;
  // Stores action output result for [Backend Call - API (AddVoteToPoll)] action in Button widget.
  ApiCallResponse? addVote;
  // Stores action output result for [Backend Call - API (Add Quiz Entry)] action in Button widget.
  ApiCallResponse? apiResultk0w;
  // Stores action output result for [Backend Call - API (Add Quiz Entry to Poll)] action in Button widget.
  ApiCallResponse? apiResult05r;
  InstantTimer? q2Onwards;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    q1Only?.cancel();
    q2Onwards?.cancel();
  }
}
