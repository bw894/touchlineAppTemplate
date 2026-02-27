import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'youth_sign_up_team_select_team_widget.dart'
    show YouthSignUpTeamSelectTeamWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class YouthSignUpTeamSelectTeamModel
    extends FlutterFlowModel<YouthSignUpTeamSelectTeamWidget> {
  ///  Local state fields for this component.

  String? shirtSizeSelected;

  ///  State fields for stateful widgets in this component.

  // State field(s) for squadNumber widget.
  FocusNode? squadNumberFocusNode;
  TextEditingController? squadNumberTextController;
  String? Function(BuildContext, String?)? squadNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    squadNumberFocusNode?.dispose();
    squadNumberTextController?.dispose();
  }
}
