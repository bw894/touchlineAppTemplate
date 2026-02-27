// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClubPolicyStruct extends FFFirebaseStruct {
  ClubPolicyStruct({
    String? name,
    String? redirectUrl,
    String? objectId,
    int? sortOrder,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _redirectUrl = redirectUrl,
        _objectId = objectId,
        _sortOrder = sortOrder,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "redirectUrl" field.
  String? _redirectUrl;
  String get redirectUrl => _redirectUrl ?? '';
  set redirectUrl(String? val) => _redirectUrl = val;

  bool hasRedirectUrl() => _redirectUrl != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "sortOrder" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 10;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  static ClubPolicyStruct fromMap(Map<String, dynamic> data) =>
      ClubPolicyStruct(
        name: data['name'] as String?,
        redirectUrl: data['redirectUrl'] as String?,
        objectId: data['objectId'] as String?,
        sortOrder: castToType<int>(data['sortOrder']),
      );

  static ClubPolicyStruct? maybeFromMap(dynamic data) => data is Map
      ? ClubPolicyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'redirectUrl': _redirectUrl,
        'objectId': _objectId,
        'sortOrder': _sortOrder,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'redirectUrl': serializeParam(
          _redirectUrl,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'sortOrder': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
      }.withoutNulls;

  static ClubPolicyStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClubPolicyStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        redirectUrl: deserializeParam(
          data['redirectUrl'],
          ParamType.String,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        sortOrder: deserializeParam(
          data['sortOrder'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ClubPolicyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ClubPolicyStruct &&
        name == other.name &&
        redirectUrl == other.redirectUrl &&
        objectId == other.objectId &&
        sortOrder == other.sortOrder;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, redirectUrl, objectId, sortOrder]);
}

ClubPolicyStruct createClubPolicyStruct({
  String? name,
  String? redirectUrl,
  String? objectId,
  int? sortOrder,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ClubPolicyStruct(
      name: name,
      redirectUrl: redirectUrl,
      objectId: objectId,
      sortOrder: sortOrder,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ClubPolicyStruct? updateClubPolicyStruct(
  ClubPolicyStruct? clubPolicy, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    clubPolicy
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addClubPolicyStructData(
  Map<String, dynamic> firestoreData,
  ClubPolicyStruct? clubPolicy,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (clubPolicy == null) {
    return;
  }
  if (clubPolicy.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && clubPolicy.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final clubPolicyData = getClubPolicyFirestoreData(clubPolicy, forFieldValue);
  final nestedData = clubPolicyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = clubPolicy.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getClubPolicyFirestoreData(
  ClubPolicyStruct? clubPolicy, [
  bool forFieldValue = false,
]) {
  if (clubPolicy == null) {
    return {};
  }
  final firestoreData = mapToFirestore(clubPolicy.toMap());

  // Add any Firestore field values
  clubPolicy.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getClubPolicyListFirestoreData(
  List<ClubPolicyStruct>? clubPolicys,
) =>
    clubPolicys?.map((e) => getClubPolicyFirestoreData(e, true)).toList() ?? [];
