import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'merch_shop_widget.dart' show MerchShopWidget;
import 'package:flutter/material.dart';

class MerchShopModel extends FlutterFlowModel<MerchShopWidget> {
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
