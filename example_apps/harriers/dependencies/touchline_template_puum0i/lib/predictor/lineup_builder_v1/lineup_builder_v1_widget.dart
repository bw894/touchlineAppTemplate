import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/lineup_builder_component_widget.dart';
import '/components/view_lineups_builder_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lineup_builder_v1_model.dart';
export 'lineup_builder_v1_model.dart';

class LineupBuilderV1Widget extends StatefulWidget {
  const LineupBuilderV1Widget({
    super.key,
    required this.userName,
    required this.matchSummary,
    required this.matchObjectId,
    bool? closeReq,
  }) : this.closeReq = closeReq ?? true;

  final String? userName;
  final String? matchSummary;
  final String? matchObjectId;
  final bool closeReq;

  @override
  State<LineupBuilderV1Widget> createState() => _LineupBuilderV1WidgetState();
}

class _LineupBuilderV1WidgetState extends State<LineupBuilderV1Widget> {
  late LineupBuilderV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LineupBuilderV1Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (FFAppState().selectedPlayersLineupBuilder.length < 11) {
        FFAppState()
            .addToSelectedPlayersLineupBuilder(LineupBuilderPlayersStruct(
          added: false,
          index: valueOrDefault<int>(
            _model.current,
            0,
          ),
        ));
        safeSetState(() {});
        _model.current = _model.current + 1;
        safeSetState(() {});
      }
    });

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
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget!.closeReq)
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 6.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_outlined,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(valueOrDefault<double>(
                        FFLibraryValues().BRBottomLeft?.toDouble(),
                        0.0,
                      )),
                      bottomRight: Radius.circular(valueOrDefault<double>(
                        FFLibraryValues().BRBottomRight?.toDouble(),
                        0.0,
                      )),
                      topLeft: Radius.circular(valueOrDefault<double>(
                        FFLibraryValues().BRTopLeft?.toDouble(),
                        0.0,
                      )),
                      topRight: Radius.circular(valueOrDefault<double>(
                        FFLibraryValues().BRTopRight?.toDouble(),
                        0.0,
                      )),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget!.matchSummary,
                                        'Match Summary',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.barlow(
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      widget!.closeReq
                                          ? 'LINEUP BUILDER'
                                          : 'YOUR PREDICTION',
                                      'YOUR PREDICTION',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.bebasNeue(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 40.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                  if (_model.existingObjectId == null ||
                                      _model.existingObjectId == '')
                                    FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue ??= '',
                                      ),
                                      options: List<String>.from([
                                        '1,4,0,4,0,2',
                                        '1,4,0,3,0,3',
                                        '1,4,1,2,0,3',
                                        '1,4,2,1,0,3',
                                        '1,4,1,2,1,2',
                                        '1,4,1,3,0,2',
                                        '1,4,1,4,0,1',
                                        '1,4,2,0,2,2',
                                        '1,4,2,0,3,1',
                                        '1,4,0,2,0,4',
                                        '1,4,0,4,1,1',
                                        '1,4,1,4,0,1',
                                        '1,3,1,4,0,2',
                                        '1,3,0,4,1,2',
                                        '1,3,0,4,0,3',
                                        '1,3,0,5,0,2',
                                        '1,5,0,3,0,2',
                                        '1,5,0,2,0,3',
                                        '1,5,0,4,0,1'
                                      ]),
                                      optionLabels: [
                                        '4-4-2',
                                        '4-3-3',
                                        '4-3-3(2)',
                                        '4-3-3(3)',
                                        '4-4-2 diamond',
                                        '4-1-3-2',
                                        '4-1-4-1',
                                        '4-2-2-2',
                                        '4-2-3-1',
                                        '4-2-4',
                                        '4-4-1-1',
                                        '4-5-1',
                                        '3-1-4-2',
                                        '3-4-1-2',
                                        '3-4-3',
                                        '3-5-2',
                                        '5-3-2',
                                        '5-2-3',
                                        '5-4-1'
                                      ],
                                      onChanged: (val) async {
                                        safeSetState(
                                            () => _model.dropDownValue = val);
                                        _model.positionMap = functions
                                            .splitStringByCommaInt(
                                                _model.dropDownValue!)
                                            .toList()
                                            .cast<int>();
                                        _model.cumulativeListMap = functions
                                            .cumulativeSumByCommaInt(
                                                _model.dropDownValue!)
                                            .toList()
                                            .cast<int>();
                                        safeSetState(() {});
                                      },
                                      width: 200.0,
                                      height: 30.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Select formation...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  if ((FFAppState()
                                              .selectedPlayersLineupBuilder
                                              .length ==
                                          11) &&
                                      (_model.existingObjectId == null ||
                                          _model.existingObjectId == ''))
                                    Container(
                                      width: 260.0,
                                      height: 388.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: Image.asset(
                                            'packages/touchline_template_puum0i/assets/images/Your_paragraph_text.png',
                                          ).image,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (_model.positionMap
                                                    .elementAtOrNull(5)! >
                                                0)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  if (_model.positionMap
                                                          .elementAtOrNull(5)! >
                                                      0)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel1,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                            .cumulativeListMap
                                                            .elementAtOrNull(
                                                                4)!),
                                                      ),
                                                    ),
                                                  if (_model.positionMap
                                                          .elementAtOrNull(5)! >
                                                      1)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel2,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                                .cumulativeListMap
                                                                .elementAtOrNull(
                                                                    4)!) +
                                                            1,
                                                      ),
                                                    ),
                                                  if (_model.positionMap
                                                          .elementAtOrNull(5)! >
                                                      2)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel3,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                                .cumulativeListMap
                                                                .elementAtOrNull(
                                                                    4)!) +
                                                            2,
                                                      ),
                                                    ),
                                                  if (_model.positionMap
                                                          .elementAtOrNull(5)! >
                                                      3)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel4,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                                .cumulativeListMap
                                                                .elementAtOrNull(
                                                                    4)!) +
                                                            3,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            if (_model.positionMap
                                                    .elementAtOrNull(4)! >
                                                0)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  if (_model.positionMap
                                                          .elementAtOrNull(4)! >
                                                      0)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel5,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                            .cumulativeListMap
                                                            .elementAtOrNull(
                                                                3)!),
                                                      ),
                                                    ),
                                                  if (_model.positionMap
                                                          .elementAtOrNull(4)! >
                                                      1)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel6,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                                .cumulativeListMap
                                                                .elementAtOrNull(
                                                                    3)!) +
                                                            1,
                                                      ),
                                                    ),
                                                  if (_model.positionMap
                                                          .elementAtOrNull(4)! >
                                                      2)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel7,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                                .cumulativeListMap
                                                                .elementAtOrNull(
                                                                    3)!) +
                                                            2,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            if (_model.positionMap
                                                    .elementAtOrNull(3)! >
                                                0)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  if (_model.positionMap
                                                          .elementAtOrNull(3)! >
                                                      0)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel8,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                            .cumulativeListMap
                                                            .elementAtOrNull(
                                                                2)!),
                                                      ),
                                                    ),
                                                  if (_model.positionMap
                                                          .elementAtOrNull(3)! >
                                                      1)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel9,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                                .cumulativeListMap
                                                                .elementAtOrNull(
                                                                    2)!) +
                                                            1,
                                                      ),
                                                    ),
                                                  if (_model.positionMap
                                                          .elementAtOrNull(3)! >
                                                      2)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel10,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                                .cumulativeListMap
                                                                .elementAtOrNull(
                                                                    2)!) +
                                                            2,
                                                      ),
                                                    ),
                                                  if (_model.positionMap
                                                          .elementAtOrNull(3)! >
                                                      3)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel11,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                                .cumulativeListMap
                                                                .elementAtOrNull(
                                                                    2)!) +
                                                            3,
                                                      ),
                                                    ),
                                                  if (_model.positionMap
                                                          .elementAtOrNull(3)! >
                                                      4)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel12,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                                .cumulativeListMap
                                                                .elementAtOrNull(
                                                                    2)!) +
                                                            4,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            if (_model.positionMap
                                                    .elementAtOrNull(2)! >
                                                0)
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  if (_model.positionMap
                                                          .elementAtOrNull(2)! >
                                                      0)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel13,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                            .cumulativeListMap
                                                            .elementAtOrNull(
                                                                1)!),
                                                      ),
                                                    ),
                                                  if (_model.positionMap
                                                          .elementAtOrNull(2)! >
                                                      1)
                                                    wrapWithModel(
                                                      model: _model
                                                          .lineupBuilderComponentModel14,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          LineupBuilderComponentWidget(
                                                        index: (_model
                                                                .cumulativeListMap
                                                                .elementAtOrNull(
                                                                    1)!) +
                                                            1,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                wrapWithModel(
                                                  model: _model
                                                      .lineupBuilderComponentModel15,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      LineupBuilderComponentWidget(
                                                    index: 1,
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .lineupBuilderComponentModel16,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      LineupBuilderComponentWidget(
                                                    index: 2,
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .lineupBuilderComponentModel17,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      LineupBuilderComponentWidget(
                                                    index: 3,
                                                  ),
                                                ),
                                                if (_model.positionMap
                                                        .elementAtOrNull(1)! >
                                                    3)
                                                  wrapWithModel(
                                                    model: _model
                                                        .lineupBuilderComponentModel18,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        LineupBuilderComponentWidget(
                                                      index: 4,
                                                    ),
                                                  ),
                                                if (_model.positionMap
                                                        .elementAtOrNull(1)! >
                                                    4)
                                                  wrapWithModel(
                                                    model: _model
                                                        .lineupBuilderComponentModel19,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        LineupBuilderComponentWidget(
                                                      index: 5,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                wrapWithModel(
                                                  model: _model
                                                      .lineupBuilderComponentModel20,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      LineupBuilderComponentWidget(
                                                    index: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (_model.existingObjectId == null ||
                                      _model.existingObjectId == '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Container(
                                        width: 260.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFDFDDDD),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FontAwesomeIcons.userTie,
                                                color: Color(0xFF45484A),
                                                size: 24.0,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Manager:',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF45484A),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      widget!.userName,
                                                      'Anonymous',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color:
                                                              Color(0xFF45484A),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (_model.existingObjectId != null &&
                                      _model.existingObjectId != '')
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: wrapWithModel(
                                        model: _model.viewLineupsBuilderModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ViewLineupsBuilderWidget(
                                          objectId: _model.existingObjectId!,
                                        ),
                                      ),
                                    ),
                                  if (_model.existingObjectId == null ||
                                      _model.existingObjectId == '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          if (FFAppState()
                                                  .selectedPlayersLineupBuilder
                                                  .where(
                                                      (e) => e.added == false)
                                                  .toList()
                                                  .length >
                                              0) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: Text('Error'),
                                                    content: Text(
                                                        'Please select all players!'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                          if (_model.dropDownValue == null ||
                                              _model.dropDownValue == '') {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: Text('Error'),
                                                    content: Text(
                                                        'Please select a formation!'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                          _model.addEntry =
                                              await BackendlessDatabaseGroup
                                                  .addLineupsBuilderEntryCall
                                                  .call(
                                            userName: widget!.userName,
                                            selectedPlayersJson: functions
                                                .formatLineupBuilderPlayers2(
                                                    FFAppState()
                                                        .selectedPlayersLineupBuilder
                                                        .toList()),
                                            bLProjectId:
                                                FFLibraryValues().BLProjectId,
                                            bLRestAPIKey:
                                                FFLibraryValues().BLRestAPIKey,
                                            headerName: 'user-token',
                                            headerValue: FFAppState().userToken,
                                            playerMap: _model.dropDownValue,
                                          );

                                          _shouldSetState = true;
                                          if ((_model.addEntry?.succeeded ??
                                              true)) {
                                            _model.apiResulty6t =
                                                await BackendlessDatabaseGroup
                                                    .addMatchToLineupsBuilderEntryCall
                                                    .call(
                                              lineupsObjectId:
                                                  PublicLineupsBuilderStruct
                                                          .maybeFromMap((_model
                                                                  .addEntry
                                                                  ?.jsonBody ??
                                                              ''))
                                                      ?.objectId,
                                              matchObjectId:
                                                  widget!.matchObjectId,
                                              bLProjectId:
                                                  FFLibraryValues().BLProjectId,
                                              bLRestAPIKey: FFLibraryValues()
                                                  .BLRestAPIKey,
                                            );

                                            _shouldSetState = true;
                                            if ((_model
                                                    .apiResulty6t?.succeeded ??
                                                true)) {
                                              _model.existingObjectId =
                                                  PublicLineupsBuilderStruct
                                                          .maybeFromMap((_model
                                                                  .addEntry
                                                                  ?.jsonBody ??
                                                              ''))
                                                      ?.objectId;
                                              safeSetState(() {});
                                              FFAppState()
                                                  .selectedPlayersLineupBuilder = [];
                                              safeSetState(() {});
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: Text('Add fail 2'),
                                                      content: Text((_model
                                                              .apiResulty6t
                                                              ?.bodyText ??
                                                          '')),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title:
                                                        Text('Fail to add 1'),
                                                    content: Text((_model
                                                            .addEntry
                                                            ?.bodyText ??
                                                        '')),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        text: 'Save Team',
                                        icon: Icon(
                                          Icons.save_rounded,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 260.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                      ),
                                    ),
                                  if ((_model.existingObjectId != null &&
                                          _model.existingObjectId != '') &&
                                      responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Share My Team',
                                        icon: Icon(
                                          Icons.share_sharp,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 260.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                      ),
                                    ),
                                  if (_model.existingObjectId != null &&
                                      _model.existingObjectId != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Text(
                                        'Team Selection Saved',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                ].divide(SizedBox(height: 2.0)),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
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
