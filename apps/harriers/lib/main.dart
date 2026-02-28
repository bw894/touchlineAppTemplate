import 'package:core_ui/core_ui.dart';
import 'package:dynalink_flutter/dynalink_flutter.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theming/theming.dart';

import 'app_config.dart';
import 'navigation/router.dart';

// TODO(Phase 6.11): Run `flutterfire configure` to generate this file, then
// uncomment the import and pass DefaultFirebaseOptions.currentPlatform to
// Firebase.initializeApp() below.
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase — analytics, crashlytics, messaging, remote config.
  // User auth (firebase_auth) is handled inside feature_auth.
  // TODO(Phase 6.11): Add `options: DefaultFirebaseOptions.currentPlatform`
  // after copying google-services.json / GoogleService-Info.plist.
  await Firebase.initializeApp();

  if (!kIsWeb) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  // Deep-link SDK.
  await Dynalink.initialize(
    publicKey: const HarriersConfig().dynalinkPublicKey,
    projectId: const HarriersConfig().dynalinkProjectId,
  );

  // Portrait-only.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    ProviderScope(
      overrides: [
        appConfigProvider.overrideWithValue(const HarriersConfig()),
      ],
      child: const _HarriersApp(),
    ),
  );
}

class _HarriersApp extends ConsumerStatefulWidget {
  const _HarriersApp();

  @override
  ConsumerState<_HarriersApp> createState() => _HarriersAppState();
}

class _HarriersAppState extends ConsumerState<_HarriersApp> {
  @override
  void initState() {
    super.initState();
    // Restore persisted auth session once on cold start.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authNotifierProvider.notifier).restoreSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final cfg = ref.watch(appConfigProvider);
    final themeData = AppTheme.build(cfg.theme);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Harriers',
      routerConfig: router,
      theme: themeData,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
    );
  }
}
