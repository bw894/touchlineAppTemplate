// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResourceIdStruct extends FFFirebaseStruct {
  ResourceIdStruct({
    String? videoId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _videoId = videoId,
        super(firestoreUtilData);

  // "videoId" field.
  String? _videoId;
  String get videoId => _videoId ?? '';
  set videoId(String? val) => _videoId = val;

  bool hasVideoId() => _videoId != null;

  static ResourceIdStruct fromMap(Map<String, dynamic> data) =>
      ResourceIdStruct(
        videoId: data['videoId'] as String?,
      );

  static ResourceIdStruct? maybeFromMap(dynamic data) => data is Map
      ? ResourceIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'videoId': _videoId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'videoId': serializeParam(
          _videoId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ResourceIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResourceIdStruct(
        videoId: deserializeParam(
          data['videoId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ResourceIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResourceIdStruct && videoId == other.videoId;
  }

  @override
  int get hashCode => const ListEquality().hash([videoId]);
}

ResourceIdStruct createResourceIdStruct({
  String? videoId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResourceIdStruct(
      videoId: videoId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResourceIdStruct? updateResourceIdStruct(
  ResourceIdStruct? resourceId, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    resourceId
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResourceIdStructData(
  Map<String, dynamic> firestoreData,
  ResourceIdStruct? resourceId,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (resourceId == null) {
    return;
  }
  if (resourceId.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && resourceId.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final resourceIdData = getResourceIdFirestoreData(resourceId, forFieldValue);
  final nestedData = resourceIdData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = resourceId.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResourceIdFirestoreData(
  ResourceIdStruct? resourceId, [
  bool forFieldValue = false,
]) {
  if (resourceId == null) {
    return {};
  }
  final firestoreData = mapToFirestore(resourceId.toMap());

  // Add any Firestore field values
  resourceId.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResourceIdListFirestoreData(
  List<ResourceIdStruct>? resourceIds,
) =>
    resourceIds?.map((e) => getResourceIdFirestoreData(e, true)).toList() ?? [];
