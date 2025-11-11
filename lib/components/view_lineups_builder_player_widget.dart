import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view_lineups_builder_player_model.dart';
export 'view_lineups_builder_player_model.dart';

class ViewLineupsBuilderPlayerWidget extends StatefulWidget {
  const ViewLineupsBuilderPlayerWidget({
    super.key,
    required this.allPlayers,
    int? index,
  }) : this.index = index ?? 0;

  final List<LineupBuilderPlayersStruct>? allPlayers;
  final int index;

  @override
  State<ViewLineupsBuilderPlayerWidget> createState() =>
      _ViewLineupsBuilderPlayerWidgetState();
}

class _ViewLineupsBuilderPlayerWidgetState
    extends State<ViewLineupsBuilderPlayerWidget> {
  late ViewLineupsBuilderPlayerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewLineupsBuilderPlayerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36.0,
              height: 36.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    (widget.allPlayers!.elementAtOrNull(widget.index))!.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/images/error_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  valueOrDefault<String>(
                    (widget.allPlayers?.elementAtOrNull(widget.index))?.name,
                    'Name',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 10.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
