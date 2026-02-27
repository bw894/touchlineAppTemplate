// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchGalleryItemStruct extends FFFirebaseStruct {
  MatchGalleryItemStruct({
    String? imagePath,
    BLESSfixtureStruct? relatedMatch,
    String? objectId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imagePath = imagePath,
        _relatedMatch = relatedMatch,
        _objectId = objectId,
        super(firestoreUtilData);

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  set imagePath(String? val) => _imagePath = val;

  bool hasImagePath() => _imagePath != null;

  // "relatedMatch" field.
  BLESSfixtureStruct? _relatedMatch;
  BLESSfixtureStruct get relatedMatch => _relatedMatch ?? BLESSfixtureStruct();
  set relatedMatch(BLESSfixtureStruct? val) => _relatedMatch = val;

  void updateRelatedMatch(Function(BLESSfixtureStruct) updateFn) {
    updateFn(_relatedMatch ??= BLESSfixtureStruct());
  }

  bool hasRelatedMatch() => _relatedMatch != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  static MatchGalleryItemStruct fromMap(Map<String, dynamic> data) =>
      MatchGalleryItemStruct(
        imagePath: data['imagePath'] as String?,
        relatedMatch: data['relatedMatch'] is BLESSfixtureStruct
            ? data['relatedMatch']
            : BLESSfixtureStruct.maybeFromMap(data['relatedMatch']),
        objectId: data['objectId'] as String?,
      );

  static MatchGalleryItemStruct? maybeFromMap(dynamic data) => data is Map
      ? MatchGalleryItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'imagePath': _imagePath,
        'relatedMatch': _relatedMatch?.toMap(),
        'objectId': _objectId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imagePath': serializeParam(
          _imagePath,
          ParamType.String,
        ),
        'relatedMatch': serializeParam(
          _relatedMatch,
          ParamType.DataStruct,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
      }.withoutNulls;

  static MatchGalleryItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MatchGalleryItemStruct(
        imagePath: deserializeParam(
          data['imagePath'],
          ParamType.String,
          false,
        ),
        relatedMatch: deserializeStructParam(
          data['relatedMatch'],
          ParamType.DataStruct,
          false,
          structBuilder: BLESSfixtureStruct.fromSerializableMap,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MatchGalleryItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MatchGalleryItemStruct &&
        imagePath == other.imagePath &&
        relatedMatch == other.relatedMatch &&
        objectId == other.objectId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([imagePath, relatedMatch, objectId]);
}

MatchGalleryItemStruct createMatchGalleryItemStruct({
  String? imagePath,
  BLESSfixtureStruct? relatedMatch,
  String? objectId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MatchGalleryItemStruct(
      imagePath: imagePath,
      relatedMatch:
          relatedMatch ?? (clearUnsetFields ? BLESSfixtureStruct() : null),
      objectId: objectId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MatchGalleryItemStruct? updateMatchGalleryItemStruct(
  MatchGalleryItemStruct? matchGalleryItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    matchGalleryItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMatchGalleryItemStructData(
  Map<String, dynamic> firestoreData,
  MatchGalleryItemStruct? matchGalleryItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (matchGalleryItem == null) {
    return;
  }
  if (matchGalleryItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && matchGalleryItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final matchGalleryItemData =
      getMatchGalleryItemFirestoreData(matchGalleryItem, forFieldValue);
  final nestedData =
      matchGalleryItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = matchGalleryItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMatchGalleryItemFirestoreData(
  MatchGalleryItemStruct? matchGalleryItem, [
  bool forFieldValue = false,
]) {
  if (matchGalleryItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(matchGalleryItem.toMap());

  // Handle nested data for "relatedMatch" field.
  addBLESSfixtureStructData(
    firestoreData,
    matchGalleryItem.hasRelatedMatch() ? matchGalleryItem.relatedMatch : null,
    'relatedMatch',
    forFieldValue,
  );

  // Add any Firestore field values
  matchGalleryItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMatchGalleryItemListFirestoreData(
  List<MatchGalleryItemStruct>? matchGalleryItems,
) =>
    matchGalleryItems
        ?.map((e) => getMatchGalleryItemFirestoreData(e, true))
        .toList() ??
    [];
