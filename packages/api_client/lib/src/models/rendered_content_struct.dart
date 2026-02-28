// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class RenderedContentStruct extends BaseStruct {
  RenderedContentStruct({
    String? rendered,
  }) : _rendered = rendered;

  // "rendered" field.
  String? _rendered;
  String get rendered => _rendered ?? '';
  set rendered(String? val) => _rendered = val;

  bool hasRendered() => _rendered != null;

  static RenderedContentStruct fromMap(Map<String, dynamic> data) =>
      RenderedContentStruct(
        rendered: data['rendered'] as String?,
      );

  static RenderedContentStruct? maybeFromMap(dynamic data) => data is Map
      ? RenderedContentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'rendered': _rendered,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rendered': serializeParam(
          _rendered,
          ParamType.String,
        ),
      }.withoutNulls;

  static RenderedContentStruct fromSerializableMap(Map<String, dynamic> data) =>
      RenderedContentStruct(
        rendered: deserializeParam(
          data['rendered'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RenderedContentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RenderedContentStruct && rendered == other.rendered;
  }

  @override
  int get hashCode => const ListEquality().hash([rendered]);
}

RenderedContentStruct createRenderedContentStruct({
  String? rendered,
}) =>
    RenderedContentStruct(
      rendered: rendered,
    );
