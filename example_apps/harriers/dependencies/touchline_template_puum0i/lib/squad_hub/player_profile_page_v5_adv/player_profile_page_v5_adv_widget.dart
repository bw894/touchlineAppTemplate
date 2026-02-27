import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'player_profile_page_v5_adv_model.dart';
export 'player_profile_page_v5_adv_model.dart';

class PlayerProfilePageV5AdvWidget extends StatefulWidget {
  const PlayerProfilePageV5AdvWidget({
    super.key,
    required this.playerObjectId,
    required this.sponsorshipBuyClickAction,
  });

  final String? playerObjectId;
  final Future Function(String sponsorshipDealObjectId, double value,
      String playerName, String shortDisplay)? sponsorshipBuyClickAction;

  @override
  State<PlayerProfilePageV5AdvWidget> createState() =>
      _PlayerProfilePageV5AdvWidgetState();
}

class _PlayerProfilePageV5AdvWidgetState
    extends State<PlayerProfilePageV5AdvWidget> {
  late PlayerProfilePageV5AdvModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerProfilePageV5AdvModel());

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
                                      font: GoogleFonts.inter(
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
                                      font: GoogleFonts.inter(
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Text(
                        'SPONSORS',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.bebasNeue(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 38.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 14.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final sponsors = PlayerStruct.maybeFromMap(
                                    containerGetSpecificPlayerResponse.jsonBody)
                                ?.sponsorship
                                ?.sortedList(
                                    keyOf: (e) => e.sortOrder, desc: false)
                                ?.toList() ??
                            [];
                        if (sponsors.isEmpty) {
                          return EmptyListWidget(
                            title: 'NOT AVAILABLE',
                            body: 'Check back soon!',
                            icon: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 30.0,
                            ),
                          );
                        }

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: sponsors.length,
                          separatorBuilder: (_, __) => SizedBox(height: 12.0),
                          itemBuilder: (context, sponsorsIndex) {
                            final sponsorsItem = sponsors[sponsorsIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (sponsorsItem.status == 'For Sale') {
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Add to Cart?'),
                                                  content: Text(
                                                      'Cost: £${sponsorsItem.value.toString()}'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    await widget.sponsorshipBuyClickAction
                                        ?.call(
                                      sponsorsItem.objectId,
                                      sponsorsItem.value,
                                      valueOrDefault<String>(
                                        PlayerStruct.maybeFromMap(
                                                containerGetSpecificPlayerResponse
                                                    .jsonBody)
                                            ?.playerName,
                                        'Player Name',
                                      ),
                                      valueOrDefault<String>(
                                        sponsorsItem.shortDisplay,
                                        'Item Title',
                                      ),
                                    );
                                  } else {
                                    return;
                                  }
                                } else {
                                  if ((sponsorsItem.sponsorWebsite != null &&
                                          sponsorsItem.sponsorWebsite != '') &&
                                      (sponsorsItem.sponsorWebsite != 'null')) {
                                    await launchURL(
                                        sponsorsItem.sponsorWebsite);
                                  } else {
                                    return;
                                  }
                                }
                              },
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.0,
                                      color: valueOrDefault<Color>(
                                        sponsorsItem.colour,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      offset: Offset(
                                        -4.0,
                                        4.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft:
                                        Radius.circular(valueOrDefault<double>(
                                      FFLibraryValues()
                                          .BRBottomLeft
                                          ?.toDouble(),
                                      0.0,
                                    )),
                                    bottomRight:
                                        Radius.circular(valueOrDefault<double>(
                                      FFLibraryValues()
                                          .BRBottomRight
                                          ?.toDouble(),
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
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.person_outline,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                () {
                                                  if (sponsorsItem
                                                          .shortDisplay ==
                                                      'All All') {
                                                    return 'Player Sponsor';
                                                  } else if (sponsorsItem
                                                          .shortDisplay ==
                                                      'Home All') {
                                                    return 'Home Sponsor';
                                                  } else if (sponsorsItem
                                                          .shortDisplay ==
                                                      'Away All') {
                                                    return 'Away Sponsor';
                                                  } else if (sponsorsItem
                                                          .shortDisplay ==
                                                      'Third All') {
                                                    return 'Third Sponsor';
                                                  } else {
                                                    return sponsorsItem
                                                        .shortDisplay;
                                                  }
                                                }(),
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
                                                          fontSize: 15.0,
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                sponsorsItem.sponsorName !=
                                                            null &&
                                                        sponsorsItem
                                                                .sponsorName !=
                                                            ''
                                                    ? valueOrDefault<String>(
                                                        sponsorsItem
                                                            .sponsorName,
                                                        'Sponsor Name Here',
                                                      )
                                                    : 'Available for £${valueOrDefault<String>(
                                                        sponsorsItem.value
                                                            .toString(),
                                                        '10.00',
                                                      )}',
                                                'Available for £10.00',
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        lineHeight: 1.0,
                                                      ),
                                            ),
                                          ),
                                          if ((sponsorsItem.sponsorImage !=
                                                      null &&
                                                  sponsorsItem.sponsorImage !=
                                                      '') &&
                                              (sponsorsItem.sponsorImage !=
                                                  'null'))
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.network(
                                                sponsorsItem.sponsorImage,
                                                height: 75.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                        ]
                                            .divide(SizedBox(height: 4.0))
                                            .addToStart(SizedBox(height: 10.0))
                                            .addToEnd(SizedBox(height: 10.0)),
                                      ),
                                      Opacity(
                                        opacity: valueOrDefault<double>(
                                          () {
                                            if ((sponsorsItem.sponsorWebsite !=
                                                        null &&
                                                    sponsorsItem
                                                            .sponsorWebsite !=
                                                        '') &&
                                                (sponsorsItem.sponsorWebsite !=
                                                    'null')) {
                                              return 1.0;
                                            } else if (sponsorsItem.status ==
                                                'For Sale') {
                                              return 1.0;
                                            } else {
                                              return 0.0;
                                            }
                                          }(),
                                          1.0,
                                        ),
                                        child: Icon(
                                          Icons.east_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
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
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 38.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
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
