import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_v1_model.dart';
export 'nav_bar_v1_model.dart';

class NavBarV1Widget extends StatefulWidget {
  const NavBarV1Widget({
    super.key,
    required this.button1Action,
    required this.button2Action,
    required this.button3Action,
    required this.button4Action,
    required this.button5Action,
  });

  final Future Function()? button1Action;
  final Future Function()? button2Action;
  final Future Function()? button3Action;
  final Future Function()? button4Action;
  final Future Function()? button5Action;

  @override
  State<NavBarV1Widget> createState() => _NavBarV1WidgetState();
}

class _NavBarV1WidgetState extends State<NavBarV1Widget>
    with TickerProviderStateMixin {
  late NavBarV1Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarV1Model());

    animationsMap.addAll({
      'iconButtonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 21.0),
            end: Offset(0.0, -21.0),
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 400.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, -21.0),
            end: Offset(0.0, 21.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.0,
      decoration: BoxDecoration(
        color: Color(0x00EEEEEE),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0x1A57636C),
                        offset: Offset(
                          0.0,
                          -10.0,
                        ),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                hoverIconColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.home_rounded,
                  color: valueOrDefault<Color>(
                    () {
                      if ('touchlinetemplate://afctelfordunitedtheapp.com${GoRouterState.of(context).uri.toString()}' ==
                          'afctelfordunitedtheapp://afctelfordunitedtheapp.com/homepage') {
                        return FlutterFlowTheme.of(context).primary;
                      } else if ('touchlinetemplate://afctelfordunitedtheapp.com${GoRouterState.of(context).uri.toString()}' ==
                          'afctelfordunitedtheapp://afctelfordunitedtheapp.com/') {
                        return FlutterFlowTheme.of(context).primary;
                      } else {
                        return Color(0xFF9299A1);
                      }
                    }(),
                    Color(0xFF9299A1),
                  ),
                  size: 24.0,
                ),
                onPressed: () async {
                  await widget.button1Action?.call();
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                hoverIconColor: FlutterFlowTheme.of(context).primary,
                icon: Icon(
                  Icons.calendar_today,
                  color: valueOrDefault<Color>(
                    'touchlinetemplate://afctelfordunitedtheapp.com${GoRouterState.of(context).uri.toString()}' ==
                            'afctelfordunitedtheapp://afctelfordunitedtheapp.com/games'
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0xFF9299A1),
                    Color(0xFF9299A1),
                  ),
                  size: 24.0,
                ),
                onPressed: () async {
                  await widget.button2Action?.call();
                },
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: Icon(
                        Icons.sports_soccer_outlined,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        await widget.button3Action?.call();
                      },
                    ).animateOnActionTrigger(
                      animationsMap['iconButtonOnActionTriggerAnimation']!,
                    ),
                  ),
                ],
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                hoverIconColor: FlutterFlowTheme.of(context).primary,
                icon: FaIcon(
                  FontAwesomeIcons.ticketAlt,
                  color: valueOrDefault<Color>(
                    'touchlinetemplate://afctelfordunitedtheapp.com${GoRouterState.of(context).uri.toString()}' ==
                            'afctelfordunitedtheapp://afctelfordunitedtheapp.com/tickets'
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0xFF9299A1),
                    Color(0xFF9299A1),
                  ),
                  size: 24.0,
                ),
                onPressed: () async {
                  await widget.button4Action?.call();
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                hoverIconColor: FlutterFlowTheme.of(context).primary,
                icon: FaIcon(
                  FontAwesomeIcons.store,
                  color: valueOrDefault<Color>(
                    'touchlinetemplate://afctelfordunitedtheapp.com${GoRouterState.of(context).uri.toString()}' ==
                            'afctelfordunitedtheapp://afctelfordunitedtheapp.com/shop'
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0xFF9299A1),
                    Color(0xFF9299A1),
                  ),
                  size: 24.0,
                ),
                onPressed: () async {
                  await widget.button5Action?.call();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
