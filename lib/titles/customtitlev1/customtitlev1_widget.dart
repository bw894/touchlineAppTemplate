import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'customtitlev1_model.dart';
export 'customtitlev1_model.dart';

class Customtitlev1Widget extends StatefulWidget {
  const Customtitlev1Widget({
    super.key,
    required this.part1,
    required this.part2,
  });

  final String? part1;
  final String? part2;

  @override
  State<Customtitlev1Widget> createState() => _Customtitlev1WidgetState();
}

class _Customtitlev1WidgetState extends State<Customtitlev1Widget> {
  late Customtitlev1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Customtitlev1Model());

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
            valueOrDefault<String>(
              widget.part1,
              'part1',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.bebasNeue(
                    fontWeight: FontWeight.w300,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: 42.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w300,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Text(
            valueOrDefault<String>(
              widget.part2,
              'part2',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.bebasNeue(
                    fontWeight: FontWeight.w300,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 42.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w300,
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
