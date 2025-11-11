import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'latest_videos_title_v1_model.dart';
export 'latest_videos_title_v1_model.dart';

class LatestVideosTitleV1Widget extends StatefulWidget {
  const LatestVideosTitleV1Widget({super.key});

  @override
  State<LatestVideosTitleV1Widget> createState() =>
      _LatestVideosTitleV1WidgetState();
}

class _LatestVideosTitleV1WidgetState extends State<LatestVideosTitleV1Widget> {
  late LatestVideosTitleV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LatestVideosTitleV1Model());

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
            'LATEST',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.rubik(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  fontSize: 32.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
          ),
          Text(
            'VIDEOS',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 32.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
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
