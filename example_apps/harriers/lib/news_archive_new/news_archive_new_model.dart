import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'news_archive_new_widget.dart' show NewsArchiveNewWidget;
import 'package:touchline_template_puum0i/app_bar/app_bar_v1/app_bar_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/cms/combined_c_m_s_v1/combined_c_m_s_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:flutter/material.dart';

class NewsArchiveNewModel extends FlutterFlowModel<NewsArchiveNewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appBarV1 component.
  late touchline_template_puum0i.AppBarV1Model appBarV1Model;
  // Model for CombinedCMSV1 component.
  late touchline_template_puum0i.CombinedCMSV1Model combinedCMSV1Model;

  @override
  void initState(BuildContext context) {
    appBarV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.AppBarV1Model());
    combinedCMSV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.CombinedCMSV1Model());
  }

  @override
  void dispose() {
    appBarV1Model.dispose();
    combinedCMSV1Model.dispose();
  }
}
