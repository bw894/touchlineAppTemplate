// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ObjectIdOnlyStruct extends FFFirebaseStruct {
  ObjectIdOnlyStruct({
    String? objectId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _objectId = objectId,
        super(firestoreUtilData);

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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ObjectIdOnlyStruct(
      objectId: objectId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ObjectIdOnlyStruct? updateObjectIdOnlyStruct(
  ObjectIdOnlyStruct? objectIdOnly, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    objectIdOnly
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addObjectIdOnlyStructData(
  Map<String, dynamic> firestoreData,
  ObjectIdOnlyStruct? objectIdOnly,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (objectIdOnly == null) {
    return;
  }
  if (objectIdOnly.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && objectIdOnly.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final objectIdOnlyData =
      getObjectIdOnlyFirestoreData(objectIdOnly, forFieldValue);
  final nestedData =
      objectIdOnlyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = objectIdOnly.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getObjectIdOnlyFirestoreData(
  ObjectIdOnlyStruct? objectIdOnly, [
  bool forFieldValue = false,
]) {
  if (objectIdOnly == null) {
    return {};
  }
  final firestoreData = mapToFirestore(objectIdOnly.toMap());

  // Add any Firestore field values
  objectIdOnly.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getObjectIdOnlyListFirestoreData(
  List<ObjectIdOnlyStruct>? objectIdOnlys,
) =>
    objectIdOnlys?.map((e) => getObjectIdOnlyFirestoreData(e, true)).toList() ??
    [];
