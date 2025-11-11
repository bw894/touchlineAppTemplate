// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// The schema of a team in the Backendless data table
class BLTeamStruct extends BaseStruct {
  BLTeamStruct({
    String? name,
    String? ownerId,
    int? created,
    int? updated,
    String? objectId,
  })  : _name = name,
        _ownerId = ownerId,
        _created = created,
        _updated = updated,
        _objectId = objectId;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  // "updated" field.
  int? _updated;
  int get updated => _updated ?? 0;
  set updated(int? val) => _updated = val;

  void incrementUpdated(int amount) => updated = updated + amount;

  bool hasUpdated() => _updated != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  static BLTeamStruct fromMap(Map<String, dynamic> data) => BLTeamStruct(
        name: data['name'] as String?,
        ownerId: data['ownerId'] as String?,
        created: castToType<int>(data['created']),
        updated: castToType<int>(data['updated']),
        objectId: data['objectId'] as String?,
      );

  static BLTeamStruct? maybeFromMap(dynamic data) =>
      data is Map ? BLTeamStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'ownerId': _ownerId,
        'created': _created,
        'updated': _updated,
        'objectId': _objectId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'updated': serializeParam(
          _updated,
          ParamType.int,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
      }.withoutNulls;

  static BLTeamStruct fromSerializableMap(Map<String, dynamic> data) =>
      BLTeamStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['ownerId'],
          ParamType.String,
          false,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
        updated: deserializeParam(
          data['updated'],
          ParamType.int,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BLTeamStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BLTeamStruct &&
        name == other.name &&
        ownerId == other.ownerId &&
        created == other.created &&
        updated == other.updated &&
        objectId == other.objectId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, ownerId, created, updated, objectId]);
}

BLTeamStruct createBLTeamStruct({
  String? name,
  String? ownerId,
  int? created,
  int? updated,
  String? objectId,
}) =>
    BLTeamStruct(
      name: name,
      ownerId: ownerId,
      created: created,
      updated: updated,
      objectId: objectId,
    );
