import '/flutter_flow/flutter_flow_util.dart';
import 'package:touchline_template_puum0i/app_bar/app_bar_v1/app_bar_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/cms/c_m_s_post_page_v1/c_m_s_post_page_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'cms_post_model.dart';
export 'cms_post_model.dart';

class CmsPostWidget extends StatefulWidget {
  const CmsPostWidget({
    super.key,
    required this.objectId,
  });

  final String? objectId;

  static String routeName = 'cmsPost';
  static String routePath = '/cmsPost';

  @override
  State<CmsPostWidget> createState() => _CmsPostWidgetState();
}

class _CmsPostWidgetState extends State<CmsPostWidget> {
  late CmsPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CmsPostModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'cmsPost'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            touchline_template_puum0i_util.wrapWithModel(
              model: _model.appBarV1Model,
              updateCallback: () => safeSetState(() {}),
              child: touchline_template_puum0i.AppBarV1Widget(
                backgroundColour: FlutterFlowTheme.of(context).primary,
                badgeURL: FFAppConstants.clubBadgeOnPrimary,
                iconColour: FlutterFlowTheme.of(context).secondaryBackground,
                backButtonReq: true,
              ),
            ),
            Expanded(
              child: touchline_template_puum0i_util.wrapWithModel(
                model: _model.cMSPostPageV1Model,
                updateCallback: () => safeSetState(() {}),
                child: touchline_template_puum0i.CMSPostPageV1Widget(
                  cmsPostObjectId: widget.objectId!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
