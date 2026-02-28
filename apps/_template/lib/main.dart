// ============================================================
// STEP 5 — App entry point
//
// TODOs for a new club:
//   1. Replace TemplateClubConfig with [ClubName]Config everywhere.
//   2. Run `flutterfire configure` in this directory to generate
//      firebase_options.dart, then uncomment the import + options arg.
//   3. Copy google-services.json → android/app/
//      Copy GoogleService-Info.plist → ios/Runner/
// ============================================================

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

// TODO(new-club): Run `flutterfire configure` then uncomment:
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase — analytics, crashlytics, messaging, remote config.
  // User auth (firebase_auth) is handled inside feature_auth.
  // TODO(new-club): Add `options: DefaultFirebaseOptions.currentPlatform`
  // after generating firebase_options.dart via `flutterfire configure`.
  await Firebase.initializeApp();

  if (!kIsWeb) {
    FlutterError.onError =
        FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  // Deep-link SDK.
  // Values come from AppConfig — no changes needed here.
  const config = TemplateClubConfig(); // TODO(new-club): replace class name
  await Dynalink.initialize(
    publicKey: config.dynalinkPublicKey,
    projectId: config.dynalinkProjectId,
  );

  // Portrait-only lock (SystemChrome also enforces this at runtime).
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    ProviderScope(
      overrides: [
        // TODO(new-club): replace TemplateClubConfig with [ClubName]Config
        appConfigProvider.overrideWithValue(const TemplateClubConfig()),
      ],
      child: const _ClubApp(),
    ),
  );
}

class _ClubApp extends ConsumerStatefulWidget {
  const _ClubApp();

  @override
  ConsumerState<_ClubApp> createState() => _ClubAppState();
}

class _ClubAppState extends ConsumerState<_ClubApp> {
  @override
  void initState() {
    super.initState();
    // Restore persisted auth session on cold start.
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
      // TODO(new-club): update the app title
      title: 'Club App',
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
