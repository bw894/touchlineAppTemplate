import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'single_live_text_item_blur_model.dart';
export 'single_live_text_item_blur_model.dart';

class SingleLiveTextItemBlurWidget extends StatefulWidget {
  const SingleLiveTextItemBlurWidget({
    super.key,
    required this.singleLiveTextItem,
  });

  final LiveTextStruct? singleLiveTextItem;

  @override
  State<SingleLiveTextItemBlurWidget> createState() =>
      _SingleLiveTextItemBlurWidgetState();
}

class _SingleLiveTextItemBlurWidgetState
    extends State<SingleLiveTextItemBlurWidget> {
  late SingleLiveTextItemBlurModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleLiveTextItemBlurModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.pop(context);
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  height: 3.0,
                  thickness: 3.0,
                  color: FlutterFlowTheme.of(context).primary,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if ((widget.singleLiveTextItem?.minuteIndicator != null &&
                            widget.singleLiveTextItem?.minuteIndicator !=
                                '') &&
                        (widget.singleLiveTextItem?.minuteIndicator != 'null'))
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                7.0, 3.0, 7.0, 6.0),
                            child: Text(
                              '${widget.singleLiveTextItem?.minuteIndicator}\'',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 19.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    if ((widget.singleLiveTextItem?.minuteIndicator == null ||
                            widget.singleLiveTextItem?.minuteIndicator ==
                                '') ||
                        (widget.singleLiveTextItem?.minuteIndicator == 'null'))
                      Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                7.0, 3.0, 7.0, 6.0),
                            child: Text(
                              '${dateTimeFormat("jm", DateTime.fromMillisecondsSinceEpoch(valueOrDefault<int>(
                                    widget.singleLiveTextItem?.created,
                                    0,
                                  )))} (UK)',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 19.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                if ((widget.singleLiveTextItem?.heading != null &&
                        widget.singleLiveTextItem?.heading != '') &&
                    (widget.singleLiveTextItem?.type != 'GENERAL') &&
                    (widget.singleLiveTextItem?.heading != 'null'))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(14.0, 3.0, 14.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if ((widget.singleLiveTextItem?.imagePathUrl != null &&
                                widget.singleLiveTextItem?.imagePathUrl !=
                                    '') &&
                            (widget.singleLiveTextItem?.imagePathUrl !=
                                'null'))
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.network(
                              widget.singleLiveTextItem!.imagePathUrl,
                              width: 45.0,
                              height: 40.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if ((widget.singleLiveTextItem?.heading != null &&
                                widget.singleLiveTextItem?.heading != '') &&
                            (widget.singleLiveTextItem?.heading != 'null'))
                          Expanded(
                            child: Text(
                              valueOrDefault<String>(
                                widget.singleLiveTextItem?.heading,
                                'TYPE',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 26.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(14.0, 6.0, 14.0, 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          widget.singleLiveTextItem!.description,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 21.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ),
                if ((widget.singleLiveTextItem?.mainImageUrl != null &&
                        widget.singleLiveTextItem?.mainImageUrl != '') &&
                    (widget.singleLiveTextItem?.mainImageUrl != 'null'))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(14.0, 5.0, 14.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: FlutterFlowExpandedImageView(
                              image: Image.network(
                                widget.singleLiveTextItem!.mainImageUrl,
                                fit: BoxFit.contain,
                              ),
                              allowRotation: false,
                              tag: widget.singleLiveTextItem!.mainImageUrl,
                              useHeroAnimation: true,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: widget.singleLiveTextItem!.mainImageUrl,
                        transitionOnUserGestures: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            widget.singleLiveTextItem!.mainImageUrl,
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 200.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
              ].addToEnd(SizedBox(height: 14.0)),
            ),
          ),
        ),
      ),
    );
  }
}
