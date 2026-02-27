// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizQuestionOptionsStruct extends FFFirebaseStruct {
  QuizQuestionOptionsStruct({
    bool? correct,
    String? image,
    int? sortOrder,
    String? title,
    String? ownerId,
    String? objectId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _correct = correct,
        _image = image,
        _sortOrder = sortOrder,
        _title = title,
        _ownerId = ownerId,
        _objectId = objectId,
        super(firestoreUtilData);

  // "correct" field.
  bool? _correct;
  bool get correct => _correct ?? false;
  set correct(bool? val) => _correct = val;

  bool hasCorrect() => _correct != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "sortOrder" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  static QuizQuestionOptionsStruct fromMap(Map<String, dynamic> data) =>
      QuizQuestionOptionsStruct(
        correct: data['correct'] as bool?,
        image: data['image'] as String?,
        sortOrder: castToType<int>(data['sortOrder']),
        title: data['title'] as String?,
        ownerId: data['ownerId'] as String?,
        objectId: data['objectId'] as String?,
      );

  static QuizQuestionOptionsStruct? maybeFromMap(dynamic data) => data is Map
      ? QuizQuestionOptionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'correct': _correct,
        'image': _image,
        'sortOrder': _sortOrder,
        'title': _title,
        'ownerId': _ownerId,
        'objectId': _objectId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'correct': serializeParam(
          _correct,
          ParamType.bool,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'sortOrder': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuizQuestionOptionsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      QuizQuestionOptionsStruct(
        correct: deserializeParam(
          data['correct'],
          ParamType.bool,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        sortOrder: deserializeParam(
          data['sortOrder'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['ownerId'],
          ParamType.String,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuizQuestionOptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuizQuestionOptionsStruct &&
        correct == other.correct &&
        image == other.image &&
        sortOrder == other.sortOrder &&
        title == other.title &&
        ownerId == other.ownerId &&
        objectId == other.objectId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([correct, image, sortOrder, title, ownerId, objectId]);
}

QuizQuestionOptionsStruct createQuizQuestionOptionsStruct({
  bool? correct,
  String? image,
  int? sortOrder,
  String? title,
  String? ownerId,
  String? objectId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuizQuestionOptionsStruct(
      correct: correct,
      image: image,
      sortOrder: sortOrder,
      title: title,
      ownerId: ownerId,
      objectId: objectId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuizQuestionOptionsStruct? updateQuizQuestionOptionsStruct(
  QuizQuestionOptionsStruct? quizQuestionOptions, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    quizQuestionOptions
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuizQuestionOptionsStructData(
  Map<String, dynamic> firestoreData,
  QuizQuestionOptionsStruct? quizQuestionOptions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (quizQuestionOptions == null) {
    return;
  }
  if (quizQuestionOptions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && quizQuestionOptions.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final quizQuestionOptionsData =
      getQuizQuestionOptionsFirestoreData(quizQuestionOptions, forFieldValue);
  final nestedData =
      quizQuestionOptionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      quizQuestionOptions.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuizQuestionOptionsFirestoreData(
  QuizQuestionOptionsStruct? quizQuestionOptions, [
  bool forFieldValue = false,
]) {
  if (quizQuestionOptions == null) {
    return {};
  }
  final firestoreData = mapToFirestore(quizQuestionOptions.toMap());

  // Add any Firestore field values
  quizQuestionOptions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuizQuestionOptionsListFirestoreData(
  List<QuizQuestionOptionsStruct>? quizQuestionOptionss,
) =>
    quizQuestionOptionss
        ?.map((e) => getQuizQuestionOptionsFirestoreData(e, true))
        .toList() ??
    [];
