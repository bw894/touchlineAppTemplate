import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/predictor/player_select_lineups_builder/player_select_lineups_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lineup_builder_component_model.dart';
export 'lineup_builder_component_model.dart';

class LineupBuilderComponentWidget extends StatefulWidget {
  const LineupBuilderComponentWidget({
    super.key,
    int? index,
  }) : this.index = index ?? 0;

  final int index;

  @override
  State<LineupBuilderComponentWidget> createState() =>
      _LineupBuilderComponentWidgetState();
}

class _LineupBuilderComponentWidgetState
    extends State<LineupBuilderComponentWidget> {
  late LineupBuilderComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LineupBuilderComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (FFAppState()
                    .selectedPlayersLineupBuilder
                    .elementAtOrNull(widget.index)
                    ?.added ??
                true)
              Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: WebViewAware(
                            child: PlayerSelectLineupsBuilderWidget(
                              index: widget.index,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
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
                          FFAppState()
                              .selectedPlayersLineupBuilder
                              .elementAtOrNull(widget.index)!
                              .image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (!FFAppState()
                .selectedPlayersLineupBuilder
                .elementAtOrNull(widget.index)!
                .added)
              Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: WebViewAware(
                            child: PlayerSelectLineupsBuilderWidget(
                              index: widget.index,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF45484A),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            if (FFAppState()
                    .selectedPlayersLineupBuilder
                    .elementAtOrNull(widget.index)
                    ?.added ??
                true)
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    valueOrDefault<String>(
                      FFAppState()
                          .selectedPlayersLineupBuilder
                          .elementAtOrNull(widget.index)
                          ?.name,
                      'Name',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
