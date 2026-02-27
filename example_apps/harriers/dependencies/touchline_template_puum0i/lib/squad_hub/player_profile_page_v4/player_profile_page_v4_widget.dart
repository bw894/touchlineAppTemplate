import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'player_profile_page_v4_model.dart';
export 'player_profile_page_v4_model.dart';

class PlayerProfilePageV4Widget extends StatefulWidget {
  const PlayerProfilePageV4Widget({
    super.key,
    Color? homeKitColour,
    Color? awayKitColour,
    required this.playerObjectId,
    bool? awaySponsorReq,
    bool? sponsorsReq,
  })  : this.homeKitColour = homeKitColour ?? const Color(0xFF1A56A8),
        this.awayKitColour = awayKitColour ?? const Color(0xFF1A56A8),
        this.awaySponsorReq = awaySponsorReq ?? true,
        this.sponsorsReq = sponsorsReq ?? true;

  final Color homeKitColour;
  final Color awayKitColour;
  final String? playerObjectId;
  final bool awaySponsorReq;
  final bool sponsorsReq;

  @override
  State<PlayerProfilePageV4Widget> createState() =>
      _PlayerProfilePageV4WidgetState();
}

class _PlayerProfilePageV4WidgetState extends State<PlayerProfilePageV4Widget> {
  late PlayerProfilePageV4Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerProfilePageV4Model());

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

    return FutureBuilder<ApiCallResponse>(
      future: BackendlessDatabaseGroup.getSpecificPlayerCall.call(
        playerObjectId: widget!.playerObjectId,
        bLProjectId: FFLibraryValues().BLProjectId,
        bLRestAPIKey: FFLibraryValues().BLRestAPIKey,
        headerName:
            FFAppState().userToken != null && FFAppState().userToken != ''
                ? 'user-token'
                : 'Content-Type',
        headerValue:
            FFAppState().userToken != null && FFAppState().userToken != ''
                ? FFAppState().userToken
                : 'application/json',
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
        final containerGetSpecificPlayerResponse = snapshot.data!;

        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 1.0),
                child: Container(
                  height: 350.0,
                  child: Stack(
                    children: [
                      ClipRRect(
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
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 350.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryText,
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
                          child: Opacity(
                            opacity: 0.4,
                            child: Hero(
                              tag: PlayerStruct.maybeFromMap(
                                      containerGetSpecificPlayerResponse
                                          .jsonBody)!
                                  .playerPictureurl,
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                child: Image.network(
                                  PlayerStruct.maybeFromMap(
                                          containerGetSpecificPlayerResponse
                                              .jsonBody)!
                                      .playerPictureurl,
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 350.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, -1.0),
                        child: Container(
                          width: 75.0,
                          height: 75.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                              topLeft: Radius.circular(valueOrDefault<double>(
                                FFLibraryValues().BRTopLeft?.toDouble(),
                                0.0,
                              )),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                PlayerStruct.maybeFromMap(
                                        containerGetSpecificPlayerResponse
                                            .jsonBody)
                                    ?.posAbr,
                                'POS',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.bebasNeue(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 40.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 25.0,
                                child: VerticalDivider(
                                  width: 2.0,
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  functions
                                      .splitStringByFirstSpace(
                                          PlayerStruct.maybeFromMap(
                                                  containerGetSpecificPlayerResponse
                                                      .jsonBody)!
                                              .playerName)
                                      .firstOrNull,
                                  'First',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.rubik(
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  functions
                                      .splitStringByFirstSpace(
                                          PlayerStruct.maybeFromMap(
                                                  containerGetSpecificPlayerResponse
                                                      .jsonBody)!
                                              .playerName)
                                      .lastOrNull,
                                  'Last',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.rubik(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 6.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget!.sponsorsReq)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Text(
                          'SPONSORS',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.bebasNeue(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 38.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (widget!.sponsorsReq)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100.0,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Divider(
                                  height: 2.0,
                                  thickness: 2.0,
                                  color: widget!.homeKitColour,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.tshirt,
                                        color: widget!.homeKitColour,
                                        size: 15.0,
                                      ),
                                      Text(
                                        widget!.awaySponsorReq
                                            ? 'HOME SPONSOR'
                                            : 'PLAYER SPONSOR',
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
                                              fontSize: 15.0,
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
                                      ),
                                    ].divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      PlayerStruct.maybeFromMap(
                                              containerGetSpecificPlayerResponse
                                                  .jsonBody)
                                          ?.homeSponsor,
                                      'Sponsor Now!',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (widget!.awaySponsorReq)
                        Expanded(
                          child: Container(
                            width: 100.0,
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
                                topLeft: Radius.circular(valueOrDefault<double>(
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
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Divider(
                                    height: 2.0,
                                    thickness: 2.0,
                                    color: widget!.awayKitColour,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.tshirt,
                                          color: widget!.awayKitColour,
                                          size: 15.0,
                                        ),
                                        Text(
                                          'AWAY SPONSOR',
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
                                                fontSize: 15.0,
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
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        PlayerStruct.maybeFromMap(
                                                containerGetSpecificPlayerResponse
                                                    .jsonBody)
                                            ?.awaySponsor,
                                        'Sponsor Now!',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                            lineHeight: 1.2,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ].divide(SizedBox(width: 20.0)),
                  ),
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          'BIOGRAPHY',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.bebasNeue(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 38.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                    Text(
                      functions.removeUnwantedCharacters(
                          PlayerStruct.maybeFromMap(
                                  containerGetSpecificPlayerResponse.jsonBody)!
                              .biography),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ),
            ].addToEnd(SizedBox(height: 40.0)),
          ),
        );
      },
    );
  }
}
