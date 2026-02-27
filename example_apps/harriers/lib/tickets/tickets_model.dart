import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tickets_widget.dart' show TicketsWidget;
import 'package:flutter/material.dart';

class TicketsModel extends FlutterFlowModel<TicketsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}
