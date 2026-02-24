// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class GuestLoginStruct extends BaseStruct {
  GuestLoginStruct({
    String? userToken,
    String? objectId,
  })  : _userToken = userToken,
        _objectId = objectId;

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
}) =>
    GuestLoginStruct(
      userToken: userToken,
      objectId: objectId,
    );
