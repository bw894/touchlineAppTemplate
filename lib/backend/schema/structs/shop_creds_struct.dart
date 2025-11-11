// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopCredsStruct extends BaseStruct {
  ShopCredsStruct({
    String? keyyyy,
    String? secret,
    bool? live,
  })  : _keyyyy = keyyyy,
        _secret = secret,
        _live = live;

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
}) =>
    ShopCredsStruct(
      keyyyy: keyyyy,
      secret: secret,
      live: live,
    );
