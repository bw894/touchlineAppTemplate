import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'campaign_v1_model.dart';
export 'campaign_v1_model.dart';

class CampaignV1Widget extends StatefulWidget {
  const CampaignV1Widget({
    super.key,
    required this.campaign,
  });

  final CampaignStruct? campaign;

  @override
  State<CampaignV1Widget> createState() => _CampaignV1WidgetState();
}

class _CampaignV1WidgetState extends State<CampaignV1Widget>
    with TickerProviderStateMixin {
  late CampaignV1Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CampaignV1Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().addToCampaignObjectIds(widget.campaign!.objectId);
    });

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 490.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 260.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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

    return Stack(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.pop(context);
          },
          child: ClipRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 2.0,
                sigmaY: 2.0,
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 10.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: Color(0x2B000000),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional(0.9, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 20.0,
                    buttonSize: 40.0,
                    fillColor: Color(0xFF1C1B1B),
                    icon: Icon(
                      Icons.close_sharp,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ).animateOnPageLoad(
                      animationsMap['iconButtonOnPageLoadAnimation']!),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if ((widget.campaign?.appTargetLink == null ||
                          widget.campaign?.appTargetLink == '') ||
                      (widget.campaign?.appTargetLink == 'null')) {
                    await launchURL(widget.campaign!.webTargetLink);
                  } else {
                    await launchURL(widget.campaign!.appTargetLink);
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.network(
                    widget.campaign!.mobileImage,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    fit: BoxFit.contain,
                  ),
                ),
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
            ],
          ),
        ),
      ],
    );
  }
}
