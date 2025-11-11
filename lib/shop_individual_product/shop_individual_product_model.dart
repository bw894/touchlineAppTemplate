import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'shop_individual_product_widget.dart' show ShopIndividualProductWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ShopIndividualProductModel
    extends FlutterFlowModel<ShopIndividualProductWidget> {
  ///  Local state fields for this page.

  int selectedIndex = 0;

  int reviewsOffset = 0;

  int? newReviewStarsSelected;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for ProductDescription widget.
  late ExpandableController productDescriptionExpandableController;

  // State field(s) for Shipping widget.
  late ExpandableController shippingExpandableController;

  // State field(s) for ReturnsPolicy widget.
  late ExpandableController returnsPolicyExpandableController;

  // State field(s) for Reviews widget.
  late ExpandableController reviewsExpandableController;

  // State field(s) for reviewComment widget.
  FocusNode? reviewCommentFocusNode;
  TextEditingController? reviewCommentTextController;
  String? Function(BuildContext, String?)? reviewCommentTextControllerValidator;
  // Stores action output result for [Backend Call - API (Post New Review Content)] action in Button widget.
  ApiCallResponse? apiResultgg0;
  // Stores action output result for [Backend Call - API (Add Review to Shop Item)] action in Button widget.
  ApiCallResponse? apiResultyve;
  // Stores action output result for [Backend Call - API (Add Author to Review)] action in Button widget.
  ApiCallResponse? apiResultqnm;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    productDescriptionExpandableController.dispose();
    shippingExpandableController.dispose();
    returnsPolicyExpandableController.dispose();
    reviewsExpandableController.dispose();
    reviewCommentFocusNode?.dispose();
    reviewCommentTextController?.dispose();
  }
}
