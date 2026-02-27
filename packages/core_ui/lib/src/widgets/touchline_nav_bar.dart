import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

/// Five-button bottom navigation bar used across all Touchline club apps.
///
/// Buttons: Home · Fixtures · Match Centre (centre, raised) · Tickets · Shop.
/// The active button is highlighted with [ColorScheme.primary]; inactive
/// buttons use a neutral grey. The centre soccer-ball button has a bounce
/// animation on tap.
class TouchlineNavBar extends StatefulWidget {
  const TouchlineNavBar({
    super.key,
    required this.onHome,
    required this.onFixtures,
    required this.onMatchCentre,
    required this.onTickets,
    required this.onShop,
  });

  final Future<void> Function() onHome;
  final Future<void> Function() onFixtures;
  final Future<void> Function() onMatchCentre;
  final Future<void> Function() onTickets;
  final Future<void> Function() onShop;

  @override
  State<TouchlineNavBar> createState() => _TouchlineNavBarState();
}

class _TouchlineNavBarState extends State<TouchlineNavBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _bounceCtrl;

  static const _inactiveColour = Color(0xFF9299A1);

  @override
  void initState() {
    super.initState();
    _bounceCtrl = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _bounceCtrl.dispose();
    super.dispose();
  }

  /// Returns [primary] if the current GoRouter location matches [path].
  Color _routeColour(BuildContext context, String path) {
    final location = GoRouterState.of(context).uri.toString();
    final isPrimary = location == path || location == '/';
    return isPrimary
        ? Theme.of(context).colorScheme.primary
        : _inactiveColour;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      height: 90.0,
      child: Stack(
        children: [
          // Background card with rounded top
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: cs.surface,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0x1A57636C),
                        offset: Offset(0.0, -10.0),
                        spreadRadius: 0.1,
                      ),
                    ],
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                ),
              ),
            ],
          ),
          // Buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _NavButton(
                icon: Icon(
                  Icons.home_rounded,
                  color: _routeColour(context, '/homepage'),
                  size: 24.0,
                ),
                onPressed: widget.onHome,
              ),
              _NavButton(
                icon: Icon(
                  Icons.calendar_today,
                  color: _routeColour(context, '/games'),
                  size: 24.0,
                ),
                onPressed: widget.onFixtures,
              ),
              // Centre match-centre button (raised, animated)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: _CentreButton(
                  colour: cs.primary,
                  controller: _bounceCtrl,
                  onPressed: widget.onMatchCentre,
                ),
              ),
              _NavButton(
                icon: FaIcon(
                  FontAwesomeIcons.ticketAlt,
                  color: _routeColour(context, '/tickets'),
                  size: 24.0,
                ),
                onPressed: widget.onTickets,
              ),
              _NavButton(
                icon: FaIcon(
                  FontAwesomeIcons.store,
                  color: _routeColour(context, '/shop'),
                  size: 24.0,
                ),
                onPressed: widget.onShop,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({required this.icon, required this.onPressed});

  final Widget icon;
  final Future<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50.0,
      padding: EdgeInsets.zero,
      icon: icon,
      onPressed: onPressed,
    );
  }
}

class _CentreButton extends StatelessWidget {
  const _CentreButton({
    required this.colour,
    required this.controller,
    required this.onPressed,
  });

  final Color colour;
  final AnimationController controller;
  final Future<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 60.0,
      padding: EdgeInsets.zero,
      style: IconButton.styleFrom(
        backgroundColor: colour,
        shape: const CircleBorder(),
      ),
      icon: const Icon(Icons.sports_soccer_outlined,
          color: Colors.white, size: 30.0),
      onPressed: () async {
        controller
          ..reset()
          ..forward();
        await onPressed();
      },
    )
        .animate(controller: controller)
        .moveY(
          begin: 21.0,
          end: -21.0,
          duration: 400.ms,
          curve: Curves.easeIn,
        )
        .then()
        .moveY(
          begin: -21.0,
          end: 21.0,
          duration: 400.ms,
          curve: Curves.easeOut,
        );
  }
}
