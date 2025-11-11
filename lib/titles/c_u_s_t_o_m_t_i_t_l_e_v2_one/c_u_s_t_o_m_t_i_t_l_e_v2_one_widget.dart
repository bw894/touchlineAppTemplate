import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'c_u_s_t_o_m_t_i_t_l_e_v2_one_model.dart';
export 'c_u_s_t_o_m_t_i_t_l_e_v2_one_model.dart';

class CUSTOMTITLEV2OneWidget extends StatefulWidget {
  const CUSTOMTITLEV2OneWidget({
    super.key,
    required this.part1,
  });

  final String? part1;

  @override
  State<CUSTOMTITLEV2OneWidget> createState() => _CUSTOMTITLEV2OneWidgetState();
}

class _CUSTOMTITLEV2OneWidgetState extends State<CUSTOMTITLEV2OneWidget> {
  late CUSTOMTITLEV2OneModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CUSTOMTITLEV2OneModel());

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
