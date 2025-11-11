import '/flutter_flow/flutter_flow_util.dart';
import 'sponsor_ad_carousel_v1_widget.dart' show SponsorAdCarouselV1Widget;
import 'package:flutter/material.dart';

class SponsorAdCarouselV1Model
    extends FlutterFlowModel<SponsorAdCarouselV1Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
