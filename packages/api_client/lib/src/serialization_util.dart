// Subset of FlutterFlow's serialization_util.dart — pure Dart only.
// Only includes the ParamTypes actually used by the data structs
// (int, double, String, bool, DateTime, DataStruct, JSON).
// Flutter-specific types (Color, LatLng, FFPlace, etc.) are excluded.

import 'dart:convert';

/// Parameter types used for struct serialization.
enum ParamType {
  int,
  double,
  // ignore: camel_case_types
  String,
  bool,
  DateTime,
  // ignore: camel_case_types
  JSON,
  DataStruct,
}

String? serializeParam(
  dynamic param,
  ParamType paramType, {
  bool isList = false,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final serializedValues = (param as Iterable)
          .map((p) => serializeParam(p, paramType, isList: false))
          .where((p) => p != null)
          .map((p) => p!)
          .toList();
      return json.encode(serializedValues);
    }
    switch (paramType) {
      case ParamType.int:
        return param.toString();
      case ParamType.double:
        return param.toString();
      case ParamType.String:
        return param as String?;
      case ParamType.bool:
        return param ? 'true' : 'false';
      case ParamType.DateTime:
        return (param as DateTime).millisecondsSinceEpoch.toString();
      case ParamType.JSON:
        return json.encode(param);
      case ParamType.DataStruct:
        // Duck-type call to BaseStruct.serialize() — avoids circular import.
        return (param as dynamic).serialize() as String?;
    }
  } catch (e) {
    return null;
  }
}

dynamic deserializeParam<T>(
  String? param,
  ParamType paramType,
  bool isList, {
  T Function(Map<String, dynamic>)? structBuilder,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final paramValues = json.decode(param);
      if (paramValues is! Iterable || paramValues.isEmpty) {
        return null;
      }
      return paramValues
          .where((p) => p is String)
          .map((p) => p as String)
          .map((p) => deserializeParam<T>(
                p,
                paramType,
                false,
                structBuilder: structBuilder,
              ))
          .where((p) => p != null)
          .map((p) => p! as T)
          .toList();
    }
    switch (paramType) {
      case ParamType.int:
        return int.tryParse(param);
      case ParamType.double:
        return double.tryParse(param);
      case ParamType.String:
        return param;
      case ParamType.bool:
        return param == 'true';
      case ParamType.DateTime:
        final milliseconds = int.tryParse(param);
        return milliseconds != null
            ? DateTime.fromMillisecondsSinceEpoch(milliseconds)
            : null;
      case ParamType.JSON:
        return json.decode(param);
      case ParamType.DataStruct:
        final data = json.decode(param) as Map<String, dynamic>? ?? {};
        return structBuilder != null ? structBuilder(data) : null;
    }
  } catch (e) {
    return null;
  }
}
