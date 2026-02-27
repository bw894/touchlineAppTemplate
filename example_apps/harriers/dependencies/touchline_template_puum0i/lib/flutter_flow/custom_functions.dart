import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/library_values.dart';

DateTime parseDateTime(String dateTimeString) {
  // Parse the string into a DateTime object
  DateTime parsedDateTime = DateTime.parse(dateTimeString);

  // Return the DateTime object
  return parsedDateTime;
}

String stripHtmlTags(String htmlString) {
// Regular expression to find HTML tags
  final RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);

  // Replace all HTML tags with an empty string
  String cleanText = htmlString.replaceAll(exp, '');

  // Remove newline characters (\n)
  cleanText = cleanText.replaceAll('\n', '');

  // Return the cleaned text
  return cleanText;
}

int getTermIndex(
  String term,
  List<String> stringList,
) {
  // Check if the list is not null to avoid errors
  if (stringList == null) {
    return -1; // Return -1 if the list is null
  }

  // Iterate over the list to find the term
  for (int i = 0; i < stringList.length; i++) {
    if (stringList[i] == term) {
      return i; // Return the index if term is found
    }
  }

  // If term is not found, return -1
  return -1;
}

DateTime convertFromMills(int milliseconds) {
  return DateTime.fromMillisecondsSinceEpoch(milliseconds);
}

int findIndexCopy(
  String desiredString,
  List<String> strings,
) {
  try {
    int index = strings.indexOf(desiredString);
    if (index == -1) {
      return 0;
    }
    return index;
  } catch (e) {
    return 0;
  }
}

double calculateSubtotal(
  List<double> unitPrices,
  List<int> quantities,
) {
  double subtotal = 0.0;

  for (int i = 0; i < unitPrices.length; i++) {
    subtotal += unitPrices[i] * quantities[i];
  }

  return subtotal;
}

List<String> splitStringByCommas(String input) {
// Split the input string by commas
  List<String> splitList = input.split(',');

  // Trim any leading or trailing whitespace from each item in the list
  List<String> trimmedList = splitList.map((item) => item.trim()).toList();

  // Return the list of individual items as strings
  return trimmedList;
}

List<int> splitStringByCommaInt(String input) {
  // Split the input string by commas and convert to integers
  List<int> splitList = input
      .split(',')
      .map((s) =>
          int.tryParse(s.trim()) ?? 0) // Convert to int, use 0 if parsing fails
      .toList();

  // Return the list of integers
  return splitList;
}

double convertStringToDouble(String input) {
  // Try to parse the string as a double.
  try {
    return double.parse(input);
  } catch (e) {
    // If parsing fails, return 0.0 or handle it as needed.
    return 0.0;
  }
}

int findIndex(
  int desiredString,
  List<int> strings,
) {
  try {
    int index = strings.indexOf(desiredString);
    if (index == -1) {
      return 0;
    }
    return index;
  } catch (e) {
    return 0;
  }
}

DateTime? convertStringToDateTime(String dateTimeString) {
  try {
    // Parse the input string to a DateTime object
    return DateTime.parse(dateTimeString);
  } catch (e) {
    // If the string is not in a valid format, return null or a default DateTime
    return null;
  }
}

List<String> splitStringByFirstSpace(String input) {
  // Check if the input is null or empty
  if (input.isEmpty) {
    return ["", ""];
  }

  // Find the index of the first space
  int spaceIndex = input.indexOf(' ');

  // If there's no space in the input
  if (spaceIndex == -1) {
    return [input, ""];
  }

  // Split the input string at the first space
  String firstPart = input.substring(0, spaceIndex);
  String secondPart = input.substring(spaceIndex + 1);

  return [firstPart, secondPart];
}

String removeUnwantedCharacters(String inputt) {
  // Normalize text to remove encoding artifacts
  String normalized =
      const Utf8Decoder(allowMalformed: true).convert(inputt.codeUnits);

  // Manually replace common HTML entities and similar characters
  final htmlEntities = {
    '&#8230;': '…', // Ellipsis
    '&#8211;': '-', // En dash
    '&#8212;': '--', // Em dash
    '&#8216;': "'", // Left single quote
    '&#8217;': "'", // Right single quote (apostrophe)
    '&#8220;': '"', // Left double quote
    '&#8221;': '"', // Right double quote
    '&#8242;': "'", // Prime symbol (can look like an apostrophe)
    '&#8243;': '"', // Double prime symbol
    '&amp;': '&', // Ampersand
    '&lt;': '<', // Less than
    '&gt;': '>', // Greater than
    '&#038;': '&', // Additional ampersand encoding
    '&quot;': '"', // Double quote
    '&apos;': "'", // Single quote
    '&nbsp;': ' ', // Non-breaking space
    '&hellip;': '…', // Horizontal ellipsis
    '&#8213;': '-', // Horizontal bar
    '&#8722;': '-', // Minus sign
    '&#8208;': '-', // Hyphen
    '&#8209;': '-', // Non-breaking hyphen
    '&#8210;': '-', // Figure dash
    '&#65279;': '' // Zero-width no-break space (BOM)
  };

  htmlEntities.forEach((entity, replacement) {
    normalized = normalized.replaceAll(entity, replacement);
  });

  // Remove all HTML tags
  normalized = normalized.replaceAll(RegExp(r'<[^>]*>'), '');

  // Remove remaining unwanted encoding artifacts and formatting characters
  normalized = normalized
      .replaceAll('Â', '') // Common encoding artifact
      .replaceAll(RegExp(r'\s+'), ' ') // Normalize excessive spaces
      .replaceAll(RegExp(r'[\u200B-\u200D\uFEFF]'),
          '') // Remove zero-width & formatting chars
      .replaceAll(RegExp(r'[^\x00-\x7F]+'),
          '') // Remove non-ASCII characters (e.g., emojis, symbols)
      .trim();

  return normalized;
}

String decodeUtf8ToRichText(String input) {
  try {
    // Convert the incorrectly encoded string to bytes
    List<int> bytes = input.codeUnits;

    // Decode using UTF-8
    String decodedText = utf8.decode(bytes, allowMalformed: true);

    return decodedText;
  } catch (e) {
    return input; // Return original text if an error occurs
  }
}

bool isWithinEventWindow(
  DateTime? start,
  DateTime? end,
  DateTime current,
) {
// Return false if any of the input datetimes are null
  if (start == null || end == null) {
    return false;
  }

  // Define the 3-hour buffer duration
  Duration buffer = Duration(hours: 3);

  // Calculate buffer windows
  DateTime startBuffer = start.subtract(buffer);
  DateTime endBuffer = end.add(buffer);

  // Check if current is within the buffer windows
  return current.isAfter(startBuffer) && current.isBefore(endBuffer);
}

List<String>? formatGoalscorers(
  List<String>? goalscorerList,
  List<String>? minuteList,
) {
  // Check if inputs are null or empty
  if (goalscorerList == null ||
      minuteList == null ||
      goalscorerList.isEmpty ||
      minuteList.isEmpty) {
    return [];
  }

  // Check if inputs are valid
  if (goalscorerList.length != minuteList.length) {
    return [];
  }

  // Create a map to group minutes by goalscorer
  Map<String, List<String>> goalscorerMap = {};

  // Iterate through goalscorers and minutes to populate the map
  for (int i = 0; i < goalscorerList.length; i++) {
    String scorer = goalscorerList[i].trim();
    String minute = minuteList[i].trim();

    if (goalscorerMap.containsKey(scorer)) {
      goalscorerMap[scorer]!.add(minute);
    } else {
      goalscorerMap[scorer] = [minute];
    }
  }

  // Format the output list
  List<String> formattedGoalscorers = [];
  goalscorerMap.forEach((scorer, minutes) {
    // Join minutes with a comma if multiple, otherwise use single minute
    String minutesString = minutes.length > 1 ? minutes.join(', ') : minutes[0];
    formattedGoalscorers.add('$scorer $minutesString');
  });

  // Sort by first minute appearance (optional, can be removed if order doesn't matter)
  formattedGoalscorers.sort((a, b) {
    int aFirstMinute = int.parse(a
        .split(' ')
        .last
        .split(',')[0]
        .replaceAll("'", '')
        .replaceAll('+', ''));
    int bFirstMinute = int.parse(b
        .split(' ')
        .last
        .split(',')[0]
        .replaceAll("'", '')
        .replaceAll('+', ''));
    return aFirstMinute.compareTo(bFirstMinute);
  });

  return formattedGoalscorers;
}

List<String>? minuteFormat(
  List<int>? minute,
  List<int>? extraMinute,
) {
  // Check if minute input is null or empty
  if (minute == null || minute.isEmpty) {
    return [];
  }

  // Check if extraMinute is null or empty, or has different length
  if (extraMinute == null ||
      extraMinute.isEmpty ||
      extraMinute.length != minute.length) {
    return List.generate(minute.length, (index) => "${minute[index]}'");
  }

  // Format the output list
  List<String> formattedMinutes = [];
  for (int i = 0; i < minute.length; i++) {
    int min = minute[i];
    int? extra = extraMinute[i];

    // If extraMinute is null or 0, format as minute'
    // Otherwise, format as minute+extra'
    String formatted = (extra == null || extra == 0) ? "$min'" : "$min+$extra'";
    formattedMinutes.add(formatted);
  }

  return formattedMinutes;
}

List<int> cumulativeSumByCommaInt(String input) {
  // Split the input string by commas and convert to integers
  List<int> numbers = input
      .split(',')
      .map((s) =>
          int.tryParse(s.trim()) ?? 0) // Convert to int, use 0 if parsing fails
      .toList();

  // Calculate cumulative sum
  List<int> cumulativeSum = [];
  int sum = 0;
  for (int num in numbers) {
    sum += num;
    cumulativeSum.add(sum);
  }

  // Return the list of cumulative sums
  return cumulativeSum;
}

dynamic intListToJson(List<int> intList) {
  return jsonDecode(jsonEncode(intList));
}

dynamic formatLineupBuilderPlayers2(
    List<LineupBuilderPlayersStruct> lineupBuilderPlayers) {
  return lineupBuilderPlayers
      .map((player) => {
            'name': player.name,
            'number': player.number,
            'image': player.image,
            'objectId': player.objectId,
            'index': player.index,
            'added': player.added,
          })
      .toList();
}

List<String> getDateComponents(String input) {
  if (input == 'd') {
    return List.generate(31, (index) => (index + 1).toString());
  } else if (input == 'm') {
    return [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
  } else if (input == 'y') {
    return List.generate(101, (index) => (2025 - index).toString());
  } else {
    return [];
  }
}

List<String>? getCountries() {
  return [
    'United Kingdom',
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas, The',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei Darussalam',
    'Bulgaria',
    'Burkina Faso',
    'Burma (Myanmar)',
    'Burundi',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Cape Verde',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo (Brazzaville)',
    'Congo (Kinshasa)',
    'Costa Rica',
    "Cote d'Ivoire",
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia, The',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Holy See (Vatican City State)',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Korea (North)',
    'Korea (South)',
    'Kuwait',
    'Kyrgyzstan',
    'Lao PDR',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macedonia, Rep. of',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Palestinian territories',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Vincent and Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Swaziland',
    'Sweden',
    'Switzerland',
    'Syria',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Timor-Leste',
    'Togo',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Venezuela',
    'Vietnam',
    'Yemen',
    'Zambia',
    'Zimbabwe'
  ];
}

String reviewNameFormat(String fullName) {
  String trimmedName = fullName.trim();
  if (!trimmedName.contains(' ')) {
    return trimmedName;
  }

  List<String> words = trimmedName.split(RegExp(r'\s+'));
  if (words.length < 2) {
    return trimmedName;
  }

  String firstName = words[0];
  String initial = words[1][0].toUpperCase() + '.';

  return '$firstName $initial';
}

List<int> getPageNumbers(int numberOfObjects) {
  const int pageSize = 10;
  int totalPages = (numberOfObjects + pageSize - 1) ~/ pageSize;
  totalPages = totalPages > 0 ? totalPages : 1;
  return List.generate(totalPages, (index) => index + 1);
}
