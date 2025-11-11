// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsStruct extends BaseStruct {
  ItemsStruct({
    SnippetStruct? snippet,
  }) : _snippet = snippet;

  // "snippet" field.
  SnippetStruct? _snippet;
  SnippetStruct get snippet => _snippet ?? SnippetStruct();
  set snippet(SnippetStruct? val) => _snippet = val;

  void updateSnippet(Function(SnippetStruct) updateFn) {
    updateFn(_snippet ??= SnippetStruct());
  }

  bool hasSnippet() => _snippet != null;

  static ItemsStruct fromMap(Map<String, dynamic> data) => ItemsStruct(
        snippet: data['snippet'] is SnippetStruct
            ? data['snippet']
            : SnippetStruct.maybeFromMap(data['snippet']),
      );

  static ItemsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'snippet': _snippet?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'snippet': serializeParam(
          _snippet,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemsStruct(
        snippet: deserializeStructParam(
          data['snippet'],
          ParamType.DataStruct,
          false,
          structBuilder: SnippetStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemsStruct && snippet == other.snippet;
  }

  @override
  int get hashCode => const ListEquality().hash([snippet]);
}

ItemsStruct createItemsStruct({
  SnippetStruct? snippet,
}) =>
    ItemsStruct(
      snippet: snippet ?? SnippetStruct(),
    );
