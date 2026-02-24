// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class StaticPageStruct extends BaseStruct {
  StaticPageStruct({
    String? title,
    List<StaticPageStruct>? containedPages,
    String? fullBody,
    String? featuredImage,
    String? objectId,
    String? type,
    bool? visible,
    int? sortOrder,
  })  : _title = title,
        _containedPages = containedPages,
        _fullBody = fullBody,
        _featuredImage = featuredImage,
        _objectId = objectId,
        _type = type,
        _visible = visible,
        _sortOrder = sortOrder;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "containedPages" field.
  List<StaticPageStruct>? _containedPages;
  List<StaticPageStruct> get containedPages => _containedPages ?? const [];
  set containedPages(List<StaticPageStruct>? val) => _containedPages = val;

  void updateContainedPages(Function(List<StaticPageStruct>) updateFn) {
    updateFn(_containedPages ??= []);
  }

  bool hasContainedPages() => _containedPages != null;

  // "FullBody" field.
  String? _fullBody;
  String get fullBody => _fullBody ?? '';
  set fullBody(String? val) => _fullBody = val;

  bool hasFullBody() => _fullBody != null;

  // "FeaturedImage" field.
  String? _featuredImage;
  String get featuredImage => _featuredImage ?? '';
  set featuredImage(String? val) => _featuredImage = val;

  bool hasFeaturedImage() => _featuredImage != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "visible" field.
  bool? _visible;
  bool get visible => _visible ?? true;
  set visible(bool? val) => _visible = val;

  bool hasVisible() => _visible != null;

  // "sortOrder" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  static StaticPageStruct fromMap(Map<String, dynamic> data) =>
      StaticPageStruct(
        title: data['Title'] as String?,
        containedPages: getStructList(
          data['containedPages'],
          StaticPageStruct.fromMap,
        ),
        fullBody: data['FullBody'] as String?,
        featuredImage: data['FeaturedImage'] as String?,
        objectId: data['objectId'] as String?,
        type: data['type'] as String?,
        visible: data['visible'] as bool?,
        sortOrder: castToType<int>(data['sortOrder']),
      );

  static StaticPageStruct? maybeFromMap(dynamic data) => data is Map
      ? StaticPageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Title': _title,
        'containedPages': _containedPages?.map((e) => e.toMap()).toList(),
        'FullBody': _fullBody,
        'FeaturedImage': _featuredImage,
        'objectId': _objectId,
        'type': _type,
        'visible': _visible,
        'sortOrder': _sortOrder,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Title': serializeParam(
          _title,
          ParamType.String,
        ),
        'containedPages': serializeParam(
          _containedPages,
          ParamType.DataStruct,
          isList: true,
        ),
        'FullBody': serializeParam(
          _fullBody,
          ParamType.String,
        ),
        'FeaturedImage': serializeParam(
          _featuredImage,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'visible': serializeParam(
          _visible,
          ParamType.bool,
        ),
        'sortOrder': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
      }.withoutNulls;

  static StaticPageStruct fromSerializableMap(Map<String, dynamic> data) =>
      StaticPageStruct(
        title: deserializeParam(
          data['Title'],
          ParamType.String,
          false,
        ),
        containedPages: deserializeStructParam<StaticPageStruct>(
          data['containedPages'],
          ParamType.DataStruct,
          true,
          structBuilder: StaticPageStruct.fromSerializableMap,
        ),
        fullBody: deserializeParam(
          data['FullBody'],
          ParamType.String,
          false,
        ),
        featuredImage: deserializeParam(
          data['FeaturedImage'],
          ParamType.String,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        visible: deserializeParam(
          data['visible'],
          ParamType.bool,
          false,
        ),
        sortOrder: deserializeParam(
          data['sortOrder'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'StaticPageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StaticPageStruct &&
        title == other.title &&
        listEquality.equals(containedPages, other.containedPages) &&
        fullBody == other.fullBody &&
        featuredImage == other.featuredImage &&
        objectId == other.objectId &&
        type == other.type &&
        visible == other.visible &&
        sortOrder == other.sortOrder;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        containedPages,
        fullBody,
        featuredImage,
        objectId,
        type,
        visible,
        sortOrder
      ]);
}

StaticPageStruct createStaticPageStruct({
  String? title,
  String? fullBody,
  String? featuredImage,
  String? objectId,
  String? type,
  bool? visible,
  int? sortOrder,
}) =>
    StaticPageStruct(
      title: title,
      fullBody: fullBody,
      featuredImage: featuredImage,
      objectId: objectId,
      type: type,
      visible: visible,
      sortOrder: sortOrder,
    );
