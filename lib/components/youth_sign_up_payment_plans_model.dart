import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'youth_sign_up_payment_plans_widget.dart'
    show YouthSignUpPaymentPlansWidget;
import 'package:flutter/material.dart';

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
