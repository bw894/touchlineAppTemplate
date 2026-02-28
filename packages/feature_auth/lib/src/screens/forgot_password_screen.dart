import 'package:core_ui/core_ui.dart';
import 'package:feature_auth/src/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theming/theming.dart';

/// Forgot-password screen.
///
/// Ported from [ForgotPasswordWidget] in
/// `example_apps/harriers/lib/auth/forgot_password/`.
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  static const routePath = '/forgot-password';

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  bool _sending = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cfg = ref.watch(appConfigProvider);
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
                  _buildForm(colors, colorScheme),
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
                  'FORGOT',
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
                  'PASSWORD',
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
              "Enter your email and we'll\nsend you a reset link.",
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.montserrat(fontSize: 14, color: colors.secondaryText),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: Text(
                  'Back to sign in',
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

  /// Renders a badge from either a HTTPS URL or a local asset path.
  Widget _badgeImage(String path) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      return Image.network(path, fit: BoxFit.contain);
    }
    return Image.asset(path, fit: BoxFit.contain);
  }

  Widget _buildForm(TouchlineColors colors, ColorScheme colorScheme) {
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

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextFormField(
              controller: _emailController,
              autofocus: false,
              autofillHints: const [AutofillHints.email],
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.montserrat(color: colors.primaryText),
              decoration: InputDecoration(
                labelText: 'Email',
                enabledBorder: border,
                focusedBorder: focusedBorder,
                errorBorder: errorBorder,
                focusedErrorBorder: errorBorder,
                filled: true,
                fillColor: colors.secondaryBackground,
                contentPadding: const EdgeInsets.all(24),
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
                  onPressed: _sending ? null : _sendReset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 3,
                  ),
                  child: _sending
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2),
                        )
                      : Text(
                          'Send Reset Link',
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

  Future<void> _sendReset() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email required!')),
      );
      return;
    }
    setState(() => _sending = true);
    try {
      await ref.read(authNotifierProvider.notifier).sendPasswordReset(email);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Reset link sent! Check your email.')),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }
}
