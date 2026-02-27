// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScoreStruct extends FFFirebaseStruct {
  ScoreStruct({
    int? goals,
    String? participant,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _goals = goals,
        _participant = participant,
        super(firestoreUtilData);

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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ScoreStruct(
      goals: goals,
      participant: participant,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ScoreStruct? updateScoreStruct(
  ScoreStruct? score, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    score
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addScoreStructData(
  Map<String, dynamic> firestoreData,
  ScoreStruct? score,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (score == null) {
    return;
  }
  if (score.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && score.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final scoreData = getScoreFirestoreData(score, forFieldValue);
  final nestedData = scoreData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = score.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getScoreFirestoreData(
  ScoreStruct? score, [
  bool forFieldValue = false,
]) {
  if (score == null) {
    return {};
  }
  final firestoreData = mapToFirestore(score.toMap());

  // Add any Firestore field values
  score.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getScoreListFirestoreData(
  List<ScoreStruct>? scores,
) =>
    scores?.map((e) => getScoreFirestoreData(e, true)).toList() ?? [];
