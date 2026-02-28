import 'dart:ui';

import 'package:api_client/api_client.dart';
import 'package:feature_events/src/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

/// Fullscreen campaign overlay with a blurred backdrop.
///
/// On mount the campaign's [objectId] is recorded in [campaignProvider] so the
/// app layer knows not to show it again this session.
///
/// Tap the backdrop or the close button to dismiss. Tap the campaign image to
/// follow the campaign link (prefers [campaign.appTargetLink], falls back to
/// [campaign.webTargetLink]).
class CampaignWidget extends ConsumerStatefulWidget {
  const CampaignWidget({super.key, required this.campaign});

  final CampaignStruct campaign;

  @override
  ConsumerState<CampaignWidget> createState() => _CampaignWidgetState();
}

class _CampaignWidgetState extends ConsumerState<CampaignWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // Mark campaign as shown this session
      if (widget.campaign.hasObjectId()) {
        ref.read(campaignProvider.notifier).update(
              (ids) => [...ids, widget.campaign.objectId],
            );
      }
    });
  }

  Future<void> _launchLink() async {
    final appLink = widget.campaign.appTargetLink;
    final webLink = widget.campaign.webTargetLink;
    final useApp =
        appLink.isNotEmpty && appLink != 'null' && appLink != 'NULL';
    final target = useApp ? appLink : webLink;
    if (target.isNotEmpty) {
      await launchUrl(Uri.parse(target));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred backdrop — tap to dismiss
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: ClipRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 10.0,
                height: MediaQuery.sizeOf(context).height,
                color: const Color(0x2B000000),
              ),
            ),
          ),
        ),

        // Centred content
        Align(
          alignment: AlignmentDirectional.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close button (fades in after 200ms)
              Align(
                alignment: const AlignmentDirectional(0.9, -1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFF1C1B1B),
                      shape: const CircleBorder(),
                      fixedSize: const Size(40.0, 40.0),
                    ),
                    icon: const Icon(Icons.close_sharp,
                        color: Colors.white, size: 24.0),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 490.ms),
                ),
              ),

              // Campaign image (tappable — fades in at 0ms)
              GestureDetector(
                onTap: _launchLink,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.network(
                    widget.campaign.mobileImage,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    fit: BoxFit.contain,
                  ),
                )
                    .animate()
                    .fadeIn(duration: 260.ms),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
