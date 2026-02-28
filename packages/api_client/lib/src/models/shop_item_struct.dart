// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class ShopItemStruct extends BaseStruct {
  ShopItemStruct({
    String? brandImage,
    String? brandName,
    String? description,
    bool? ePOS,
    String? hoverImage,
    bool? live,
    String? mainImage,
    double? maxPrice,
    double? minPrice,
    String? name,
    int? sortOrder,
    bool? youthShop,
    String? objectId,
    int? created,
    int? updated,
    List<ShopSizesStruct>? sizes,
    List<ShopReviewsStruct>? reviews,
    String? shortDescription,
    bool? onSale,
    String? saleText,
    double? avgRating,
  })  : _brandImage = brandImage,
        _brandName = brandName,
        _description = description,
        _ePOS = ePOS,
        _hoverImage = hoverImage,
        _live = live,
        _mainImage = mainImage,
        _maxPrice = maxPrice,
        _minPrice = minPrice,
        _name = name,
        _sortOrder = sortOrder,
        _youthShop = youthShop,
        _objectId = objectId,
        _created = created,
        _updated = updated,
        _sizes = sizes,
        _reviews = reviews,
        _shortDescription = shortDescription,
        _onSale = onSale,
        _saleText = saleText,
        _avgRating = avgRating;

  // "brandImage" field.
  String? _brandImage;
  String get brandImage => _brandImage ?? '';
  set brandImage(String? val) => _brandImage = val;

  bool hasBrandImage() => _brandImage != null;

  // "brandName" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  set brandName(String? val) => _brandName = val;

  bool hasBrandName() => _brandName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "ePOS" field.
  bool? _ePOS;
  bool get ePOS => _ePOS ?? false;
  set ePOS(bool? val) => _ePOS = val;

  bool hasEPOS() => _ePOS != null;

  // "hoverImage" field.
  String? _hoverImage;
  String get hoverImage => _hoverImage ?? '';
  set hoverImage(String? val) => _hoverImage = val;

  bool hasHoverImage() => _hoverImage != null;

  // "live" field.
  bool? _live;
  bool get live => _live ?? false;
  set live(bool? val) => _live = val;

  bool hasLive() => _live != null;

  // "mainImage" field.
  String? _mainImage;
  String get mainImage => _mainImage ?? '';
  set mainImage(String? val) => _mainImage = val;

  bool hasMainImage() => _mainImage != null;

  // "maxPrice" field.
  double? _maxPrice;
  double get maxPrice => _maxPrice ?? 0.0;
  set maxPrice(double? val) => _maxPrice = val;

  void incrementMaxPrice(double amount) => maxPrice = maxPrice + amount;

  bool hasMaxPrice() => _maxPrice != null;

  // "minPrice" field.
  double? _minPrice;
  double get minPrice => _minPrice ?? 0.0;
  set minPrice(double? val) => _minPrice = val;

  void incrementMinPrice(double amount) => minPrice = minPrice + amount;

  bool hasMinPrice() => _minPrice != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "sortOrder" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  // "youthShop" field.
  bool? _youthShop;
  bool get youthShop => _youthShop ?? false;
  set youthShop(bool? val) => _youthShop = val;

  bool hasYouthShop() => _youthShop != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  // "updated" field.
  int? _updated;
  int get updated => _updated ?? 0;
  set updated(int? val) => _updated = val;

  void incrementUpdated(int amount) => updated = updated + amount;

  bool hasUpdated() => _updated != null;

  // "sizes" field.
  List<ShopSizesStruct>? _sizes;
  List<ShopSizesStruct> get sizes => _sizes ?? const [];
  set sizes(List<ShopSizesStruct>? val) => _sizes = val;

  void updateSizes(Function(List<ShopSizesStruct>) updateFn) {
    updateFn(_sizes ??= []);
  }

  bool hasSizes() => _sizes != null;

  // "reviews" field.
  List<ShopReviewsStruct>? _reviews;
  List<ShopReviewsStruct> get reviews => _reviews ?? const [];
  set reviews(List<ShopReviewsStruct>? val) => _reviews = val;

  void updateReviews(Function(List<ShopReviewsStruct>) updateFn) {
    updateFn(_reviews ??= []);
  }

  bool hasReviews() => _reviews != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  set shortDescription(String? val) => _shortDescription = val;

  bool hasShortDescription() => _shortDescription != null;

  // "onSale" field.
  bool? _onSale;
  bool get onSale => _onSale ?? false;
  set onSale(bool? val) => _onSale = val;

  bool hasOnSale() => _onSale != null;

  // "saleText" field.
  String? _saleText;
  String get saleText => _saleText ?? '';
  set saleText(String? val) => _saleText = val;

  bool hasSaleText() => _saleText != null;

  // "avgRating" field.
  double? _avgRating;
  double get avgRating => _avgRating ?? 0.0;
  set avgRating(double? val) => _avgRating = val;

  void incrementAvgRating(double amount) => avgRating = avgRating + amount;

  bool hasAvgRating() => _avgRating != null;

  static ShopItemStruct fromMap(Map<String, dynamic> data) => ShopItemStruct(
        brandImage: data['brandImage'] as String?,
        brandName: data['brandName'] as String?,
        description: data['description'] as String?,
        ePOS: data['ePOS'] as bool?,
        hoverImage: data['hoverImage'] as String?,
        live: data['live'] as bool?,
        mainImage: data['mainImage'] as String?,
        maxPrice: castToType<double>(data['maxPrice']),
        minPrice: castToType<double>(data['minPrice']),
        name: data['name'] as String?,
        sortOrder: castToType<int>(data['sortOrder']),
        youthShop: data['youthShop'] as bool?,
        objectId: data['objectId'] as String?,
        created: castToType<int>(data['created']),
        updated: castToType<int>(data['updated']),
        sizes: getStructList(
          data['sizes'],
          ShopSizesStruct.fromMap,
        ),
        reviews: getStructList(
          data['reviews'],
          ShopReviewsStruct.fromMap,
        ),
        shortDescription: data['shortDescription'] as String?,
        onSale: data['onSale'] as bool?,
        saleText: data['saleText'] as String?,
        avgRating: castToType<double>(data['avgRating']),
      );

  static ShopItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? ShopItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'brandImage': _brandImage,
        'brandName': _brandName,
        'description': _description,
        'ePOS': _ePOS,
        'hoverImage': _hoverImage,
        'live': _live,
        'mainImage': _mainImage,
        'maxPrice': _maxPrice,
        'minPrice': _minPrice,
        'name': _name,
        'sortOrder': _sortOrder,
        'youthShop': _youthShop,
        'objectId': _objectId,
        'created': _created,
        'updated': _updated,
        'sizes': _sizes?.map((e) => e.toMap()).toList(),
        'reviews': _reviews?.map((e) => e.toMap()).toList(),
        'shortDescription': _shortDescription,
        'onSale': _onSale,
        'saleText': _saleText,
        'avgRating': _avgRating,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'brandImage': serializeParam(
          _brandImage,
          ParamType.String,
        ),
        'brandName': serializeParam(
          _brandName,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'ePOS': serializeParam(
          _ePOS,
          ParamType.bool,
        ),
        'hoverImage': serializeParam(
          _hoverImage,
          ParamType.String,
        ),
        'live': serializeParam(
          _live,
          ParamType.bool,
        ),
        'mainImage': serializeParam(
          _mainImage,
          ParamType.String,
        ),
        'maxPrice': serializeParam(
          _maxPrice,
          ParamType.double,
        ),
        'minPrice': serializeParam(
          _minPrice,
          ParamType.double,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'sortOrder': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
        'youthShop': serializeParam(
          _youthShop,
          ParamType.bool,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'updated': serializeParam(
          _updated,
          ParamType.int,
        ),
        'sizes': serializeParam(
          _sizes,
          ParamType.DataStruct,
          isList: true,
        ),
        'reviews': serializeParam(
          _reviews,
          ParamType.DataStruct,
          isList: true,
        ),
        'shortDescription': serializeParam(
          _shortDescription,
          ParamType.String,
        ),
        'onSale': serializeParam(
          _onSale,
          ParamType.bool,
        ),
        'saleText': serializeParam(
          _saleText,
          ParamType.String,
        ),
        'avgRating': serializeParam(
          _avgRating,
          ParamType.double,
        ),
      }.withoutNulls;

  static ShopItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShopItemStruct(
        brandImage: deserializeParam(
          data['brandImage'],
          ParamType.String,
          false,
        ),
        brandName: deserializeParam(
          data['brandName'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        ePOS: deserializeParam(
          data['ePOS'],
          ParamType.bool,
          false,
        ),
        hoverImage: deserializeParam(
          data['hoverImage'],
          ParamType.String,
          false,
        ),
        live: deserializeParam(
          data['live'],
          ParamType.bool,
          false,
        ),
        mainImage: deserializeParam(
          data['mainImage'],
          ParamType.String,
          false,
        ),
        maxPrice: deserializeParam(
          data['maxPrice'],
          ParamType.double,
          false,
        ),
        minPrice: deserializeParam(
          data['minPrice'],
          ParamType.double,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        sortOrder: deserializeParam(
          data['sortOrder'],
          ParamType.int,
          false,
        ),
        youthShop: deserializeParam(
          data['youthShop'],
          ParamType.bool,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
        updated: deserializeParam(
          data['updated'],
          ParamType.int,
          false,
        ),
        sizes: deserializeStructParam<ShopSizesStruct>(
          data['sizes'],
          ParamType.DataStruct,
          true,
          structBuilder: ShopSizesStruct.fromSerializableMap,
        ),
        reviews: deserializeStructParam<ShopReviewsStruct>(
          data['reviews'],
          ParamType.DataStruct,
          true,
          structBuilder: ShopReviewsStruct.fromSerializableMap,
        ),
        shortDescription: deserializeParam(
          data['shortDescription'],
          ParamType.String,
          false,
        ),
        onSale: deserializeParam(
          data['onSale'],
          ParamType.bool,
          false,
        ),
        saleText: deserializeParam(
          data['saleText'],
          ParamType.String,
          false,
        ),
        avgRating: deserializeParam(
          data['avgRating'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ShopItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ShopItemStruct &&
        brandImage == other.brandImage &&
        brandName == other.brandName &&
        description == other.description &&
        ePOS == other.ePOS &&
        hoverImage == other.hoverImage &&
        live == other.live &&
        mainImage == other.mainImage &&
        maxPrice == other.maxPrice &&
        minPrice == other.minPrice &&
        name == other.name &&
        sortOrder == other.sortOrder &&
        youthShop == other.youthShop &&
        objectId == other.objectId &&
        created == other.created &&
        updated == other.updated &&
        listEquality.equals(sizes, other.sizes) &&
        listEquality.equals(reviews, other.reviews) &&
        shortDescription == other.shortDescription &&
        onSale == other.onSale &&
        saleText == other.saleText &&
        avgRating == other.avgRating;
  }

  @override
  int get hashCode => const ListEquality().hash([
        brandImage,
        brandName,
        description,
        ePOS,
        hoverImage,
        live,
        mainImage,
        maxPrice,
        minPrice,
        name,
        sortOrder,
        youthShop,
        objectId,
        created,
        updated,
        sizes,
        reviews,
        shortDescription,
        onSale,
        saleText,
        avgRating
      ]);
}

ShopItemStruct createShopItemStruct({
  String? brandImage,
  String? brandName,
  String? description,
  bool? ePOS,
  String? hoverImage,
  bool? live,
  String? mainImage,
  double? maxPrice,
  double? minPrice,
  String? name,
  int? sortOrder,
  bool? youthShop,
  String? objectId,
  int? created,
  int? updated,
  String? shortDescription,
  bool? onSale,
  String? saleText,
  double? avgRating,
}) =>
    ShopItemStruct(
      brandImage: brandImage,
      brandName: brandName,
      description: description,
      ePOS: ePOS,
      hoverImage: hoverImage,
      live: live,
      mainImage: mainImage,
      maxPrice: maxPrice,
      minPrice: minPrice,
      name: name,
      sortOrder: sortOrder,
      youthShop: youthShop,
      objectId: objectId,
      created: created,
      updated: updated,
      shortDescription: shortDescription,
      onSale: onSale,
      saleText: saleText,
      avgRating: avgRating,
    );
