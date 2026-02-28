import 'dart:convert';

/// String utility extensions ported from [custom_functions.dart].
extension StringExtensions on String {
  /// Strips all HTML tags and inline newlines from the string.
  String stripHtmlTags() {
    final exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return replaceAll(exp, '').replaceAll('\n', '');
  }

  /// Normalises encoding artifacts, HTML entities, and non-ASCII characters
  /// that can appear in text fetched from Backendless / WordPress.
  String fixBackendlessText() {
    String result =
        const Utf8Decoder(allowMalformed: true).convert(codeUnits);

    const htmlEntities = {
      '&#8230;': '…',
      '&#8211;': '-',
      '&#8212;': '--',
      '&#8216;': "'",
      '&#8217;': "'",
      '&#8220;': '"',
      '&#8221;': '"',
      '&#8242;': "'",
      '&#8243;': '"',
      '&amp;': '&',
      '&lt;': '<',
      '&gt;': '>',
      '&#038;': '&',
      '&quot;': '"',
      '&apos;': "'",
      '&nbsp;': ' ',
      '&hellip;': '…',
      '&#8213;': '-',
      '&#8722;': '-',
      '&#8208;': '-',
      '&#8209;': '-',
      '&#8210;': '-',
      '&#65279;': '',
    };

    for (final entry in htmlEntities.entries) {
      result = result.replaceAll(entry.key, entry.value);
    }

    return result
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll('Â', '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .replaceAll(RegExp(r'[\u200B-\u200D\uFEFF]'), '')
        .replaceAll(RegExp(r'[^\x00-\x7F]+'), '')
        .trim();
  }

  /// Decodes a UTF-8 mis-encoded string back to readable text.
  String decodeUtf8() {
    try {
      return utf8.decode(codeUnits, allowMalformed: true);
    } catch (_) {
      return this;
    }
  }

  /// Formats a full name as "FirstName I." (initial only for surname).
  String reviewNameFormat() {
    final trimmed = trim();
    if (!trimmed.contains(' ')) return trimmed;
    final words = trimmed.split(RegExp(r'\s+'));
    if (words.length < 2) return trimmed;
    return '${words[0]} ${words[1][0].toUpperCase()}.';
  }

  /// Splits the string by commas, trimming each item.
  List<String> splitByCommas() =>
      split(',').map((s) => s.trim()).toList();

  /// Splits at the first space, returning [before, after].
  List<String> splitAtFirstSpace() {
    if (isEmpty) return ['', ''];
    final idx = indexOf(' ');
    if (idx == -1) return [this, ''];
    return [substring(0, idx), substring(idx + 1)];
  }

  /// Parses the string as a [double], returning 0.0 on failure.
  double toDoubleOrZero() {
    try {
      return double.parse(this);
    } catch (_) {
      return 0.0;
    }
  }
}
