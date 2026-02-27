// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThumbnailsStruct extends FFFirebaseStruct {
  ThumbnailsStruct({
    HighStruct? high,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _high = high,
        super(firestoreUtilData);

  // "high" field.
  HighStruct? _high;
  HighStruct get high => _high ?? HighStruct();
  set high(HighStruct? val) => _high = val;

  void updateHigh(Function(HighStruct) updateFn) {
    updateFn(_high ??= HighStruct());
  }

  bool hasHigh() => _high != null;

  static ThumbnailsStruct fromMap(Map<String, dynamic> data) =>
      ThumbnailsStruct(
        high: data['high'] is HighStruct
            ? data['high']
            : HighStruct.maybeFromMap(data['high']),
      );

  static ThumbnailsStruct? maybeFromMap(dynamic data) => data is Map
      ? ThumbnailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'high': _high?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'high': serializeParam(
          _high,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ThumbnailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThumbnailsStruct(
        high: deserializeStructParam(
          data['high'],
          ParamType.DataStruct,
          false,
          structBuilder: HighStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ThumbnailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThumbnailsStruct && high == other.high;
  }

  @override
  int get hashCode => const ListEquality().hash([high]);
}

ThumbnailsStruct createThumbnailsStruct({
  HighStruct? high,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThumbnailsStruct(
      high: high ?? (clearUnsetFields ? HighStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThumbnailsStruct? updateThumbnailsStruct(
  ThumbnailsStruct? thumbnails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    thumbnails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThumbnailsStructData(
  Map<String, dynamic> firestoreData,
  ThumbnailsStruct? thumbnails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (thumbnails == null) {
    return;
  }
  if (thumbnails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && thumbnails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final thumbnailsData = getThumbnailsFirestoreData(thumbnails, forFieldValue);
  final nestedData = thumbnailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = thumbnails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThumbnailsFirestoreData(
  ThumbnailsStruct? thumbnails, [
  bool forFieldValue = false,
]) {
  if (thumbnails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(thumbnails.toMap());

  // Handle nested data for "high" field.
  addHighStructData(
    firestoreData,
    thumbnails.hasHigh() ? thumbnails.high : null,
    'high',
    forFieldValue,
  );

  // Add any Firestore field values
  thumbnails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThumbnailsListFirestoreData(
  List<ThumbnailsStruct>? thumbnailss,
) =>
    thumbnailss?.map((e) => getThumbnailsFirestoreData(e, true)).toList() ?? [];
