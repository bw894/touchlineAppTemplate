// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GuestLoginStruct extends FFFirebaseStruct {
  GuestLoginStruct({
    String? userToken,
    String? objectId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userToken = userToken,
        _objectId = objectId,
        super(firestoreUtilData);

  // "user-token" field.
  String? _userToken;
  String get userToken => _userToken ?? '';
  set userToken(String? val) => _userToken = val;

  bool hasUserToken() => _userToken != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  static GuestLoginStruct fromMap(Map<String, dynamic> data) =>
      GuestLoginStruct(
        userToken: data['user-token'] as String?,
        objectId: data['objectId'] as String?,
      );

  static GuestLoginStruct? maybeFromMap(dynamic data) => data is Map
      ? GuestLoginStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user-token': _userToken,
        'objectId': _objectId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user-token': serializeParam(
          _userToken,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
      }.withoutNulls;

  static GuestLoginStruct fromSerializableMap(Map<String, dynamic> data) =>
      GuestLoginStruct(
        userToken: deserializeParam(
          data['user-token'],
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
  String toString() => 'GuestLoginStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GuestLoginStruct &&
        userToken == other.userToken &&
        objectId == other.objectId;
  }

  @override
  int get hashCode => const ListEquality().hash([userToken, objectId]);
}

GuestLoginStruct createGuestLoginStruct({
  String? userToken,
  String? objectId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GuestLoginStruct(
      userToken: userToken,
      objectId: objectId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GuestLoginStruct? updateGuestLoginStruct(
  GuestLoginStruct? guestLogin, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    guestLogin
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGuestLoginStructData(
  Map<String, dynamic> firestoreData,
  GuestLoginStruct? guestLogin,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (guestLogin == null) {
    return;
  }
  if (guestLogin.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && guestLogin.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final guestLoginData = getGuestLoginFirestoreData(guestLogin, forFieldValue);
  final nestedData = guestLoginData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = guestLogin.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGuestLoginFirestoreData(
  GuestLoginStruct? guestLogin, [
  bool forFieldValue = false,
]) {
  if (guestLogin == null) {
    return {};
  }
  final firestoreData = mapToFirestore(guestLogin.toMap());

  // Add any Firestore field values
  guestLogin.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGuestLoginListFirestoreData(
  List<GuestLoginStruct>? guestLogins,
) =>
    guestLogins?.map((e) => getGuestLoginFirestoreData(e, true)).toList() ?? [];
