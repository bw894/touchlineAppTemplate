// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class ScoreStruct extends BaseStruct {
  ScoreStruct({
    int? goals,
    String? participant,
  })  : _goals = goals,
        _participant = participant;

  // "goals" field.
  int? _goals;
  int get goals => _goals ?? 0;
  set goals(int? val) => _goals = val;

  void incrementGoals(int amount) => goals = goals + amount;

  bool hasGoals() => _goals != null;

  // "participant" field.
  String? _participant;
  String get participant => _participant ?? '';
  set participant(String? val) => _participant = val;

  bool hasParticipant() => _participant != null;

  static ScoreStruct fromMap(Map<String, dynamic> data) => ScoreStruct(
        goals: castToType<int>(data['goals']),
        participant: data['participant'] as String?,
      );

  static ScoreStruct? maybeFromMap(dynamic data) =>
      data is Map ? ScoreStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'goals': _goals,
        'participant': _participant,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'goals': serializeParam(
          _goals,
          ParamType.int,
        ),
        'participant': serializeParam(
          _participant,
          ParamType.String,
        ),
      }.withoutNulls;

  static ScoreStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScoreStruct(
        goals: deserializeParam(
          data['goals'],
          ParamType.int,
          false,
        ),
        participant: deserializeParam(
          data['participant'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ScoreStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScoreStruct &&
        goals == other.goals &&
        participant == other.participant;
  }

  @override
  int get hashCode => const ListEquality().hash([goals, participant]);
}

ScoreStruct createScoreStruct({
  int? goals,
  String? participant,
}) =>
    ScoreStruct(
      goals: goals,
      participant: participant,
    );
