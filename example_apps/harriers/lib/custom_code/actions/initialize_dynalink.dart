// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:touchline_template_puum0i/backend/schema/structs/index.dart"
    as touchline_template_puum0i_data_schema;
import "package:touchline_template_puum0i/backend/schema/structs/index.dart"
    as touchline_template_puum0i_data_schema;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dynalink_flutter/dynalink_flutter.dart';

Future initializeDynalink() async {
  // Add your function code here!

  // Initialize Dynalink once with your project keys
  await Dynalink.initialize(
    publicKey: FFAppConstants.dynalinkPublicKey,
    projectId: 'kidderminster-harriers',
  );
}
