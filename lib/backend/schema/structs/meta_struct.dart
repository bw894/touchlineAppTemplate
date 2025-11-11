// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MetaStruct extends BaseStruct {
  MetaStruct({
    String? location,
    int? position,
  })  : _location = location,
        _position = position;

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
}) =>
    MetaStruct(
      location: location,
      position: position,
    );
