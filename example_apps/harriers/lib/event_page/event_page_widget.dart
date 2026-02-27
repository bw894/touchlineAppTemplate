import '/flutter_flow/flutter_flow_util.dart';
import 'package:touchline_template_puum0i/app_bar/app_bar_v1/app_bar_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/components/event_page_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'event_page_model.dart';
export 'event_page_model.dart';

class EventPageWidget extends StatefulWidget {
  const EventPageWidget({
    super.key,
    required this.objectId,
  });

  final String? objectId;

  static String routeName = 'eventPage';
  static String routePath = '/eventPage';

  @override
  State<EventPageWidget> createState() => _EventPageWidgetState();
}

class _EventPageWidgetState extends State<EventPageWidget> {
  late EventPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'eventPage'});
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
            Expanded(
              child: touchline_template_puum0i_util.wrapWithModel(
                model: _model.eventPageV1Model,
                updateCallback: () => safeSetState(() {}),
                child: touchline_template_puum0i.EventPageV1Widget(
                  objectId: widget.objectId!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
