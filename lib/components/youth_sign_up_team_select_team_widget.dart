import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'youth_sign_up_team_select_team_model.dart';
export 'youth_sign_up_team_select_team_model.dart';

class YouthSignUpTeamSelectTeamWidget extends StatefulWidget {
  const YouthSignUpTeamSelectTeamWidget({
    super.key,
    required this.team,
    required this.onTeamSelect,
    required this.onSquadNumberSelect,
    required this.onShirtSizeSelect,
    int? subpage,
    required this.teamObjectId,
  }) : this.subpage = subpage ?? 0;

  final TeamStruct? team;
  final Future Function(String teamObjectId)? onTeamSelect;
  final Future Function(int? squadNumber)? onSquadNumberSelect;
  final Future Function(String shirtSize)? onShirtSizeSelect;
  final int subpage;
  final String? teamObjectId;

  @override
  State<YouthSignUpTeamSelectTeamWidget> createState() =>
      _YouthSignUpTeamSelectTeamWidgetState();
}

class _YouthSignUpTeamSelectTeamWidgetState
    extends State<YouthSignUpTeamSelectTeamWidget> {
  late YouthSignUpTeamSelectTeamModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YouthSignUpTeamSelectTeamModel());

    _model.squadNumberTextController ??= TextEditingController();
    _model.squadNumberFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 230),
      curve: Curves.easeInOut,
      height: 120.0,
      constraints: BoxConstraints(
        maxWidth: 500.0,
      ),
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          (widget.subpage != 0) &&
                  (widget.team?.objectId == widget.teamObjectId)
              ? FlutterFlowTheme.of(context).primary
              : Color(0xFFEFEFEF),
          Color(0xFFEFEFEF),
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        children: [
          if ((widget.subpage == 2) &&
              (widget.team?.objectId == widget.teamObjectId))
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(14.0, 20.0, 0.0, 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          FFLibraryValues().ClubBadgeOnPrimary != null &&
                                  FFLibraryValues().ClubBadgeOnPrimary != ''
                              ? FFLibraryValues().ClubBadgeOnPrimary
                              : FFLibraryValues().ClubBadge,
                          'https://staging.touchlineclub.com/images/logo-1.png',
                        ),
                        width: 60.0,
                        height: 100.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'INPUT SHIRT SIZE',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Wrap(
                                    spacing: 4.0,
                                    runSpacing: 4.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.shirtSizeSelected = 'XS';
                                          safeSetState(() {});
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeInOut,
                                          width: 38.0,
                                          decoration: BoxDecoration(
                                            color: _model.shirtSizeSelected ==
                                                    'XS'
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: AnimatedDefaultTextStyle(
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color:
                                                        _model.shirtSizeSelected ==
                                                                'XS'
                                                            ? Colors.white
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                              duration:
                                                  Duration(milliseconds: 315),
                                              curve: Curves.easeIn,
                                              child: Text(
                                                'XS',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.shirtSizeSelected = 'S';
                                          safeSetState(() {});
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 260),
                                          curve: Curves.easeInOut,
                                          width: 38.0,
                                          decoration: BoxDecoration(
                                            color: _model.shirtSizeSelected ==
                                                    'S'
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: AnimatedDefaultTextStyle(
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color:
                                                        _model.shirtSizeSelected ==
                                                                'S'
                                                            ? Colors.white
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                              duration:
                                                  Duration(milliseconds: 240),
                                              curve: Curves.easeIn,
                                              child: Text(
                                                'S',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.shirtSizeSelected = 'M';
                                          safeSetState(() {});
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 260),
                                          curve: Curves.easeInOut,
                                          width: 38.0,
                                          decoration: BoxDecoration(
                                            color: _model.shirtSizeSelected ==
                                                    'M'
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: AnimatedDefaultTextStyle(
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color:
                                                        _model.shirtSizeSelected ==
                                                                'M'
                                                            ? Colors.white
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                              duration:
                                                  Duration(milliseconds: 315),
                                              curve: Curves.easeIn,
                                              child: Text(
                                                'M',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.shirtSizeSelected = 'L';
                                          safeSetState(() {});
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 220),
                                          curve: Curves.easeInOut,
                                          width: 38.0,
                                          decoration: BoxDecoration(
                                            color: _model.shirtSizeSelected ==
                                                    'L'
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: AnimatedDefaultTextStyle(
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color:
                                                        _model.shirtSizeSelected ==
                                                                'L'
                                                            ? Colors.white
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                              duration:
                                                  Duration(milliseconds: 315),
                                              curve: Curves.easeIn,
                                              child: Text(
                                                'L',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.shirtSizeSelected = 'XL';
                                          safeSetState(() {});
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 250),
                                          curve: Curves.easeInOut,
                                          width: 38.0,
                                          decoration: BoxDecoration(
                                            color: _model.shirtSizeSelected ==
                                                    'XL'
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: AnimatedDefaultTextStyle(
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color:
                                                        _model.shirtSizeSelected ==
                                                                'XL'
                                                            ? Colors.white
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                              duration:
                                                  Duration(milliseconds: 360),
                                              curve: Curves.easeIn,
                                              child: Text(
                                                'XL',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: (_model.shirtSizeSelected == null ||
                                        _model.shirtSizeSelected == '')
                                    ? null
                                    : () async {
                                        await widget.onShirtSizeSelect?.call(
                                          _model.shirtSizeSelected!,
                                        );
                                      },
                                text: 'CONFIRM',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 5.0, 16.0, 5.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                  disabledColor: Color(0xAAFFFFFF),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ].divide(SizedBox(height: 6.0)),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 8.0)).addToEnd(SizedBox(width: 8.0)),
              ),
            ),
          if ((widget.subpage == 1) &&
              (widget.team?.objectId == widget.teamObjectId))
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(14.0, 14.0, 0.0, 14.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        valueOrDefault<String>(
                          FFLibraryValues().ClubBadgeOnPrimary != null &&
                                  FFLibraryValues().ClubBadgeOnPrimary != ''
                              ? FFLibraryValues().ClubBadgeOnPrimary
                              : FFLibraryValues().ClubBadge,
                          'https://staging.touchlineclub.com/images/logo-1.png',
                        ),
                        width: 60.0,
                        height: 100.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'INPUT SQUAD NUMBER',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 125.0,
                                child: TextFormField(
                                  controller: _model.squadNumberTextController,
                                  focusNode: _model.squadNumberFocusNode,
                                  autofocus: false,
                                  enabled: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintText: 'Example: 7',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .squadNumberTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  await widget.onSquadNumberSelect?.call(
                                    int.tryParse(
                                        _model.squadNumberTextController.text),
                                  );
                                },
                                text: 'CONFIRM',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 5.0, 16.0, 5.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ].divide(SizedBox(height: 6.0)),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 8.0)).addToEnd(SizedBox(width: 8.0)),
              ),
            ),
          if ((widget.subpage == 0) ||
              (widget.team?.objectId != widget.teamObjectId))
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(14.0, 14.0, 0.0, 14.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        FFLibraryValues().ClubBadge!,
                        width: 60.0,
                        height: 100.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.team?.name,
                              'Team Name',
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Text(
                            'Coaches: ${valueOrDefault<String>(
                              widget.team?.coaches,
                              'Coach Name',
                            )}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      await widget.onTeamSelect?.call(
                        widget.team!.objectId,
                      );
                    },
                    text: 'SELECT',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 5.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ].divide(SizedBox(width: 8.0)).addToEnd(SizedBox(width: 8.0)),
              ),
            ),
        ],
      ),
    );
  }
}
