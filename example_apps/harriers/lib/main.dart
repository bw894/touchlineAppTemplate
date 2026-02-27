import '/custom_code/actions/index.dart' as actions;
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/push_notifications/push_notifications_util.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:touchline_template_puum0i/app_state.dart'
    as touchline_template_puum0i_app_state;

import 'package:touchline_template_puum0i/library_values.dart'
    as touchline_template_puum0i_library_values;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  touchline_template_puum0i_library_values.FFLibraryValues().BLProjectId =
      FFAppConstants.BLProjectId;
  touchline_template_puum0i_library_values.FFLibraryValues().BLRestAPIKey =
      FFAppConstants.BLRestAPIKey;
  touchline_template_puum0i_library_values.FFLibraryValues().TicketingLink =
      FFAppConstants.TicketingLink;
  touchline_template_puum0i_library_values.FFLibraryValues().ClubFullName =
      FFAppConstants.ClubFullName;
  touchline_template_puum0i_library_values.FFLibraryValues().ClubShortName =
      FFAppConstants.ClubShortName;
  touchline_template_puum0i_library_values.FFLibraryValues().ClubBadge =
      FFAppConstants.ClubBadge;
  touchline_template_puum0i_library_values.FFLibraryValues().NicknamePlural =
      FFAppConstants.NicknamePlural;
  touchline_template_puum0i_library_values.FFLibraryValues().ClubABR =
      FFAppConstants.ClubABR;
  touchline_template_puum0i_library_values.FFLibraryValues().feedURL =
      FFAppConstants.feedURL;
  touchline_template_puum0i_library_values.FFLibraryValues().PredictorNumber =
      2;
  touchline_template_puum0i_library_values.FFLibraryValues().focusTeamObjectId =
      FFAppConstants.focusTeamId;
  touchline_template_puum0i_library_values.FFLibraryValues()
      .ClubBadgeOnPrimary = FFAppConstants.clubBadgeOnPrimary;
  touchline_template_puum0i_library_values.FFLibraryValues().settingsId =
      FFAppConstants.settingsId;
  touchline_template_puum0i_library_values.FFLibraryValues().BRTopLeft = 8;
  touchline_template_puum0i_library_values.FFLibraryValues().BRTopRight = 8;
  touchline_template_puum0i_library_values.FFLibraryValues().BRBottomLeft = 8;
  touchline_template_puum0i_library_values.FFLibraryValues().BRBottomRight = 8;
  touchline_template_puum0i_library_values.FFLibraryValues().deepLinkUrl =
      FFAppConstants.deepLinkUrl;
  await initFirebase();

  // Start initial custom actions code
  await actions.initializeDynalink();
  await actions.lockPortraitMode();
  // End initial custom actions code

  final touchline_template_puum0iAppState =
      touchline_template_puum0i_app_state.FFAppState();
  await touchline_template_puum0iAppState.initializePersistedState();

  if (!kIsWeb) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }
  await initializeFirebaseRemoteConfig();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => touchline_template_puum0iAppState,
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class MyAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = kidderminsterHarriersFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(milliseconds: 3500),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'test site',
      scrollBehavior: MyAppScrollBehavior(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: WidgetStateProperty.all(true),
          trackVisibility: WidgetStateProperty.all(false),
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.dragged)) {
              return Color(15412526);
            }
            if (states.contains(WidgetState.hovered)) {
              return Color(15412526);
            }
            return Color(15412526);
          }),
        ),
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}
