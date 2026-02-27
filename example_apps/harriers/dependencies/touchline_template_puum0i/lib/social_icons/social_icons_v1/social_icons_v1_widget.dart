import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'social_icons_v1_model.dart';
export 'social_icons_v1_model.dart';

class SocialIconsV1Widget extends StatefulWidget {
  const SocialIconsV1Widget({
    super.key,
    bool? tikTokOnOFF,
    bool? facebookOnOFF,
    bool? instagramOnOFF,
    bool? xOnOFF,
    this.tiktokLink,
    this.fbLink,
    this.instaLink,
    this.xLink,
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

  @override
  State<SocialIconsV1Widget> createState() => _SocialIconsV1WidgetState();
}

class _SocialIconsV1WidgetState extends State<SocialIconsV1Widget> {
  late SocialIconsV1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialIconsV1Model());

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
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Text(
              'social media',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.bebasNeue(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 32.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
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
                  child: Icon(
                    Icons.tiktok_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 30.0,
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
                  child: FaIcon(
                    FontAwesomeIcons.facebookSquare,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 30.0,
                  ),
                ),
              if (widget!.instagramOnOFF)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await launchURL(widget!.fbLink!);
                  },
                  child: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 30.0,
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
                  child: FaIcon(
                    FontAwesomeIcons.twitter,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 30.0,
                  ),
                ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ],
      ),
    );
  }
}
