import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:core_ui/src/config/app_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Full-screen image lightbox overlay.
///
/// Displays [imageUrl] centred on a dark background. Tapping anywhere or the
/// close button dismisses via [GoRouter.pop].
class LightboxImageViewer extends ConsumerWidget {
  const LightboxImageViewer({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfg = ref.watch(appConfigProvider);

    return Align(
      child: GestureDetector(
        onTap: () => GoRouter.of(context).pop(),
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: cfg.cardBorderRadius,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imageUrl,
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
              alignment: const AlignmentDirectional(0.9, -0.6),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    0.0, 20.0, 20.0, 0.0),
                child: GestureDetector(
                  onTap: () => GoRouter.of(context).pop(),
                  child: Icon(
                    Icons.close_rounded,
                    color: Theme.of(context).colorScheme.surface,
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
