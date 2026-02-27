// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizEntriesStruct extends FFFirebaseStruct {
  QuizEntriesStruct({
    String? email,
    String? name,
    int? pointsScored,
    int? totalPointsAvailable,
    String? uid,
    String? objectId,
    String? ownerId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _email = email,
        _name = name,
        _pointsScored = pointsScored,
        _totalPointsAvailable = totalPointsAvailable,
        _uid = uid,
        _objectId = objectId,
        _ownerId = ownerId,
        super(firestoreUtilData);

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "pointsScored" field.
  int? _pointsScored;
  int get pointsScored => _pointsScored ?? 0;
  set pointsScored(int? val) => _pointsScored = val;

  void incrementPointsScored(int amount) =>
      pointsScored = pointsScored + amount;

  bool hasPointsScored() => _pointsScored != null;

  // "totalPointsAvailable" field.
  int? _totalPointsAvailable;
  int get totalPointsAvailable => _totalPointsAvailable ?? 0;
  set totalPointsAvailable(int? val) => _totalPointsAvailable = val;

  void incrementTotalPointsAvailable(int amount) =>
      totalPointsAvailable = totalPointsAvailable + amount;

  bool hasTotalPointsAvailable() => _totalPointsAvailable != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

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

  static QuizEntriesStruct fromMap(Map<String, dynamic> data) =>
      QuizEntriesStruct(
        email: data['email'] as String?,
        name: data['name'] as String?,
        pointsScored: castToType<int>(data['pointsScored']),
        totalPointsAvailable: castToType<int>(data['totalPointsAvailable']),
        uid: data['uid'] as String?,
        objectId: data['objectId'] as String?,
        ownerId: data['ownerId'] as String?,
      );

  static QuizEntriesStruct? maybeFromMap(dynamic data) => data is Map
      ? QuizEntriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'name': _name,
        'pointsScored': _pointsScored,
        'totalPointsAvailable': _totalPointsAvailable,
        'uid': _uid,
        'objectId': _objectId,
        'ownerId': _ownerId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'pointsScored': serializeParam(
          _pointsScored,
          ParamType.int,
        ),
        'totalPointsAvailable': serializeParam(
          _totalPointsAvailable,
          ParamType.int,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuizEntriesStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuizEntriesStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        pointsScored: deserializeParam(
          data['pointsScored'],
          ParamType.int,
          false,
        ),
        totalPointsAvailable: deserializeParam(
          data['totalPointsAvailable'],
          ParamType.int,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
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
      );

  @override
  String toString() => 'QuizEntriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuizEntriesStruct &&
        email == other.email &&
        name == other.name &&
        pointsScored == other.pointsScored &&
        totalPointsAvailable == other.totalPointsAvailable &&
        uid == other.uid &&
        objectId == other.objectId &&
        ownerId == other.ownerId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        email,
        name,
        pointsScored,
        totalPointsAvailable,
        uid,
        objectId,
        ownerId
      ]);
}

QuizEntriesStruct createQuizEntriesStruct({
  String? email,
  String? name,
  int? pointsScored,
  int? totalPointsAvailable,
  String? uid,
  String? objectId,
  String? ownerId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuizEntriesStruct(
      email: email,
      name: name,
      pointsScored: pointsScored,
      totalPointsAvailable: totalPointsAvailable,
      uid: uid,
      objectId: objectId,
      ownerId: ownerId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuizEntriesStruct? updateQuizEntriesStruct(
  QuizEntriesStruct? quizEntries, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    quizEntries
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuizEntriesStructData(
  Map<String, dynamic> firestoreData,
  QuizEntriesStruct? quizEntries,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (quizEntries == null) {
    return;
  }
  if (quizEntries.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && quizEntries.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final quizEntriesData =
      getQuizEntriesFirestoreData(quizEntries, forFieldValue);
  final nestedData =
      quizEntriesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = quizEntries.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuizEntriesFirestoreData(
  QuizEntriesStruct? quizEntries, [
  bool forFieldValue = false,
]) {
  if (quizEntries == null) {
    return {};
  }
  final firestoreData = mapToFirestore(quizEntries.toMap());

  // Add any Firestore field values
  quizEntries.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuizEntriesListFirestoreData(
  List<QuizEntriesStruct>? quizEntriess,
) =>
    quizEntriess?.map((e) => getQuizEntriesFirestoreData(e, true)).toList() ??
    [];
