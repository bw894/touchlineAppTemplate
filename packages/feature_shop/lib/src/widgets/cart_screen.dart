import 'package:feature_shop/src/widgets/cart_summary_widget.dart';
import 'package:flutter/material.dart';

/// Full-page shopping cart screen.
///
/// Wraps [CartSummaryWidget] (non-popup mode) in a [Scaffold].
///
/// [onCheckout] is forwarded to the checkout button in the cart footer.
class CartScreen extends StatelessWidget {
  const CartScreen({super.key, this.onCheckout});

  final VoidCallback? onCheckout;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: CartSummaryWidget(
          popup: false,
          onCheckout: onCheckout,
        ),
      ),
    );
  }
}
