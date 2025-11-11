import '/components/cart_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';

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
