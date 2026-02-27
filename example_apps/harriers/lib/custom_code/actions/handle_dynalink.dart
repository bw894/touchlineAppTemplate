// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:touchline_template_puum0i/backend/schema/structs/index.dart"
    as touchline_template_puum0i_data_schema;
import "package:touchline_template_puum0i/backend/schema/structs/index.dart"
    as touchline_template_puum0i_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// --- Helper function to normalize missing scheme (Android sometimes omits https) ---
String _normalizeUrl(String raw) {
  final s = raw.trim();
  if (s.contains('://')) return s;
  return 'https://$s';
}

Future<void> handleDynalink(
  BuildContext context,
  String url,
) async {
  debugPrint('--- handleDynalink Action Started ---');
  debugPrint('Received URL (raw): $url');

  if (url.isEmpty || url.trim().isEmpty) {
    debugPrint('No URL provided → do nothing');
    return;
  }

  try {
    final normalized = _normalizeUrl(url);
    debugPrint('Normalized URL: $normalized');

    final uri = Uri.parse(normalized);
    debugPrint(
        'Parsed URI -> scheme=${uri.scheme}, host=${uri.host}, path=${uri.path}, query=${uri.query}');
    debugPrint('Path Segments: ${uri.pathSegments}');
    debugPrint('Query Parameters: ${uri.queryParameters}');

    if (uri.pathSegments.isEmpty) {
      debugPrint('No path segments → do nothing');
      return;
    }

    final firstRaw = uri.pathSegments.first;
    final first = firstRaw.toLowerCase();
    debugPrint('First segment: "$firstRaw" (norm: "$first")');

    String? objectId = uri.queryParameters['objectId'];
    if (objectId == null && uri.pathSegments.length >= 2) {
      objectId = uri.pathSegments[1];
    }
    debugPrint('Resolved objectId: ${objectId ?? "(none)"}');

    const needsId = {
      'lgclive',
      'lgcresult',
      'lgcfixture',
      'cmspost',
      'event',
      'eventpage',
    };

    if (needsId.contains(first)) {
      if (objectId == null || objectId.isEmpty) {
        debugPrint('Missing objectId for "$first" → do nothing');
        return;
      }

      final qp = {
        'objectId': serializeParam(
          objectId,
          ParamType.String,
        ),
      }.withoutNulls;

      switch (first) {
        case 'lgclive':
          debugPrint('→ LGCLive (id=$objectId)');
          context.goNamed('/lgclive', queryParameters: qp);
          return;
        case 'lgcresult':
          debugPrint('→ LGCResult (id=$objectId)');
          context.goNamed('/lgcresult', queryParameters: qp);
          return;
        case 'lgcfixture':
          debugPrint('→ LGCFixture (id=$objectId)');
          context.goNamed('/lgcfixture', queryParameters: qp);
          return;
        case 'cmspost':
          debugPrint('→ CmsPost (id=$objectId)');
          context.goNamed('/cmspost', queryParameters: qp);
          return;
        case 'event':
        case 'eventpage':
          debugPrint('→ Event (id=$objectId) [enable when route ready]');
          return;
      }
    }

    switch (first) {
      case 'home':
        context.goNamed('/home');
        return;
      case 'games':
        context.goNamed('/games');
        return;
      case 'myclub':
        context.goNamed('/myclub', queryParameters: {'rootKey': 'root'});
        return;
      case 'merchshop':
      case 'shop':
        context.goNamed('/merchshop');
        return;
      case 'tickets':
        context.goNamed('/tickets');
        return;
      default:
        debugPrint('Unknown segment "$firstRaw" → do nothing');
        return;
    }
  } catch (e, st) {
    debugPrint('--- ERROR in handleDynalink ---');
    debugPrint('Error: $e');
    debugPrint('Stack Trace: $st');
    debugPrint('Do nothing on error');
    return;
  }
}
