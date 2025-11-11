import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'social_media_title_v1_model.dart';
export 'social_media_title_v1_model.dart';

class SocialMediaTitleV1Widget extends StatefulWidget {
  const SocialMediaTitleV1Widget({super.key});

  @override
  State<SocialMediaTitleV1Widget> createState() =>
      _SocialMediaTitleV1WidgetState();
}

class _SocialMediaTitleV1WidgetState extends State<SocialMediaTitleV1Widget> {
  late SocialMediaTitleV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialMediaTitleV1Model());

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
            'SOCIAL',
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
            'MEDIA',
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
