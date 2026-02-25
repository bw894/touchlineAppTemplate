import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

/// A full-screen image viewer with pinch-to-zoom and optional rotation.
///
/// Dismiss by pinching below 0.3× scale or tapping the close button.
/// Supports hero animations via [tag].
///
/// Ported from [FlutterFlowExpandedImageView] in
/// [flutter_flow_expanded_image_view.dart].
class AppImageViewer extends StatelessWidget {
  const AppImageViewer({
    super.key,
    required this.image,
    this.allowRotation = false,
    this.useHeroAnimation = true,
    this.tag,
  });

  final Widget image;
  final bool allowRotation;
  final bool useHeroAnimation;
  final Object? tag;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Material(
      color: Colors.black,
      child: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: PhotoView.customChild(
                minScale: 1.0,
                maxScale: 3.0,
                enableRotation: allowRotation,
                heroAttributes: useHeroAnimation && tag != null
                    ? PhotoViewHeroAttributes(tag: tag!)
                    : null,
                onScaleEnd: (context, details, value) {
                  if ((value.scale ?? 1.0) < 0.3) {
                    Navigator.pop(context);
                  }
                },
                child: image,
              ),
            ),
            Positioned(
              top: 8,
              left: 0,
              child: IconButton(
                color: Colors.black,
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
