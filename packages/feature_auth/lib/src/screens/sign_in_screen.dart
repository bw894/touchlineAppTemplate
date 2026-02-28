import 'package:core_ui/core_ui.dart';
import 'package:feature_auth/src/auth_notifier.dart';
import 'package:feature_auth/src/auth_state.dart';
import 'package:feature_auth/src/providers.dart';
import 'package:feature_auth/src/screens/create_account_screen.dart';
import 'package:feature_auth/src/screens/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theming/theming.dart';

/// Sign-in screen.
///
/// Ported from [SignInWidget] in `example_apps/harriers/lib/auth/sign_in/`.
/// Auth calls delegate to [AuthNotifier]; navigation on success is handled
/// automatically by the host app's GoRouter redirect (no explicit push here).
class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  static const routePath = '/sign-in';

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authNotifierProvider, (_, next) {
      if (next is AuthUnauthenticated && next.message != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message!)),
        );
      }
    });

    final authState = ref.watch(authNotifierProvider);
    final cfg = ref.watch(appConfigProvider);
    final isLoading = authState is AuthLoading;
    final colorScheme = Theme.of(context).colorScheme;
    final colors = Theme.of(context).extension<TouchlineColors>()!;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: colors.primaryBackground,
        body: Stack(
          children: [
            Image.network(
              cfg.bgImageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(cfg, colors, colorScheme),
                  _buildForm(colors, colorScheme, isLoading),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
      AppConfig cfg, TouchlineColors colors, ColorScheme colorScheme) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colors.accent1, colorScheme.primary],
                stops: const [0.0, 1.0],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.zero,
              child: _badgeImage(cfg.badgeOnPrimaryAssetPath),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'SIGN',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                    letterSpacing: 1.5,
                    color: colors.primaryText,
                    shadows: const [
                      Shadow(
                          color: Color(0x2657636C),
                          offset: Offset(2, 2),
                          blurRadius: 2)
                    ],
                  ),
                ),
                Text(
                  'IN',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                    letterSpacing: 1.5,
                    color: colorScheme.primary,
                    shadows: const [
                      Shadow(
                          color: Color(0x2657636C),
                          offset: Offset(2, 2),
                          blurRadius: 2)
                    ],
                  ),
                ),
              ].divide(const SizedBox(width: 5)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              'Log into your ${cfg.clubShortName} Account.',
              style:
                  GoogleFonts.montserrat(fontSize: 14, color: colors.secondaryText),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have one?",
                style: GoogleFonts.montserrat(
                    fontSize: 14, color: colors.secondaryText),
              ),
              GestureDetector(
                onTap: () => context.push(CreateAccountScreen.routePath),
                child: Text(
                  'Create account here.',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ].divide(const SizedBox(width: 6)),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(
      TouchlineColors colors, ColorScheme colorScheme, bool isLoading) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildTextField(
              controller: _emailController,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              colors: colors,
              colorScheme: colorScheme,
            ),
          ),
          _buildTextField(
            controller: _passwordController,
            label: 'Password',
            obscureText: !_passwordVisible,
            autofillHints: const [AutofillHints.password],
            colors: colors,
            colorScheme: colorScheme,
            suffixIcon: InkWell(
              onTap: () =>
                  setState(() => _passwordVisible = !_passwordVisible),
              focusNode: FocusNode(skipTraversal: true),
              child: Icon(
                _passwordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: colors.secondaryText,
                size: 24,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextButton(
                onPressed: () => context.push(ForgotPasswordScreen.routePath),
                style: TextButton.styleFrom(
                  foregroundColor: colors.secondaryText,
                  backgroundColor: colors.secondaryBackground,
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  elevation: 0,
                ),
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.montserrat(
                      fontSize: 14, color: colors.secondaryText),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                width: 230,
                height: 52,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 3,
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2),
                        )
                      : Text(
                          'Sign In',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: Text(
                  'Or continue with',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: 14, color: colors.secondaryText),
                ),
              ),
              Wrap(
                spacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _socialButton(
                      label: 'Continue with Google',
                      icon: FontAwesomeIcons.google,
                      onPressed: isLoading ? null : _signInWithGoogle,
                      colors: colors,
                      colorScheme: colorScheme,
                    ),
                  ),
                  if (isIOS)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _socialButton(
                        label: 'Continue with Apple',
                        icon: FontAwesomeIcons.apple,
                        onPressed: isLoading ? null : _signInWithApple,
                        colors: colors,
                        colorScheme: colorScheme,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Renders a badge from either a HTTPS URL or a local asset path.
  Widget _badgeImage(String path) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return Image.network(path, fit: BoxFit.contain);
    }
    return Image.asset(path, fit: BoxFit.contain);
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    TextInputType? keyboardType,
    Iterable<String>? autofillHints,
    Widget? suffixIcon,
    required TouchlineColors colors,
    required ColorScheme colorScheme,
  }) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: colors.alternate, width: 2),
      borderRadius: BorderRadius.circular(12),
    );
    final focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.primary, width: 2),
      borderRadius: BorderRadius.circular(12),
    );
    final errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.error, width: 2),
      borderRadius: BorderRadius.circular(12),
    );
    return TextFormField(
      controller: controller,
      autofocus: false,
      obscureText: obscureText,
      keyboardType: keyboardType,
      autofillHints: autofillHints,
      style: GoogleFonts.montserrat(color: colors.primaryText),
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: border,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
        filled: true,
        fillColor: colors.secondaryBackground,
        contentPadding: const EdgeInsets.all(24),
        suffixIcon: suffixIcon,
      ),
    );
  }

  Widget _socialButton({
    required String label,
    required IconData icon,
    required VoidCallback? onPressed,
    required TouchlineColors colors,
    required ColorScheme colorScheme,
  }) {
    return SizedBox(
      width: 230,
      height: 44,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: FaIcon(icon, size: 20),
        label: Text(label,
            style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
        style: OutlinedButton.styleFrom(
          backgroundColor: colors.secondaryBackground,
          foregroundColor: colors.primaryText,
          side: BorderSide(color: colors.alternate, width: 2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  void _signIn() {
    ref.read(authNotifierProvider.notifier).signIn(
          _emailController.text.trim(),
          _passwordController.text,
        );
  }

  void _signInWithGoogle() {
    ref.read(authNotifierProvider.notifier).signInWithGoogle();
  }

  void _signInWithApple() {
    ref.read(authNotifierProvider.notifier).signInWithApple();
  }
}
