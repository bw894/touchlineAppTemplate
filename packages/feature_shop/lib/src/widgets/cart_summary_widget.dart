import 'package:core_ui/core_ui.dart';
import 'package:feature_shop/src/providers.dart';
import 'package:feature_shop/src/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theming/theming.dart';

/// Shows the current cart contents.
///
/// * [popup] `true` → displayed in a bottom sheet after "Add to Bag", with an
///   "Added To Your Bag" header.
/// * [popup] `false` → full-page view with "Your Bag" header.
///
/// [onCheckout] is called when the Checkout button is pressed.
class CartSummaryWidget extends ConsumerWidget {
  const CartSummaryWidget({
    super.key,
    this.popup = false,
    this.onCheckout,
  });

  final bool popup;
  final VoidCallback? onCheckout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartNotifierProvider);
    final notifier = ref.read(cartNotifierProvider.notifier);
    final theme = Theme.of(context);
    final colors = theme.extension<TouchlineColors>();
    final subtotal = notifier.subtotal;
    final fmt = NumberFormat('#,##0.00', 'en_GB');

    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(color: theme.colorScheme.surface),
      child: Stack(
        children: [
          // ---------------------------------------------------------------
          // Scrollable cart list (bottom-padded so footer doesn't overlap)
          // ---------------------------------------------------------------
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 150.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 17.0, 20.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!popup)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Your Bag',
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional
                                          .fromSTEB(0.0, 0.0, 0.0, 9.0),
                                      child: Text(
                                        '${cart.length} items',
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: theme.colorScheme.onSurface,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                        if (popup)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: theme.colorScheme.secondary,
                                  size: 18.0,
                                ),
                                Text(
                                  'Added To Your Bag',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ].divide(const SizedBox(width: 6.0)),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    thickness: 2.0,
                    color: theme.colorScheme.surfaceVariant,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      itemCount: cart.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 5.0),
                      itemBuilder: (context, i) => CartItemWidget(
                        key: ValueKey('cart_item_$i'),
                        cartItem: cart[i],
                        index: i,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ---------------------------------------------------------------
          // Sticky footer — shipping note, subtotal, checkout button
          // ---------------------------------------------------------------
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 180.0,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, -2.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        13.0, 12.0, 13.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Costs',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              'Calculated at checkout',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 13.0,
                              ),
                            ),
                          ].divide(const SizedBox(height: 3.0)),
                        ),
                        Icon(
                          Icons.local_shipping_outlined,
                          color: theme.colorScheme.onSurface,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    thickness: 1.0,
                    indent: 25.0,
                    endIndent: 25.0,
                    color: colors?.shopBorder ?? theme.dividerColor,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        13.0, 12.0, 13.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Total',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              '(incl. tax)',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 13.0,
                              ),
                            ),
                          ].divide(const SizedBox(width: 5.0)),
                        ),
                        Text(
                          '£${fmt.format(subtotal)}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        13.0, 0.0, 13.0, 0.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: ElevatedButton.icon(
                        onPressed: onCheckout,
                        icon: const SizedBox.shrink(),
                        label: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Checkout'),
                            SizedBox(width: 8.0),
                            Icon(Icons.east, size: 15.0),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: Colors.white,
                          elevation: 0.0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          textStyle: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
