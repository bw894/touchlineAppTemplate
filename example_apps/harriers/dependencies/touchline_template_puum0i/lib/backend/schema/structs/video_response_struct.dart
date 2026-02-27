// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoResponseStruct extends FFFirebaseStruct {
  VideoResponseStruct({
    List<ItemsStruct>? items,
    String? nextPageToken,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _items = items,
        _nextPageToken = nextPageToken,
        super(firestoreUtilData);

  // "items" field.
  List<ItemsStruct>? _items;
  List<ItemsStruct> get items => _items ?? const [];
  set items(List<ItemsStruct>? val) => _items = val;

  void updateItems(Function(List<ItemsStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  // "nextPageToken" field.
  String? _nextPageToken;
  String get nextPageToken => _nextPageToken ?? '';
  set nextPageToken(String? val) => _nextPageToken = val;

  bool hasNextPageToken() => _nextPageToken != null;

  static VideoResponseStruct fromMap(Map<String, dynamic> data) =>
      VideoResponseStruct(
        items: getStructList(
          data['items'],
          ItemsStruct.fromMap,
        ),
        nextPageToken: data['nextPageToken'] as String?,
      );

  static VideoResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? VideoResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'items': _items?.map((e) => e.toMap()).toList(),
        'nextPageToken': _nextPageToken,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
        'nextPageToken': serializeParam(
          _nextPageToken,
          ParamType.String,
        ),
      }.withoutNulls;

  static VideoResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideoResponseStruct(
        items: deserializeStructParam<ItemsStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: ItemsStruct.fromSerializableMap,
        ),
        nextPageToken: deserializeParam(
          data['nextPageToken'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VideoResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VideoResponseStruct &&
        listEquality.equals(items, other.items) &&
        nextPageToken == other.nextPageToken;
  }

  @override
  int get hashCode => const ListEquality().hash([items, nextPageToken]);
}

VideoResponseStruct createVideoResponseStruct({
  String? nextPageToken,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VideoResponseStruct(
      nextPageToken: nextPageToken,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VideoResponseStruct? updateVideoResponseStruct(
  VideoResponseStruct? videoResponse, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    videoResponse
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVideoResponseStructData(
  Map<String, dynamic> firestoreData,
  VideoResponseStruct? videoResponse,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (videoResponse == null) {
    return;
  }
  if (videoResponse.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && videoResponse.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final videoResponseData =
      getVideoResponseFirestoreData(videoResponse, forFieldValue);
  final nestedData =
      videoResponseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = videoResponse.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVideoResponseFirestoreData(
  VideoResponseStruct? videoResponse, [
  bool forFieldValue = false,
]) {
  if (videoResponse == null) {
    return {};
  }
  final firestoreData = mapToFirestore(videoResponse.toMap());

  // Add any Firestore field values
  videoResponse.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVideoResponseListFirestoreData(
  List<VideoResponseStruct>? videoResponses,
) =>
    videoResponses
        ?.map((e) => getVideoResponseFirestoreData(e, true))
        .toList() ??
    [];
