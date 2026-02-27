// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormEntriesStruct extends FFFirebaseStruct {
  FormEntriesStruct({
    String? email,
    String? name,
    String? uid,
    String? ownerId,
    String? objectId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _email = email,
        _name = name,
        _uid = uid,
        _ownerId = ownerId,
        _objectId = objectId,
        super(firestoreUtilData);

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  static FormEntriesStruct fromMap(Map<String, dynamic> data) =>
      FormEntriesStruct(
        email: data['email'] as String?,
        name: data['name'] as String?,
        uid: data['uid'] as String?,
        ownerId: data['ownerId'] as String?,
        objectId: data['objectId'] as String?,
      );

  static FormEntriesStruct? maybeFromMap(dynamic data) => data is Map
      ? FormEntriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'name': _name,
        'uid': _uid,
        'ownerId': _ownerId,
        'objectId': _objectId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
      }.withoutNulls;

  static FormEntriesStruct fromSerializableMap(Map<String, dynamic> data) =>
      FormEntriesStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['ownerId'],
          ParamType.String,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FormEntriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FormEntriesStruct &&
        email == other.email &&
        name == other.name &&
        uid == other.uid &&
        ownerId == other.ownerId &&
        objectId == other.objectId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([email, name, uid, ownerId, objectId]);
}

FormEntriesStruct createFormEntriesStruct({
  String? email,
  String? name,
  String? uid,
  String? ownerId,
  String? objectId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FormEntriesStruct(
      email: email,
      name: name,
      uid: uid,
      ownerId: ownerId,
      objectId: objectId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FormEntriesStruct? updateFormEntriesStruct(
  FormEntriesStruct? formEntries, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    formEntries
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFormEntriesStructData(
  Map<String, dynamic> firestoreData,
  FormEntriesStruct? formEntries,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (formEntries == null) {
    return;
  }
  if (formEntries.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && formEntries.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final formEntriesData =
      getFormEntriesFirestoreData(formEntries, forFieldValue);
  final nestedData =
      formEntriesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = formEntries.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFormEntriesFirestoreData(
  FormEntriesStruct? formEntries, [
  bool forFieldValue = false,
]) {
  if (formEntries == null) {
    return {};
  }
  final firestoreData = mapToFirestore(formEntries.toMap());

  // Add any Firestore field values
  formEntries.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFormEntriesListFirestoreData(
  List<FormEntriesStruct>? formEntriess,
) =>
    formEntriess?.map((e) => getFormEntriesFirestoreData(e, true)).toList() ??
    [];
