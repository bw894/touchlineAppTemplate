// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormFieldsStruct extends FFFirebaseStruct {
  FormFieldsStruct({
    String? hint,
    String? label,
    int? page,
    String? question,
    String? subtext,
    String? type,
    String? ownerId,
    String? objectId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _hint = hint,
        _label = label,
        _page = page,
        _question = question,
        _subtext = subtext,
        _type = type,
        _ownerId = ownerId,
        _objectId = objectId,
        super(firestoreUtilData);

  // "hint" field.
  String? _hint;
  String get hint => _hint ?? '';
  set hint(String? val) => _hint = val;

  bool hasHint() => _hint != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "page" field.
  int? _page;
  int get page => _page ?? 0;
  set page(int? val) => _page = val;

  void incrementPage(int amount) => page = page + amount;

  bool hasPage() => _page != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "subtext" field.
  String? _subtext;
  String get subtext => _subtext ?? '';
  set subtext(String? val) => _subtext = val;

  bool hasSubtext() => _subtext != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

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

  static FormFieldsStruct fromMap(Map<String, dynamic> data) =>
      FormFieldsStruct(
        hint: data['hint'] as String?,
        label: data['label'] as String?,
        page: castToType<int>(data['page']),
        question: data['question'] as String?,
        subtext: data['subtext'] as String?,
        type: data['type'] as String?,
        ownerId: data['ownerId'] as String?,
        objectId: data['objectId'] as String?,
      );

  static FormFieldsStruct? maybeFromMap(dynamic data) => data is Map
      ? FormFieldsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'hint': _hint,
        'label': _label,
        'page': _page,
        'question': _question,
        'subtext': _subtext,
        'type': _type,
        'ownerId': _ownerId,
        'objectId': _objectId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'hint': serializeParam(
          _hint,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'page': serializeParam(
          _page,
          ParamType.int,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'subtext': serializeParam(
          _subtext,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
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

  static FormFieldsStruct fromSerializableMap(Map<String, dynamic> data) =>
      FormFieldsStruct(
        hint: deserializeParam(
          data['hint'],
          ParamType.String,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        page: deserializeParam(
          data['page'],
          ParamType.int,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        subtext: deserializeParam(
          data['subtext'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
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
  String toString() => 'FormFieldsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FormFieldsStruct &&
        hint == other.hint &&
        label == other.label &&
        page == other.page &&
        question == other.question &&
        subtext == other.subtext &&
        type == other.type &&
        ownerId == other.ownerId &&
        objectId == other.objectId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([hint, label, page, question, subtext, type, ownerId, objectId]);
}

FormFieldsStruct createFormFieldsStruct({
  String? hint,
  String? label,
  int? page,
  String? question,
  String? subtext,
  String? type,
  String? ownerId,
  String? objectId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FormFieldsStruct(
      hint: hint,
      label: label,
      page: page,
      question: question,
      subtext: subtext,
      type: type,
      ownerId: ownerId,
      objectId: objectId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FormFieldsStruct? updateFormFieldsStruct(
  FormFieldsStruct? formFields, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    formFields
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFormFieldsStructData(
  Map<String, dynamic> firestoreData,
  FormFieldsStruct? formFields,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (formFields == null) {
    return;
  }
  if (formFields.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && formFields.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final formFieldsData = getFormFieldsFirestoreData(formFields, forFieldValue);
  final nestedData = formFieldsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = formFields.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFormFieldsFirestoreData(
  FormFieldsStruct? formFields, [
  bool forFieldValue = false,
]) {
  if (formFields == null) {
    return {};
  }
  final firestoreData = mapToFirestore(formFields.toMap());

  // Add any Firestore field values
  formFields.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFormFieldsListFirestoreData(
  List<FormFieldsStruct>? formFieldss,
) =>
    formFieldss?.map((e) => getFormFieldsFirestoreData(e, true)).toList() ?? [];
