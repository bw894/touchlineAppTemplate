import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'youth_main_screen_widget.dart' show YouthMainScreenWidget;
import 'package:flutter/material.dart';

class YouthMainScreenModel extends FlutterFlowModel<YouthMainScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
