import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';
import 'package:touchline_template_puum0i/index.dart'
    as $touchline_template_puum0i;

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) {
  $touchline_template_puum0i.initializeRoutes(
    digitalProgrammeProductPageWidgetName:
        'touchline_template_puum0i.DigitalProgrammeProductPage',
    digitalProgrammeProductPageWidgetPath: '/digitalProgrammeProductPageLIB',
    myProgrammesWidgetName: 'touchline_template_puum0i.MyProgrammes',
    myProgrammesWidgetPath: '/myProgrammesLIB',
    teamSelectWidgetName: 'touchline_template_puum0i.TeamSelect',
    teamSelectWidgetPath: '/teamSelect',
    teamEventWidgetName: 'touchline_template_puum0i.TeamEvent',
    teamEventWidgetPath: '/teamEvent',
    cartWidgetName: 'touchline_template_puum0i.cart',
    cartWidgetPath: '/cart',
    interactiveHubWidgetName: 'touchline_template_puum0i.interactiveHub',
    interactiveHubWidgetPath: '/play',
    youthSignUpWidgetName: 'touchline_template_puum0i.youthSignUp',
    youthSignUpWidgetPath: '/youthSignUp',
    shopIndividualProductWidgetName:
        'touchline_template_puum0i.shopIndividualProduct',
    shopIndividualProductWidgetPath: '/shopIndividualProduct',
    youthMainScreenWidgetName: 'touchline_template_puum0i.youthMainScreen',
  );

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: appStateNotifier,
    navigatorKey: appNavigatorKey,
    errorBuilder: (context, state) =>
        appStateNotifier.loggedIn ? HomeWidget() : SignInWidget(),
    routes: [
      FFRoute(
        name: '_initialize',
        path: '/',
        builder: (context, _) =>
            appStateNotifier.loggedIn ? HomeWidget() : SignInWidget(),
      ),
      FFRoute(
        name: SignInWidget.routeName,
        path: SignInWidget.routePath,
        builder: (context, params) => SignInWidget(),
      ),
      FFRoute(
        name: CreateAccountWidget.routeName,
        path: CreateAccountWidget.routePath,
        builder: (context, params) => CreateAccountWidget(),
      ),
      FFRoute(
        name: ForgotPasswordWidget.routeName,
        path: ForgotPasswordWidget.routePath,
        builder: (context, params) => ForgotPasswordWidget(),
      ),
      FFRoute(
        name: HomeWidget.routeName,
        path: HomeWidget.routePath,
        builder: (context, params) => HomeWidget(),
      ),
      FFRoute(
        name: PredictorWidget.routeName,
        path: PredictorWidget.routePath,
        builder: (context, params) => PredictorWidget(),
      ),
      FFRoute(
        name: PredictorLeagueTableWidget.routeName,
        path: PredictorLeagueTableWidget.routePath,
        builder: (context, params) => PredictorLeagueTableWidget(),
      ),
      FFRoute(
        name: TicketsWidget.routeName,
        path: TicketsWidget.routePath,
        builder: (context, params) => TicketsWidget(),
      ),
      FFRoute(
        name: MerchShopWidget.routeName,
        path: MerchShopWidget.routePath,
        builder: (context, params) => MerchShopWidget(),
      ),
      FFRoute(
        name: GamesWidget.routeName,
        path: GamesWidget.routePath,
        builder: (context, params) => GamesWidget(),
      ),
      FFRoute(
        name: LGCLiveWidget.routeName,
        path: LGCLiveWidget.routePath,
        builder: (context, params) => LGCLiveWidget(
          objectId: params.getParam(
            'objectId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: LGCFixtureWidget.routeName,
        path: LGCFixtureWidget.routePath,
        requireAuth: true,
        builder: (context, params) => LGCFixtureWidget(
          objectId: params.getParam(
            'objectId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: LGCResultWidget.routeName,
        path: LGCResultWidget.routePath,
        requireAuth: true,
        builder: (context, params) => LGCResultWidget(
          objectId: params.getParam(
            'objectId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: LeagueTableWidget.routeName,
        path: LeagueTableWidget.routePath,
        builder: (context, params) => LeagueTableWidget(),
      ),
      FFRoute(
        name: PlayerPageWidget.routeName,
        path: PlayerPageWidget.routePath,
        builder: (context, params) => PlayerPageWidget(
          objectId: params.getParam(
            'objectId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: CmsPostWidget.routeName,
        path: CmsPostWidget.routePath,
        builder: (context, params) => CmsPostWidget(
          objectId: params.getParam(
            'objectId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: NewsArchiveNewWidget.routeName,
        path: NewsArchiveNewWidget.routePath,
        builder: (context, params) => NewsArchiveNewWidget(),
      ),
      FFRoute(
        name: MyClubPageWidget.routeName,
        path: MyClubPageWidget.routePath,
        builder: (context, params) => MyClubPageWidget(
          objectId: params.getParam(
            'objectId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: MyClubFolderWidget.routeName,
        path: MyClubFolderWidget.routePath,
        builder: (context, params) => MyClubFolderWidget(
          rootKey: params.getParam(
            'rootKey',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: EventPageWidget.routeName,
        path: EventPageWidget.routePath,
        builder: (context, params) => EventPageWidget(
          objectId: params.getParam(
            'objectId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: $touchline_template_puum0i
            .DigitalProgrammeProductPageWidget.routeName,
        path: $touchline_template_puum0i
            .DigitalProgrammeProductPageWidget.routePath,
        builder: (context, params) =>
            $touchline_template_puum0i.DigitalProgrammeProductPageWidget(
          matchObjectId: params.getParam(
            'matchObjectId',
            ParamType.String,
          ),
          matchSummary: params.getParam(
            'matchSummary',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: $touchline_template_puum0i.MyProgrammesWidget.routeName,
        path: $touchline_template_puum0i.MyProgrammesWidget.routePath,
        builder: (context, params) =>
            $touchline_template_puum0i.MyProgrammesWidget(),
      ),
      FFRoute(
        name: $touchline_template_puum0i.TeamSelectWidget.routeName,
        path: $touchline_template_puum0i.TeamSelectWidget.routePath,
        builder: (context, params) =>
            $touchline_template_puum0i.TeamSelectWidget(),
      ),
      FFRoute(
        name: $touchline_template_puum0i.TeamEventWidget.routeName,
        path: $touchline_template_puum0i.TeamEventWidget.routePath,
        builder: (context, params) =>
            $touchline_template_puum0i.TeamEventWidget(
          objectId: params.getParam(
            'objectId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: $touchline_template_puum0i.CartWidget.routeName,
        path: $touchline_template_puum0i.CartWidget.routePath,
        builder: (context, params) => $touchline_template_puum0i.CartWidget(),
      ),
      FFRoute(
        name: $touchline_template_puum0i.InteractiveHubWidget.routeName,
        path: $touchline_template_puum0i.InteractiveHubWidget.routePath,
        builder: (context, params) =>
            $touchline_template_puum0i.InteractiveHubWidget(
          objectId: params.getParam(
            'objectId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: $touchline_template_puum0i.YouthSignUpWidget.routeName,
        path: $touchline_template_puum0i.YouthSignUpWidget.routePath,
        builder: (context, params) =>
            $touchline_template_puum0i.YouthSignUpWidget(),
      ),
      FFRoute(
        name: $touchline_template_puum0i.ShopIndividualProductWidget.routeName,
        path: $touchline_template_puum0i.ShopIndividualProductWidget.routePath,
        builder: (context, params) =>
            $touchline_template_puum0i.ShopIndividualProductWidget(
          objectId: params.getParam(
            'objectId',
            ParamType.String,
          ),
        ),
      ),
      FFRoute(
        name: $touchline_template_puum0i.YouthMainScreenWidget.routeName,
        path: $touchline_template_puum0i.YouthMainScreenWidget.routePath,
        builder: (context, params) =>
            $touchline_template_puum0i.YouthMainScreenWidget(),
      )
    ].map((r) => r.toRoute(appStateNotifier)).toList(),
  );
}

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo {
    final possibleKeys = [
      '__transition_info__',
      '__transition_info__touchline_template_puum0i'
    ];
    for (final key in possibleKeys) {
      if (extraMap.containsKey(key)) {
        return extraMap[key] as TransitionInfo;
      }
    }
    return TransitionInfo.appDefault();
  }
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/signIn';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Untitled_design-2_(1).gif',
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
