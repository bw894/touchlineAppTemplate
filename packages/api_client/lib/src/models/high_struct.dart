// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class HighStruct extends BaseStruct {
  HighStruct({
    String? url,
  }) : _url = url;

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
}) =>
    HighStruct(
      url: url,
    );
