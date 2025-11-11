import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/view_lineups_builder_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/predictor/lineup_builder_v1/lineup_builder_v1_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lineups_v1_model.dart';
export 'lineups_v1_model.dart';

class LineupsV1Widget extends StatefulWidget {
  const LineupsV1Widget({
    super.key,
    required this.listPlayerData,
    Color? headerColour,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeTeamBadge,
    required this.awayTeamBadge,
    required this.awayTeamData,
    required this.squadPlayerClickAction,
    required this.userName,
    required this.objectId,
    bool? lineupsOnOff,
    bool? lineupsBuilderOnOff,
    required this.userEmail,
    required this.start,
  })  : this.headerColour = headerColour ?? const Color(0x9A000000),
        this.lineupsOnOff = lineupsOnOff ?? true,
        this.lineupsBuilderOnOff = lineupsBuilderOnOff ?? true;

  final List<PlayerJSONStruct>? listPlayerData;
  final Color headerColour;
  final String? homeTeamName;
  final String? awayTeamName;
  final String? homeTeamBadge;
  final String? awayTeamBadge;
  final List<PlayerJSONStruct>? awayTeamData;
  final Future Function(String playerObjectId)? squadPlayerClickAction;
  final String? userName;
  final String? objectId;
  final bool lineupsOnOff;
  final bool lineupsBuilderOnOff;
  final String? userEmail;
  final int? start;

  @override
  State<LineupsV1Widget> createState() => _LineupsV1WidgetState();
}

class _LineupsV1WidgetState extends State<LineupsV1Widget> {
  late LineupsV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LineupsV1Model());

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
      decoration: BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            if (valueOrDefault<bool>(
                  (widget.listPlayerData!.length > 0) ||
                      (widget.awayTeamData!.length > 0),
                  true,
                ) &&
                widget.lineupsOnOff)
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.listPlayerData!.length > 0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRBottomLeft?.toDouble(),
                                    0.0,
                                  )),
                                  bottomRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRBottomRight?.toDouble(),
                                    0.0,
                                  )),
                                  topLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRTopLeft?.toDouble(),
                                    0.0,
                                  )),
                                  topRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRTopRight?.toDouble(),
                                    0.0,
                                  )),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: widget.headerColour,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Divider(
                                          height: 2.0,
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 10.0, 8.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (widget.homeTeamBadge !=
                                                      null &&
                                                  widget.homeTeamBadge != '')
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  child: Image.network(
                                                    widget.homeTeamBadge!,
                                                    width: 40.0,
                                                    height: 40.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              Text(
                                                valueOrDefault<String>(
                                                  widget.homeTeamName,
                                                  'Home',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
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
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final player = widget.listPlayerData!
                                            .where(
                                                (e) => e.startedOnPitch == true)
                                            .toList()
                                            .take(11)
                                            .toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            8.0,
                                            0,
                                            8.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: player.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 3.0),
                                          itemBuilder: (context, playerIndex) {
                                            final playerItem =
                                                player[playerIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if ((playerItem
                                                                .playerObjectId !=
                                                            '') &&
                                                    (playerItem
                                                            .playerObjectId !=
                                                        'null')) {
                                                  await widget
                                                      .squadPlayerClickAction
                                                      ?.call(
                                                    playerItem.playerObjectId,
                                                  );
                                                }
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 26.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible:
                                                                valueOrDefault<
                                                                        int>(
                                                                      playerItem
                                                                          .playerNumber,
                                                                      1,
                                                                    ) !=
                                                                    0,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  playerItem
                                                                      .playerNumber
                                                                      .toString(),
                                                                  '1',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .rubik(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          playerItem
                                                                      .playerProfileURL !=
                                                                  '',
                                                          true,
                                                        ))
                                                          Container(
                                                            width: 36.0,
                                                            height: 36.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              playerItem
                                                                  .playerProfileURL,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              child: Container(
                                                                width: 100.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          playerItem
                                                                              .playerFirst,
                                                                          'J',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              1,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.rubik(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        '. ${playerItem.playerLast}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.rubik(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (playerItem
                                                            .isInjured)
                                                          Icon(
                                                            Icons
                                                                .medical_services,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 22.0,
                                                          ),
                                                        if (playerItem
                                                                .startedOnPitch &&
                                                            !playerItem
                                                                .isOnPitch)
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .angleDown,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 22.0,
                                                          ),
                                                        if ((valueOrDefault<
                                                                    int>(
                                                                  playerItem
                                                                      .minuteOn,
                                                                  0,
                                                                ) !=
                                                                null) &&
                                                            (valueOrDefault<
                                                                    int>(
                                                                  playerItem
                                                                      .minuteOn,
                                                                  0,
                                                                ) !=
                                                                0))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                playerItem
                                                                    .minuteOn
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .rubik(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        if (playerItem
                                                                .numberOfCards ==
                                                            1)
                                                          Icon(
                                                            Icons
                                                                .rectangle_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                            size: 22.0,
                                                          ),
                                                        if (playerItem
                                                                .numberOfCards ==
                                                            3)
                                                          Icon(
                                                            Icons
                                                                .rectangle_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 22.0,
                                                          ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          playerItem
                                                                  .numberOfCards ==
                                                              2,
                                                          false,
                                                        ))
                                                          Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .rectangle_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .warning,
                                                                    size: 22.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.12,
                                                                        -0.38),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .rectangle_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    size: 22.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        Container(
                                                          width: 23.0,
                                                          height: 23.0,
                                                          child: Stack(
                                                            children: [
                                                              if (playerItem
                                                                      .numberOfGoals >
                                                                  0)
                                                                Icon(
                                                                  Icons
                                                                      .sports_soccer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              if (playerItem
                                                                      .numberOfGoals >=
                                                                  2)
                                                                Opacity(
                                                                  opacity: 0.7,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          playerItem
                                                                              .numberOfGoals
                                                                              .toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Substitutes',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
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
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final player = widget.listPlayerData!
                                            .where((e) =>
                                                e.startedOnPitch == false)
                                            .toList()
                                            .take(7)
                                            .toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            8.0,
                                            0,
                                            8.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: player.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 3.0),
                                          itemBuilder: (context, playerIndex) {
                                            final playerItem =
                                                player[playerIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if ((playerItem
                                                                .playerObjectId !=
                                                            '') &&
                                                    (playerItem
                                                            .playerObjectId !=
                                                        'null')) {
                                                  await widget
                                                      .squadPlayerClickAction
                                                      ?.call(
                                                    playerItem.playerObjectId,
                                                  );
                                                }
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 26.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible: playerItem
                                                                    .playerNumber !=
                                                                0,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  playerItem
                                                                      .playerNumber
                                                                      .toString(),
                                                                  '1',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .rubik(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          playerItem
                                                                      .playerProfileURL !=
                                                                  '',
                                                          true,
                                                        ))
                                                          Container(
                                                            width: 36.0,
                                                            height: 36.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              playerItem
                                                                  .playerProfileURL,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              child: Container(
                                                                width: 100.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          playerItem
                                                                              .playerFirst,
                                                                          'J',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              1,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.rubik(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        '. ${playerItem.playerLast}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.rubik(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (playerItem
                                                            .isInjured)
                                                          Icon(
                                                            Icons
                                                                .medical_services,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 22.0,
                                                          ),
                                                        if (!playerItem
                                                                .startedOnPitch &&
                                                            playerItem
                                                                .isOnPitch)
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .angleUp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .success,
                                                            size: 22.0,
                                                          ),
                                                        if ((valueOrDefault<
                                                                    int>(
                                                                  playerItem
                                                                      .minuteOn,
                                                                  0,
                                                                ) !=
                                                                null) &&
                                                            (playerItem
                                                                    .minuteOn !=
                                                                0))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                playerItem
                                                                    .minuteOn
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .rubik(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        if (playerItem
                                                                .numberOfCards ==
                                                            1)
                                                          Icon(
                                                            Icons
                                                                .rectangle_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                            size: 22.0,
                                                          ),
                                                        if (playerItem
                                                                .numberOfCards ==
                                                            3)
                                                          Icon(
                                                            Icons
                                                                .rectangle_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 22.0,
                                                          ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          playerItem
                                                                  .numberOfCards ==
                                                              2,
                                                          false,
                                                        ))
                                                          Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .rectangle_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .warning,
                                                                    size: 22.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.12,
                                                                        -0.38),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .rectangle_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    size: 22.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        Container(
                                                          width: 23.0,
                                                          height: 23.0,
                                                          child: Stack(
                                                            children: [
                                                              if (playerItem
                                                                      .numberOfGoals >
                                                                  0)
                                                                Icon(
                                                                  Icons
                                                                      .sports_soccer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              if (playerItem
                                                                      .numberOfGoals >=
                                                                  2)
                                                                Opacity(
                                                                  opacity: 0.7,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          playerItem
                                                                              .numberOfGoals
                                                                              .toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (widget.awayTeamData!.length > 0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRBottomLeft?.toDouble(),
                                    0.0,
                                  )),
                                  bottomRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRBottomRight?.toDouble(),
                                    0.0,
                                  )),
                                  topLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRTopLeft?.toDouble(),
                                    0.0,
                                  )),
                                  topRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRTopRight?.toDouble(),
                                    0.0,
                                  )),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: widget.headerColour,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Divider(
                                          height: 2.0,
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 10.0, 8.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (widget.awayTeamBadge !=
                                                      null &&
                                                  widget.awayTeamBadge != '')
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  child: Image.network(
                                                    widget.awayTeamBadge!,
                                                    width: 40.0,
                                                    height: 40.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              Text(
                                                valueOrDefault<String>(
                                                  widget.awayTeamName,
                                                  'Away',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
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
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final player = widget.awayTeamData!
                                            .where(
                                                (e) => e.startedOnPitch == true)
                                            .toList()
                                            .take(11)
                                            .toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            8.0,
                                            0,
                                            8.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: player.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 3.0),
                                          itemBuilder: (context, playerIndex) {
                                            final playerItem =
                                                player[playerIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if ((playerItem
                                                                .playerObjectId !=
                                                            '') &&
                                                    (playerItem
                                                            .playerObjectId !=
                                                        'null')) {
                                                  await widget
                                                      .squadPlayerClickAction
                                                      ?.call(
                                                    playerItem.playerObjectId,
                                                  );
                                                }
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 26.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible: playerItem
                                                                    .playerNumber !=
                                                                0,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  playerItem
                                                                      .playerNumber
                                                                      .toString(),
                                                                  '1',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .rubik(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          playerItem
                                                                      .playerProfileURL !=
                                                                  '',
                                                          true,
                                                        ))
                                                          Container(
                                                            width: 36.0,
                                                            height: 36.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              playerItem
                                                                  .playerProfileURL,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              child: Container(
                                                                width: 100.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          playerItem
                                                                              .playerFirst,
                                                                          'J',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              1,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.rubik(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        '. ${playerItem.playerLast}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.rubik(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (playerItem
                                                            .isInjured)
                                                          Icon(
                                                            Icons
                                                                .medical_services,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 22.0,
                                                          ),
                                                        if (playerItem
                                                                .startedOnPitch &&
                                                            !playerItem
                                                                .isOnPitch)
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .angleDown,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 22.0,
                                                          ),
                                                        if ((valueOrDefault<
                                                                    int>(
                                                                  playerItem
                                                                      .minuteOn,
                                                                  0,
                                                                ) !=
                                                                null) &&
                                                            (playerItem
                                                                    .minuteOn !=
                                                                0))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                playerItem
                                                                    .minuteOn
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .rubik(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        if (playerItem
                                                                .numberOfCards ==
                                                            1)
                                                          Icon(
                                                            Icons
                                                                .rectangle_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                            size: 22.0,
                                                          ),
                                                        if (playerItem
                                                                .numberOfCards ==
                                                            3)
                                                          Icon(
                                                            Icons
                                                                .rectangle_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 22.0,
                                                          ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          playerItem
                                                                  .numberOfCards ==
                                                              2,
                                                          false,
                                                        ))
                                                          Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .rectangle_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .warning,
                                                                    size: 22.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.12,
                                                                        -0.38),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .rectangle_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    size: 22.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        Container(
                                                          width: 23.0,
                                                          height: 23.0,
                                                          child: Stack(
                                                            children: [
                                                              if (playerItem
                                                                      .numberOfGoals >
                                                                  0)
                                                                Icon(
                                                                  Icons
                                                                      .sports_soccer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              if (playerItem
                                                                      .numberOfGoals >=
                                                                  2)
                                                                Opacity(
                                                                  opacity: 0.7,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          playerItem
                                                                              .numberOfGoals
                                                                              .toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Substitutes',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
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
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final player = widget.awayTeamData!
                                            .where((e) =>
                                                e.startedOnPitch == false)
                                            .toList()
                                            .take(7)
                                            .toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            8.0,
                                            0,
                                            8.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: player.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 3.0),
                                          itemBuilder: (context, playerIndex) {
                                            final playerItem =
                                                player[playerIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if ((playerItem
                                                                .playerObjectId !=
                                                            '') &&
                                                    (playerItem
                                                            .playerObjectId !=
                                                        'null')) {
                                                  await widget
                                                      .squadPlayerClickAction
                                                      ?.call(
                                                    playerItem.playerObjectId,
                                                  );
                                                }
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 26.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Visibility(
                                                            visible: playerItem
                                                                    .playerNumber !=
                                                                0,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  playerItem
                                                                      .playerNumber
                                                                      .toString(),
                                                                  '1',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .rubik(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          playerItem
                                                                      .playerProfileURL !=
                                                                  '',
                                                          true,
                                                        ))
                                                          Container(
                                                            width: 36.0,
                                                            height: 36.0,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              playerItem
                                                                  .playerProfileURL,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              child: Container(
                                                                width: 100.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          playerItem
                                                                              .playerFirst,
                                                                          'J',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              1,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.rubik(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        '. ${playerItem.playerLast}',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.rubik(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (playerItem
                                                            .isInjured)
                                                          Icon(
                                                            Icons
                                                                .medical_services,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            size: 22.0,
                                                          ),
                                                        if (!playerItem
                                                                .startedOnPitch &&
                                                            playerItem
                                                                .isOnPitch)
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .angleUp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .success,
                                                            size: 22.0,
                                                          ),
                                                        if ((valueOrDefault<
                                                                    int>(
                                                                  playerItem
                                                                      .minuteOn,
                                                                  0,
                                                                ) !=
                                                                null) &&
                                                            (playerItem
                                                                    .minuteOn !=
                                                                0))
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                playerItem
                                                                    .minuteOn
                                                                    .toString(),
                                                                '0',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .rubik(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        if (playerItem
                                                                .numberOfCards ==
                                                            1)
                                                          Icon(
                                                            Icons
                                                                .rectangle_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                            size: 22.0,
                                                          ),
                                                        if (playerItem
                                                                .numberOfCards ==
                                                            3)
                                                          Icon(
                                                            Icons
                                                                .rectangle_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 22.0,
                                                          ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          playerItem
                                                                  .numberOfCards ==
                                                              2,
                                                          false,
                                                        ))
                                                          Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .rectangle_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .warning,
                                                                    size: 22.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.12,
                                                                        -0.38),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .rectangle_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    size: 22.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        Container(
                                                          width: 23.0,
                                                          height: 23.0,
                                                          child: Stack(
                                                            children: [
                                                              if (playerItem
                                                                      .numberOfGoals >
                                                                  0)
                                                                Icon(
                                                                  Icons
                                                                      .sports_soccer,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                              if (playerItem
                                                                      .numberOfGoals >=
                                                                  2)
                                                                Opacity(
                                                                  opacity: 0.7,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          playerItem
                                                                              .numberOfGoals
                                                                              .toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ]
                          .divide(SizedBox(height: 20.0))
                          .addToStart(SizedBox(height: 20.0))
                          .addToEnd(SizedBox(height: 20.0)),
                    ),
                  ),
                ),
              ),
            if (valueOrDefault<bool>(
              valueOrDefault<bool>(
                    (widget.listPlayerData!.length < 1) &&
                        (widget.awayTeamData!.length < 1),
                    true,
                  ) ||
                  valueOrDefault<bool>(
                    (widget.listPlayerData?.length == null) &&
                        (widget.awayTeamData?.length == null),
                    true,
                  ) ||
                  !widget.lineupsOnOff,
              true,
            ))
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: FaIcon(
                          FontAwesomeIcons.tshirt,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 60.0,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Text(
                          'LINEUPS',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.bebasNeue(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 40.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Text(
                        'NOT YET AVAILABLE',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w300,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      if (widget.lineupsBuilderOnOff &&
                          (getCurrentTimestamp.millisecondsSinceEpoch <
                              widget.start!))
                        FutureBuilder<ApiCallResponse>(
                          future: (_model.apiRequestCompleter ??= Completer<
                                  ApiCallResponse>()
                                ..complete(BackendlessDatabaseGroup
                                    .checkIfLineupsBuilderHasBeenPlayedForMatchCall
                                    .call(
                                  ownerId: FFAppState().currentUser.ownerId,
                                  matchObjectId: widget.objectId,
                                  bLProjectId: FFLibraryValues().BLProjectId,
                                  bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
                                )))
                              .future,
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
                            final containerCheckIfLineupsBuilderHasBeenPlayedForMatchResponse =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if ((widget.userEmail != null &&
                                          widget.userEmail != '') &&
                                      ((containerCheckIfLineupsBuilderHasBeenPlayedForMatchResponse
                                                      .jsonBody
                                                      .toList()
                                                      .map<PublicLineupsBuilderStruct?>(
                                                          PublicLineupsBuilderStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      PublicLineupsBuilderStruct?>)
                                              .withoutNulls
                                              .length ==
                                          0))
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: InkWell(
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
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child:
                                                        LineupBuilderV1Widget(
                                                      userName:
                                                          widget.userName!,
                                                      matchSummary:
                                                          '${widget.homeTeamName} v ${widget.awayTeamName}',
                                                      matchObjectId:
                                                          widget.objectId!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );

                                            safeSetState(() => _model
                                                .apiRequestCompleter = null);
                                            await _model
                                                .waitForApiRequestCompleted();
                                          },
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
                                                    FontAwesomeIcons.users,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 18.0,
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Choose your lineup',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF45484A),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 4.0)),
                                                  ),
                                                  Icon(
                                                    Icons.east,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 18.0,
                                                  ),
                                                ].divide(SizedBox(width: 12.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((widget.userEmail == null ||
                                          widget.userEmail == '') &&
                                      ((containerCheckIfLineupsBuilderHasBeenPlayedForMatchResponse
                                                      .jsonBody
                                                      .toList()
                                                      .map<PublicLineupsBuilderStruct?>(
                                                          PublicLineupsBuilderStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      PublicLineupsBuilderStruct?>)
                                              .withoutNulls
                                              .length ==
                                          0))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Container(
                                        width: 260.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
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
                                              Icon(
                                                Icons.lock,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 18.0,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Sign in to play Lineup Builder',
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
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
                                                ].divide(SizedBox(width: 4.0)),
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((containerCheckIfLineupsBuilderHasBeenPlayedForMatchResponse
                                                  .jsonBody
                                                  .toList()
                                                  .map<PublicLineupsBuilderStruct?>(
                                                      PublicLineupsBuilderStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  PublicLineupsBuilderStruct?>)
                                          .withoutNulls
                                          .length !=
                                      0)
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'YOUR PREDICTED LINEUP:',
                                        textAlign: TextAlign.center,
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
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  if ((containerCheckIfLineupsBuilderHasBeenPlayedForMatchResponse
                                                  .jsonBody
                                                  .toList()
                                                  .map<PublicLineupsBuilderStruct?>(
                                                      PublicLineupsBuilderStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  PublicLineupsBuilderStruct?>)
                                          .withoutNulls
                                          .length !=
                                      0)
                                    Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: wrapWithModel(
                                        model: _model.viewLineupsBuilderModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ViewLineupsBuilderWidget(
                                          objectId: (containerCheckIfLineupsBuilderHasBeenPlayedForMatchResponse
                                                      .jsonBody
                                                      .toList()
                                                      .map<PublicLineupsBuilderStruct?>(
                                                          PublicLineupsBuilderStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      PublicLineupsBuilderStruct?>)
                                              .withoutNulls
                                              .firstOrNull!
                                              .objectId,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
