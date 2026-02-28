// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class VideoResponseStruct extends BaseStruct {
  VideoResponseStruct({
    List<ItemsStruct>? items,
    String? nextPageToken,
  })  : _items = items,
        _nextPageToken = nextPageToken;

  // "items" field.
  List<ItemsStruct>? _items;
  List<ItemsStruct> get items => _items ?? const [];
  set items(List<ItemsStruct>? val) => _items = val;

  void updateItems(Function(List<ItemsStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  // "nextPageToken" field.
  String? _nextPageToken;
  String get nextPageToken => _nextPageToken ?? '';
  set nextPageToken(String? val) => _nextPageToken = val;

  bool hasNextPageToken() => _nextPageToken != null;

  static VideoResponseStruct fromMap(Map<String, dynamic> data) =>
      VideoResponseStruct(
        items: getStructList(
          data['items'],
          ItemsStruct.fromMap,
        ),
        nextPageToken: data['nextPageToken'] as String?,
      );

  static VideoResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? VideoResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'items': _items?.map((e) => e.toMap()).toList(),
        'nextPageToken': _nextPageToken,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
        'nextPageToken': serializeParam(
          _nextPageToken,
          ParamType.String,
        ),
      }.withoutNulls;

  static VideoResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideoResponseStruct(
        items: deserializeStructParam<ItemsStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: ItemsStruct.fromSerializableMap,
        ),
        nextPageToken: deserializeParam(
          data['nextPageToken'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VideoResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VideoResponseStruct &&
        listEquality.equals(items, other.items) &&
        nextPageToken == other.nextPageToken;
  }

  @override
  int get hashCode => const ListEquality().hash([items, nextPageToken]);
}

VideoResponseStruct createVideoResponseStruct({
  String? nextPageToken,
}) =>
    VideoResponseStruct(
      nextPageToken: nextPageToken,
    );
