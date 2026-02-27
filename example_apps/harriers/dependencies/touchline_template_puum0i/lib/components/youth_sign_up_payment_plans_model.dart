import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'youth_sign_up_payment_plans_widget.dart'
    show YouthSignUpPaymentPlansWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class YouthSignUpPaymentPlansModel
    extends FlutterFlowModel<YouthSignUpPaymentPlansWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for paymentPeriod widget.
  FormFieldController<List<String>>? paymentPeriodValueController;
  String? get paymentPeriodValue =>
      paymentPeriodValueController?.value?.firstOrNull;
  set paymentPeriodValue(String? val) =>
      paymentPeriodValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
