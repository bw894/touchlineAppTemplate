// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class TwitterFeedStruct extends BaseStruct {
  TwitterFeedStruct({
    List<ItemTwitterStruct>? items,
  }) : _items = items;

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

TwitterFeedStruct createTwitterFeedStruct() => TwitterFeedStruct();
