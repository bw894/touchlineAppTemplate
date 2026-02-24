// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class WPattributesStruct extends BaseStruct {
  WPattributesStruct({
    String? name,
    List<String>? options,
  })  : _name = name,
        _options = options;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;

  void updateOptions(Function(List<String>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  static WPattributesStruct fromMap(Map<String, dynamic> data) =>
      WPattributesStruct(
        name: data['name'] as String?,
        options: getDataList(data['options']),
      );

  static WPattributesStruct? maybeFromMap(dynamic data) => data is Map
      ? WPattributesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'options': _options,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static WPattributesStruct fromSerializableMap(Map<String, dynamic> data) =>
      WPattributesStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'WPattributesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WPattributesStruct &&
        name == other.name &&
        listEquality.equals(options, other.options);
  }

  @override
  int get hashCode => const ListEquality().hash([name, options]);
}

WPattributesStruct createWPattributesStruct({
  String? name,
}) =>
    WPattributesStruct(
      name: name,
    );
