import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'x_latest_title_v4_model.dart';
export 'x_latest_title_v4_model.dart';

class XLatestTitleV4Widget extends StatefulWidget {
  const XLatestTitleV4Widget({
    super.key,
    Color? lineColor,
  }) : this.lineColor = lineColor ?? Colors.black;

  final Color lineColor;

  @override
  State<XLatestTitleV4Widget> createState() => _XLatestTitleV4WidgetState();
}

class _XLatestTitleV4WidgetState extends State<XLatestTitleV4Widget> {
  late XLatestTitleV4Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => XLatestTitleV4Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(
                height: 2.0,
                thickness: 2.0,
                color: widget!.lineColor,
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: Image.asset(
            'packages/touchline_template_puum0i/assets/images/rb_45422.png',
            width: 50.0,
            height: 50.0,
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(
                height: 2.0,
                thickness: 2.0,
                color: widget!.lineColor,
              ),
            ],
          ),
        ),
      ].divide(SizedBox(width: 8.0)),
    );
  }
}
