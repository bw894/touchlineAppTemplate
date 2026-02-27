import '/flutter_flow/flutter_flow_util.dart';
import 'event_page_widget.dart' show EventPageWidget;
import 'package:touchline_template_puum0i/app_bar/app_bar_v1/app_bar_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/components/event_page_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:flutter/material.dart';

class EventPageModel extends FlutterFlowModel<EventPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appBarV1 component.
  late touchline_template_puum0i.AppBarV1Model appBarV1Model;
  // Model for EventPageV1 component.
  late touchline_template_puum0i.EventPageV1Model eventPageV1Model;

  @override
  void initState(BuildContext context) {
    appBarV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.AppBarV1Model());
    eventPageV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.EventPageV1Model());
  }

  @override
  void dispose() {
    appBarV1Model.dispose();
    eventPageV1Model.dispose();
  }
}
