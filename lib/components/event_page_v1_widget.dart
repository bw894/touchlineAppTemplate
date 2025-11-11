import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'event_page_v1_model.dart';
export 'event_page_v1_model.dart';

class EventPageV1Widget extends StatefulWidget {
  const EventPageV1Widget({
    super.key,
    required this.objectId,
  });

  final String? objectId;

  @override
  State<EventPageV1Widget> createState() => _EventPageV1WidgetState();
}

class _EventPageV1WidgetState extends State<EventPageV1Widget> {
  late EventPageV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventPageV1Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: BackendlessDatabaseGroup.getCommercialEventByIDCall.call(
        eventObjectId: widget.objectId,
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
        final containerGetCommercialEventByIDResponse = snapshot.data!;

        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: CommercialEventStruct.maybeFromMap(
                          containerGetCommercialEventByIDResponse.jsonBody)!
                      .image,
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                    child: Image.network(
                      CommercialEventStruct.maybeFromMap(
                              containerGetCommercialEventByIDResponse.jsonBody)!
                          .image,
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/error_image.png',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 8.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    constraints: BoxConstraints(
                      maxWidth: 500.0,
                    ),
                    decoration: BoxDecoration(
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 45.0,
                            height: 45.0,
                            decoration: BoxDecoration(
                              color: Color(0xD5FFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.calendar_today,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 18.0,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if ((CommercialEventStruct.maybeFromMap(
                                                    containerGetCommercialEventByIDResponse
                                                        .jsonBody)
                                                ?.startDatetime !=
                                            null) &&
                                        (CommercialEventStruct.maybeFromMap(
                                                    containerGetCommercialEventByIDResponse
                                                        .jsonBody)
                                                ?.startDatetime !=
                                            0))
                                      Expanded(
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Start: ',
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
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
                                              TextSpan(
                                                text: dateTimeFormat(
                                                    "dd MMM yyy @ HH:MM a",
                                                    DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            valueOrDefault<int>(
                                                      CommercialEventStruct
                                                              .maybeFromMap(
                                                                  containerGetCommercialEventByIDResponse
                                                                      .jsonBody)
                                                          ?.startDatetime,
                                                      0,
                                                    ))),
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
                                              )
                                            ],
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if ((CommercialEventStruct.maybeFromMap(
                                                    containerGetCommercialEventByIDResponse
                                                        .jsonBody)
                                                ?.endDatetime !=
                                            null) &&
                                        (CommercialEventStruct.maybeFromMap(
                                                    containerGetCommercialEventByIDResponse
                                                        .jsonBody)
                                                ?.endDatetime !=
                                            0))
                                      Expanded(
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'End: ',
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
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
                                              TextSpan(
                                                text: dateTimeFormat(
                                                    "dd MMM yyy @ HH:MM a",
                                                    DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            valueOrDefault<int>(
                                                      CommercialEventStruct
                                                              .maybeFromMap(
                                                                  containerGetCommercialEventByIDResponse
                                                                      .jsonBody)
                                                          ?.endDatetime,
                                                      0,
                                                    ))),
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
                                              )
                                            ],
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
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                if ((CommercialEventStruct.maybeFromMap(
                                    containerGetCommercialEventByIDResponse
                                        .jsonBody)
                                ?.location !=
                            null &&
                        CommercialEventStruct.maybeFromMap(
                                    containerGetCommercialEventByIDResponse
                                        .jsonBody)
                                ?.location !=
                            '') &&
                    (CommercialEventStruct.maybeFromMap(
                                containerGetCommercialEventByIDResponse
                                    .jsonBody)
                            ?.location !=
                        'null'))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 2.0, 20.0, 8.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      constraints: BoxConstraints(
                        maxWidth: 500.0,
                      ),
                      decoration: BoxDecoration(
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
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 45.0,
                            height: 45.0,
                            decoration: BoxDecoration(
                              color: Color(0xD5FFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.location_pin,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 22.0,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        valueOrDefault<String>(
                                          CommercialEventStruct.maybeFromMap(
                                                  containerGetCommercialEventByIDResponse
                                                      .jsonBody)
                                              ?.location,
                                          'Location Name',
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
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                if (((CommercialEventStruct.maybeFromMap(containerGetCommercialEventByIDResponse.jsonBody)
                                    ?.ticketLink !=
                                null &&
                            CommercialEventStruct.maybeFromMap(containerGetCommercialEventByIDResponse.jsonBody)
                                    ?.ticketLink !=
                                '') &&
                        (CommercialEventStruct.maybeFromMap(containerGetCommercialEventByIDResponse.jsonBody)
                                ?.ticketLink !=
                            'null')) ||
                    ((CommercialEventStruct.maybeFromMap(containerGetCommercialEventByIDResponse.jsonBody)
                                    ?.ticketsInfo !=
                                null &&
                            CommercialEventStruct.maybeFromMap(
                                        containerGetCommercialEventByIDResponse
                                            .jsonBody)
                                    ?.ticketsInfo !=
                                '') &&
                        (CommercialEventStruct.maybeFromMap(
                                    containerGetCommercialEventByIDResponse.jsonBody)
                                ?.ticketsInfo !=
                            'null')))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 2.0, 20.0, 15.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if ((CommercialEventStruct.maybeFromMap(
                                            containerGetCommercialEventByIDResponse
                                                .jsonBody)
                                        ?.ticketLink !=
                                    null &&
                                CommercialEventStruct.maybeFromMap(
                                            containerGetCommercialEventByIDResponse
                                                .jsonBody)
                                        ?.ticketLink !=
                                    '') &&
                            (CommercialEventStruct.maybeFromMap(
                                        containerGetCommercialEventByIDResponse
                                            .jsonBody)
                                    ?.ticketLink !=
                                'null')) {
                          await launchURL(CommercialEventStruct.maybeFromMap(
                                  containerGetCommercialEventByIDResponse
                                      .jsonBody)!
                              .ticketLink);
                        } else {
                          return;
                        }
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        constraints: BoxConstraints(
                          maxWidth: 500.0,
                        ),
                        decoration: BoxDecoration(
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
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 45.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Color(0xD5FFFFFF),
                                shape: BoxShape.circle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.ticketAlt,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 16.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          valueOrDefault<String>(
                                            CommercialEventStruct.maybeFromMap(
                                                    containerGetCommercialEventByIDResponse
                                                        .jsonBody)
                                                ?.ticketsInfo,
                                            'Ticket Information',
                                          ),
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ),
                            if ((CommercialEventStruct.maybeFromMap(
                                                containerGetCommercialEventByIDResponse
                                                    .jsonBody)
                                            ?.ticketLink !=
                                        null &&
                                    CommercialEventStruct.maybeFromMap(
                                                containerGetCommercialEventByIDResponse
                                                    .jsonBody)
                                            ?.ticketLink !=
                                        '') &&
                                (CommercialEventStruct.maybeFromMap(
                                            containerGetCommercialEventByIDResponse
                                                .jsonBody)
                                        ?.ticketLink !=
                                    'null'))
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.east,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 22.0,
                                ),
                              ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: custom_widgets.ResponsiveHtmlViewer3(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 550.0,
                                htmlContent: CommercialEventStruct.maybeFromMap(
                                        containerGetCommercialEventByIDResponse
                                            .jsonBody)!
                                    .description,
                              ),
                            ),
                          ),
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
  }
}
