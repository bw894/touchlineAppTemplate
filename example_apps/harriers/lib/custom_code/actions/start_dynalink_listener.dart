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

// Dynalinks (Flutter) plugin
import 'package:dynalink_flutter/dynalink_flutter.dart';

// Module-level guards
StreamSubscription<String?>? _dynalinkSub;
bool _dynalinkStarted = false;
bool _deepLinkHandledThisLaunch = false;

Future<void> startDynalinkListener(BuildContext context) async {
  if (_dynalinkStarted) {
    debugPrint('🔁 Dynalink listener already started – skipping');
    return;
  }
  _dynalinkStarted = true;
  _deepLinkHandledThisLaunch = false;
  debugPrint('🚀 Starting Dynalink listener');

  // 1) Begin listening (covers cold + warm links)
  await _dynalinkSub?.cancel();
  _dynalinkSub = Dynalink.instance.dynamicLinkStream.listen(
    (url) async {
      if (url == null || url.isEmpty) return;
      debugPrint('🔥 Received Dynalink → $url');
      _deepLinkHandledThisLaunch = true;
      await handleDynalink(context, url);
    },
    onError: (e, st) => debugPrint('❌ Dynalink stream error: $e\n$st'),
    cancelOnError: false,
  );

  // 2) Fallback: if no link arrives, continue to Home
  // Use a short delay so a cold-start link has a chance to arrive.
  Future.delayed(const Duration(milliseconds: 300), () {
    if (!_deepLinkHandledThisLaunch) {
      debugPrint('🧭 No deep link received → navigating to Home');
    }
  });
}

// Optional cleanup (rarely needed if you keep one listener for the app lifetime)
Future<void> stopDynalinkListener() async {
  debugPrint('🛑 Stopping Dynalink listener');
  await _dynalinkSub?.cancel();
  _dynalinkSub = null;
  _dynalinkStarted = false;
}
