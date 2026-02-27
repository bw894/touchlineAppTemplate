// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YouTubeEmbedWidget extends StatefulWidget {
  const YouTubeEmbedWidget({
    super.key,
    this.width,
    this.height,
    required this.url,
  });

  final double? width;
  final double? height;
  final String url;

  @override
  _YouTubeEmbedWidgetState createState() => _YouTubeEmbedWidgetState();
}

class _YouTubeEmbedWidgetState extends State<YouTubeEmbedWidget> {
  late YoutubePlayerController _controller;
  String? _videoId;

  @override
  void initState() {
    super.initState();
    // Extract video ID from the URL string
    _videoId = _extractVideoId(widget.url);
    if (_videoId == null || _videoId!.isEmpty) {
      _videoId = '';
    } else {
      // Initialize controller with default params
      _controller = YoutubePlayerController(
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          enableCaption: true,
          strictRelatedVideos: true,
          origin: 'https://www.youtube-nocookie.com', // <========== UPDATE HERE
        ),
      );
      // Use cueVideoByUrl to handle video IDs with hyphens
      _controller.cueVideoByUrl(
        mediaContentUrl: 'http://www.youtube.com/v/$_videoId',
        startSeconds: 0,
      );
    }
  }

  String? _extractVideoId(String url) {
    // Handle different YouTube URL formats
    if (url.contains('youtu.be/')) {
      return url.split('youtu.be/')[1].split('?')[0];
    } else if (url.contains('youtube.com/watch')) {
      final uri = Uri.parse(url);
      return uri.queryParameters['v'];
    } else if (url.contains('youtube.com/embed/')) {
      return url.split('embed/')[1].split('?')[0];
    } else if (url.contains('youtube.com/v/')) {
      return url.split('v/')[1].split('?')[0];
    }
    return null;
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Handle null or invalid width/height by providing fallback values
    final double effectiveWidth =
        widget.width ?? MediaQuery.of(context).size.width;
    final double effectiveHeight = widget.height ??
        (effectiveWidth * 9 / 16); // Default to 16:9 aspect ratio

    if (_videoId == null || _videoId!.isEmpty) {
      return SizedBox(
        width: effectiveWidth,
        height: effectiveHeight,
        child: const Center(
          child: Text('Invalid YouTube URL'),
        ),
      );
    }

    return YoutubePlayerScaffold(
      controller: _controller,
      aspectRatio: effectiveWidth / effectiveHeight,
      builder: (context, player) {
        return SizedBox(
          width: effectiveWidth,
          height: effectiveHeight,
          child: player,
        );
      },
    );
  }
}
