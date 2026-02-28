import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:theming/theming.dart';

// ---------------------------------------------------------------------------
// Local provider — next fixture start/end times for the dynamic centre button.
// ---------------------------------------------------------------------------

typedef _CentreArgs = ({
  String projectId,
  String restApiKey,
  String focusTeamId,
});

final _liveCentreProvider =
    FutureProvider.autoDispose.family<BLESSfixtureStruct?, _CentreArgs>(
  (ref, args) async {
    final response =
        await BackendlessDatabaseGroup.upcomingOneFixturesStartEndCall.call(
      time: DateTime.now().millisecondsSinceEpoch,
      teamObjectId: args.focusTeamId,
      bLProjectId: args.projectId,
      bLRestAPIKey: args.restApiKey,
    );
    return ((response.jsonBody as List)
            .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
            .toList() as Iterable<BLESSfixtureStruct?>)
        .withoutNulls
        .firstOrNull;
  },
);

// ---------------------------------------------------------------------------
// isWithinEventWindow — ported from touchline_template custom_functions.dart.
//
// Returns true if [current] is within a 3-hour buffer around the event
// window [start, end].  Returns false if either bound is null.
// ---------------------------------------------------------------------------

bool _isWithinEventWindow(
  DateTime? start,
  DateTime? end,
  DateTime current,
) {
  if (start == null || end == null) return false;
  const buffer = Duration(hours: 3);
  return current.isAfter(start.subtract(buffer)) &&
      current.isBefore(end.add(buffer));
}

// ---------------------------------------------------------------------------
// NavbarWidget
// ---------------------------------------------------------------------------

/// 5-tab bottom navigation bar for the Harriers app.
///
/// Ported from [NavbarWidget] in
/// `example_apps/harriers/lib/components/navbar_widget.dart`.
///
/// Tabs: Home · Games · [dynamic centre] · Shop · Tickets
///
/// The centre button is dynamic:
/// - If now is within the next fixture's event window (±3 h) → Lottie live
///   badge, navigates to `/fixture/:matchObjectId`.
/// - Otherwise → club icon, navigates to `/my-club-folder`.
class NavbarWidget extends ConsumerWidget {
  const NavbarWidget({super.key});

  static const _inactiveColor = Color(0xFF9299A1);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfg = ref.watch(appConfigProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final colors = Theme.of(context).extension<TouchlineColors>()!;

    final centreArgs = (
      projectId: cfg.projectId,
      restApiKey: cfg.restApiKey,
      focusTeamId: cfg.focusTeamObjectId,
    );
    final fixtureAsync = ref.watch(_liveCentreProvider(centreArgs));

    final currentPath = GoRouterState.of(context).uri.path;
    Color tabColor(String path) =>
        currentPath == path ? colorScheme.primary : _inactiveColor;

    final bottomPad = navBarPadding(context);

    return Container(
      width: double.infinity,
      height: bottomPad + 90,
      decoration: const BoxDecoration(color: Color(0x00EEEEEE)),
      child: Stack(
        children: [
          // ---- Pill background ----
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: bottomPad + 80,
                  decoration: BoxDecoration(
                    color: colors.secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color(0x1A57636C),
                        offset: Offset(0, -10),
                        spreadRadius: 0.1,
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ---- Tab row ----
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // ---- Home ----
              _TabButton(
                icon: Icons.home_rounded,
                color: tabColor('/home'),
                onPressed: () {
                  if (currentPath == '/home') return;
                  context.push('/home');
                },
              ),

              // ---- Games ----
              _TabButton(
                icon: Icons.calendar_today,
                color: tabColor('/games'),
                onPressed: () {
                  if (currentPath == '/games') return;
                  context.push('/games');
                },
              ),

              // ---- Dynamic centre button ----
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  fixtureAsync.when(
                    loading: () => SizedBox(
                      width: 45,
                      height: 45,
                      child: SpinKitFoldingCube(
                        color: colorScheme.primary,
                        size: 45,
                      ),
                    ),
                    error: (_, __) => _CentreButtonStatic(cfg: cfg),
                    data: (fixture) {
                      final now = DateTime.now();
                      final start = fixture?.hasStart() == true
                          ? DateTime.fromMillisecondsSinceEpoch(fixture!.start)
                          : null;
                      final end = fixture?.hasEnd() == true
                          ? DateTime.fromMillisecondsSinceEpoch(fixture!.end)
                          : null;
                      final isLive = _isWithinEventWindow(start, end, now);

                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                        child: GestureDetector(
                          onTap: () {
                            if (!isLive || fixture == null) {
                              context.push('/my-club-folder?rootKey=root');
                              return;
                            }
                            final id = fixture.objectId;
                            context.push('/fixture/$id');
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: isLive
                                ? _LiveCentreButton(colors: colors)
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: Image.asset(
                                      'assets/images/app_launcher_icon.png',
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),

              // ---- Shop ----
              _TabButton(
                icon: Icons.store,
                color: tabColor('/merch-shop'),
                iconSize: 30,
                onPressed: () {
                  if (currentPath == '/merch-shop') return;
                  context.push('/merch-shop');
                },
              ),

              // ---- Tickets ----
              _TabButton(
                faIcon: FontAwesomeIcons.ticket,
                color: tabColor('/tickets'),
                onPressed: () {
                  if (currentPath == '/tickets') return;
                  context.push('/tickets');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

/// Simple 50×50 icon tap target replacing FlutterFlowIconButton.
class _TabButton extends StatelessWidget {
  const _TabButton({
    this.icon,
    this.faIcon,
    required this.color,
    required this.onPressed,
    this.iconSize = 24,
  }) : assert(icon != null || faIcon != null);

  final IconData? icon;
  final IconData? faIcon;
  final Color color;
  final VoidCallback onPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: IconButton(
        onPressed: onPressed,
        icon: faIcon != null
            ? FaIcon(faIcon!, color: color, size: iconSize)
            : Icon(icon!, color: color, size: iconSize),
        padding: EdgeInsets.zero,
      ),
    );
  }
}

/// Centre button shown when NOT within the event window — static club icon.
class _CentreButtonStatic extends StatelessWidget {
  const _CentreButtonStatic({required this.cfg});

  final AppConfig cfg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      child: GestureDetector(
        onTap: () => context.push('/my-club-folder?rootKey=root'),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.asset(
              'assets/images/app_launcher_icon.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

/// Centre button shown when within the event window — animated live badge.
class _LiveCentreButton extends StatelessWidget {
  const _LiveCentreButton({required this.colors});

  final TouchlineColors colors;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Lottie.asset(
          'assets/jsons/live-white.json',
          width: 300,
          height: 300,
          fit: BoxFit.fitWidth,
          animate: true,
        ),
        Opacity(
          opacity: 0.8,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.sports_soccer,
                  color: colors.secondaryBackground,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
