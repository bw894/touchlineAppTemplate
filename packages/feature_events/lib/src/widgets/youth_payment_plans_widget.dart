import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Displays a single youth payment plan card.
///
/// Shows the club badge, plan description, a list of included / excluded
/// features, a ONE-TIME / MONTHLY payment period selector, and a SELECT
/// button.
///
/// [onSelected] is called with the plan's [objectId] and a boolean
/// [isOneTime] when the user taps SELECT.
class YouthPaymentPlansWidget extends StatefulWidget {
  const YouthPaymentPlansWidget({
    super.key,
    required this.paymentPlan,
    this.clubBadgeUrl,
    this.onSelected,
  });

  final PaymentPlansStruct paymentPlan;
  final String? clubBadgeUrl;

  /// Called when SELECT is tapped.
  /// [paymentPlanObjectId] — the plan's objectId.
  /// [isOneTime] — true = one-time total, false = monthly installment.
  final Future<void> Function(String paymentPlanObjectId, bool isOneTime)?
      onSelected;

  @override
  State<YouthPaymentPlansWidget> createState() =>
      _YouthPaymentPlansWidgetState();
}

class _YouthPaymentPlansWidgetState extends State<YouthPaymentPlansWidget> {
  bool _isOneTime = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fmt = NumberFormat('#,##0.00', 'en_GB');
    final plan = widget.paymentPlan;

    final amountStr = _isOneTime
        ? '£${fmt.format(plan.total)} (one time)'
        : '£${fmt.format(plan.monthlyInstallment)} / month × ${plan.months}';

    return Container(
      width: 330.0,
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Club badge
            if (widget.clubBadgeUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(
                  widget.clubBadgeUrl!,
                  width: 60.0,
                  height: 60.0,
                  fit: BoxFit.contain,
                ),
              ),
            const SizedBox(height: 10.0),

            // Plan description
            Text(
              plan.description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15.0,
              ),
            ),
            const SizedBox(height: 12.0),

            // Features list
            ...plan.sellingFeaturesList.map((feature) {
              final isTick = feature.ico.toLowerCase().contains('tick') ||
                  feature.ico.toLowerCase().contains('check');
              return Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isTick ? Icons.check_circle_outline : Icons.cancel_outlined,
                      color: isTick
                          ? theme.colorScheme.secondary
                          : theme.colorScheme.error,
                      size: 18.0,
                    ),
                    const SizedBox(width: 6.0),
                    Text(feature.name, style: theme.textTheme.bodyMedium),
                  ],
                ),
              );
            }),
            const SizedBox(height: 12.0),

            // ONE-TIME / MONTHLY chips
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text('ONE-TIME'),
                  selected: _isOneTime,
                  onSelected: (_) => setState(() => _isOneTime = true),
                ),
                const SizedBox(width: 8.0),
                ChoiceChip(
                  label: const Text('MONTHLY'),
                  selected: !_isOneTime,
                  onSelected: (_) => setState(() => _isOneTime = false),
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            // Amount
            Text(
              amountStr,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 12.0),

            // SELECT button
            SizedBox(
              width: double.infinity,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () async {
                  if (widget.onSelected != null) {
                    await widget.onSelected!(plan.objectId, _isOneTime);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('SELECT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
