import 'package:flutter/material.dart';

/// Static checkout placeholder widget.
///
/// The original FlutterFlow checkout component was a UI mockup with no backend
/// integration (all buttons were no-ops). This widget preserves the visual
/// structure: a header, a delivery options panel, and a proceed button.
///
/// [onProceed] is called when the "Proceed" button is pressed.
class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({super.key, this.onProceed});

  final VoidCallback? onProceed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(color: theme.colorScheme.surface),
      child: Stack(
        children: [
          SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      20.0, 17.0, 20.0, 11.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 8.0, 0.0, 18.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Checkout',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0,
                              ),
                            ),
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: theme.colorScheme.onSurface,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      // Delivery options panel
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          border: Border.all(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 14.0, 0.0, 14.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _OptionRow(
                                icon: Icons.local_shipping_outlined,
                                label: 'Delivery',
                                theme: theme,
                              ),
                              _OptionRow(
                                icon: Icons.storefront_outlined,
                                label: 'Click & Collect',
                                theme: theme,
                              ),
                              _OptionRow(
                                icon: Icons.credit_card_outlined,
                                label: 'Secure Payment',
                                theme: theme,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Sticky footer
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  13.0, 0.0, 13.0, 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: onProceed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    textStyle: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text('Proceed'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionRow extends StatelessWidget {
  const _OptionRow({
    required this.icon,
    required this.label,
    required this.theme,
  });

  final IconData icon;
  final String label;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: theme.colorScheme.onSurface, size: 24.0),
          const SizedBox(width: 8.0),
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 17.0,
            ),
          ),
        ],
      ),
    );
  }
}
