import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'social_icons_v3_model.dart';
export 'social_icons_v3_model.dart';

class SocialIconsV3Widget extends StatefulWidget {
  const SocialIconsV3Widget({
    super.key,
    bool? tikTokOnOFF,
    bool? facebookOnOFF,
    bool? instagramOnOFF,
    bool? xOnOFF,
    this.tiktokLink,
    this.fbLink,
    this.instaLink,
    this.xLink,
    required this.ytOnOff,
    this.ytLink,
  })  : this.tikTokOnOFF = tikTokOnOFF ?? true,
        this.facebookOnOFF = facebookOnOFF ?? true,
        this.instagramOnOFF = instagramOnOFF ?? true,
        this.xOnOFF = xOnOFF ?? true;

  final bool tikTokOnOFF;
  final bool facebookOnOFF;
  final bool instagramOnOFF;
  final bool xOnOFF;
  final String? tiktokLink;
  final String? fbLink;
  final String? instaLink;
  final String? xLink;
  final bool? ytOnOff;
  final String? ytLink;

  @override
  State<SocialIconsV3Widget> createState() => _SocialIconsV3WidgetState();
}

class _SocialIconsV3WidgetState extends State<SocialIconsV3Widget> {
  late SocialIconsV3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialIconsV3Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (widget!.tikTokOnOFF)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(widget!.tiktokLink!);
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5.0,
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
                          width: 50.0,
                          height: 50.0,
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
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.tiktok,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 32.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (widget!.instagramOnOFF)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(widget!.instaLink!);
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5.0,
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
                          width: 50.0,
                          height: 50.0,
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
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 29.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (widget!.xOnOFF)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(widget!.xLink!);
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5.0,
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
                          width: 50.0,
                          height: 50.0,
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
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  FFIcons.kxTwitter,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 32.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (widget!.ytOnOff ?? true)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(widget!.ytLink!);
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5.0,
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
                          width: 50.0,
                          height: 50.0,
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
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.youtube,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 29.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (widget!.facebookOnOFF)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(widget!.fbLink!);
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 5.0,
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
                          width: 50.0,
                          height: 50.0,
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
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.facebookSquare,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 29.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ].divide(SizedBox(width: 18.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
