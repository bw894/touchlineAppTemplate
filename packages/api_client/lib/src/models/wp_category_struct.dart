// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class WpCategoryStruct extends BaseStruct {
  WpCategoryStruct({
    int? id,
    String? name,
    String? slug,
  })  : _id = id,
        _name = name,
        _slug = slug;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  set slug(String? val) => _slug = val;

  bool hasSlug() => _slug != null;

  static WpCategoryStruct fromMap(Map<String, dynamic> data) =>
      WpCategoryStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        slug: data['slug'] as String?,
      );

  static WpCategoryStruct? maybeFromMap(dynamic data) => data is Map
      ? WpCategoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'slug': _slug,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'slug': serializeParam(
          _slug,
          ParamType.String,
        ),
      }.withoutNulls;

  static WpCategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      WpCategoryStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        slug: deserializeParam(
          data['slug'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WpCategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WpCategoryStruct &&
        id == other.id &&
        name == other.name &&
        slug == other.slug;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, slug]);
}

WpCategoryStruct createWpCategoryStruct({
  int? id,
  String? name,
  String? slug,
}) =>
    WpCategoryStruct(
      id: id,
      name: name,
      slug: slug,
    );
