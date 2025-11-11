// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScoresStruct extends BaseStruct {
  ScoresStruct({
    int? id,
    ScoreStruct? score,
    int? typeId,
    int? fixtureId,
    String? description,
    int? participantId,
  })  : _id = id,
        _score = score,
        _typeId = typeId,
        _fixtureId = fixtureId,
        _description = description,
        _participantId = participantId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "score" field.
  ScoreStruct? _score;
  ScoreStruct get score => _score ?? ScoreStruct();
  set score(ScoreStruct? val) => _score = val;

  void updateScore(Function(ScoreStruct) updateFn) {
    updateFn(_score ??= ScoreStruct());
  }

  bool hasScore() => _score != null;

  // "type_id" field.
  int? _typeId;
  int get typeId => _typeId ?? 0;
  set typeId(int? val) => _typeId = val;

  void incrementTypeId(int amount) => typeId = typeId + amount;

  bool hasTypeId() => _typeId != null;

  // "fixture_id" field.
  int? _fixtureId;
  int get fixtureId => _fixtureId ?? 0;
  set fixtureId(int? val) => _fixtureId = val;

  void incrementFixtureId(int amount) => fixtureId = fixtureId + amount;

  bool hasFixtureId() => _fixtureId != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "participant_id" field.
  int? _participantId;
  int get participantId => _participantId ?? 0;
  set participantId(int? val) => _participantId = val;

  void incrementParticipantId(int amount) =>
      participantId = participantId + amount;

  bool hasParticipantId() => _participantId != null;

  static ScoresStruct fromMap(Map<String, dynamic> data) => ScoresStruct(
        id: castToType<int>(data['id']),
        score: data['score'] is ScoreStruct
            ? data['score']
            : ScoreStruct.maybeFromMap(data['score']),
        typeId: castToType<int>(data['type_id']),
        fixtureId: castToType<int>(data['fixture_id']),
        description: data['description'] as String?,
        participantId: castToType<int>(data['participant_id']),
      );

  static ScoresStruct? maybeFromMap(dynamic data) =>
      data is Map ? ScoresStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'score': _score?.toMap(),
        'type_id': _typeId,
        'fixture_id': _fixtureId,
        'description': _description,
        'participant_id': _participantId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'score': serializeParam(
          _score,
          ParamType.DataStruct,
        ),
        'type_id': serializeParam(
          _typeId,
          ParamType.int,
        ),
        'fixture_id': serializeParam(
          _fixtureId,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'participant_id': serializeParam(
          _participantId,
          ParamType.int,
        ),
      }.withoutNulls;

  static ScoresStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScoresStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        score: deserializeStructParam(
          data['score'],
          ParamType.DataStruct,
          false,
          structBuilder: ScoreStruct.fromSerializableMap,
        ),
        typeId: deserializeParam(
          data['type_id'],
          ParamType.int,
          false,
        ),
        fixtureId: deserializeParam(
          data['fixture_id'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        participantId: deserializeParam(
          data['participant_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ScoresStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScoresStruct &&
        id == other.id &&
        score == other.score &&
        typeId == other.typeId &&
        fixtureId == other.fixtureId &&
        description == other.description &&
        participantId == other.participantId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, score, typeId, fixtureId, description, participantId]);
}

ScoresStruct createScoresStruct({
  int? id,
  ScoreStruct? score,
  int? typeId,
  int? fixtureId,
  String? description,
  int? participantId,
}) =>
    ScoresStruct(
      id: id,
      score: score ?? ScoreStruct(),
      typeId: typeId,
      fixtureId: fixtureId,
      description: description,
      participantId: participantId,
    );
