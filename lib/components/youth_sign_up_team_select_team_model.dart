import '/flutter_flow/flutter_flow_util.dart';
import 'youth_sign_up_team_select_team_widget.dart'
    show YouthSignUpTeamSelectTeamWidget;
import 'package:flutter/material.dart';

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
