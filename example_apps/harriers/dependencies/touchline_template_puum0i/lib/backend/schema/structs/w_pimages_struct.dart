// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WPimagesStruct extends FFFirebaseStruct {
  WPimagesStruct({
    String? src,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _src = src,
        super(firestoreUtilData);

  // "src" field.
  String? _src;
  String get src => _src ?? '';
  set src(String? val) => _src = val;

  bool hasSrc() => _src != null;

  static WPimagesStruct fromMap(Map<String, dynamic> data) => WPimagesStruct(
        src: data['src'] as String?,
      );

  static WPimagesStruct? maybeFromMap(dynamic data) =>
      data is Map ? WPimagesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'src': _src,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'src': serializeParam(
          _src,
          ParamType.String,
        ),
      }.withoutNulls;

  static WPimagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      WPimagesStruct(
        src: deserializeParam(
          data['src'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WPimagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WPimagesStruct && src == other.src;
  }

  @override
  int get hashCode => const ListEquality().hash([src]);
}

WPimagesStruct createWPimagesStruct({
  String? src,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WPimagesStruct(
      src: src,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WPimagesStruct? updateWPimagesStruct(
  WPimagesStruct? wPimages, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    wPimages
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWPimagesStructData(
  Map<String, dynamic> firestoreData,
  WPimagesStruct? wPimages,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (wPimages == null) {
    return;
  }
  if (wPimages.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && wPimages.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final wPimagesData = getWPimagesFirestoreData(wPimages, forFieldValue);
  final nestedData = wPimagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = wPimages.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWPimagesFirestoreData(
  WPimagesStruct? wPimages, [
  bool forFieldValue = false,
]) {
  if (wPimages == null) {
    return {};
  }
  final firestoreData = mapToFirestore(wPimages.toMap());

  // Add any Firestore field values
  wPimages.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWPimagesListFirestoreData(
  List<WPimagesStruct>? wPimagess,
) =>
    wPimagess?.map((e) => getWPimagesFirestoreData(e, true)).toList() ?? [];
