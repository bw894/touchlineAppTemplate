// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamRequestStruct extends BaseStruct {
  TeamRequestStruct({
    String? note,
    TeamStruct? team,
    String? objectId,
    String? ownerId,
    int? created,
  })  : _note = note,
        _team = team,
        _objectId = objectId,
        _ownerId = ownerId,
        _created = created;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "team" field.
  TeamStruct? _team;
  TeamStruct get team => _team ?? TeamStruct();
  set team(TeamStruct? val) => _team = val;

  void updateTeam(Function(TeamStruct) updateFn) {
    updateFn(_team ??= TeamStruct());
  }

  bool hasTeam() => _team != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

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

  static TeamRequestStruct fromMap(Map<String, dynamic> data) =>
      TeamRequestStruct(
        note: data['note'] as String?,
        team: data['team'] is TeamStruct
            ? data['team']
            : TeamStruct.maybeFromMap(data['team']),
        objectId: data['objectId'] as String?,
        ownerId: data['ownerId'] as String?,
        created: castToType<int>(data['created']),
      );

  static TeamRequestStruct? maybeFromMap(dynamic data) => data is Map
      ? TeamRequestStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'note': _note,
        'team': _team?.toMap(),
        'objectId': _objectId,
        'ownerId': _ownerId,
        'created': _created,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'team': serializeParam(
          _team,
          ParamType.DataStruct,
        ),
        'objectId': serializeParam(
          _objectId,
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
      }.withoutNulls;

  static TeamRequestStruct fromSerializableMap(Map<String, dynamic> data) =>
      TeamRequestStruct(
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        team: deserializeStructParam(
          data['team'],
          ParamType.DataStruct,
          false,
          structBuilder: TeamStruct.fromSerializableMap,
        ),
        objectId: deserializeParam(
          data['objectId'],
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
      );

  @override
  String toString() => 'TeamRequestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TeamRequestStruct &&
        note == other.note &&
        team == other.team &&
        objectId == other.objectId &&
        ownerId == other.ownerId &&
        created == other.created;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([note, team, objectId, ownerId, created]);
}

TeamRequestStruct createTeamRequestStruct({
  String? note,
  TeamStruct? team,
  String? objectId,
  String? ownerId,
  int? created,
}) =>
    TeamRequestStruct(
      note: note,
      team: team ?? TeamStruct(),
      objectId: objectId,
      ownerId: ownerId,
      created: created,
    );
