import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'app_bar_v2_model.dart';
export 'app_bar_v2_model.dart';

class AppBarV2Widget extends StatefulWidget {
  const AppBarV2Widget({
    super.key,
    Color? backgroundColour,
    required this.badgeURL,
    Color? iconColour,
    bool? backButtonReq,
    Color? secondaryColour,
  })  : this.backgroundColour = backgroundColour ?? const Color(0xFF1A56A8),
        this.iconColour = iconColour ?? Colors.black,
        this.backButtonReq = backButtonReq ?? true,
        this.secondaryColour = secondaryColour ?? const Color(0xFF1A56A8);

  final Color backgroundColour;
  final String? badgeURL;
  final Color iconColour;
  final bool backButtonReq;
  final Color secondaryColour;

  @override
  State<AppBarV2Widget> createState() => _AppBarV2WidgetState();
}

class _AppBarV2WidgetState extends State<AppBarV2Widget> {
  late AppBarV2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarV2Model());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 105.0,
      decoration: BoxDecoration(
        color: widget.backgroundColour,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(valueOrDefault<double>(
            FFLibraryValues().BRBottomLeft?.toDouble(),
            0.0,
          )),
          bottomRight: Radius.circular(valueOrDefault<double>(
            FFLibraryValues().BRBottomRight?.toDouble(),
            0.0,
          )),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
        child: Stack(
          alignment: AlignmentDirectional(0.0, 1.0),
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(),
                      child: Opacity(
                        opacity: widget.backButtonReq ? 1.0 : 0.0,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.west,
                            color: widget.iconColour,
                            size: 26.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.network(
                      widget.badgeURL!,
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(),
                    child: Opacity(
                      opacity: 0.0,
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.west,
                          color: widget.iconColour,
                          size: 26.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 11.0,
              decoration: BoxDecoration(
                color: widget.secondaryColour,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
