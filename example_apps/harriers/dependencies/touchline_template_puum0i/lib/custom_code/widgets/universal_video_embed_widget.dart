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
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class UniversalVideoEmbedWidget extends StatefulWidget {
  const UniversalVideoEmbedWidget({
    super.key,
    this.width,
    this.height,
    required this.url,
  });

  final double? width;
  final double? height;
  final String url;

  @override
  State<UniversalVideoEmbedWidget> createState() =>
      _UniversalVideoEmbedWidgetState();
}

class _UniversalVideoEmbedWidgetState extends State<UniversalVideoEmbedWidget> {
  YoutubePlayerController? _youtubeController;
  WebViewController? _webViewController;

  String? _youtubeVideoId;

  bool get _isSeeen => widget.url.contains('seeenPlayerWidget');

  bool get _isYouTube =>
      widget.url.contains('youtube.com') || widget.url.contains('youtu.be');

  // ✅ Hosted SEEEN wrapper (WordPress uploads path)
  static final Uri _seeenHostPage = Uri.parse(
    'https://touchlineclub.com/wp-content/uploads/2026/02/seeen-embed.html',
  );

  // (Kept identical to your original SEEEN config)
  static const String _seeenApiUrl = 'https://api.cs.seeen.com/';
  static const String _seeenApiKey = 'Zz3UMSI8diIRS42SaaooKvpXJkUhDbqe';

  @override
  void initState() {
    super.initState();

    // ▶️ YouTube setup (PARAMS KEPT IDENTICAL)
    if (_isYouTube) {
      _youtubeVideoId = _extractYouTubeVideoId(widget.url);

      if (_youtubeVideoId != null && _youtubeVideoId!.isNotEmpty) {
        _youtubeController = YoutubePlayerController(
          params: const YoutubePlayerParams(
            showControls: true,
            showFullscreenButton: true,
            strictRelatedVideos: true,
            enableCaption: true,
            origin: 'https://www.youtube-nocookie.com',
          ),
        )..cueVideoById(videoId: _youtubeVideoId!);
      }
    }

    // 🎬 SEEEN setup (Android)
    if (_isSeeen) {
      final widgetId = _extractSeeenWidgetId(widget.url);
      final videoId = _extractSeeenVideoId(widget.url);

      if (widgetId.isNotEmpty && videoId.isNotEmpty) {
        final uri = _seeenHostPage.replace(queryParameters: {
          'widgetId': widgetId,
          'videoId': videoId,

          // keep same config values as your original widget
          'apiUrl': _seeenApiUrl,
          'apiKey': _seeenApiKey,
          'showMomentsBelowVideo': 'false',
          'showSocialIcons': 'false',
          'autoplay': 'false',
        });

        _webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onNavigationRequest: (request) async {
                final url = request.url;

                // Allow wrapper page loads/reloads
                if (_isWrapperUrl(url)) {
                  return NavigationDecision.navigate;
                }

                // Open external and stop WebView navigation
                await _openExternally(url);
                return NavigationDecision.prevent;
              },
              onPageFinished: (url) =>
                  debugPrint('SEEEN WebView finished: $url'),
              onWebResourceError: (error) {
                debugPrint(
                  'SEEEN WebView error: ${error.errorCode} ${error.description}',
                );
              },
            ),
          )
          ..loadRequest(uri);
      }
    }
  }

  bool _isWrapperUrl(String url) {
    try {
      final uri = Uri.parse(url);

      final isSameHost = uri.host == _seeenHostPage.host;
      final isSamePath = uri.path == _seeenHostPage.path;

      // Allow internal schemes that WebView may use
      final isInternalScheme = uri.scheme == 'about' || uri.scheme == 'data';

      return (isSameHost && isSamePath) || isInternalScheme;
    } catch (_) {
      return false;
    }
  }

  Future<bool> _openExternally(String url) async {
    try {
      final uri = Uri.parse(url);

      final allowedSchemes = {'http', 'https', 'mailto', 'tel', 'sms'};
      if (!allowedSchemes.contains(uri.scheme)) return false;

      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      return false;
    }
  }

  @override
  void dispose() {
    _youtubeController?.close();
    super.dispose();
  }

  // ─────────────────────────
  // YouTube helpers
  // ─────────────────────────

  String? _extractYouTubeVideoId(String url) {
    try {
      if (url.contains('youtu.be/')) {
        return url.split('youtu.be/')[1].split('?')[0];
      }
      if (url.contains('youtube.com/watch')) {
        final uri = Uri.parse(url);
        return uri.queryParameters['v'];
      }
      if (url.contains('youtube.com/embed/')) {
        return url.split('embed/')[1].split('?')[0];
      }
    } catch (_) {}
    return null;
  }

  // ─────────────────────────
  // SEEEN helpers
  // ─────────────────────────

  String _extractSeeenWidgetId(String embed) {
    final match = RegExp(r'seeenPlayerWidget(\d+)').firstMatch(embed);
    return match?.group(1) ?? '';
  }

  String _extractSeeenVideoId(String embed) {
    final match = RegExp(r'"videoId"\s*:\s*"(\d+)"').firstMatch(embed);
    return match?.group(1) ?? '';
  }

  // ─────────────────────────
  // Build
  // ─────────────────────────

  @override
  Widget build(BuildContext context) {
    final width = widget.width ?? MediaQuery.of(context).size.width;
    final height = widget.height ?? width * 9 / 16;

    // 🎬 SEEEN
    if (_isSeeen && _webViewController != null) {
      return SizedBox(
        width: width,
        height: height,
        child: WebViewWidget(
          controller: _webViewController!,
        ),
      );
    }

    // ▶️ YouTube
    if (_youtubeController != null) {
      return SizedBox(
        width: width,
        height: height,
        child: YoutubePlayerScaffold(
          controller: _youtubeController!,
          aspectRatio: width / height,
          builder: (context, player) => player,
        ),
      );
    }

    return const Center(
      child: Text('Unsupported video source'),
    );
  }
}
