// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopSizesStruct extends BaseStruct {
  ShopSizesStruct({
    bool? allowPreOrder,
    bool? beingSold,
    String? name,
    List<String>? imagesJSON,
    bool? onSale,
    double? priceExVat,
    double? priceIncVat,
    double? salePriceIncVat,
    double? salePriceExVat,
    String? sku,
    int? sortOrder,
    double? taxTotal,
    bool? unlimitedStock,
    double? vatRate,
    String? objectId,
    int? created,
    int? updated,
    String? shortName,
  })  : _allowPreOrder = allowPreOrder,
        _beingSold = beingSold,
        _name = name,
        _imagesJSON = imagesJSON,
        _onSale = onSale,
        _priceExVat = priceExVat,
        _priceIncVat = priceIncVat,
        _salePriceIncVat = salePriceIncVat,
        _salePriceExVat = salePriceExVat,
        _sku = sku,
        _sortOrder = sortOrder,
        _taxTotal = taxTotal,
        _unlimitedStock = unlimitedStock,
        _vatRate = vatRate,
        _objectId = objectId,
        _created = created,
        _updated = updated,
        _shortName = shortName;

  // "allowPreOrder" field.
  bool? _allowPreOrder;
  bool get allowPreOrder => _allowPreOrder ?? false;
  set allowPreOrder(bool? val) => _allowPreOrder = val;

  bool hasAllowPreOrder() => _allowPreOrder != null;

  // "beingSold" field.
  bool? _beingSold;
  bool get beingSold => _beingSold ?? false;
  set beingSold(bool? val) => _beingSold = val;

  bool hasBeingSold() => _beingSold != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "imagesJSON" field.
  List<String>? _imagesJSON;
  List<String> get imagesJSON => _imagesJSON ?? const [];
  set imagesJSON(List<String>? val) => _imagesJSON = val;

  void updateImagesJSON(Function(List<String>) updateFn) {
    updateFn(_imagesJSON ??= []);
  }

  bool hasImagesJSON() => _imagesJSON != null;

  // "onSale" field.
  bool? _onSale;
  bool get onSale => _onSale ?? false;
  set onSale(bool? val) => _onSale = val;

  bool hasOnSale() => _onSale != null;

  // "price_ex_vat" field.
  double? _priceExVat;
  double get priceExVat => _priceExVat ?? 0.0;
  set priceExVat(double? val) => _priceExVat = val;

  void incrementPriceExVat(double amount) => priceExVat = priceExVat + amount;

  bool hasPriceExVat() => _priceExVat != null;

  // "price_inc_vat" field.
  double? _priceIncVat;
  double get priceIncVat => _priceIncVat ?? 0.0;
  set priceIncVat(double? val) => _priceIncVat = val;

  void incrementPriceIncVat(double amount) =>
      priceIncVat = priceIncVat + amount;

  bool hasPriceIncVat() => _priceIncVat != null;

  // "sale_price_inc_vat" field.
  double? _salePriceIncVat;
  double get salePriceIncVat => _salePriceIncVat ?? 0.0;
  set salePriceIncVat(double? val) => _salePriceIncVat = val;

  void incrementSalePriceIncVat(double amount) =>
      salePriceIncVat = salePriceIncVat + amount;

  bool hasSalePriceIncVat() => _salePriceIncVat != null;

  // "sale_price_ex_vat" field.
  double? _salePriceExVat;
  double get salePriceExVat => _salePriceExVat ?? 0.0;
  set salePriceExVat(double? val) => _salePriceExVat = val;

  void incrementSalePriceExVat(double amount) =>
      salePriceExVat = salePriceExVat + amount;

  bool hasSalePriceExVat() => _salePriceExVat != null;

  // "sku" field.
  String? _sku;
  String get sku => _sku ?? '';
  set sku(String? val) => _sku = val;

  bool hasSku() => _sku != null;

  // "sortOrder" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  // "tax_total" field.
  double? _taxTotal;
  double get taxTotal => _taxTotal ?? 0.0;
  set taxTotal(double? val) => _taxTotal = val;

  void incrementTaxTotal(double amount) => taxTotal = taxTotal + amount;

  bool hasTaxTotal() => _taxTotal != null;

  // "unlimitedStock" field.
  bool? _unlimitedStock;
  bool get unlimitedStock => _unlimitedStock ?? false;
  set unlimitedStock(bool? val) => _unlimitedStock = val;

  bool hasUnlimitedStock() => _unlimitedStock != null;

  // "vatRate" field.
  double? _vatRate;
  double get vatRate => _vatRate ?? 0.0;
  set vatRate(double? val) => _vatRate = val;

  void incrementVatRate(double amount) => vatRate = vatRate + amount;

  bool hasVatRate() => _vatRate != null;

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

  // "shortName" field.
  String? _shortName;
  String get shortName => _shortName ?? '';
  set shortName(String? val) => _shortName = val;

  bool hasShortName() => _shortName != null;

  static ShopSizesStruct fromMap(Map<String, dynamic> data) => ShopSizesStruct(
        allowPreOrder: data['allowPreOrder'] as bool?,
        beingSold: data['beingSold'] as bool?,
        name: data['name'] as String?,
        imagesJSON: getDataList(data['imagesJSON']),
        onSale: data['onSale'] as bool?,
        priceExVat: castToType<double>(data['price_ex_vat']),
        priceIncVat: castToType<double>(data['price_inc_vat']),
        salePriceIncVat: castToType<double>(data['sale_price_inc_vat']),
        salePriceExVat: castToType<double>(data['sale_price_ex_vat']),
        sku: data['sku'] as String?,
        sortOrder: castToType<int>(data['sortOrder']),
        taxTotal: castToType<double>(data['tax_total']),
        unlimitedStock: data['unlimitedStock'] as bool?,
        vatRate: castToType<double>(data['vatRate']),
        objectId: data['objectId'] as String?,
        created: castToType<int>(data['created']),
        updated: castToType<int>(data['updated']),
        shortName: data['shortName'] as String?,
      );

  static ShopSizesStruct? maybeFromMap(dynamic data) => data is Map
      ? ShopSizesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'allowPreOrder': _allowPreOrder,
        'beingSold': _beingSold,
        'name': _name,
        'imagesJSON': _imagesJSON,
        'onSale': _onSale,
        'price_ex_vat': _priceExVat,
        'price_inc_vat': _priceIncVat,
        'sale_price_inc_vat': _salePriceIncVat,
        'sale_price_ex_vat': _salePriceExVat,
        'sku': _sku,
        'sortOrder': _sortOrder,
        'tax_total': _taxTotal,
        'unlimitedStock': _unlimitedStock,
        'vatRate': _vatRate,
        'objectId': _objectId,
        'created': _created,
        'updated': _updated,
        'shortName': _shortName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'allowPreOrder': serializeParam(
          _allowPreOrder,
          ParamType.bool,
        ),
        'beingSold': serializeParam(
          _beingSold,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'imagesJSON': serializeParam(
          _imagesJSON,
          ParamType.String,
          isList: true,
        ),
        'onSale': serializeParam(
          _onSale,
          ParamType.bool,
        ),
        'price_ex_vat': serializeParam(
          _priceExVat,
          ParamType.double,
        ),
        'price_inc_vat': serializeParam(
          _priceIncVat,
          ParamType.double,
        ),
        'sale_price_inc_vat': serializeParam(
          _salePriceIncVat,
          ParamType.double,
        ),
        'sale_price_ex_vat': serializeParam(
          _salePriceExVat,
          ParamType.double,
        ),
        'sku': serializeParam(
          _sku,
          ParamType.String,
        ),
        'sortOrder': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
        'tax_total': serializeParam(
          _taxTotal,
          ParamType.double,
        ),
        'unlimitedStock': serializeParam(
          _unlimitedStock,
          ParamType.bool,
        ),
        'vatRate': serializeParam(
          _vatRate,
          ParamType.double,
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
        'shortName': serializeParam(
          _shortName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ShopSizesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShopSizesStruct(
        allowPreOrder: deserializeParam(
          data['allowPreOrder'],
          ParamType.bool,
          false,
        ),
        beingSold: deserializeParam(
          data['beingSold'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        imagesJSON: deserializeParam<String>(
          data['imagesJSON'],
          ParamType.String,
          true,
        ),
        onSale: deserializeParam(
          data['onSale'],
          ParamType.bool,
          false,
        ),
        priceExVat: deserializeParam(
          data['price_ex_vat'],
          ParamType.double,
          false,
        ),
        priceIncVat: deserializeParam(
          data['price_inc_vat'],
          ParamType.double,
          false,
        ),
        salePriceIncVat: deserializeParam(
          data['sale_price_inc_vat'],
          ParamType.double,
          false,
        ),
        salePriceExVat: deserializeParam(
          data['sale_price_ex_vat'],
          ParamType.double,
          false,
        ),
        sku: deserializeParam(
          data['sku'],
          ParamType.String,
          false,
        ),
        sortOrder: deserializeParam(
          data['sortOrder'],
          ParamType.int,
          false,
        ),
        taxTotal: deserializeParam(
          data['tax_total'],
          ParamType.double,
          false,
        ),
        unlimitedStock: deserializeParam(
          data['unlimitedStock'],
          ParamType.bool,
          false,
        ),
        vatRate: deserializeParam(
          data['vatRate'],
          ParamType.double,
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
        shortName: deserializeParam(
          data['shortName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ShopSizesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ShopSizesStruct &&
        allowPreOrder == other.allowPreOrder &&
        beingSold == other.beingSold &&
        name == other.name &&
        listEquality.equals(imagesJSON, other.imagesJSON) &&
        onSale == other.onSale &&
        priceExVat == other.priceExVat &&
        priceIncVat == other.priceIncVat &&
        salePriceIncVat == other.salePriceIncVat &&
        salePriceExVat == other.salePriceExVat &&
        sku == other.sku &&
        sortOrder == other.sortOrder &&
        taxTotal == other.taxTotal &&
        unlimitedStock == other.unlimitedStock &&
        vatRate == other.vatRate &&
        objectId == other.objectId &&
        created == other.created &&
        updated == other.updated &&
        shortName == other.shortName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        allowPreOrder,
        beingSold,
        name,
        imagesJSON,
        onSale,
        priceExVat,
        priceIncVat,
        salePriceIncVat,
        salePriceExVat,
        sku,
        sortOrder,
        taxTotal,
        unlimitedStock,
        vatRate,
        objectId,
        created,
        updated,
        shortName
      ]);
}

ShopSizesStruct createShopSizesStruct({
  bool? allowPreOrder,
  bool? beingSold,
  String? name,
  bool? onSale,
  double? priceExVat,
  double? priceIncVat,
  double? salePriceIncVat,
  double? salePriceExVat,
  String? sku,
  int? sortOrder,
  double? taxTotal,
  bool? unlimitedStock,
  double? vatRate,
  String? objectId,
  int? created,
  int? updated,
  String? shortName,
}) =>
    ShopSizesStruct(
      allowPreOrder: allowPreOrder,
      beingSold: beingSold,
      name: name,
      onSale: onSale,
      priceExVat: priceExVat,
      priceIncVat: priceIncVat,
      salePriceIncVat: salePriceIncVat,
      salePriceExVat: salePriceExVat,
      sku: sku,
      sortOrder: sortOrder,
      taxTotal: taxTotal,
      unlimitedStock: unlimitedStock,
      vatRate: vatRate,
      objectId: objectId,
      created: created,
      updated: updated,
      shortName: shortName,
    );
