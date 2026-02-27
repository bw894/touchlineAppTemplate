// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WpCategoryStruct extends FFFirebaseStruct {
  WpCategoryStruct({
    int? id,
    String? name,
    String? slug,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _slug = slug,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  set slug(String? val) => _slug = val;

  bool hasSlug() => _slug != null;

  static WpCategoryStruct fromMap(Map<String, dynamic> data) =>
      WpCategoryStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        slug: data['slug'] as String?,
      );

  static WpCategoryStruct? maybeFromMap(dynamic data) => data is Map
      ? WpCategoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'slug': _slug,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'slug': serializeParam(
          _slug,
          ParamType.String,
        ),
      }.withoutNulls;

  static WpCategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      WpCategoryStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        slug: deserializeParam(
          data['slug'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WpCategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WpCategoryStruct &&
        id == other.id &&
        name == other.name &&
        slug == other.slug;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, slug]);
}

WpCategoryStruct createWpCategoryStruct({
  int? id,
  String? name,
  String? slug,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WpCategoryStruct(
      id: id,
      name: name,
      slug: slug,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WpCategoryStruct? updateWpCategoryStruct(
  WpCategoryStruct? wpCategory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    wpCategory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWpCategoryStructData(
  Map<String, dynamic> firestoreData,
  WpCategoryStruct? wpCategory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (wpCategory == null) {
    return;
  }
  if (wpCategory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && wpCategory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final wpCategoryData = getWpCategoryFirestoreData(wpCategory, forFieldValue);
  final nestedData = wpCategoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = wpCategory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWpCategoryFirestoreData(
  WpCategoryStruct? wpCategory, [
  bool forFieldValue = false,
]) {
  if (wpCategory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(wpCategory.toMap());

  // Add any Firestore field values
  wpCategory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWpCategoryListFirestoreData(
  List<WpCategoryStruct>? wpCategorys,
) =>
    wpCategorys?.map((e) => getWpCategoryFirestoreData(e, true)).toList() ?? [];
