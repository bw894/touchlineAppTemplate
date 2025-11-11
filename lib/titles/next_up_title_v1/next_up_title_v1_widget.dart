import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'next_up_title_v1_model.dart';
export 'next_up_title_v1_model.dart';

class NextUpTitleV1Widget extends StatefulWidget {
  const NextUpTitleV1Widget({super.key});

  @override
  State<NextUpTitleV1Widget> createState() => _NextUpTitleV1WidgetState();
}

class _NextUpTitleV1WidgetState extends State<NextUpTitleV1Widget> {
  late NextUpTitleV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NextUpTitleV1Model());

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
            'NEXT',
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
            'UP',
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
