import '/components/cart_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for cartComponent component.
  late CartComponentModel cartComponentModel;

  @override
  void initState(BuildContext context) {
    cartComponentModel = createModel(context, () => CartComponentModel());
  }

  @override
  void dispose() {
    cartComponentModel.dispose();
  }
}
