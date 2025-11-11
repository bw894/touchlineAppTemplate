import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'social_icons_v2_model.dart';
export 'social_icons_v2_model.dart';

class SocialIconsV2Widget extends StatefulWidget {
  const SocialIconsV2Widget({
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
  State<SocialIconsV2Widget> createState() => _SocialIconsV2WidgetState();
}

class _SocialIconsV2WidgetState extends State<SocialIconsV2Widget> {
  late SocialIconsV2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialIconsV2Model());

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
                  if (widget.tikTokOnOFF)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(widget.tiktokLink!);
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 50.0,
                                child: Divider(
                                  height: 2.0,
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.tiktok,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 32.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (widget.instagramOnOFF)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(widget.instaLink!);
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 50.0,
                                child: Divider(
                                  height: 2.0,
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.instagram,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 32.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (widget.xOnOFF)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(widget.xLink!);
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 50.0,
                                child: Divider(
                                  height: 2.0,
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    FFIcons.kxTwitter,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 32.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (widget.ytOnOff ?? true)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(widget.ytLink!);
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 50.0,
                                child: Divider(
                                  height: 2.0,
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.youtube,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 32.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (widget.facebookOnOFF)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(widget.fbLink!);
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
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 50.0,
                                child: Divider(
                                  height: 2.0,
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.facebookSquare,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 32.0,
                                  ),
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
