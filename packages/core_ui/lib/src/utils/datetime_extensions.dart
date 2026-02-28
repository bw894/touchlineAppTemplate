import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

/// Formats [dateTime] using an [intl] pattern or the special
/// `'relative'` keyword (e.g. "3 minutes ago").
String dateTimeFormat(String format, DateTime? dateTime, {String? locale}) {
  if (dateTime == null) return '';
  if (format == 'relative') {
    return timeago.format(dateTime, locale: locale, allowFromNow: true);
  }
  return DateFormat(format, locale).format(dateTime);
}

/// Returns the current timestamp.
DateTime get getCurrentTimestamp => DateTime.now();

/// Converts Unix seconds to [DateTime].
DateTime dateTimeFromSecondsSinceEpoch(int seconds) =>
    DateTime.fromMillisecondsSinceEpoch(seconds * 1000);

/// DateTime utility extensions ported from [custom_functions.dart] and
/// [flutter_flow_util.dart].
extension DateTimeExtensions on DateTime {
  /// Unix epoch in whole seconds.
  int get secondsSinceEpoch => (millisecondsSinceEpoch / 1000).round();

  bool operator <(DateTime other) => isBefore(other);
  bool operator >(DateTime other) => isAfter(other);
  bool operator <=(DateTime other) => this < other || isAtSameMomentAs(other);
  bool operator >=(DateTime other) => this > other || isAtSameMomentAs(other);
}

/// Parses [dateTimeString] with [DateTime.parse], throwing on invalid input.
DateTime parseDateTime(String dateTimeString) =>
    DateTime.parse(dateTimeString);

/// Converts milliseconds since epoch to [DateTime].
DateTime convertFromMills(int milliseconds) =>
    DateTime.fromMillisecondsSinceEpoch(milliseconds);

/// Parses [dateTimeString], returning `null` on failure.
DateTime? convertStringToDateTime(String dateTimeString) {
  try {
    return DateTime.parse(dateTimeString);
  } catch (_) {
    return null;
  }
}

/// Returns `true` if [current] is within a 3-hour window around
/// [[start], [end]].
bool isWithinEventWindow(
  DateTime? start,
  DateTime? end,
  DateTime current,
) {
  if (start == null || end == null) return false;
  const buffer = Duration(hours: 3);
  return current.isAfter(start.subtract(buffer)) &&
      current.isBefore(end.add(buffer));
}
