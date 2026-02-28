import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

/// Renders either a YouTube video (via [youtube_player_iframe]) or a
/// SEEEN-embedded video (via [webview_flutter]) depending on the [url].
///
/// Ported from UniversalVideoEmbedWidget (Phase 5.5).
class UniversalVideoWidget extends StatefulWidget {
  const UniversalVideoWidget({
    super.key,
    required this.url,
    this.width,
    this.height,
  });

  final String url;
  final double? width;
  final double? height;

  @override
  State<UniversalVideoWidget> createState() => _UniversalVideoWidgetState();
}

class _UniversalVideoWidgetState extends State<UniversalVideoWidget> {
  YoutubePlayerController? _ytController;
  WebViewController? _webViewController;
  String? _ytVideoId;

  bool get _isSeeen => widget.url.contains('seeenPlayerWidget');
  bool get _isYouTube =>
      widget.url.contains('youtube.com') || widget.url.contains('youtu.be');

  static final Uri _seeenHostPage = Uri.parse(
    'https://touchlineclub.com/wp-content/uploads/2026/02/seeen-embed.html',
  );
  static const String _seeenApiUrl = 'https://api.cs.seeen.com/';
  static const String _seeenApiKey = 'Zz3UMSI8diIRS42SaaooKvpXJkUhDbqe';

  @override
  void initState() {
    super.initState();
    if (_isYouTube) {
      _ytVideoId = _extractYouTubeId(widget.url);
      if (_ytVideoId != null && _ytVideoId!.isNotEmpty) {
        _ytController = YoutubePlayerController(
          params: const YoutubePlayerParams(
            showControls: true,
            showFullscreenButton: true,
            strictRelatedVideos: true,
            enableCaption: true,
            origin: 'https://www.youtube-nocookie.com',
          ),
        )..cueVideoById(videoId: _ytVideoId!);
      }
    }

    if (_isSeeen) {
      final widgetId = _extractSeeenWidgetId(widget.url);
      final videoId = _extractSeeenVideoId(widget.url);
      if (widgetId.isNotEmpty && videoId.isNotEmpty) {
        final uri = _seeenHostPage.replace(queryParameters: {
          'widgetId': widgetId,
          'videoId': videoId,
          'apiUrl': _seeenApiUrl,
          'apiKey': _seeenApiKey,
          'showMomentsBelowVideo': 'false',
          'showSocialIcons': 'false',
          'autoplay': 'false',
        });
        _webViewController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(NavigationDelegate(
            onNavigationRequest: (request) async {
              if (_isWrapperUrl(request.url)) {
                return NavigationDecision.navigate;
              }
              await _openExternally(request.url);
              return NavigationDecision.prevent;
            },
          ))
          ..loadRequest(uri);
      }
    }
  }

  @override
  void dispose() {
    _ytController?.close();
    super.dispose();
  }

  bool _isWrapperUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return (uri.host == _seeenHostPage.host &&
              uri.path == _seeenHostPage.path) ||
          uri.scheme == 'about' ||
          uri.scheme == 'data';
    } catch (_) {
      return false;
    }
  }

  Future<void> _openExternally(String url) async {
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (_) {}
  }

  String? _extractYouTubeId(String url) {
    try {
      if (url.contains('youtu.be/')) {
        return url.split('youtu.be/')[1].split('?')[0];
      }
      if (url.contains('youtube.com/watch')) {
        return Uri.parse(url).queryParameters['v'];
      }
      if (url.contains('youtube.com/embed/')) {
        return url.split('embed/')[1].split('?')[0];
      }
    } catch (_) {}
    return null;
  }

  String _extractSeeenWidgetId(String embed) =>
      RegExp(r'seeenPlayerWidget(\d+)').firstMatch(embed)?.group(1) ?? '';

  String _extractSeeenVideoId(String embed) =>
      RegExp(r'"videoId"\s*:\s*"(\d+)"').firstMatch(embed)?.group(1) ?? '';

  @override
  Widget build(BuildContext context) {
    final w = widget.width ?? MediaQuery.sizeOf(context).width;
    final h = widget.height ?? w * 9 / 16;

    if (_isSeeen && _webViewController != null) {
      return SizedBox(
        width: w,
        height: h,
        child: WebViewWidget(controller: _webViewController!),
      );
    }

    if (_ytController != null) {
      return SizedBox(
        width: w,
        height: h,
        child: YoutubePlayerScaffold(
          controller: _ytController!,
          aspectRatio: w / h,
          builder: (context, player) => player,
        ),
      );
    }

    return const Center(child: Text('Unsupported video source'));
  }
}
