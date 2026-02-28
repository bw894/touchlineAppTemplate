// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class ThumbnailsStruct extends BaseStruct {
  ThumbnailsStruct({
    HighStruct? high,
  }) : _high = high;

  // "high" field.
  HighStruct? _high;
  HighStruct get high => _high ?? HighStruct();
  set high(HighStruct? val) => _high = val;

  void updateHigh(Function(HighStruct) updateFn) {
    updateFn(_high ??= HighStruct());
  }

  bool hasHigh() => _high != null;

  static ThumbnailsStruct fromMap(Map<String, dynamic> data) =>
      ThumbnailsStruct(
        high: data['high'] is HighStruct
            ? data['high']
            : HighStruct.maybeFromMap(data['high']),
      );

  static ThumbnailsStruct? maybeFromMap(dynamic data) => data is Map
      ? ThumbnailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'high': _high?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'high': serializeParam(
          _high,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ThumbnailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThumbnailsStruct(
        high: deserializeStructParam(
          data['high'],
          ParamType.DataStruct,
          false,
          structBuilder: HighStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ThumbnailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThumbnailsStruct && high == other.high;
  }

  @override
  int get hashCode => const ListEquality().hash([high]);
}

ThumbnailsStruct createThumbnailsStruct({
  HighStruct? high,
}) =>
    ThumbnailsStruct(
      high: high ?? HighStruct(),
    );
