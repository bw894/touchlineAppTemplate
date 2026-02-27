import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vote_non_fixture_v1_model.dart';
export 'vote_non_fixture_v1_model.dart';

class VoteNonFixtureV1Widget extends StatefulWidget {
  const VoteNonFixtureV1Widget({
    super.key,
    required this.onTap,
    required this.polls,
  });

  /// choose what happens when a user taps the poll action (open poll custom
  /// dialog)
  final Future Function(String pollObjectId)? onTap;

  final List<PollStruct>? polls;

  @override
  State<VoteNonFixtureV1Widget> createState() => _VoteNonFixtureV1WidgetState();
}

class _VoteNonFixtureV1WidgetState extends State<VoteNonFixtureV1Widget> {
  late VoteNonFixtureV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoteNonFixtureV1Model());

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
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(),
        child: Builder(
          builder: (context) {
            final poll = widget!.polls!.toList();

            return ListView.separated(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: poll.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.0),
              itemBuilder: (context, pollIndex) {
                final pollItem = poll[pollIndex];
                return Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await widget.onTap?.call(
                        pollItem.objectId,
                      );
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
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
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (pollItem.style == 'POLL')
                                Icon(
                                  Icons.bar_chart,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              if (pollItem.style == 'QUIZ')
                                Icon(
                                  Icons.quiz_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              if (pollItem.style == 'FORM')
                                Icon(
                                  Icons.format_align_left,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 25.0,
                                ),
                              Expanded(
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        '${() {
                                          if (pollItem.style == 'QUIZ') {
                                            return 'PLAY: ';
                                          } else if (pollItem.style == 'POLL') {
                                            return 'VOTE: ';
                                          } else {
                                            return ' ';
                                          }
                                        }()}${pollItem.title}',
                                        'VOTE NOW',
                                      ),
                                      textAlign: TextAlign.center,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 19.0,
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
                                ),
                              ),
                              Icon(
                                Icons.east_sharp,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 28.0,
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
