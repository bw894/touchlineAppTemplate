import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:touchline_template_puum0i/app_bar/app_bar_v1/app_bar_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/cms/combined_c_m_s_v1/combined_c_m_s_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'news_archive_new_model.dart';
export 'news_archive_new_model.dart';

class NewsArchiveNewWidget extends StatefulWidget {
  const NewsArchiveNewWidget({super.key});

  static String routeName = 'newsArchiveNew';
  static String routePath = '/newsArchiveNew';

  @override
  State<NewsArchiveNewWidget> createState() => _NewsArchiveNewWidgetState();
}

class _NewsArchiveNewWidgetState extends State<NewsArchiveNewWidget> {
  late NewsArchiveNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsArchiveNewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'newsArchiveNew'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'NEWS',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.bebasNeue(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 45.0,
                                    letterSpacing: 2.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Text(
                          'ARCHIVE',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.bebasNeue(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 45.0,
                                    letterSpacing: 2.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(width: 6.0)),
                    ),
                  ),
                  touchline_template_puum0i_util.wrapWithModel(
                    model: _model.combinedCMSV1Model,
                    updateCallback: () => safeSetState(() {}),
                    child: touchline_template_puum0i.CombinedCMSV1Widget(
                      numberToFetch: 50,
                      clickAction: (cmsPostObjectId) async {
                        logFirebaseEvent(
                            'NEWS_ARCHIVE_NEW_Container_b1f5rbjb_CALL');
                        logFirebaseEvent('CombinedCMSV1_navigate_to');

                        context.pushNamed(
                          CmsPostWidget.routeName,
                          queryParameters: {
                            'objectId': serializeParam(
                              cmsPostObjectId,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
