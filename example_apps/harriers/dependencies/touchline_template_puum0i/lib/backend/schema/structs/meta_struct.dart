// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetaStruct extends FFFirebaseStruct {
  MetaStruct({
    String? location,
    int? position,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _location = location,
        _position = position,
        super(firestoreUtilData);

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "position" field.
  int? _position;
  int get position => _position ?? 0;
  set position(int? val) => _position = val;

  void incrementPosition(int amount) => position = position + amount;

  bool hasPosition() => _position != null;

  static MetaStruct fromMap(Map<String, dynamic> data) => MetaStruct(
        location: data['location'] as String?,
        position: castToType<int>(data['position']),
      );

  static MetaStruct? maybeFromMap(dynamic data) =>
      data is Map ? MetaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'location': _location,
        'position': _position,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'position': serializeParam(
          _position,
          ParamType.int,
        ),
      }.withoutNulls;

  static MetaStruct fromSerializableMap(Map<String, dynamic> data) =>
      MetaStruct(
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        position: deserializeParam(
          data['position'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MetaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MetaStruct &&
        location == other.location &&
        position == other.position;
  }

  @override
  int get hashCode => const ListEquality().hash([location, position]);
}

MetaStruct createMetaStruct({
  String? location,
  int? position,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MetaStruct(
      location: location,
      position: position,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MetaStruct? updateMetaStruct(
  MetaStruct? meta, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    meta
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMetaStructData(
  Map<String, dynamic> firestoreData,
  MetaStruct? meta,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (meta == null) {
    return;
  }
  if (meta.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && meta.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final metaData = getMetaFirestoreData(meta, forFieldValue);
  final nestedData = metaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = meta.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMetaFirestoreData(
  MetaStruct? meta, [
  bool forFieldValue = false,
]) {
  if (meta == null) {
    return {};
  }
  final firestoreData = mapToFirestore(meta.toMap());

  // Add any Firestore field values
  meta.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMetaListFirestoreData(
  List<MetaStruct>? metas,
) =>
    metas?.map((e) => getMetaFirestoreData(e, true)).toList() ?? [];
