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
import 'events_slider_v1_model.dart';
export 'events_slider_v1_model.dart';

class EventsSliderV1Widget extends StatefulWidget {
  const EventsSliderV1Widget({
    super.key,
    required this.clickAction,
  });

  final Future Function(String objectId)? clickAction;

  @override
  State<EventsSliderV1Widget> createState() => _EventsSliderV1WidgetState();
}

class _EventsSliderV1WidgetState extends State<EventsSliderV1Widget> {
  late EventsSliderV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventsSliderV1Model());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
        child: FutureBuilder<ApiCallResponse>(
          future: BackendlessDatabaseGroup.getUpcomingCommercialEventsCall.call(
            currentTime: getCurrentTimestamp.millisecondsSinceEpoch,
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
            final containerGetUpcomingCommercialEventsResponse = snapshot.data!;

            return Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              constraints: BoxConstraints(
                maxWidth: 550.0,
              ),
              decoration: BoxDecoration(),
              child: Builder(
                builder: (context) {
                  final event = (containerGetUpcomingCommercialEventsResponse
                              .jsonBody
                              .toList()
                              .map<CommercialEventStruct?>(
                                  CommercialEventStruct.maybeFromMap)
                              .toList() as Iterable<CommercialEventStruct?>)
                          .withoutNulls
                          ?.sortedList(
                              keyOf: (e) => e.startDatetime, desc: false)
                          ?.toList() ??
                      [];
                  if (event.isEmpty) {
                    return Container(
                      height: 100.0,
                      child: EmptyListWidget(
                        title: 'NO UPCOMING EVENTS',
                        body: 'Check Back Soon',
                        icon: Icon(
                          Icons.calendar_today,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 26.0,
                        ),
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(event.length, (eventIndex) {
                        final eventItem = event[eventIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await widget.clickAction?.call(
                                eventItem.objectId,
                              );
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
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
                              child: ClipRRect(
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
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 250.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          valueOrDefault<double>(
                                        FFLibraryValues()
                                            .BRBottomLeft
                                            ?.toDouble(),
                                        0.0,
                                      )),
                                      bottomRight: Radius.circular(
                                          valueOrDefault<double>(
                                        FFLibraryValues()
                                            .BRBottomRight
                                            ?.toDouble(),
                                        0.0,
                                      )),
                                      topLeft: Radius.circular(
                                          valueOrDefault<double>(
                                        FFLibraryValues().BRTopLeft?.toDouble(),
                                        0.0,
                                      )),
                                      topRight: Radius.circular(
                                          valueOrDefault<double>(
                                        FFLibraryValues()
                                            .BRTopRight
                                            ?.toDouble(),
                                        0.0,
                                      )),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                          child: Image.network(
                                            eventItem.image,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 180.0,
                                            fit: BoxFit.contain,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'packages/touchline_template_puum0i/assets/images/error_image.png',
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 180.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          "MMM dd y @ HH:mm a",
                                                          DateTime.fromMillisecondsSinceEpoch(
                                                              eventItem
                                                                  .startDatetime)),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        functions
                                                            .removeUnwantedCharacters(
                                                                valueOrDefault<
                                                                    String>(
                                                          eventItem.name,
                                                          'Event Name',
                                                        )),
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      20.0,
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
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        eventItem.teaserText
                                                            .maybeHandleOverflow(
                                                          maxChars: 200,
                                                          replacement: '…',
                                                        ),
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
                                                  ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                          .divide(SizedBox(width: 12.0))
                          .addToStart(SizedBox(width: 20.0))
                          .addToEnd(SizedBox(width: 20.0)),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
