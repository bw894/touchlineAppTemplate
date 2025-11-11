import '/components/cart_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_component_widget.dart' show CartComponentWidget;
import 'package:flutter/material.dart';

class CartComponentModel extends FlutterFlowModel<CartComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for cartItem dynamic component.
  late FlutterFlowDynamicModels<CartItemModel> cartItemModels;

  @override
  void initState(BuildContext context) {
    cartItemModels = FlutterFlowDynamicModels(() => CartItemModel());
  }

  @override
  void dispose() {
    cartItemModels.dispose();
  }
}
