import '/backend/api_requests/api_calls.dart';
import '/components/view_lineups_builder_player_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view_lineups_builder_model.dart';
export 'view_lineups_builder_model.dart';

class ViewLineupsBuilderWidget extends StatefulWidget {
  const ViewLineupsBuilderWidget({
    super.key,
    required this.objectId,
  });

  final String? objectId;

  @override
  State<ViewLineupsBuilderWidget> createState() =>
      _ViewLineupsBuilderWidgetState();
}

class _ViewLineupsBuilderWidgetState extends State<ViewLineupsBuilderWidget> {
  late ViewLineupsBuilderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewLineupsBuilderModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultarm =
          await BackendlessDatabaseGroup.getLineupsBuilderEntryByIDCall.call(
        objectId: widget.objectId,
        bLProjectId: FFLibraryValues().BLProjectId,
        bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
      );

      if ((_model.apiResultarm?.succeeded ?? true)) {
        _model.playerMap = functions
            .splitStringByCommaInt(PublicLineupsBuilderStruct.maybeFromMap(
                    (_model.apiResultarm?.jsonBody ?? ''))!
                .playerMap)
            .toList()
            .cast<int>();
        _model.cumulativePlayerMap = functions
            .cumulativeSumByCommaInt(PublicLineupsBuilderStruct.maybeFromMap(
                    (_model.apiResultarm?.jsonBody ?? ''))!
                .playerMap)
            .toList()
            .cast<int>();
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
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: FutureBuilder<ApiCallResponse>(
        future: BackendlessDatabaseGroup.getLineupsBuilderEntryByIDCall.call(
          objectId: widget.objectId,
          bLProjectId: FFLibraryValues().BLProjectId,
          bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitWanderingCubes(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            );
          }
          final containerGetLineupsBuilderEntryByIDResponse = snapshot.data!;

          return Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 260.0,
                    height: 388.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/Your_paragraph_text.png',
                        ).image,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (_model.playerMap.elementAtOrNull(5)! > 0)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                if (_model.playerMap.elementAtOrNull(5)! > 0)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model:
                                          _model.viewLineupsBuilderPlayerModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                            .elementAtOrNull(4)!),
                                      ),
                                    ),
                                  ),
                                if (_model.playerMap.elementAtOrNull(5)! > 1)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model:
                                          _model.viewLineupsBuilderPlayerModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                                .elementAtOrNull(4)!) +
                                            1,
                                      ),
                                    ),
                                  ),
                                if (_model.playerMap.elementAtOrNull(5)! > 2)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model:
                                          _model.viewLineupsBuilderPlayerModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                                .elementAtOrNull(4)!) +
                                            2,
                                      ),
                                    ),
                                  ),
                                if (_model.playerMap.elementAtOrNull(5)! > 3)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model:
                                          _model.viewLineupsBuilderPlayerModel4,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                                .elementAtOrNull(4)!) +
                                            3,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          if (_model.playerMap.elementAtOrNull(4)! > 0)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                if (_model.playerMap.elementAtOrNull(4)! > 0)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model:
                                          _model.viewLineupsBuilderPlayerModel5,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                            .elementAtOrNull(3)!),
                                      ),
                                    ),
                                  ),
                                if (_model.playerMap.elementAtOrNull(4)! > 1)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model:
                                          _model.viewLineupsBuilderPlayerModel6,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                                .elementAtOrNull(3)!) +
                                            1,
                                      ),
                                    ),
                                  ),
                                if (_model.playerMap.elementAtOrNull(4)! > 2)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model:
                                          _model.viewLineupsBuilderPlayerModel7,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                                .elementAtOrNull(3)!) +
                                            2,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          if (_model.playerMap.elementAtOrNull(3)! > 0)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                if (_model.playerMap.elementAtOrNull(3)! > 0)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model:
                                          _model.viewLineupsBuilderPlayerModel8,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                            .elementAtOrNull(2)!),
                                      ),
                                    ),
                                  ),
                                if (_model.playerMap.elementAtOrNull(3)! > 1)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model:
                                          _model.viewLineupsBuilderPlayerModel9,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                                .elementAtOrNull(2)!) +
                                            1,
                                      ),
                                    ),
                                  ),
                                if (_model.playerMap.elementAtOrNull(3)! > 2)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model
                                          .viewLineupsBuilderPlayerModel10,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                                .elementAtOrNull(2)!) +
                                            2,
                                      ),
                                    ),
                                  ),
                                if (_model.playerMap.elementAtOrNull(3)! > 3)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model
                                          .viewLineupsBuilderPlayerModel11,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                                .elementAtOrNull(2)!) +
                                            3,
                                      ),
                                    ),
                                  ),
                                if (_model.playerMap.elementAtOrNull(3)! > 4)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model
                                          .viewLineupsBuilderPlayerModel12,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                                .elementAtOrNull(2)!) +
                                            4,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          if (_model.playerMap.elementAtOrNull(2)! > 0)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                if (_model.playerMap.elementAtOrNull(2)! > 0)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model
                                          .viewLineupsBuilderPlayerModel13,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                            .elementAtOrNull(1)!),
                                      ),
                                    ),
                                  ),
                                if (_model.playerMap.elementAtOrNull(2)! > 1)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model
                                          .viewLineupsBuilderPlayerModel14,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ViewLineupsBuilderPlayerWidget(
                                        allPlayers: PublicLineupsBuilderStruct
                                                .maybeFromMap(
                                                    containerGetLineupsBuilderEntryByIDResponse
                                                        .jsonBody)!
                                            .selectedPlayers,
                                        index: (_model.cumulativePlayerMap
                                                .elementAtOrNull(1)!) +
                                            1,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.viewLineupsBuilderPlayerModel15,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ViewLineupsBuilderPlayerWidget(
                                    allPlayers:
                                        PublicLineupsBuilderStruct.maybeFromMap(
                                                containerGetLineupsBuilderEntryByIDResponse
                                                    .jsonBody)!
                                            .selectedPlayers,
                                    index: 1,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.viewLineupsBuilderPlayerModel16,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ViewLineupsBuilderPlayerWidget(
                                    allPlayers:
                                        PublicLineupsBuilderStruct.maybeFromMap(
                                                containerGetLineupsBuilderEntryByIDResponse
                                                    .jsonBody)!
                                            .selectedPlayers,
                                    index: 2,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.viewLineupsBuilderPlayerModel17,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ViewLineupsBuilderPlayerWidget(
                                    allPlayers:
                                        PublicLineupsBuilderStruct.maybeFromMap(
                                                containerGetLineupsBuilderEntryByIDResponse
                                                    .jsonBody)!
                                            .selectedPlayers,
                                    index: 3,
                                  ),
                                ),
                              ),
                              if (_model.playerMap.elementAtOrNull(1)! > 3)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model:
                                        _model.viewLineupsBuilderPlayerModel18,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ViewLineupsBuilderPlayerWidget(
                                      allPlayers: PublicLineupsBuilderStruct
                                              .maybeFromMap(
                                                  containerGetLineupsBuilderEntryByIDResponse
                                                      .jsonBody)!
                                          .selectedPlayers,
                                      index: 4,
                                    ),
                                  ),
                                ),
                              if (_model.playerMap.elementAtOrNull(1)! > 4)
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: wrapWithModel(
                                    model:
                                        _model.viewLineupsBuilderPlayerModel19,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ViewLineupsBuilderPlayerWidget(
                                      allPlayers: PublicLineupsBuilderStruct
                                              .maybeFromMap(
                                                  containerGetLineupsBuilderEntryByIDResponse
                                                      .jsonBody)!
                                          .selectedPlayers,
                                      index: 5,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.viewLineupsBuilderPlayerModel20,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ViewLineupsBuilderPlayerWidget(
                                    allPlayers:
                                        PublicLineupsBuilderStruct.maybeFromMap(
                                                containerGetLineupsBuilderEntryByIDResponse
                                                    .jsonBody)!
                                            .selectedPlayers,
                                    index: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Container(
                      width: 260.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFDFDDDD),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF45484A),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    PublicLineupsBuilderStruct.maybeFromMap(
                                            containerGetLineupsBuilderEntryByIDResponse
                                                .jsonBody)
                                        ?.userName,
                                    'Anonymous',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Color(0xFF45484A),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
