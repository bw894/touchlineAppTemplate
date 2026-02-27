// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TwitterFeedStruct extends FFFirebaseStruct {
  TwitterFeedStruct({
    List<ItemTwitterStruct>? items,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _items = items,
        super(firestoreUtilData);

  // "items" field.
  List<ItemTwitterStruct>? _items;
  List<ItemTwitterStruct> get items => _items ?? const [];
  set items(List<ItemTwitterStruct>? val) => _items = val;

  void updateItems(Function(List<ItemTwitterStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  static TwitterFeedStruct fromMap(Map<String, dynamic> data) =>
      TwitterFeedStruct(
        items: getStructList(
          data['items'],
          ItemTwitterStruct.fromMap,
        ),
      );

  static TwitterFeedStruct? maybeFromMap(dynamic data) => data is Map
      ? TwitterFeedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'items': _items?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TwitterFeedStruct fromSerializableMap(Map<String, dynamic> data) =>
      TwitterFeedStruct(
        items: deserializeStructParam<ItemTwitterStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: ItemTwitterStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TwitterFeedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TwitterFeedStruct &&
        listEquality.equals(items, other.items);
  }

  @override
  int get hashCode => const ListEquality().hash([items]);
}

TwitterFeedStruct createTwitterFeedStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TwitterFeedStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TwitterFeedStruct? updateTwitterFeedStruct(
  TwitterFeedStruct? twitterFeed, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    twitterFeed
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTwitterFeedStructData(
  Map<String, dynamic> firestoreData,
  TwitterFeedStruct? twitterFeed,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (twitterFeed == null) {
    return;
  }
  if (twitterFeed.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && twitterFeed.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final twitterFeedData =
      getTwitterFeedFirestoreData(twitterFeed, forFieldValue);
  final nestedData =
      twitterFeedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = twitterFeed.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTwitterFeedFirestoreData(
  TwitterFeedStruct? twitterFeed, [
  bool forFieldValue = false,
]) {
  if (twitterFeed == null) {
    return {};
  }
  final firestoreData = mapToFirestore(twitterFeed.toMap());

  // Add any Firestore field values
  twitterFeed.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTwitterFeedListFirestoreData(
  List<TwitterFeedStruct>? twitterFeeds,
) =>
    twitterFeeds?.map((e) => getTwitterFeedFirestoreData(e, true)).toList() ??
    [];
