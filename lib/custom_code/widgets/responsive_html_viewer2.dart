// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ResponsiveHtmlViewer2 extends StatefulWidget {
  const ResponsiveHtmlViewer2({
    super.key,
    this.width,
    this.height,
    required this.htmlContent,
  });

  final double? width;
  final double? height;
  final String htmlContent;

  @override
  State<ResponsiveHtmlViewer2> createState() => _ResponsiveHtmlViewer2State();
}

class _ResponsiveHtmlViewer2State extends State<ResponsiveHtmlViewer2> {
  // Extract YouTube video ID from URL
  String? extractYouTubeId(String url) {
    // Handle embed URLs
    RegExp embedRegExp = RegExp(
      r'youtube\.com/embed/([a-zA-Z0-9_-]+)',
      caseSensitive: false,
    );

    // Handle regular YouTube URLs
    RegExp watchRegExp = RegExp(
      r'(?:youtube\.com\/(?:[^\/\n\s]+\/\s*[^\/\n\s]+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})',
      caseSensitive: false,
    );

    // First try to match embed URL format
    var embedMatch = embedRegExp.firstMatch(url);
    if (embedMatch != null && embedMatch.group(1) != null) {
      return embedMatch.group(1);
    }

    // Then try regular YouTube URL format
    var watchMatch = watchRegExp.firstMatch(url);
    return watchMatch?.group(1);
  }

  // Get YouTube thumbnail URL
  String getYouTubeThumbnailUrl(String videoId) {
    return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: widget.width ?? screenSize.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Allow Column to size to content
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: HtmlWidget(
              widget.htmlContent,
              // External link handling
              onTapUrl: (url) async {
                await launchUrl(
                  Uri.parse(url),
                  mode: LaunchMode.externalApplication,
                );
                return true;
              },
              // Text styling
              textStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              // Combined custom styles builder for all elements
              customStylesBuilder: (element) {
                if (element.localName == 'p') {
                  return {
                    'margin': '0 0 24px 0',
                    'line-height': '1.6',
                  };
                } else if (element.localName == 'h1' ||
                    element.localName == 'h2' ||
                    element.localName == 'h3') {
                  return {
                    'margin': '24px 0 16px 0',
                    'line-height': '1.3',
                  };
                } else if (element.localName == 'ul' ||
                    element.localName == 'ol') {
                  return {
                    'padding-left': '20px',
                    'margin': '0 0 24px 0',
                  };
                } else if (element.localName == 'li') {
                  return {
                    'margin-bottom': '8px',
                  };
                }
                return null;
              },
              // Handle iframes (videos) with actual thumbnails
              customWidgetBuilder: (element) {
                if (element.localName == 'iframe') {
                  final src = element.attributes['src'];
                  if (src != null &&
                      (src.contains('youtube.com') ||
                          src.contains('youtu.be'))) {
                    final videoId = extractYouTubeId(src);
                    if (videoId != null) {
                      final thumbnailUrl = getYouTubeThumbnailUrl(videoId);
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 24),
                        child: GestureDetector(
                          onTap: () async {
                            await launchUrl(
                              Uri.parse(src),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          child: Container(
                            height: 220,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    thumbnailUrl,
                                    fit: BoxFit.cover,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        color: Colors.black,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.black45,
                                        child: const Center(
                                          child: Icon(
                                            Icons.video_library,
                                            color: Colors.white,
                                            size: 64,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black.withOpacity(0.3),
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
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 36,
                                    ),
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
                                          Colors.black.withOpacity(0.8),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.play_circle_outline,
                                          color: Colors.red,
                                          size: 24,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            'Watch on YouTube',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
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
        ],
      ),
    );
  }
}
