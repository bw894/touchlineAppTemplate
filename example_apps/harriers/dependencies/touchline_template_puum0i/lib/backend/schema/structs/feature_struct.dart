// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeatureStruct extends FFFirebaseStruct {
  FeatureStruct({
    String? ico,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ico = ico,
        _name = name,
        super(firestoreUtilData);

  // "ico" field.
  String? _ico;
  String get ico => _ico ?? '';
  set ico(String? val) => _ico = val;

  bool hasIco() => _ico != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static FeatureStruct fromMap(Map<String, dynamic> data) => FeatureStruct(
        ico: data['ico'] as String?,
        name: data['name'] as String?,
      );

  static FeatureStruct? maybeFromMap(dynamic data) =>
      data is Map ? FeatureStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ico': _ico,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ico': serializeParam(
          _ico,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static FeatureStruct fromSerializableMap(Map<String, dynamic> data) =>
      FeatureStruct(
        ico: deserializeParam(
          data['ico'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FeatureStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FeatureStruct && ico == other.ico && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([ico, name]);
}

FeatureStruct createFeatureStruct({
  String? ico,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FeatureStruct(
      ico: ico,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FeatureStruct? updateFeatureStruct(
  FeatureStruct? feature, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    feature
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFeatureStructData(
  Map<String, dynamic> firestoreData,
  FeatureStruct? feature,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (feature == null) {
    return;
  }
  if (feature.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && feature.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final featureData = getFeatureFirestoreData(feature, forFieldValue);
  final nestedData = featureData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = feature.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFeatureFirestoreData(
  FeatureStruct? feature, [
  bool forFieldValue = false,
]) {
  if (feature == null) {
    return {};
  }
  final firestoreData = mapToFirestore(feature.toMap());

  // Add any Firestore field values
  feature.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFeatureListFirestoreData(
  List<FeatureStruct>? features,
) =>
    features?.map((e) => getFeatureFirestoreData(e, true)).toList() ?? [];
