// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SnippetStruct extends FFFirebaseStruct {
  SnippetStruct({
    String? title,
    String? description,
    ThumbnailsStruct? thumbnails,
    ResourceIdStruct? resourceId,
    String? publishedAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        _thumbnails = thumbnails,
        _resourceId = resourceId,
        _publishedAt = publishedAt,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "thumbnails" field.
  ThumbnailsStruct? _thumbnails;
  ThumbnailsStruct get thumbnails => _thumbnails ?? ThumbnailsStruct();
  set thumbnails(ThumbnailsStruct? val) => _thumbnails = val;

  void updateThumbnails(Function(ThumbnailsStruct) updateFn) {
    updateFn(_thumbnails ??= ThumbnailsStruct());
  }

  bool hasThumbnails() => _thumbnails != null;

  // "resourceId" field.
  ResourceIdStruct? _resourceId;
  ResourceIdStruct get resourceId => _resourceId ?? ResourceIdStruct();
  set resourceId(ResourceIdStruct? val) => _resourceId = val;

  void updateResourceId(Function(ResourceIdStruct) updateFn) {
    updateFn(_resourceId ??= ResourceIdStruct());
  }

  bool hasResourceId() => _resourceId != null;

  // "publishedAt" field.
  String? _publishedAt;
  String get publishedAt => _publishedAt ?? '';
  set publishedAt(String? val) => _publishedAt = val;

  bool hasPublishedAt() => _publishedAt != null;

  static SnippetStruct fromMap(Map<String, dynamic> data) => SnippetStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        thumbnails: data['thumbnails'] is ThumbnailsStruct
            ? data['thumbnails']
            : ThumbnailsStruct.maybeFromMap(data['thumbnails']),
        resourceId: data['resourceId'] is ResourceIdStruct
            ? data['resourceId']
            : ResourceIdStruct.maybeFromMap(data['resourceId']),
        publishedAt: data['publishedAt'] as String?,
      );

  static SnippetStruct? maybeFromMap(dynamic data) =>
      data is Map ? SnippetStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'thumbnails': _thumbnails?.toMap(),
        'resourceId': _resourceId?.toMap(),
        'publishedAt': _publishedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'thumbnails': serializeParam(
          _thumbnails,
          ParamType.DataStruct,
        ),
        'resourceId': serializeParam(
          _resourceId,
          ParamType.DataStruct,
        ),
        'publishedAt': serializeParam(
          _publishedAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static SnippetStruct fromSerializableMap(Map<String, dynamic> data) =>
      SnippetStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        thumbnails: deserializeStructParam(
          data['thumbnails'],
          ParamType.DataStruct,
          false,
          structBuilder: ThumbnailsStruct.fromSerializableMap,
        ),
        resourceId: deserializeStructParam(
          data['resourceId'],
          ParamType.DataStruct,
          false,
          structBuilder: ResourceIdStruct.fromSerializableMap,
        ),
        publishedAt: deserializeParam(
          data['publishedAt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SnippetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SnippetStruct &&
        title == other.title &&
        description == other.description &&
        thumbnails == other.thumbnails &&
        resourceId == other.resourceId &&
        publishedAt == other.publishedAt;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, description, thumbnails, resourceId, publishedAt]);
}

SnippetStruct createSnippetStruct({
  String? title,
  String? description,
  ThumbnailsStruct? thumbnails,
  ResourceIdStruct? resourceId,
  String? publishedAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SnippetStruct(
      title: title,
      description: description,
      thumbnails: thumbnails ?? (clearUnsetFields ? ThumbnailsStruct() : null),
      resourceId: resourceId ?? (clearUnsetFields ? ResourceIdStruct() : null),
      publishedAt: publishedAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SnippetStruct? updateSnippetStruct(
  SnippetStruct? snippet, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    snippet
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSnippetStructData(
  Map<String, dynamic> firestoreData,
  SnippetStruct? snippet,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (snippet == null) {
    return;
  }
  if (snippet.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && snippet.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final snippetData = getSnippetFirestoreData(snippet, forFieldValue);
  final nestedData = snippetData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = snippet.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSnippetFirestoreData(
  SnippetStruct? snippet, [
  bool forFieldValue = false,
]) {
  if (snippet == null) {
    return {};
  }
  final firestoreData = mapToFirestore(snippet.toMap());

  // Handle nested data for "thumbnails" field.
  addThumbnailsStructData(
    firestoreData,
    snippet.hasThumbnails() ? snippet.thumbnails : null,
    'thumbnails',
    forFieldValue,
  );

  // Handle nested data for "resourceId" field.
  addResourceIdStructData(
    firestoreData,
    snippet.hasResourceId() ? snippet.resourceId : null,
    'resourceId',
    forFieldValue,
  );

  // Add any Firestore field values
  snippet.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSnippetListFirestoreData(
  List<SnippetStruct>? snippets,
) =>
    snippets?.map((e) => getSnippetFirestoreData(e, true)).toList() ?? [];
