// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ObjectIdOnlyStruct extends BaseStruct {
  ObjectIdOnlyStruct({
    String? objectId,
  }) : _objectId = objectId;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  static ObjectIdOnlyStruct fromMap(Map<String, dynamic> data) =>
      ObjectIdOnlyStruct(
        objectId: data['objectId'] as String?,
      );

  static ObjectIdOnlyStruct? maybeFromMap(dynamic data) => data is Map
      ? ObjectIdOnlyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'objectId': _objectId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ObjectIdOnlyStruct fromSerializableMap(Map<String, dynamic> data) =>
      ObjectIdOnlyStruct(
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ObjectIdOnlyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ObjectIdOnlyStruct && objectId == other.objectId;
  }

  @override
  int get hashCode => const ListEquality().hash([objectId]);
}

ObjectIdOnlyStruct createObjectIdOnlyStruct({
  String? objectId,
}) =>
    ObjectIdOnlyStruct(
      objectId: objectId,
    );
