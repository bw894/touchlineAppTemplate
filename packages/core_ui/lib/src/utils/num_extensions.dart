import 'package:intl/intl.dart';

enum FormatType {
  decimal,
  percent,
  scientific,
  compact,
  compactLong,
  custom,
}

enum DecimalType {
  automatic,
  periodDecimal,
  commaDecimal,
}

/// Formats [value] according to [formatType] and optional parameters.
///
/// Ported from [flutter_flow_util.dart] `formatNumber`.
String formatNumber(
  num? value, {
  required FormatType formatType,
  DecimalType? decimalType,
  String? currency,
  bool toLowerCase = false,
  String? format,
  String? locale,
}) {
  if (value == null) return '';
  var formatted = '';
  switch (formatType) {
    case FormatType.decimal:
      switch (decimalType!) {
        case DecimalType.automatic:
          formatted = NumberFormat.decimalPattern().format(value);
        case DecimalType.periodDecimal:
          formatted = currency != null
              ? NumberFormat('#,##0.00', 'en_US').format(value)
              : NumberFormat.decimalPattern('en_US').format(value);
        case DecimalType.commaDecimal:
          formatted = currency != null
              ? NumberFormat('#,##0.00', 'es_PA').format(value)
              : NumberFormat.decimalPattern('es_PA').format(value);
      }
    case FormatType.percent:
      formatted = NumberFormat.percentPattern().format(value);
    case FormatType.scientific:
      formatted = NumberFormat.scientificPattern().format(value);
      if (toLowerCase) formatted = formatted.toLowerCase();
    case FormatType.compact:
      formatted = NumberFormat.compact().format(value);
    case FormatType.compactLong:
      formatted = NumberFormat.compactLong().format(value);
    case FormatType.custom:
      final hasLocale = locale != null && locale.isNotEmpty;
      formatted = NumberFormat(format, hasLocale ? locale : null).format(value);
  }

  if (formatted.isEmpty) return value.toString();

  if (currency != null) {
    final symbol = currency.isNotEmpty
        ? currency
        : NumberFormat.simpleCurrency().format(0.0).substring(0, 1);
    formatted = '$symbol$formatted';
  }

  return formatted;
}

/// Calculates the total cost of [unitPrices] × [quantities].
double calculateSubtotal(List<double> unitPrices, List<int> quantities) {
  var subtotal = 0.0;
  for (var i = 0; i < unitPrices.length; i++) {
    subtotal += unitPrices[i] * quantities[i];
  }
  return subtotal;
}

/// Parses [input] as comma-separated integers and returns their cumulative sums.
List<int> cumulativeSumByCommaInt(String input) {
  final numbers =
      input.split(',').map((s) => int.tryParse(s.trim()) ?? 0).toList();
  final cumulative = <int>[];
  var sum = 0;
  for (final n in numbers) {
    sum += n;
    cumulative.add(sum);
  }
  return cumulative;
}
