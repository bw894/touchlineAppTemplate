import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lightbox_images_model.dart';
export 'lightbox_images_model.dart';

class LightboxImagesWidget extends StatefulWidget {
  const LightboxImagesWidget({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  State<LightboxImagesWidget> createState() => _LightboxImagesWidgetState();
}

class _LightboxImagesWidgetState extends State<LightboxImagesWidget> {
  late LightboxImagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LightboxImagesModel());

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
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.safePop();
        },
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: ClipRRect(
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
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    height: MediaQuery.sizeOf(context).height * 0.5,
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget!.image!,
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.9, -0.6),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 20.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 36.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
