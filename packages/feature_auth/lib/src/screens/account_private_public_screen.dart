import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:feature_auth/src/auth_state.dart';
import 'package:feature_auth/src/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theming/theming.dart';

/// Account privacy toggle (PUBLIC / PRIVATE).
///
/// Ported from [AccountPrivatePublicWidget] in
/// `lib/account/account_private_public/`.
/// Reads the current token via [authNotifierProvider] and calls
/// [AuthGroup.updateAccountPrivacyCall] on save.
class AccountPrivatePublicScreen extends ConsumerStatefulWidget {
  const AccountPrivatePublicScreen({
    super.key,
    required this.userObjectId,
    String? initialSecurityPolicy,
  }) : initialSecurityPolicy = initialSecurityPolicy ?? '';

  final String? userObjectId;
  final String initialSecurityPolicy;

  @override
  ConsumerState<AccountPrivatePublicScreen> createState() =>
      _AccountPrivatePublicScreenState();
}

class _AccountPrivatePublicScreenState
    extends ConsumerState<AccountPrivatePublicScreen> {
  late String _securityPolicy;

  @override
  void initState() {
    super.initState();
    _securityPolicy = widget.initialSecurityPolicy;
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final cfg = ref.watch(appConfigProvider);
    final colors = Theme.of(context).extension<TouchlineColors>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final borderRadius = cfg.cardBorderRadius;

    return Align(
      alignment: AlignmentDirectional.center,
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Close button
            Align(
              alignment: const AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    0.0, 10.0, 10.0, 6.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close_outlined,
                    color: colors.primaryBackground,
                    size: 30.0,
                  ),
                ),
              ),
            ),
            // Card
            Align(
              alignment: AlignmentDirectional.center,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    0.0, 0.0, 0.0, 20.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  decoration: BoxDecoration(
                    color: colors.secondaryBackground,
                    borderRadius: borderRadius,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Title
                        Text(
                          'ACCOUNT PRIVACY',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 36.0,
                            color: colorScheme.onSurface,
                            letterSpacing: 0.0,
                          ),
                        ),
                        // Toggle row
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              // PUBLIC
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () => setState(
                                      () => _securityPolicy = 'PUBLIC'),
                                  child: AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 260),
                                    curve: Curves.easeInOut,
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: _securityPolicy == 'PUBLIC'
                                          ? colors.success
                                          : colors.primaryBackground,
                                      borderRadius:
                                          BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.lock_open,
                                            color: colorScheme.onSurface,
                                            size: 34.0,
                                          ),
                                          Text(
                                            'PUBLIC',
                                            style: GoogleFonts.bebasNeue(
                                              fontSize: 28.0,
                                              color: colorScheme.onSurface,
                                              letterSpacing: 0.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              // PRIVATE
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () => setState(
                                      () => _securityPolicy = 'PRIVATE'),
                                  child: AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 280),
                                    curve: Curves.easeInOut,
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: _securityPolicy == 'PRIVATE'
                                          ? colorScheme.error
                                          : colors.primaryBackground,
                                      borderRadius:
                                          BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.lock_outline,
                                            color: colorScheme.onSurface,
                                            size: 34.0,
                                          ),
                                          Text(
                                            'PRIVATE',
                                            style: GoogleFonts.bebasNeue(
                                              fontSize: 28.0,
                                              color: colorScheme.onSurface,
                                              letterSpacing: 0.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Save button
                        AppButton(
                          onPressed: () async {
                            if (widget.initialSecurityPolicy !=
                                _securityPolicy) {
                              // Capture context-dependent values before awaits.
                              final messenger =
                                  ScaffoldMessenger.of(context);
                              final navigator = Navigator.of(context);
                              final tcExt = Theme.of(context)
                                  .extension<TouchlineColors>()!;

                              final userToken = switch (authState) {
                                AuthAuthenticated(:final userToken) =>
                                  userToken,
                                AuthGuest(:final userToken) => userToken,
                                _ => '',
                              };

                              final result = await AuthGroup
                                  .updateAccountPrivacyCall
                                  .call(
                                userObjectId: widget.userObjectId,
                                userToken: userToken,
                                publicName: _securityPolicy == 'PUBLIC',
                                bLappId: cfg.projectId,
                                bLRestApiKey: cfg.restApiKey,
                              );

                              if (result.succeeded) {
                                messenger.showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Updated account',
                                      style: TextStyle(
                                        color: tcExt.secondaryBackground,
                                      ),
                                    ),
                                    duration: const Duration(
                                        milliseconds: 1550),
                                    backgroundColor: tcExt.success,
                                  ),
                                );
                              }

                              await ref
                                  .read(authNotifierProvider.notifier)
                                  .refreshUserData();

                              navigator.pop();
                              return;
                            }
                            Navigator.of(context).pop();
                          },
                          text: 'Save',
                          icon: const Icon(Icons.save, size: 15.0),
                          options: AppButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.zero,
                            color: colors.primaryBackground,
                            textStyle: textTheme.titleSmall!.copyWith(
                              color: colorScheme.onSurface,
                            ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 12.0))
                          .addToStart(const SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
