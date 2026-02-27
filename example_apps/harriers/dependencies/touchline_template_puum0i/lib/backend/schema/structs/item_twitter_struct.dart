// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemTwitterStruct extends FFFirebaseStruct {
  ItemTwitterStruct({
    String? title,
    String? image,
    String? datePublished,
    String? url,
    String? contentText,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _image = image,
        _datePublished = datePublished,
        _url = url,
        _contentText = contentText,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "date_published" field.
  String? _datePublished;
  String get datePublished => _datePublished ?? '';
  set datePublished(String? val) => _datePublished = val;

  bool hasDatePublished() => _datePublished != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "content_text" field.
  String? _contentText;
  String get contentText => _contentText ?? '';
  set contentText(String? val) => _contentText = val;

  bool hasContentText() => _contentText != null;

  static ItemTwitterStruct fromMap(Map<String, dynamic> data) =>
      ItemTwitterStruct(
        title: data['title'] as String?,
        image: data['image'] as String?,
        datePublished: data['date_published'] as String?,
        url: data['url'] as String?,
        contentText: data['content_text'] as String?,
      );

  static ItemTwitterStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemTwitterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'image': _image,
        'date_published': _datePublished,
        'url': _url,
        'content_text': _contentText,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'date_published': serializeParam(
          _datePublished,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'content_text': serializeParam(
          _contentText,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemTwitterStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemTwitterStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        datePublished: deserializeParam(
          data['date_published'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        contentText: deserializeParam(
          data['content_text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ItemTwitterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemTwitterStruct &&
        title == other.title &&
        image == other.image &&
        datePublished == other.datePublished &&
        url == other.url &&
        contentText == other.contentText;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, image, datePublished, url, contentText]);
}

ItemTwitterStruct createItemTwitterStruct({
  String? title,
  String? image,
  String? datePublished,
  String? url,
  String? contentText,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemTwitterStruct(
      title: title,
      image: image,
      datePublished: datePublished,
      url: url,
      contentText: contentText,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemTwitterStruct? updateItemTwitterStruct(
  ItemTwitterStruct? itemTwitter, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    itemTwitter
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemTwitterStructData(
  Map<String, dynamic> firestoreData,
  ItemTwitterStruct? itemTwitter,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (itemTwitter == null) {
    return;
  }
  if (itemTwitter.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && itemTwitter.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemTwitterData =
      getItemTwitterFirestoreData(itemTwitter, forFieldValue);
  final nestedData =
      itemTwitterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = itemTwitter.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemTwitterFirestoreData(
  ItemTwitterStruct? itemTwitter, [
  bool forFieldValue = false,
]) {
  if (itemTwitter == null) {
    return {};
  }
  final firestoreData = mapToFirestore(itemTwitter.toMap());

  // Add any Firestore field values
  itemTwitter.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemTwitterListFirestoreData(
  List<ItemTwitterStruct>? itemTwitters,
) =>
    itemTwitters?.map((e) => getItemTwitterFirestoreData(e, true)).toList() ??
    [];
