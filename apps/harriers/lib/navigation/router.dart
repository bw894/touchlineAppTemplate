import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_events/feature_events.dart';
import 'package:feature_league/feature_league.dart';
import 'package:feature_match_centre/feature_match_centre.dart';
import 'package:feature_news/feature_news.dart';
import 'package:feature_player/feature_player.dart';
import 'package:feature_predictor/feature_predictor.dart';
import 'package:feature_programmes/feature_programmes.dart';
import 'package:feature_shop/feature_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../home/home_screen.dart';
import '../navigation/navbar_widget.dart';
import '../screens/tickets_screen.dart';

// ---------------------------------------------------------------------------
// Router provider
// ---------------------------------------------------------------------------

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: false,
    initialLocation: HomeScreen.routePath,
    redirect: (context, state) {
      final authState = ref.read(authNotifierProvider);
      final isOnAuth = state.matchedLocation == SignInScreen.routePath ||
          state.matchedLocation == CreateAccountScreen.routePath ||
          state.matchedLocation == ForgotPasswordScreen.routePath;

      switch (authState) {
        case AuthInitial() || AuthLoading():
          // Stay put while loading — no redirect.
          return null;
        case AuthUnauthenticated():
          return isOnAuth ? null : SignInScreen.routePath;
        case AuthAuthenticated() || AuthGuest():
          return isOnAuth ? HomeScreen.routePath : null;
      }
    },
    refreshListenable: _AuthStateListenable(ref),
    routes: [
      // ---- Auth screens (outside shell) ----
      GoRoute(
        path: SignInScreen.routePath,
        builder: (_, __) => const SignInScreen(),
      ),
      GoRoute(
        path: CreateAccountScreen.routePath,
        builder: (_, __) => const CreateAccountScreen(),
      ),
      GoRoute(
        path: ForgotPasswordScreen.routePath,
        builder: (_, __) => const ForgotPasswordScreen(),
      ),

      // ---- Main shell (NavbarWidget overlay) ----
      ShellRoute(
        builder: (context, state, child) => HarriersNavbarShell(child: child),
        routes: [
          GoRoute(
            path: HomeScreen.routePath,
            builder: (_, __) => const HomeScreen(),
          ),
          GoRoute(
            path: '/games',
            builder: (context, state) {
              final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
              final authState =
                  ProviderScope.containerOf(context).read(authNotifierProvider);
              final userToken = switch (authState) {
                AuthAuthenticated(:final userToken) => userToken,
                AuthGuest(:final userToken) => userToken,
                _ => '',
              };
              return GamesPageWidget(
                projectId: cfg.projectId,
                restApiKey: cfg.restApiKey,
                focusTeamId: cfg.focusTeamObjectId,
                clubAbbreviation: cfg.clubAbbreviation,
                syncFixturesLink:
                    'https://api.kibouapp.co.uk/${cfg.projectId}/${cfg.restApiKey}/files/fixtures/fixtures.ics',
                userToken: userToken,
                resultAction: (id) async => context.push('/fixture/$id'),
                fixtureAction: (id) async => context.push('/fixture/$id'),
                ticketingAction: () async => context.push('/tickets'),
                predictorAction: () async => context.push('/predictor'),
              );
            },
          ),
          GoRoute(
            path: '/merch-shop',
            builder: (context, state) {
              final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
              final authState =
                  ProviderScope.containerOf(context).read(authNotifierProvider);
              final userObjectId = switch (authState) {
                AuthAuthenticated(:final currentUser) => currentUser.objectId,
                AuthGuest(:final currentUser) => currentUser.objectId,
                _ => '',
              };
              return ShopProductScreen(
                objectId: '',
                projectId: cfg.projectId,
                restApiKey: cfg.restApiKey,
                userObjectId: userObjectId,
              );
            },
          ),
          GoRoute(
            path: '/tickets',
            builder: (_, __) => const TicketsScreen(),
          ),
        ],
      ),

      // ---- Fixture detail (replaces /lGCFixture, /lGCLive, /lGCResult) ----
      GoRoute(
        path: FixtureDetailScreen.routePath, // '/fixture/:matchObjectId'
        builder: (_, state) => FixtureDetailScreen(
          matchObjectId: state.pathParameters['matchObjectId']!,
        ),
      ),

      // Legacy deep-link redirects → /fixture/:matchObjectId
      GoRoute(
        path: '/lGCFixture',
        redirect: (_, state) {
          final id = state.uri.queryParameters['matchObjectId'] ?? '';
          return '/fixture/$id';
        },
      ),
      GoRoute(
        path: '/lGCLive',
        redirect: (_, state) {
          final id = state.uri.queryParameters['matchObjectId'] ?? '';
          return '/fixture/$id';
        },
      ),
      GoRoute(
        path: '/lGCResult',
        redirect: (_, state) {
          final id = state.uri.queryParameters['matchObjectId'] ?? '';
          return '/fixture/$id';
        },
      ),

      // ---- Predictor ----
      GoRoute(
        path: '/predictor',
        builder: (context, state) {
          final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
          final authState =
              ProviderScope.containerOf(context).read(authNotifierProvider);
          final userEmail = switch (authState) {
            AuthAuthenticated(:final currentUser) => currentUser.email,
            _ => '',
          };
          final userName = switch (authState) {
            AuthAuthenticated(:final currentUser) => currentUser.name,
            _ => '',
          };
          final userUID = switch (authState) {
            AuthAuthenticated(:final currentUser) => currentUser.objectId,
            _ => '',
          };
          return PredictorWidget(
            projectId: cfg.projectId,
            restApiKey: cfg.restApiKey,
            teamObjectId: cfg.focusTeamObjectId,
            userEmail: userEmail,
            userName: userName,
            userUID: userUID,
          );
        },
      ),
      GoRoute(
        path: '/predictor-league-table',
        builder: (context, state) {
          final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
          final authState =
              ProviderScope.containerOf(context).read(authNotifierProvider);
          final uid = switch (authState) {
            AuthAuthenticated(:final currentUser) => currentUser.objectId,
            _ => '',
          };
          final name = switch (authState) {
            AuthAuthenticated(:final currentUser) => currentUser.name,
            _ => '',
          };
          return PredictorHistoryWidget(
            projectId: cfg.projectId,
            restApiKey: cfg.restApiKey,
            uid: uid,
            name: name,
          );
        },
      ),

      // ---- League table (full) ----
      GoRoute(
        path: '/league-table',
        builder: (context, state) {
          final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
          final authState =
              ProviderScope.containerOf(context).read(authNotifierProvider);
          final userToken = switch (authState) {
            AuthAuthenticated(:final userToken) => userToken,
            AuthGuest(:final userToken) => userToken,
            _ => '',
          };
          return Scaffold(
            body: LeagueTableWidget(
              projectId: cfg.projectId,
              restApiKey: cfg.restApiKey,
              userToken: userToken,
              teamName: cfg.clubFullName,
              variant: LeagueTableVariant.full,
              cardBorderRadius: cfg.cardBorderRadius,
            ),
          );
        },
      ),

      // ---- Player profile ----
      GoRoute(
        path: '/player-page',
        builder: (context, state) {
          final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
          final playerObjectId = state.uri.queryParameters['objectId'] ?? '';
          return PlayerProfileScreen(
            projectId: cfg.projectId,
            restApiKey: cfg.restApiKey,
            playerObjectId: playerObjectId,
          );
        },
      ),

      // ---- Shop cart ----
      GoRoute(
        path: '/cart',
        builder: (context, _) => CartScreen(
          onCheckout: () => context.push('/checkout'),
        ),
      ),
      GoRoute(
        path: '/checkout',
        builder: (_, __) => Scaffold(
          body: CheckoutWidget(onProceed: null),
        ),
      ),
      GoRoute(
        path: '/shop',
        builder: (context, state) {
          final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
          final authState =
              ProviderScope.containerOf(context).read(authNotifierProvider);
          final userObjectId = switch (authState) {
            AuthAuthenticated(:final currentUser) => currentUser.objectId,
            AuthGuest(:final currentUser) => currentUser.objectId,
            _ => '',
          };
          return ShopProductScreen(
            objectId: state.uri.queryParameters['objectId'] ?? '',
            projectId: cfg.projectId,
            restApiKey: cfg.restApiKey,
            userObjectId: userObjectId,
          );
        },
      ),

      // ---- News ----
      GoRoute(
        path: '/cms-post',
        builder: (context, state) {
          final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
          final authState =
              ProviderScope.containerOf(context).read(authNotifierProvider);
          final userToken = switch (authState) {
            AuthAuthenticated(:final userToken) => userToken,
            AuthGuest(:final userToken) => userToken,
            _ => '',
          };
          return CmsPostPage(
            cmsPostObjectId: state.uri.queryParameters['cmsPostObjectId'] ?? '',
            projectId: cfg.projectId,
            restApiKey: cfg.restApiKey,
            userToken: userToken,
          );
        },
      ),
      GoRoute(
        path: '/news-archive',
        builder: (context, state) {
          final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
          return WordpressNewsFeed(
            websiteBaseUrl: state.uri.queryParameters['websiteBaseUrl'] ?? '',
            variant: cfg.newsFeedVariant,
            cardBorderRadius: cfg.cardBorderRadius,
          );
        },
      ),

      // ---- Events ----
      GoRoute(
        path: '/event-page',
        builder: (context, state) {
          final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
          final authState =
              ProviderScope.containerOf(context).read(authNotifierProvider);
          final userToken = switch (authState) {
            AuthAuthenticated(:final userToken) => userToken,
            AuthGuest(:final userToken) => userToken,
            _ => '',
          };
          // TeamEventScreen requires complex `players` list — passed via extra.
          final extra = state.extra;
          return TeamEventScreen(
            objectId: state.uri.queryParameters['objectId'] ?? '',
            projectId: cfg.projectId,
            restApiKey: cfg.restApiKey,
            userToken: userToken,
            players: extra is List<PlayerStruct> ? extra : const [],
          );
        },
      ),
      GoRoute(
        path: '/teamEvent',
        redirect: (_, state) =>
            '/event-page?objectId=${state.uri.queryParameters['objectId'] ?? ''}',
      ),

      // ---- Interactive hub (polls / quizzes) ----
      GoRoute(
        path: '/play',
        builder: (context, state) {
          final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
          final authState =
              ProviderScope.containerOf(context).read(authNotifierProvider);
          final userObjectId = switch (authState) {
            AuthAuthenticated(:final currentUser) => currentUser.objectId,
            AuthGuest(:final currentUser) => currentUser.objectId,
            _ => '',
          };
          final userEmail = switch (authState) {
            AuthAuthenticated(:final currentUser) => currentUser.email,
            _ => '',
          };
          return InteractiveHubScreen(
            objectId: state.uri.queryParameters['objectId'] ?? '',
            projectId: cfg.projectId,
            restApiKey: cfg.restApiKey,
            userObjectId: userObjectId,
            userEmail: userEmail,
            clubBadgeUrl: cfg.badgeAssetPath,
          );
        },
      ),

      // ---- Digital programmes ----
      GoRoute(
        path: '/digitalProgrammeProductPageLIB',
        builder: (context, state) {
          final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
          final authState =
              ProviderScope.containerOf(context).read(authNotifierProvider);
          final userToken = switch (authState) {
            AuthAuthenticated(:final userToken) => userToken,
            AuthGuest(:final userToken) => userToken,
            _ => '',
          };
          return DigitalProgrammeScreen(
            matchObjectId: state.uri.queryParameters['matchObjectId'] ?? '',
            matchSummary: state.uri.queryParameters['matchSummary'] ?? '',
            projectId: cfg.projectId,
            restApiKey: cfg.restApiKey,
            userToken: userToken,
          );
        },
      ),
      GoRoute(
        path: '/myProgrammesLIB',
        builder: (context, state) {
          final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
          final authState =
              ProviderScope.containerOf(context).read(authNotifierProvider);
          final userToken = switch (authState) {
            AuthAuthenticated(:final userToken) => userToken,
            AuthGuest(:final userToken) => userToken,
            _ => '',
          };
          return MyProgrammesScreen(
            projectId: cfg.projectId,
            restApiKey: cfg.restApiKey,
            userToken: userToken,
          );
        },
      ),

      // ---- Youth ----
      GoRoute(
        path: '/teamSelect',
        builder: (context, state) {
          // YouthTeamSelectWidget needs a TeamStruct — passed via extra.
          final extra = state.extra as Map<String, dynamic>?;
          return Scaffold(
            body: YouthTeamSelectWidget(
              team: extra?['team'] as TeamStruct? ?? TeamStruct(),
              subpage: extra?['subpage'] as int? ?? 0,
            ),
          );
        },
      ),
      GoRoute(
        path: '/youthSignUp',
        builder: (context, state) {
          final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
          final authState =
              ProviderScope.containerOf(context).read(authNotifierProvider);
          final userToken = switch (authState) {
            AuthAuthenticated(:final userToken) => userToken,
            AuthGuest(:final userToken) => userToken,
            _ => '',
          };
          // paymentPlans list passed via extra.
          final extra = state.extra;
          return YouthSignUpScreen(
            projectId: cfg.projectId,
            restApiKey: cfg.restApiKey,
            userToken: userToken,
            paymentPlans:
                extra is List<PaymentPlansStruct> ? extra : const [],
          );
        },
      ),
      GoRoute(
        path: '/youthMainScreen',
        builder: (context, state) {
          final cfg = ProviderScope.containerOf(context).read(appConfigProvider);
          // PlayerStruct passed via extra.
          final extra = state.extra as Map<String, dynamic>?;
          return YouthMainScreen(
            player: extra?['player'] as PlayerStruct? ?? PlayerStruct(),
            projectId: cfg.projectId,
            restApiKey: cfg.restApiKey,
          );
        },
      ),

      // ---- My Club (stub screens — Phase 6 stretch) ----
      GoRoute(
        path: '/my-club-page',
        builder: (_, __) => const _StubScreen(title: 'My Club'),
      ),
      GoRoute(
        path: '/my-club-folder',
        builder: (_, __) => const _StubScreen(title: 'My Club'),
      ),
    ],
  );
});

// ---------------------------------------------------------------------------
// Shell widget — wraps content with NavbarWidget overlay
// ---------------------------------------------------------------------------

class HarriersNavbarShell extends StatelessWidget {
  const HarriersNavbarShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: NavbarWidget(),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Auth state listenable — triggers GoRouter refresh on auth changes
// ---------------------------------------------------------------------------

class _AuthStateListenable extends ChangeNotifier {
  _AuthStateListenable(Ref ref) {
    ref.listen(authNotifierProvider, (_, __) => notifyListeners());
  }
}

// ---------------------------------------------------------------------------
// Stub placeholder for routes not yet implemented (Phase 6 stretch)
// ---------------------------------------------------------------------------

class _StubScreen extends StatelessWidget {
  const _StubScreen({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title — coming soon')),
    );
  }
}
