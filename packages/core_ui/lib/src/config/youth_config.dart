/// Per-club youth feature configuration.
class YouthConfig {
  const YouthConfig({
    this.enabled = true,
    this.showPaymentPlans = true,
  });

  final bool enabled;
  final bool showPaymentPlans;
}
