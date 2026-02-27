// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConditionalReturnStruct extends FFFirebaseStruct {
  ConditionalReturnStruct({
    String? objectId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _objectId = objectId,
        super(firestoreUtilData);

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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConditionalReturnStruct(
      objectId: objectId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConditionalReturnStruct? updateConditionalReturnStruct(
  ConditionalReturnStruct? conditionalReturn, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    conditionalReturn
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConditionalReturnStructData(
  Map<String, dynamic> firestoreData,
  ConditionalReturnStruct? conditionalReturn,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (conditionalReturn == null) {
    return;
  }
  if (conditionalReturn.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && conditionalReturn.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final conditionalReturnData =
      getConditionalReturnFirestoreData(conditionalReturn, forFieldValue);
  final nestedData =
      conditionalReturnData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = conditionalReturn.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConditionalReturnFirestoreData(
  ConditionalReturnStruct? conditionalReturn, [
  bool forFieldValue = false,
]) {
  if (conditionalReturn == null) {
    return {};
  }
  final firestoreData = mapToFirestore(conditionalReturn.toMap());

  // Add any Firestore field values
  conditionalReturn.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConditionalReturnListFirestoreData(
  List<ConditionalReturnStruct>? conditionalReturns,
) =>
    conditionalReturns
        ?.map((e) => getConditionalReturnFirestoreData(e, true))
        .toList() ??
    [];
