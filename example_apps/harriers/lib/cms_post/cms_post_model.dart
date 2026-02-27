import '/flutter_flow/flutter_flow_util.dart';
import 'cms_post_widget.dart' show CmsPostWidget;
import 'package:touchline_template_puum0i/app_bar/app_bar_v1/app_bar_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/cms/c_m_s_post_page_v1/c_m_s_post_page_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:flutter/material.dart';

class CmsPostModel extends FlutterFlowModel<CmsPostWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appBarV1 component.
  late touchline_template_puum0i.AppBarV1Model appBarV1Model;
  // Model for CMSPostPageV1 component.
  late touchline_template_puum0i.CMSPostPageV1Model cMSPostPageV1Model;

  @override
  void initState(BuildContext context) {
    appBarV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.AppBarV1Model());
    cMSPostPageV1Model = touchline_template_puum0i_util.createModel(
        context, () => touchline_template_puum0i.CMSPostPageV1Model());
  }

  @override
  void dispose() {
    appBarV1Model.dispose();
    cMSPostPageV1Model.dispose();
  }
}
