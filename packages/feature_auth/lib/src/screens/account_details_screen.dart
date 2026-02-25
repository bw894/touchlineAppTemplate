import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:feature_auth/src/auth_state.dart';
import 'package:feature_auth/src/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theming/theming.dart';

/// Account details edit form.
///
/// Ported from [AccountDetailsWidget] in `lib/account/account_details/`.
/// Reads and writes the current user via [authNotifierProvider].
class AccountDetailsScreen extends ConsumerStatefulWidget {
  const AccountDetailsScreen({
    super.key,
    required this.userObjectId,
  });

  final String? userObjectId;

  @override
  ConsumerState<AccountDetailsScreen> createState() =>
      _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends ConsumerState<AccountDetailsScreen> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _mobileController;
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _mobileFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final authState = ref.read(authNotifierProvider);
    final user = _userFromState(authState);
    _emailController = TextEditingController(text: user.email);
    _nameController = TextEditingController(text: user.name);
    _mobileController = TextEditingController(text: user.mobile);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    _emailFocus.dispose();
    _nameFocus.dispose();
    _mobileFocus.dispose();
    super.dispose();
  }

  UserStruct _userFromState(AuthState state) => switch (state) {
        AuthAuthenticated(:final currentUser) => currentUser,
        AuthGuest(:final currentUser) => currentUser,
        _ => UserStruct(),
      };

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final cfg = ref.watch(appConfigProvider);
    final colors = Theme.of(context).extension<TouchlineColors>()!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final borderRadius = cfg.cardBorderRadius;

    final inputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0x00000000), width: 1.0),
      borderRadius: BorderRadius.circular(8.0),
    );
    final errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.error, width: 1.0),
      borderRadius: BorderRadius.circular(8.0),
    );
    final inputDecoration = InputDecoration(
      isDense: true,
      labelStyle: textTheme.labelMedium,
      hintStyle: textTheme.labelMedium,
      enabledBorder: inputBorder,
      focusedBorder: inputBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder,
      filled: true,
      fillColor: colors.primaryBackground,
    );

    return Align(
      alignment: AlignmentDirectional.center,
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Align(
              alignment: AlignmentDirectional.center,
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  decoration: BoxDecoration(
                    color: colors.secondaryBackground,
                    borderRadius: borderRadius,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'MY ACCOUNT',
                            style: textTheme.bodyMedium!.copyWith(
                              fontSize: 36.0,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: TextFormField(
                              controller: _emailController,
                              focusNode: _emailFocus,
                              autofocus: false,
                              autofillHints: const [AutofillHints.email],
                              obscureText: false,
                              decoration: inputDecoration.copyWith(
                                hintText: 'Email Address',
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: colorScheme.primary,
                                ),
                              ),
                              style: textTheme.bodyMedium,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: colorScheme.primary,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: TextFormField(
                              controller: _nameController,
                              focusNode: _nameFocus,
                              autofocus: false,
                              autofillHints: const [AutofillHints.name],
                              obscureText: false,
                              decoration: inputDecoration.copyWith(
                                hintText: 'Display Name',
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: colorScheme.primary,
                                ),
                              ),
                              style: textTheme.bodyMedium,
                              cursorColor: colorScheme.primary,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: TextFormField(
                              controller: _mobileController,
                              focusNode: _mobileFocus,
                              autofocus: false,
                              autofillHints: const [
                                AutofillHints.telephoneNumber
                              ],
                              obscureText: false,
                              decoration: inputDecoration.copyWith(
                                hintText: 'Mobile Number',
                                prefixIcon: Icon(
                                  Icons.phone_iphone,
                                  color: colorScheme.primary,
                                ),
                              ),
                              style: textTheme.bodyMedium,
                              keyboardType: const TextInputType.numberWithOptions(
                                  signed: true, decimal: true),
                              cursorColor: colorScheme.primary,
                            ),
                          ),
                          AppButton(
                            onPressed: () async {
                              // Capture context-dependent values before awaits.
                              final messenger =
                                  ScaffoldMessenger.of(context);
                              final navigator = Navigator.of(context);
                              final tcExt = Theme.of(context)
                                  .extension<TouchlineColors>()!;
                              final cfg = ref.read(appConfigProvider);

                              final result = await AuthGroup
                                  .updateAccountFieldsCall
                                  .call(
                                userObjectId: widget.userObjectId,
                                userToken: switch (authState) {
                                  AuthAuthenticated(:final userToken) =>
                                    userToken,
                                  AuthGuest(:final userToken) => userToken,
                                  _ => '',
                                },
                                email: _emailController.text,
                                name: _nameController.text,
                                mobile: _mobileController.text,
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
                                    duration:
                                        const Duration(milliseconds: 1550),
                                    backgroundColor: tcExt.success,
                                  ),
                                );
                              }

                              await ref
                                  .read(authNotifierProvider.notifier)
                                  .refreshUserData();

                              navigator.pop();
                            },
                            text: 'Save',
                            icon: const Icon(Icons.save, size: 15.0),
                            options: AppButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 40.0,
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.zero,
                              color: colorScheme.primary,
                              textStyle: textTheme.titleSmall!.copyWith(
                                color: colors.secondaryBackground,
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
            ),
          ],
        ),
      ),
    );
  }
}
