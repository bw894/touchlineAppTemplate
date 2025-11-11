// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:html_unescape/html_unescape.dart';

Future<String> fixBackendlessText(String text) async {
  try {
    // Step 1: Fix misencoded UTF-8 characters (e.g., â)
    // Convert the text to Latin-1 (ISO-8859-1) bytes, then decode as UTF-8
    String fixedText = utf8.decode(latin1.encode(text));

    // Step 2: Convert HTML entities back to normal text
    var unescape = HtmlUnescape();
    String unescapedText = unescape.convert(fixedText);

    // Step 3: Explicitly replace common HTML entities for apostrophes
    unescapedText =
        unescapedText.replaceAll('&#39;', "'").replaceAll('&apos;', "'");

    // Step 4: Wrap the text in HTML with Montserrat font, 16px size, and transparent background
    String styledText = '''
    <html>
      <head>
        <style>
          html, body {
            font-family: 'Montserrat', sans-serif;
            font-size: 16px;
            background-color: transparent;
            margin: 0;
            padding: 0;
          }
        </style>
      </head>
      <body>
        $unescapedText
      </body>
    </html>
    ''';

    return styledText;
  } catch (e) {
    return text; // Return original if something fails
  }
}
