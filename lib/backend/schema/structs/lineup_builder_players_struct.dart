// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LineupBuilderPlayersStruct extends BaseStruct {
  LineupBuilderPlayersStruct({
    String? name,
    int? number,
    String? image,
    String? objectId,
    int? index,
    bool? added,
  })  : _name = name,
        _number = number,
        _image = image,
        _objectId = objectId,
        _index = index,
        _added = added;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;

  void incrementNumber(int amount) => number = number + amount;

  bool hasNumber() => _number != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;

  void incrementIndex(int amount) => index = index + amount;

  bool hasIndex() => _index != null;

  // "added" field.
  bool? _added;
  bool get added => _added ?? false;
  set added(bool? val) => _added = val;

  bool hasAdded() => _added != null;

  static LineupBuilderPlayersStruct fromMap(Map<String, dynamic> data) =>
      LineupBuilderPlayersStruct(
        name: data['name'] as String?,
        number: castToType<int>(data['number']),
        image: data['image'] as String?,
        objectId: data['objectId'] as String?,
        index: castToType<int>(data['index']),
        added: data['added'] as bool?,
      );

  static LineupBuilderPlayersStruct? maybeFromMap(dynamic data) => data is Map
      ? LineupBuilderPlayersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'number': _number,
        'image': _image,
        'objectId': _objectId,
        'index': _index,
        'added': _added,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
        'added': serializeParam(
          _added,
          ParamType.bool,
        ),
      }.withoutNulls;

  static LineupBuilderPlayersStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LineupBuilderPlayersStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
        added: deserializeParam(
          data['added'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'LineupBuilderPlayersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LineupBuilderPlayersStruct &&
        name == other.name &&
        number == other.number &&
        image == other.image &&
        objectId == other.objectId &&
        index == other.index &&
        added == other.added;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, number, image, objectId, index, added]);
}

LineupBuilderPlayersStruct createLineupBuilderPlayersStruct({
  String? name,
  int? number,
  String? image,
  String? objectId,
  int? index,
  bool? added,
}) =>
    LineupBuilderPlayersStruct(
      name: name,
      number: number,
      image: image,
      objectId: objectId,
      index: index,
      added: added,
    );
