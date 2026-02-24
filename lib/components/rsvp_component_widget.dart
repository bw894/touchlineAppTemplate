import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'rsvp_component_model.dart';
export 'rsvp_component_model.dart';

class RsvpComponentWidget extends StatefulWidget {
  const RsvpComponentWidget({
    super.key,
    this.playerName,
    required this.playerObjectId,
    required this.eventObjectId,
    required this.currentRSVP,
    required this.currentRSVPObjectId,
  });

  final String? playerName;
  final String? playerObjectId;
  final String? eventObjectId;
  final String? currentRSVP;
  final String? currentRSVPObjectId;

  @override
  State<RsvpComponentWidget> createState() => _RsvpComponentWidgetState();
}

class _RsvpComponentWidgetState extends State<RsvpComponentWidget> {
  late RsvpComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RsvpComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              'Will ${widget.playerName} be there?',
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
                  ChipData('YES', Icons.check_sharp),
                  ChipData('UNSURE', Icons.question_mark),
                  ChipData('NO', Icons.close_sharp)
                ],
                onChanged: (val) async {
                  safeSetState(
                      () => _model.choiceChipsValue = val?.firstOrNull);
                  if (widget.currentRSVPObjectId != null &&
                      widget.currentRSVPObjectId != '') {
                    _model.apiResult85o =
                        await YouthManagementGroup.updateEventRSVPCall.call(
                      rsvpObjectId: widget.currentRSVPObjectId,
                      status: _model.choiceChipsValue,
                      bLappId: FFLibraryValues().BLProjectId,
                      bLRestApiKey: FFLibraryValues().BLRestAPIKey,
                    );

                    if (!(_model.apiResult85o?.succeeded ?? true)) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: Text('Update error'),
                              content:
                                  Text((_model.apiResult85o?.bodyText ?? '')),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  } else {
                    _model.apiResult8xy =
                        await YouthManagementGroup.addNewEventRSVPCall.call(
                      eventObjectId: widget.eventObjectId,
                      playerObjectId: widget.playerObjectId,
                      status: _model.choiceChipsValue,
                      bLappId: FFLibraryValues().BLProjectId,
                      bLRestApiKey: FFLibraryValues().BLRestAPIKey,
                    );

                    if (!(_model.apiResult8xy?.succeeded ?? true)) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return WebViewAware(
                            child: AlertDialog(
                              title: Text('Create error'),
                              content:
                                  Text((_model.apiResult8xy?.bodyText ?? '')),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }

                  safeSetState(() {});
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
                  [widget.currentRSVP!],
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
