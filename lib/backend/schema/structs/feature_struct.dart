// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeatureStruct extends BaseStruct {
  FeatureStruct({
    String? ico,
    String? name,
  })  : _ico = ico,
        _name = name;

  // "ico" field.
  String? _ico;
  String get ico => _ico ?? '';
  set ico(String? val) => _ico = val;

  bool hasIco() => _ico != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static FeatureStruct fromMap(Map<String, dynamic> data) => FeatureStruct(
        ico: data['ico'] as String?,
        name: data['name'] as String?,
      );

  static FeatureStruct? maybeFromMap(dynamic data) =>
      data is Map ? FeatureStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ico': _ico,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ico': serializeParam(
          _ico,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static FeatureStruct fromSerializableMap(Map<String, dynamic> data) =>
      FeatureStruct(
        ico: deserializeParam(
          data['ico'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FeatureStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FeatureStruct && ico == other.ico && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([ico, name]);
}

FeatureStruct createFeatureStruct({
  String? ico,
  String? name,
}) =>
    FeatureStruct(
      ico: ico,
      name: name,
    );
