import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'social_media_title_v2_model.dart';
export 'social_media_title_v2_model.dart';

class SocialMediaTitleV2Widget extends StatefulWidget {
  const SocialMediaTitleV2Widget({super.key});

  @override
  State<SocialMediaTitleV2Widget> createState() =>
      _SocialMediaTitleV2WidgetState();
}

class _SocialMediaTitleV2WidgetState extends State<SocialMediaTitleV2Widget> {
  late SocialMediaTitleV2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialMediaTitleV2Model());

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
            'MEDIA',
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
