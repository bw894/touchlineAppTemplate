import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'event_r_s_v_p_v1_model.dart';
export 'event_r_s_v_p_v1_model.dart';

class EventRSVPV1Widget extends StatefulWidget {
  const EventRSVPV1Widget({
    super.key,
    this.playerName,
    this.isRSVPYes,
    this.isRSVPNo,
    this.isRSVPUnsure,
    required this.playerObjectId,
    required this.eventObjectId,
  });

  final String? playerName;
  final bool? isRSVPYes;
  final bool? isRSVPNo;
  final bool? isRSVPUnsure;
  final String? playerObjectId;
  final String? eventObjectId;

  @override
  State<EventRSVPV1Widget> createState() => _EventRSVPV1WidgetState();
}

class _EventRSVPV1WidgetState extends State<EventRSVPV1Widget> {
  late EventRSVPV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventRSVPV1Model());

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
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
        padding: EdgeInsetsDirectional.fromSTEB(31.0, 12.0, 31.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Will you be there?',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: FlutterFlowChoiceChips(
                options: [
                  ChipData('INTERESTED', Icons.question_mark),
                  ChipData('GOING', Icons.check_sharp)
                ],
                onChanged: (val) async {
                  safeSetState(
                      () => _model.choiceChipsValue = val?.firstOrNull);
                  var _shouldSetState = false;
                  if (_model.choiceChipsValue == 'YES') {
                    if (widget!.isRSVPYes!) {
                      if (_shouldSetState) safeSetState(() {});
                      return;
                    }

                    if (widget!.isRSVPNo!) {
                      _model.apiResultkzf =
                          await TeamsGroup.removeRSVPForTeamEventCall.call(
                        playerObjectId: widget!.playerObjectId,
                        teamEventObjectId: widget!.eventObjectId,
                        rsvp: 'NO',
                        userToken: FFAppState().userToken,
                        bLappId: FFLibraryValues().BLProjectId,
                        bLRestApiKey: FFLibraryValues().BLRestAPIKey,
                      );

                      _shouldSetState = true;
                      if (!(_model.apiResultkzf?.succeeded ?? true)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Failed to remove NO',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 1750),
                            backgroundColor: FlutterFlowTheme.of(context).error,
                          ),
                        );
                      }
                    } else {
                      // If this is false, there is no current RSVP, addition-only is therefore fine
                      if (widget!.isRSVPUnsure!) {
                        _model.apiResultkzf2 =
                            await TeamsGroup.removeRSVPForTeamEventCall.call(
                          playerObjectId: widget!.playerObjectId,
                          teamEventObjectId: widget!.eventObjectId,
                          rsvp: 'UNSURE',
                          userToken: FFAppState().userToken,
                          bLappId: FFLibraryValues().BLProjectId,
                          bLRestApiKey: FFLibraryValues().BLRestAPIKey,
                        );

                        _shouldSetState = true;
                        if (!(_model.apiResultkzf2?.succeeded ?? true)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Failed to remove UNSURE',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 1750),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                        }
                      }
                    }

                    _model.apiResulttcq =
                        await TeamsGroup.addRSVPToTeamEventCall.call(
                      teamEventObjectId: widget!.eventObjectId,
                      rsvp: 'YES',
                      playerObjectId: widget!.playerObjectId,
                      userToken: FFAppState().userToken,
                      bLappId: FFLibraryValues().BLProjectId,
                      bLRestApiKey: FFLibraryValues().BLRestAPIKey,
                    );

                    _shouldSetState = true;
                    if (!(_model.apiResulttcq?.succeeded ?? true)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Failed to add YES',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 1750),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }
                  } else {
                    if (_model.choiceChipsValue == 'NO') {
                      if (widget!.isRSVPNo!) {
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }

                      if (widget!.isRSVPYes!) {
                        _model.apiResultkzf3 =
                            await TeamsGroup.removeRSVPForTeamEventCall.call(
                          playerObjectId: widget!.playerObjectId,
                          teamEventObjectId: widget!.eventObjectId,
                          rsvp: 'YES',
                          userToken: FFAppState().userToken,
                          bLappId: FFLibraryValues().BLProjectId,
                          bLRestApiKey: FFLibraryValues().BLRestAPIKey,
                        );

                        _shouldSetState = true;
                        if (!(_model.apiResultkzf3?.succeeded ?? true)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Failed to remove YES',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 1750),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                        }
                      } else {
                        if (widget!.isRSVPUnsure!) {
                          _model.apiResultkzf4 =
                              await TeamsGroup.removeRSVPForTeamEventCall.call(
                            playerObjectId: widget!.playerObjectId,
                            teamEventObjectId: widget!.eventObjectId,
                            rsvp: 'UNSURE',
                            userToken: FFAppState().userToken,
                            bLappId: FFLibraryValues().BLProjectId,
                            bLRestApiKey: FFLibraryValues().BLRestAPIKey,
                          );

                          _shouldSetState = true;
                          if (!(_model.apiResultkzf4?.succeeded ?? true)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Failed to remove UNSURE',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 1750),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                          }
                        }
                      }

                      _model.apiResulttcq2 =
                          await TeamsGroup.addRSVPToTeamEventCall.call(
                        teamEventObjectId: widget!.eventObjectId,
                        rsvp: 'NO',
                        playerObjectId: widget!.playerObjectId,
                        userToken: FFAppState().userToken,
                        bLappId: FFLibraryValues().BLProjectId,
                        bLRestApiKey: FFLibraryValues().BLRestAPIKey,
                      );

                      _shouldSetState = true;
                      if (!(_model.apiResulttcq2?.succeeded ?? true)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Failed to add NO',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 1750),
                            backgroundColor: FlutterFlowTheme.of(context).error,
                          ),
                        );
                      }
                    } else {
                      // It is impossible for this to be false
                      if (_model.choiceChipsValue == 'UNSURE') {
                        if (widget!.isRSVPUnsure!) {
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }

                        if (widget!.isRSVPYes!) {
                          _model.apiResultkzf5 =
                              await TeamsGroup.removeRSVPForTeamEventCall.call(
                            playerObjectId: widget!.playerObjectId,
                            teamEventObjectId: widget!.eventObjectId,
                            rsvp: 'YES',
                            userToken: FFAppState().userToken,
                            bLappId: FFLibraryValues().BLProjectId,
                            bLRestApiKey: FFLibraryValues().BLRestAPIKey,
                          );

                          _shouldSetState = true;
                          if (!(_model.apiResultkzf5?.succeeded ?? true)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Failed to remove YES',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 1750),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).error,
                              ),
                            );
                          }
                        } else {
                          if (widget!.isRSVPNo!) {
                            _model.apiResultkzf6 = await TeamsGroup
                                .removeRSVPForTeamEventCall
                                .call(
                              playerObjectId: widget!.playerObjectId,
                              teamEventObjectId: widget!.eventObjectId,
                              rsvp: 'NO',
                              userToken: FFAppState().userToken,
                              bLappId: FFLibraryValues().BLProjectId,
                              bLRestApiKey: FFLibraryValues().BLRestAPIKey,
                            );

                            _shouldSetState = true;
                            if (!(_model.apiResultkzf6?.succeeded ?? true)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Failed to remove NO',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 1750),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            }
                          }
                        }
                      } else {
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }

                      _model.apiResulttcq3 =
                          await TeamsGroup.addRSVPToTeamEventCall.call(
                        teamEventObjectId: widget!.eventObjectId,
                        rsvp: 'UNSURE',
                        playerObjectId: widget!.playerObjectId,
                        userToken: FFAppState().userToken,
                        bLappId: FFLibraryValues().BLProjectId,
                        bLRestApiKey: FFLibraryValues().BLRestAPIKey,
                      );

                      _shouldSetState = true;
                      if (!(_model.apiResulttcq3?.succeeded ?? true)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Failed to add UNSURE',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 1750),
                            backgroundColor: FlutterFlowTheme.of(context).error,
                          ),
                        );
                      }
                    }
                  }

                  await action_blocks.refreshUserData(context);
                  safeSetState(() {});
                  if (_shouldSetState) safeSetState(() {});
                },
                selectedChipStyle: ChipStyle(
                  backgroundColor: Colors.white,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 11.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).primary,
                  iconSize: 12.0,
                  labelPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                  elevation: 0.0,
                  borderColor: Colors.white,
                  borderWidth: 1.0,
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
                unselectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 11.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).secondaryBackground,
                  iconSize: 12.0,
                  labelPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  elevation: 0.0,
                  borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                  borderWidth: 0.0,
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
                chipSpacing: 20.0,
                rowSpacing: 8.0,
                multiselect: false,
                initialized: _model.choiceChipsValue != null,
                alignment: WrapAlignment.center,
                controller: _model.choiceChipsValueController ??=
                    FormFieldController<List<String>>(
                  [
                    () {
                      if (widget!.isRSVPYes!) {
                        return 'YES';
                      } else if (widget!.isRSVPNo!) {
                        return 'NO';
                      } else if (widget!.isRSVPUnsure!) {
                        return 'UNSURE';
                      } else {
                        return null!;
                      }
                    }()
                  ],
                ),
                wrapped: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
