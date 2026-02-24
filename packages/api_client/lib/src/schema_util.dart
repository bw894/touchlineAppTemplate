// ignore_for_file: unnecessary_getters_setters

import 'dart:convert';

import 'package:json_path/json_path.dart';

import 'serialization_util.dart';

export 'package:collection/collection.dart' show ListEquality;
export 'serialization_util.dart';

typedef StructBuilder<T> = T Function(Map<String, dynamic> data);

abstract class BaseStruct {
  Map<String, dynamic> toSerializableMap();
  String serialize() => json.encode(toSerializableMap());
}

// ---------------------------------------------------------------------------
// Type casting
// ---------------------------------------------------------------------------

T? castToType<T>(dynamic value) {
  if (value == null) {
    return null;
  }
  switch (T) {
    case const (double):
      return value.toDouble() as T;
    case const (int):
      if (value is num && value.toInt() == value) {
        return value.toInt() as T;
      }
      break;
    default:
      break;
  }
  return value as T;
}

// ---------------------------------------------------------------------------
// Map / List extensions
// ---------------------------------------------------------------------------

extension MapFilterExtensions<T> on Map<String, T?> {
  Map<String, T> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value as T)),
      );
}

extension ListFilterExt<T> on Iterable<T?> {
  List<T> get withoutNulls => where((s) => s != null).map((e) => e!).toList();
}

// ---------------------------------------------------------------------------
// Struct helpers
// ---------------------------------------------------------------------------

dynamic deserializeStructParam<T>(
  dynamic param,
  ParamType paramType,
  bool isList, {
  required StructBuilder<T> structBuilder,
}) {
  if (param == null) {
    return null;
  } else if (isList) {
    final paramValues;
    try {
      paramValues = param is Iterable ? param : json.decode(param);
    } catch (e) {
      return null;
    }
    if (paramValues is! Iterable) {
      return null;
    }
    return paramValues
        .map<T>((e) => deserializeStructParam<T>(e, paramType, false,
            structBuilder: structBuilder))
        .toList();
  } else if (param is Map<String, dynamic>) {
    return structBuilder(param);
  } else {
    return deserializeParam<T>(
      param,
      paramType,
      isList,
      structBuilder: structBuilder,
    );
  }
}

List<T>? getStructList<T>(
  dynamic value,
  StructBuilder<T> structBuilder,
) =>
    value is! List
        ? null
        : value
            .where((e) => e is Map<String, dynamic>)
            .map((e) => structBuilder(e as Map<String, dynamic>))
            .toList();

List<T>? getDataList<T>(dynamic value) =>
    value is! List ? null : value.map((e) => castToType<T>(e)!).toList();

// ---------------------------------------------------------------------------
// JSON path helper (used in endpoint response parsers)
// ---------------------------------------------------------------------------

dynamic getJsonField(
  dynamic response,
  String jsonPath, [
  bool isForList = false,
]) {
  final field = JsonPath(jsonPath).read(response);
  if (field.isEmpty) {
    return null;
  }
  if (field.length > 1) {
    return field.map((f) => f.value).toList();
  }
  final value = field.first.value;
  if (isForList) {
    return value is! Iterable
        ? [value]
        : (value is List ? value : value.toList());
  }
  return value;
}
