import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'squad_hub_title_v1_model.dart';
export 'squad_hub_title_v1_model.dart';

class SquadHubTitleV1Widget extends StatefulWidget {
  const SquadHubTitleV1Widget({super.key});

  @override
  State<SquadHubTitleV1Widget> createState() => _SquadHubTitleV1WidgetState();
}

class _SquadHubTitleV1WidgetState extends State<SquadHubTitleV1Widget> {
  late SquadHubTitleV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SquadHubTitleV1Model());

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
            'SQUAD',
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
            'HUB',
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
