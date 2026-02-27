// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopCredsStruct extends FFFirebaseStruct {
  ShopCredsStruct({
    String? keyyyy,
    String? secret,
    bool? live,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _keyyyy = keyyyy,
        _secret = secret,
        _live = live,
        super(firestoreUtilData);

  // "keyyyy" field.
  String? _keyyyy;
  String get keyyyy => _keyyyy ?? '';
  set keyyyy(String? val) => _keyyyy = val;

  bool hasKeyyyy() => _keyyyy != null;

  // "secret" field.
  String? _secret;
  String get secret => _secret ?? '';
  set secret(String? val) => _secret = val;

  bool hasSecret() => _secret != null;

  // "live" field.
  bool? _live;
  bool get live => _live ?? true;
  set live(bool? val) => _live = val;

  bool hasLive() => _live != null;

  static ShopCredsStruct fromMap(Map<String, dynamic> data) => ShopCredsStruct(
        keyyyy: data['keyyyy'] as String?,
        secret: data['secret'] as String?,
        live: data['live'] as bool?,
      );

  static ShopCredsStruct? maybeFromMap(dynamic data) => data is Map
      ? ShopCredsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'keyyyy': _keyyyy,
        'secret': _secret,
        'live': _live,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'keyyyy': serializeParam(
          _keyyyy,
          ParamType.String,
        ),
        'secret': serializeParam(
          _secret,
          ParamType.String,
        ),
        'live': serializeParam(
          _live,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ShopCredsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShopCredsStruct(
        keyyyy: deserializeParam(
          data['keyyyy'],
          ParamType.String,
          false,
        ),
        secret: deserializeParam(
          data['secret'],
          ParamType.String,
          false,
        ),
        live: deserializeParam(
          data['live'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ShopCredsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShopCredsStruct &&
        keyyyy == other.keyyyy &&
        secret == other.secret &&
        live == other.live;
  }

  @override
  int get hashCode => const ListEquality().hash([keyyyy, secret, live]);
}

ShopCredsStruct createShopCredsStruct({
  String? keyyyy,
  String? secret,
  bool? live,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShopCredsStruct(
      keyyyy: keyyyy,
      secret: secret,
      live: live,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShopCredsStruct? updateShopCredsStruct(
  ShopCredsStruct? shopCreds, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    shopCreds
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShopCredsStructData(
  Map<String, dynamic> firestoreData,
  ShopCredsStruct? shopCreds,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shopCreds == null) {
    return;
  }
  if (shopCreds.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && shopCreds.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shopCredsData = getShopCredsFirestoreData(shopCreds, forFieldValue);
  final nestedData = shopCredsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = shopCreds.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShopCredsFirestoreData(
  ShopCredsStruct? shopCreds, [
  bool forFieldValue = false,
]) {
  if (shopCreds == null) {
    return {};
  }
  final firestoreData = mapToFirestore(shopCreds.toMap());

  // Add any Firestore field values
  shopCreds.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShopCredsListFirestoreData(
  List<ShopCredsStruct>? shopCredss,
) =>
    shopCredss?.map((e) => getShopCredsFirestoreData(e, true)).toList() ?? [];
