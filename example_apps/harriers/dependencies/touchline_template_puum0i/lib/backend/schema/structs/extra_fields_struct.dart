// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExtraFieldsStruct extends FFFirebaseStruct {
  ExtraFieldsStruct({
    /// Textfield, number, etc etc
    String? type,
    String? fieldTitle,
    String? responseValue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _fieldTitle = fieldTitle,
        _responseValue = responseValue,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "fieldTitle" field.
  String? _fieldTitle;
  String get fieldTitle => _fieldTitle ?? '';
  set fieldTitle(String? val) => _fieldTitle = val;

  bool hasFieldTitle() => _fieldTitle != null;

  // "responseValue" field.
  String? _responseValue;
  String get responseValue => _responseValue ?? '';
  set responseValue(String? val) => _responseValue = val;

  bool hasResponseValue() => _responseValue != null;

  static ExtraFieldsStruct fromMap(Map<String, dynamic> data) =>
      ExtraFieldsStruct(
        type: data['type'] as String?,
        fieldTitle: data['fieldTitle'] as String?,
        responseValue: data['responseValue'] as String?,
      );

  static ExtraFieldsStruct? maybeFromMap(dynamic data) => data is Map
      ? ExtraFieldsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'fieldTitle': _fieldTitle,
        'responseValue': _responseValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'fieldTitle': serializeParam(
          _fieldTitle,
          ParamType.String,
        ),
        'responseValue': serializeParam(
          _responseValue,
          ParamType.String,
        ),
      }.withoutNulls;

  static ExtraFieldsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExtraFieldsStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        fieldTitle: deserializeParam(
          data['fieldTitle'],
          ParamType.String,
          false,
        ),
        responseValue: deserializeParam(
          data['responseValue'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExtraFieldsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExtraFieldsStruct &&
        type == other.type &&
        fieldTitle == other.fieldTitle &&
        responseValue == other.responseValue;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([type, fieldTitle, responseValue]);
}

ExtraFieldsStruct createExtraFieldsStruct({
  String? type,
  String? fieldTitle,
  String? responseValue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExtraFieldsStruct(
      type: type,
      fieldTitle: fieldTitle,
      responseValue: responseValue,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExtraFieldsStruct? updateExtraFieldsStruct(
  ExtraFieldsStruct? extraFields, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    extraFields
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExtraFieldsStructData(
  Map<String, dynamic> firestoreData,
  ExtraFieldsStruct? extraFields,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (extraFields == null) {
    return;
  }
  if (extraFields.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && extraFields.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final extraFieldsData =
      getExtraFieldsFirestoreData(extraFields, forFieldValue);
  final nestedData =
      extraFieldsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = extraFields.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExtraFieldsFirestoreData(
  ExtraFieldsStruct? extraFields, [
  bool forFieldValue = false,
]) {
  if (extraFields == null) {
    return {};
  }
  final firestoreData = mapToFirestore(extraFields.toMap());

  // Add any Firestore field values
  extraFields.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExtraFieldsListFirestoreData(
  List<ExtraFieldsStruct>? extraFieldss,
) =>
    extraFieldss?.map((e) => getExtraFieldsFirestoreData(e, true)).toList() ??
    [];
