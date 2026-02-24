// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class ConditionalReturnStruct extends BaseStruct {
  ConditionalReturnStruct({
    String? objectId,
  }) : _objectId = objectId;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  static ConditionalReturnStruct fromMap(Map<String, dynamic> data) =>
      ConditionalReturnStruct(
        objectId: data['objectId'] as String?,
      );

  static ConditionalReturnStruct? maybeFromMap(dynamic data) => data is Map
      ? ConditionalReturnStruct.fromMap(data.cast<String, dynamic>())
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

  static ConditionalReturnStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConditionalReturnStruct(
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConditionalReturnStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConditionalReturnStruct && objectId == other.objectId;
  }

  @override
  int get hashCode => const ListEquality().hash([objectId]);
}

ConditionalReturnStruct createConditionalReturnStruct({
  String? objectId,
}) =>
    ConditionalReturnStruct(
      objectId: objectId,
    );
