// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewSingleProductWPStruct extends BaseStruct {
  NewSingleProductWPStruct({
    int? id,
    String? name,
    String? slug,
    String? permalink,
    String? type,
    String? price,
    List<WPimagesStruct>? images,
    List<WPattributesStruct>? attributes,
    List<int>? variations,
    int? stockQuantity,
    List<WpCategoryStruct>? categories,
    String? description,
  })  : _id = id,
        _name = name,
        _slug = slug,
        _permalink = permalink,
        _type = type,
        _price = price,
        _images = images,
        _attributes = attributes,
        _variations = variations,
        _stockQuantity = stockQuantity,
        _categories = categories,
        _description = description;

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

  // "permalink" field.
  String? _permalink;
  String get permalink => _permalink ?? '';
  set permalink(String? val) => _permalink = val;

  bool hasPermalink() => _permalink != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;

  bool hasPrice() => _price != null;

  // "images" field.
  List<WPimagesStruct>? _images;
  List<WPimagesStruct> get images => _images ?? const [];
  set images(List<WPimagesStruct>? val) => _images = val;

  void updateImages(Function(List<WPimagesStruct>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "attributes" field.
  List<WPattributesStruct>? _attributes;
  List<WPattributesStruct> get attributes => _attributes ?? const [];
  set attributes(List<WPattributesStruct>? val) => _attributes = val;

  void updateAttributes(Function(List<WPattributesStruct>) updateFn) {
    updateFn(_attributes ??= []);
  }

  bool hasAttributes() => _attributes != null;

  // "variations" field.
  List<int>? _variations;
  List<int> get variations => _variations ?? const [];
  set variations(List<int>? val) => _variations = val;

  void updateVariations(Function(List<int>) updateFn) {
    updateFn(_variations ??= []);
  }

  bool hasVariations() => _variations != null;

  // "stock_quantity" field.
  int? _stockQuantity;
  int get stockQuantity => _stockQuantity ?? 1;
  set stockQuantity(int? val) => _stockQuantity = val;

  void incrementStockQuantity(int amount) =>
      stockQuantity = stockQuantity + amount;

  bool hasStockQuantity() => _stockQuantity != null;

  // "categories" field.
  List<WpCategoryStruct>? _categories;
  List<WpCategoryStruct> get categories => _categories ?? const [];
  set categories(List<WpCategoryStruct>? val) => _categories = val;

  void updateCategories(Function(List<WpCategoryStruct>) updateFn) {
    updateFn(_categories ??= []);
  }

  bool hasCategories() => _categories != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static NewSingleProductWPStruct fromMap(Map<String, dynamic> data) =>
      NewSingleProductWPStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        slug: data['slug'] as String?,
        permalink: data['permalink'] as String?,
        type: data['type'] as String?,
        price: data['price'] as String?,
        images: getStructList(
          data['images'],
          WPimagesStruct.fromMap,
        ),
        attributes: getStructList(
          data['attributes'],
          WPattributesStruct.fromMap,
        ),
        variations: getDataList(data['variations']),
        stockQuantity: castToType<int>(data['stock_quantity']),
        categories: getStructList(
          data['categories'],
          WpCategoryStruct.fromMap,
        ),
        description: data['description'] as String?,
      );

  static NewSingleProductWPStruct? maybeFromMap(dynamic data) => data is Map
      ? NewSingleProductWPStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'slug': _slug,
        'permalink': _permalink,
        'type': _type,
        'price': _price,
        'images': _images?.map((e) => e.toMap()).toList(),
        'attributes': _attributes?.map((e) => e.toMap()).toList(),
        'variations': _variations,
        'stock_quantity': _stockQuantity,
        'categories': _categories?.map((e) => e.toMap()).toList(),
        'description': _description,
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
        'permalink': serializeParam(
          _permalink,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.DataStruct,
          isList: true,
        ),
        'attributes': serializeParam(
          _attributes,
          ParamType.DataStruct,
          isList: true,
        ),
        'variations': serializeParam(
          _variations,
          ParamType.int,
          isList: true,
        ),
        'stock_quantity': serializeParam(
          _stockQuantity,
          ParamType.int,
        ),
        'categories': serializeParam(
          _categories,
          ParamType.DataStruct,
          isList: true,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static NewSingleProductWPStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NewSingleProductWPStruct(
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
        permalink: deserializeParam(
          data['permalink'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.String,
          false,
        ),
        images: deserializeStructParam<WPimagesStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: WPimagesStruct.fromSerializableMap,
        ),
        attributes: deserializeStructParam<WPattributesStruct>(
          data['attributes'],
          ParamType.DataStruct,
          true,
          structBuilder: WPattributesStruct.fromSerializableMap,
        ),
        variations: deserializeParam<int>(
          data['variations'],
          ParamType.int,
          true,
        ),
        stockQuantity: deserializeParam(
          data['stock_quantity'],
          ParamType.int,
          false,
        ),
        categories: deserializeStructParam<WpCategoryStruct>(
          data['categories'],
          ParamType.DataStruct,
          true,
          structBuilder: WpCategoryStruct.fromSerializableMap,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NewSingleProductWPStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is NewSingleProductWPStruct &&
        id == other.id &&
        name == other.name &&
        slug == other.slug &&
        permalink == other.permalink &&
        type == other.type &&
        price == other.price &&
        listEquality.equals(images, other.images) &&
        listEquality.equals(attributes, other.attributes) &&
        listEquality.equals(variations, other.variations) &&
        stockQuantity == other.stockQuantity &&
        listEquality.equals(categories, other.categories) &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        slug,
        permalink,
        type,
        price,
        images,
        attributes,
        variations,
        stockQuantity,
        categories,
        description
      ]);
}

NewSingleProductWPStruct createNewSingleProductWPStruct({
  int? id,
  String? name,
  String? slug,
  String? permalink,
  String? type,
  String? price,
  int? stockQuantity,
  String? description,
}) =>
    NewSingleProductWPStruct(
      id: id,
      name: name,
      slug: slug,
      permalink: permalink,
      type: type,
      price: price,
      stockQuantity: stockQuantity,
      description: description,
    );
