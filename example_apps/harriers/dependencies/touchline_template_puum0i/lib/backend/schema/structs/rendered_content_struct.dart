// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RenderedContentStruct extends FFFirebaseStruct {
  RenderedContentStruct({
    String? rendered,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rendered = rendered,
        super(firestoreUtilData);

  // "rendered" field.
  String? _rendered;
  String get rendered => _rendered ?? '';
  set rendered(String? val) => _rendered = val;

  bool hasRendered() => _rendered != null;

  static RenderedContentStruct fromMap(Map<String, dynamic> data) =>
      RenderedContentStruct(
        rendered: data['rendered'] as String?,
      );

  static RenderedContentStruct? maybeFromMap(dynamic data) => data is Map
      ? RenderedContentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'rendered': _rendered,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rendered': serializeParam(
          _rendered,
          ParamType.String,
        ),
      }.withoutNulls;

  static RenderedContentStruct fromSerializableMap(Map<String, dynamic> data) =>
      RenderedContentStruct(
        rendered: deserializeParam(
          data['rendered'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RenderedContentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RenderedContentStruct && rendered == other.rendered;
  }

  @override
  int get hashCode => const ListEquality().hash([rendered]);
}

RenderedContentStruct createRenderedContentStruct({
  String? rendered,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RenderedContentStruct(
      rendered: rendered,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RenderedContentStruct? updateRenderedContentStruct(
  RenderedContentStruct? renderedContent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    renderedContent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRenderedContentStructData(
  Map<String, dynamic> firestoreData,
  RenderedContentStruct? renderedContent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (renderedContent == null) {
    return;
  }
  if (renderedContent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && renderedContent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final renderedContentData =
      getRenderedContentFirestoreData(renderedContent, forFieldValue);
  final nestedData =
      renderedContentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = renderedContent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRenderedContentFirestoreData(
  RenderedContentStruct? renderedContent, [
  bool forFieldValue = false,
]) {
  if (renderedContent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(renderedContent.toMap());

  // Add any Firestore field values
  renderedContent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRenderedContentListFirestoreData(
  List<RenderedContentStruct>? renderedContents,
) =>
    renderedContents
        ?.map((e) => getRenderedContentFirestoreData(e, true))
        .toList() ??
    [];
