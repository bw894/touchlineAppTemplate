import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:url_launcher/url_launcher.dart';

/// Renders HTML content using [HtmlWidget] with UTF-8 fixing, HTML entity
/// unescaping, and custom YouTube thumbnail handling for embedded iframes.
///
/// Ported from ResponsiveHtmlViewer3 (Phase 5.5).
class HtmlContentWidget extends StatefulWidget {
  const HtmlContentWidget({
    super.key,
    required this.htmlContent,
    this.width,
  });

  final String htmlContent;
  final double? width;

  @override
  State<HtmlContentWidget> createState() => _HtmlContentWidgetState();
}

class _HtmlContentWidgetState extends State<HtmlContentWidget> {
  // ── Helpers ──────────────────────────────────────────────────────────────

  String? _extractYouTubeId(String url) {
    final embedRe =
        RegExp(r'youtube\.com/embed/([a-zA-Z0-9_-]+)', caseSensitive: false);
    final watchRe = RegExp(
      r'(?:youtube\.com\/(?:[^\/\n\s]+\/\s*[^\/\n\s]+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})',
      caseSensitive: false,
    );
    return embedRe.firstMatch(url)?.group(1) ??
        watchRe.firstMatch(url)?.group(1);
  }

  String _processHtml(String raw) {
    try {
      final fixed = utf8.decode(latin1.encode(raw));
      final unescaped = HtmlUnescape()
          .convert(fixed)
          .replaceAll('\u2018', "'")
          .replaceAll('\u2019', "'");
      return '''<html>
        <head>
          <style>
            html, body {
              font-family: 'Montserrat', sans-serif;
              font-size: 16px;
              background-color: transparent;
              margin: 0; padding: 0;
            }
          </style>
        </head>
        <body>$unescaped</body>
      </html>''';
    } catch (_) {
      return raw;
    }
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final processedHtml = _processHtml(widget.htmlContent);

    return Container(
      width: widget.width ?? MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: HtmlWidget(
          processedHtml,
          onTapUrl: (url) async {
            await launchUrl(Uri.parse(url),
                mode: LaunchMode.externalApplication);
            return true;
          },
          textStyle: const TextStyle(fontSize: 16, color: Colors.black),
          customStylesBuilder: (element) {
            switch (element.localName) {
              case 'p':
                return {'margin': '0 0 24px 0', 'line-height': '1.6'};
              case 'h1':
              case 'h2':
              case 'h3':
                return {'margin': '24px 0 16px 0', 'line-height': '1.3'};
              case 'ul':
              case 'ol':
                return {'padding-left': '20px', 'margin': '0 0 24px 0'};
              case 'li':
                return {'margin-bottom': '8px'};
            }
            return null;
          },
          customWidgetBuilder: (element) {
            if (element.localName == 'iframe') {
              final src = element.attributes['src'];
              if (src != null &&
                  (src.contains('youtube.com') || src.contains('youtu.be'))) {
                final videoId = _extractYouTubeId(src);
                if (videoId != null) {
                  final thumb = 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    child: GestureDetector(
                      onTap: () => launchUrl(Uri.parse(src),
                          mode: LaunchMode.externalApplication),
                      child: Container(
                        height: 220,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                thumb,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Center(
                                  child: Icon(Icons.video_library,
                                      color: Colors.white, size: 64),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black.withValues(alpha: 0.3),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: 68,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.play_arrow,
                                    color: Colors.white, size: 36),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withValues(alpha: 0.8),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.play_circle_outline,
                                        color: Colors.red, size: 24),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'Watch on YouTube',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            }
            return null;
          },
        ),
      ),
    );
  }
}
