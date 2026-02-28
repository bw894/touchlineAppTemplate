import 'package:core_ui/core_ui.dart';
import 'package:feature_auth/src/auth_state.dart';
import 'package:feature_auth/src/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theming/theming.dart';

/// Create-account screen.
///
/// Ported from [CreateAccountWidget] in
/// `example_apps/harriers/lib/auth/create_account/`.
class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});

  static const routePath = '/create-account';

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
        mainAxisAlignment: MainAxisAlignment.end,
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
                  'CREATE',
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
                  'ACCOUNT',
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
              'Create your ${cfg.clubShortName} Account.',
              style:
                  GoogleFonts.montserrat(fontSize: 14, color: colors.secondaryText),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have one?',
                style: GoogleFonts.montserrat(
                    fontSize: 14, color: colors.secondaryText),
              ),
              GestureDetector(
                onTap: () => context.pop(),
                child: Text(
                  'Sign in here.',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ].divide(const SizedBox(width: 6)),
          ),
          const SizedBox(height: 30),
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
              controller: _nameController,
              label: 'Full Name',
              keyboardType: TextInputType.name,
              autofillHints: const [AutofillHints.name],
              colors: colors,
              colorScheme: colorScheme,
            ),
          ),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildTextField(
              controller: _passwordController,
              label: 'Password',
              obscureText: !_passwordVisible,
              autofillHints: const [AutofillHints.newPassword],
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
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildTextField(
              controller: _confirmPasswordController,
              label: 'Confirm Password',
              obscureText: !_confirmPasswordVisible,
              autofillHints: const [AutofillHints.newPassword],
              colors: colors,
              colorScheme: colorScheme,
              suffixIcon: InkWell(
                onTap: () => setState(
                    () => _confirmPasswordVisible = !_confirmPasswordVisible),
                focusNode: FocusNode(skipTraversal: true),
                child: Icon(
                  _confirmPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: colors.secondaryText,
                  size: 24,
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
                  onPressed: isLoading ? null : _createAccount,
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
                          'Create Account',
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

  void _createAccount() {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match.')),
      );
      return;
    }
    ref.read(authNotifierProvider.notifier).createAccount(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          displayName: _nameController.text.trim(),
        );
  }
}
