// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HighStruct extends FFFirebaseStruct {
  HighStruct({
    String? url,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _url = url,
        super(firestoreUtilData);

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static HighStruct fromMap(Map<String, dynamic> data) => HighStruct(
        url: data['url'] as String?,
      );

  static HighStruct? maybeFromMap(dynamic data) =>
      data is Map ? HighStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static HighStruct fromSerializableMap(Map<String, dynamic> data) =>
      HighStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HighStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HighStruct && url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([url]);
}

HighStruct createHighStruct({
  String? url,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HighStruct(
      url: url,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HighStruct? updateHighStruct(
  HighStruct? high, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    high
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHighStructData(
  Map<String, dynamic> firestoreData,
  HighStruct? high,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (high == null) {
    return;
  }
  if (high.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && high.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final highData = getHighFirestoreData(high, forFieldValue);
  final nestedData = highData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = high.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHighFirestoreData(
  HighStruct? high, [
  bool forFieldValue = false,
]) {
  if (high == null) {
    return {};
  }
  final firestoreData = mapToFirestore(high.toMap());

  // Add any Firestore field values
  high.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHighListFirestoreData(
  List<HighStruct>? highs,
) =>
    highs?.map((e) => getHighFirestoreData(e, true)).toList() ?? [];
