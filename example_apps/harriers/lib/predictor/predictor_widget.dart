import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:touchline_template_puum0i/predictor/predictor_v2/predictor_v2_widget.dart'
    as touchline_template_puum0i;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'predictor_model.dart';
export 'predictor_model.dart';

class PredictorWidget extends StatefulWidget {
  const PredictorWidget({super.key});

  static String routeName = 'Predictor';
  static String routePath = '/predictor';

  @override
  State<PredictorWidget> createState() => _PredictorWidgetState();
}

class _PredictorWidgetState extends State<PredictorWidget> {
  late PredictorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PredictorModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Predictor'});
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
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 65.0, 0.0, 0.0),
                child: AuthUserStreamWidget(
                  builder: (context) =>
                      touchline_template_puum0i_util.wrapWithModel(
                    model: _model.predictorV2Model,
                    updateCallback: () => safeSetState(() {}),
                    child: touchline_template_puum0i.PredictorV2Widget(
                      userEmail: currentUserEmail,
                      userName: currentUserDisplayName,
                      userUID: currentUserUid,
                      backArrowColour: FlutterFlowTheme.of(context).primaryText,
                      gradientCol1: FlutterFlowTheme.of(context).primary,
                      gradientCol2: FlutterFlowTheme.of(context).accent1,
                      sponsorName: 'MB SOLAR',
                      sponsorColour: Color(0xFF121212),
                      sponsorImage:
                          'https://api.touchlineclub.com:7500/6D654B32-2E5D-4E11-98F9-BACF8B9930B5/C7DEECF4-82EB-4F42-86BD-49ACA7E19114/files/MBSolarFull.jpg',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
