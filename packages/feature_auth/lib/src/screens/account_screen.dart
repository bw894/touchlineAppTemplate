import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:feature_auth/src/auth_state.dart';
import 'package:feature_auth/src/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theming/theming.dart';

/// Account menu popup card.
///
/// Ported from [AccountV1Widget] in `lib/account/account_v1/`.
/// User data is read from [authNotifierProvider]; navigation callbacks are
/// passed by the host app.
class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({
    super.key,
    String? userImage,
    this.myProgrammes,
    this.predictorLeagueTable,
    this.predictorHistory,
    required this.logOut,
    required this.deleteAccount,
    this.digitalProgrammesWanted = true,
  }) : userImage = userImage ??
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';

  final String userImage;
  final Future<void> Function()? myProgrammes;
  final Future<void> Function()? predictorLeagueTable;
  final Future<void> Function()? predictorHistory;
  final Future<void> Function()? logOut;
  final Future<void> Function()? deleteAccount;
  final bool? digitalProgrammesWanted;

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  bool _hovered1 = false;
  bool _hovered2 = false;
  bool _hovered3 = false;
  bool _hovered4 = false;
  bool _hovered5 = false;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final cfg = ref.watch(appConfigProvider);
    final colors = Theme.of(context).extension<TouchlineColors>()!;
    final textTheme = Theme.of(context).textTheme;

    final UserStruct currentUser = switch (authState) {
      AuthAuthenticated(:final currentUser) => currentUser,
      AuthGuest(:final currentUser) => currentUser,
      _ => UserStruct(),
    };

    final borderRadius = cfg.cardBorderRadius;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 320.0,
        decoration: BoxDecoration(
          color: colors.secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    12.0, 0.0, 0.0, 8.0),
                child: Text(
                  'Your ${cfg.nicknamePlural} Account',
                  textAlign: TextAlign.start,
                  style: textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    12.0, 8.0, 12.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 12.0, 0.0),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: colors.primaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              widget.userImage,
                              width: 36.0,
                              height: 36.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          4.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentUser.name.isNotEmpty
                                ? currentUser.name
                                : 'name',
                            style: textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              currentUser.email.isNotEmpty
                                  ? currentUser.email
                                  : 'em',
                              style: textTheme.bodySmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.digitalProgrammesWanted ?? true) ...[
                Divider(
                  thickness: 1.0,
                  color: colors.alternate,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      12.0, 0.0, 12.0, 4.0),
                  child: MouseRegion(
                    opaque: false,
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) => setState(() => _hovered1 = true),
                    onExit: (_) => setState(() => _hovered1 = false),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async => widget.myProgrammes?.call(),
                      child: _menuItem(
                        hovered: _hovered1,
                        icon: const Icon(Icons.menu_book, size: 22.0),
                        label: 'My Digital Programmes',
                        colors: colors,
                        textTheme: textTheme,
                      ),
                    ),
                  ),
                ),
              ],
              Divider(thickness: 1.0, color: colors.alternate),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    12.0, 0.0, 12.0, 4.0),
                child: MouseRegion(
                  opaque: false,
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => _hovered2 = true),
                  onExit: (_) => setState(() => _hovered2 = false),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async => widget.predictorLeagueTable?.call(),
                    child: _menuItem(
                      hovered: _hovered2,
                      icon: const FaIcon(FontAwesomeIcons.listCheck, size: 20.0),
                      label: 'Predictor League Table',
                      colors: colors,
                      textTheme: textTheme,
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1.0, color: colors.alternate),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    12.0, 0.0, 12.0, 4.0),
                child: MouseRegion(
                  opaque: false,
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => _hovered3 = true),
                  onExit: (_) => setState(() => _hovered3 = false),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async => widget.predictorHistory?.call(),
                    child: _menuItem(
                      hovered: _hovered3,
                      icon: const Icon(Icons.sports_soccer, size: 20.0),
                      label: 'Predictor History',
                      colors: colors,
                      textTheme: textTheme,
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1.0, color: colors.alternate),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    12.0, 0.0, 12.0, 0.0),
                child: MouseRegion(
                  opaque: false,
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => _hovered4 = true),
                  onExit: (_) => setState(() => _hovered4 = false),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async => widget.logOut?.call(),
                    child: _menuItem(
                      hovered: _hovered4,
                      icon: const Icon(Icons.login_rounded, size: 20.0),
                      label: 'Log out',
                      colors: colors,
                      textTheme: textTheme,
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1.0, color: colors.alternate),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    12.0, 0.0, 12.0, 0.0),
                child: MouseRegion(
                  opaque: false,
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => _hovered5 = true),
                  onExit: (_) => setState(() => _hovered5 = false),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async => widget.deleteAccount?.call(),
                    child: _menuItem(
                      hovered: _hovered5,
                      icon: const Icon(Icons.close_rounded,
                          color: Color(0xFFFF0008), size: 20.0),
                      label: 'Delete Account & All User Data',
                      labelColor: const Color(0xFFFF0008),
                      colors: colors,
                      textTheme: textTheme,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem({
    required bool hovered,
    required Widget icon,
    required String label,
    Color? labelColor,
    required TouchlineColors colors,
    required TextTheme textTheme,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      width: double.infinity,
      decoration: BoxDecoration(
        color: hovered ? colors.primaryBackground : colors.secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
              child: IconTheme(
                data: IconThemeData(color: colors.primaryText),
                child: icon,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    12.0, 0.0, 0.0, 0.0),
                child: Text(
                  label,
                  style: textTheme.bodyMedium!.copyWith(color: labelColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
