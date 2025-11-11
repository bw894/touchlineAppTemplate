import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'x_latest_title_v2_model.dart';
export 'x_latest_title_v2_model.dart';

class XLatestTitleV2Widget extends StatefulWidget {
  const XLatestTitleV2Widget({super.key});

  @override
  State<XLatestTitleV2Widget> createState() => _XLatestTitleV2WidgetState();
}

class _XLatestTitleV2WidgetState extends State<XLatestTitleV2Widget> {
  late XLatestTitleV2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => XLatestTitleV2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'X',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.bebasNeue(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: 42.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Text(
            'LATEST',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.bebasNeue(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 42.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
            child: FaIcon(
              FontAwesomeIcons.angleRight,
              color: FlutterFlowTheme.of(context).primary,
              size: 15.0,
            ),
          ),
        ].divide(SizedBox(width: 2.0)),
      ),
    );
  }
}
