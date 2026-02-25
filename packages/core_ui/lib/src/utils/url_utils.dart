import 'package:url_launcher/url_launcher.dart';

/// Launches [url] in the device's default browser or handler.
///
/// Throws a [String] describing the error if launching fails.
Future<void> launchURL(String url) async {
  final uri = Uri.parse(url);
  try {
    await launchUrl(uri);
  } catch (e) {
    throw 'Could not launch $uri: $e';
  }
}
