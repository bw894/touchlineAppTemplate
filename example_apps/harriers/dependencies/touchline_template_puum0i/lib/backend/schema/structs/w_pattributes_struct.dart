// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WPattributesStruct extends FFFirebaseStruct {
  WPattributesStruct({
    String? name,
    List<String>? options,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _options = options,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;

  void updateOptions(Function(List<String>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  static WPattributesStruct fromMap(Map<String, dynamic> data) =>
      WPattributesStruct(
        name: data['name'] as String?,
        options: getDataList(data['options']),
      );

  static WPattributesStruct? maybeFromMap(dynamic data) => data is Map
      ? WPattributesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'options': _options,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static WPattributesStruct fromSerializableMap(Map<String, dynamic> data) =>
      WPattributesStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'WPattributesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WPattributesStruct &&
        name == other.name &&
        listEquality.equals(options, other.options);
  }

  @override
  int get hashCode => const ListEquality().hash([name, options]);
}

WPattributesStruct createWPattributesStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WPattributesStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WPattributesStruct? updateWPattributesStruct(
  WPattributesStruct? wPattributes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    wPattributes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWPattributesStructData(
  Map<String, dynamic> firestoreData,
  WPattributesStruct? wPattributes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (wPattributes == null) {
    return;
  }
  if (wPattributes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && wPattributes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final wPattributesData =
      getWPattributesFirestoreData(wPattributes, forFieldValue);
  final nestedData =
      wPattributesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = wPattributes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWPattributesFirestoreData(
  WPattributesStruct? wPattributes, [
  bool forFieldValue = false,
]) {
  if (wPattributes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(wPattributes.toMap());

  // Add any Firestore field values
  wPattributes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWPattributesListFirestoreData(
  List<WPattributesStruct>? wPattributess,
) =>
    wPattributess?.map((e) => getWPattributesFirestoreData(e, true)).toList() ??
    [];
