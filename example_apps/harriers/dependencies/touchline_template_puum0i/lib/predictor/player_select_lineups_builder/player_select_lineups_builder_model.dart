import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'player_select_lineups_builder_widget.dart'
    show PlayerSelectLineupsBuilderWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PlayerSelectLineupsBuilderModel
    extends FlutterFlowModel<PlayerSelectLineupsBuilderWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Lineups builder cache)] action in PlayerSelectLineupsBuilder widget.
  ApiCallResponse? apiResultood;
  // Stores action output result for [Backend Call - API (Players for Lineups Builder)] action in PlayerSelectLineupsBuilder widget.
  ApiCallResponse? apiResultb1t;
  // Stores action output result for [Backend Call - API (Set Lineups builder cache)] action in PlayerSelectLineupsBuilder widget.
  ApiCallResponse? apiResult3b6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
