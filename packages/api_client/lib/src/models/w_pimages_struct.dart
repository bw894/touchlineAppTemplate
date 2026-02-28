// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class WPimagesStruct extends BaseStruct {
  WPimagesStruct({
    String? src,
  }) : _src = src;

  // "src" field.
  String? _src;
  String get src => _src ?? '';
  set src(String? val) => _src = val;

  bool hasSrc() => _src != null;

  static WPimagesStruct fromMap(Map<String, dynamic> data) => WPimagesStruct(
        src: data['src'] as String?,
      );

  static WPimagesStruct? maybeFromMap(dynamic data) =>
      data is Map ? WPimagesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'src': _src,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'src': serializeParam(
          _src,
          ParamType.String,
        ),
      }.withoutNulls;

  static WPimagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      WPimagesStruct(
        src: deserializeParam(
          data['src'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WPimagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WPimagesStruct && src == other.src;
  }

  @override
  int get hashCode => const ListEquality().hash([src]);
}

WPimagesStruct createWPimagesStruct({
  String? src,
}) =>
    WPimagesStruct(
      src: src,
    );
