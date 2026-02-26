import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

/// Full-screen YouTube player modal.
///
/// Tapping outside (the dark backdrop) dismisses the dialog.
/// Renders an inline [YoutubePlayerScaffold] sized to 16:9.
///
/// Ported from YoutubeVideoWidget (Phase 5.5).
class YoutubeVideoWidget extends StatefulWidget {
  const YoutubeVideoWidget({
    super.key,
    required this.watchUrl,
  });

  final String watchUrl;

  @override
  State<YoutubeVideoWidget> createState() => _YoutubeVideoWidgetState();
}

class _YoutubeVideoWidgetState extends State<YoutubeVideoWidget> {
  late final YoutubePlayerController _controller;
  late final String? _videoId;

  @override
  void initState() {
    super.initState();
    _videoId = _extractVideoId(widget.watchUrl);
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        enableCaption: true,
        strictRelatedVideos: true,
        origin: 'https://www.youtube-nocookie.com',
      ),
    );
    if (_videoId != null && _videoId!.isNotEmpty) {
      _controller.cueVideoByUrl(
        mediaContentUrl: 'http://www.youtube.com/v/$_videoId',
        startSeconds: 0,
      );
    }
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  String? _extractVideoId(String url) {
    if (url.contains('youtu.be/')) {
      return url.split('youtu.be/')[1].split('?')[0];
    }
    if (url.contains('youtube.com/watch')) {
      return Uri.parse(url).queryParameters['v'];
    }
    if (url.contains('youtube.com/embed/')) {
      return url.split('embed/')[1].split('?')[0];
    }
    if (url.contains('youtube.com/v/')) {
      return url.split('v/')[1].split('?')[0];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.sizeOf(context).width;
    final playerH = ((screenW - 16) / 16) * 9;

    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0x1914181B),
        child: Align(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: screenW,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLow,
              ),
              child: (_videoId == null || _videoId!.isEmpty)
                  ? SizedBox(
                      width: screenW,
                      height: playerH,
                      child: const Center(child: Text('Invalid YouTube URL')),
                    )
                  : SizedBox(
                      width: screenW,
                      height: playerH,
                      child: YoutubePlayerScaffold(
                        controller: _controller,
                        aspectRatio: screenW / playerH,
                        builder: (context, player) => player,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
