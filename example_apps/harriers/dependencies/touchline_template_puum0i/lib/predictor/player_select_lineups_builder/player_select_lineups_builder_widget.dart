import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'player_select_lineups_builder_model.dart';
export 'player_select_lineups_builder_model.dart';

class PlayerSelectLineupsBuilderWidget extends StatefulWidget {
  const PlayerSelectLineupsBuilderWidget({
    super.key,
    int? index,
  }) : this.index = index ?? 0;

  final int index;

  @override
  State<PlayerSelectLineupsBuilderWidget> createState() =>
      _PlayerSelectLineupsBuilderWidgetState();
}

class _PlayerSelectLineupsBuilderWidgetState
    extends State<PlayerSelectLineupsBuilderWidget> {
  late PlayerSelectLineupsBuilderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerSelectLineupsBuilderModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().playersForLineupsBuilder.length == 0) {
        _model.apiResultood =
            await BackendlessDatabaseGroup.lineupsBuilderCacheCall.call(
          bLProjectId: FFLibraryValues().BLProjectId,
          bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
        );

        if (((_model.apiResultood?.bodyText ?? '') == 'null') ||
            (((_model.apiResultood?.jsonBody ?? '')
                        .toList()
                        .map<PlayerStruct?>(PlayerStruct.maybeFromMap)
                        .toList() as Iterable<PlayerStruct?>)
                    .withoutNulls
                    ?.length ==
                0)) {
          _model.apiResultb1t =
              await BackendlessDatabaseGroup.playersForLineupsBuilderCall.call(
            teamObjectId: FFLibraryValues().focusTeamObjectId,
            bLProjectId: FFLibraryValues().BLProjectId,
            bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
          );

          if ((_model.apiResultb1t?.succeeded ?? true)) {
            FFAppState().playersForLineupsBuilder =
                ((_model.apiResultb1t?.jsonBody ?? '')
                        .toList()
                        .map<PlayerStruct?>(PlayerStruct.maybeFromMap)
                        .toList() as Iterable<PlayerStruct?>)
                    .withoutNulls
                    .toList()
                    .cast<PlayerStruct>();
            FFAppState().update(() {});
            _model.apiResult3b6 =
                await BackendlessDatabaseGroup.setLineupsBuilderCacheCall.call(
              valueeJson: (_model.apiResultb1t?.jsonBody ?? ''),
              bLProjectId: FFLibraryValues().BLProjectId,
              bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
            );
          } else {
            context.safePop();
          }
        } else {
          FFAppState().playersForLineupsBuilder =
              ((_model.apiResultood?.jsonBody ?? '')
                      .toList()
                      .map<PlayerStruct?>(PlayerStruct.maybeFromMap)
                      .toList() as Iterable<PlayerStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<PlayerStruct>();
          safeSetState(() {});
        }
      } else {
        return;
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    if (FFAppState()
                        .selectedPlayersLineupBuilder
                        .elementAtOrNull(widget!.index)!
                        .added) {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: Text('Remove player'),
                                  content: Text('Are you sure?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Confirm'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        FFAppState().updateSelectedPlayersLineupBuilderAtIndex(
                          widget!.index,
                          (e) => e
                            ..name = null
                            ..number = null
                            ..image = null
                            ..objectId = null
                            ..added = false,
                        );
                        safeSetState(() {});
                      } else {
                        return;
                      }
                    }
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
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'SELECT',
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
                                            fontSize: 13.0,
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
                                    'PLAYER',
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
                                          fontSize: 30.0,
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
                                  Container(
                                    width: 200.0,
                                  ),
                                ].divide(SizedBox(height: 2.0)),
                              ),
                            ].divide(SizedBox(width: 5.0)),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            final plyr =
                                FFAppState().playersForLineupsBuilder.toList();

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: plyr.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 4.0),
                              itemBuilder: (context, plyrIndex) {
                                final plyrItem = plyr[plyrIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState()
                                        .updateSelectedPlayersLineupBuilderAtIndex(
                                      widget!.index,
                                      (e) => e
                                        ..name = functions
                                            .splitStringByFirstSpace(
                                                plyrItem.playerName)
                                            .lastOrNull
                                        ..number = plyrItem.number
                                        ..image = plyrItem.playerPictureurl
                                        ..objectId = plyrItem.objectId
                                        ..index = widget!.index
                                        ..added = true,
                                    );
                                    FFAppState().update(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: plyrItem.objectId ==
                                              FFAppState()
                                                  .selectedPlayersLineupBuilder
                                                  .elementAtOrNull(
                                                      widget!.index)
                                                  ?.objectId
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Divider(
                                          height: 1.0,
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    plyrItem.posAbr,
                                                    'GK',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: plyrItem
                                                                    .objectId ==
                                                                FFAppState()
                                                                    .selectedPlayersLineupBuilder
                                                                    .elementAtOrNull(
                                                                        widget!
                                                                            .index)
                                                                    ?.objectId
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Text(
                                                  plyrItem.playerName
                                                      .maybeHandleOverflow(
                                                    maxChars: 27,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: plyrItem
                                                                    .objectId ==
                                                                FFAppState()
                                                                    .selectedPlayersLineupBuilder
                                                                    .elementAtOrNull(
                                                                        widget!
                                                                            .index)
                                                                    ?.objectId
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                if (plyrItem.objectId !=
                                                    FFAppState()
                                                        .selectedPlayersLineupBuilder
                                                        .elementAtOrNull(
                                                            widget!.index)
                                                        ?.objectId)
                                                  Icon(
                                                    Icons.add,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
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
