/// Per-club shop feature configuration.
class ShopConfig {
  const ShopConfig({
    this.enabled = true,
    this.guestCheckout = false,
    this.maxCartItems = 20,
  });

  final bool enabled;
  final bool guestCheckout;
  final int maxCartItems;
}
