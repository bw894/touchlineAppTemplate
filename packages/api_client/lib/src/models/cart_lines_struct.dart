// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class CartLinesStruct extends BaseStruct {
  CartLinesStruct({
    int? qty,
    String? title,
    String? type,
    String? productId,
    double? itemTotal,
    double? lineTotal,
    double? lineTax,
    double? itemTax,
    List<ExtraFieldsStruct>? extraFields,
    String? productImage,
    bool? onSale,
    double? regularItemPrice,
    String? sizeObjectId,
    String? sizeTitle,
  })  : _qty = qty,
        _title = title,
        _type = type,
        _productId = productId,
        _itemTotal = itemTotal,
        _lineTotal = lineTotal,
        _lineTax = lineTax,
        _itemTax = itemTax,
        _extraFields = extraFields,
        _productImage = productImage,
        _onSale = onSale,
        _regularItemPrice = regularItemPrice,
        _sizeObjectId = sizeObjectId,
        _sizeTitle = sizeTitle;

  // "qty" field.
  int? _qty;
  int get qty => _qty ?? 0;
  set qty(int? val) => _qty = val;

  void incrementQty(int amount) => qty = qty + amount;

  bool hasQty() => _qty != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "item_total" field.
  double? _itemTotal;
  double get itemTotal => _itemTotal ?? 0.0;
  set itemTotal(double? val) => _itemTotal = val;

  void incrementItemTotal(double amount) => itemTotal = itemTotal + amount;

  bool hasItemTotal() => _itemTotal != null;

  // "line_total" field.
  double? _lineTotal;
  double get lineTotal => _lineTotal ?? 0.0;
  set lineTotal(double? val) => _lineTotal = val;

  void incrementLineTotal(double amount) => lineTotal = lineTotal + amount;

  bool hasLineTotal() => _lineTotal != null;

  // "line_tax" field.
  double? _lineTax;
  double get lineTax => _lineTax ?? 0.0;
  set lineTax(double? val) => _lineTax = val;

  void incrementLineTax(double amount) => lineTax = lineTax + amount;

  bool hasLineTax() => _lineTax != null;

  // "item_tax" field.
  double? _itemTax;
  double get itemTax => _itemTax ?? 0.0;
  set itemTax(double? val) => _itemTax = val;

  void incrementItemTax(double amount) => itemTax = itemTax + amount;

  bool hasItemTax() => _itemTax != null;

  // "extra_fields" field.
  List<ExtraFieldsStruct>? _extraFields;
  List<ExtraFieldsStruct> get extraFields => _extraFields ?? const [];
  set extraFields(List<ExtraFieldsStruct>? val) => _extraFields = val;

  void updateExtraFields(Function(List<ExtraFieldsStruct>) updateFn) {
    updateFn(_extraFields ??= []);
  }

  bool hasExtraFields() => _extraFields != null;

  // "productImage" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  set productImage(String? val) => _productImage = val;

  bool hasProductImage() => _productImage != null;

  // "onSale" field.
  bool? _onSale;
  bool get onSale => _onSale ?? false;
  set onSale(bool? val) => _onSale = val;

  bool hasOnSale() => _onSale != null;

  // "regular_item_price" field.
  double? _regularItemPrice;
  double get regularItemPrice => _regularItemPrice ?? 0.0;
  set regularItemPrice(double? val) => _regularItemPrice = val;

  void incrementRegularItemPrice(double amount) =>
      regularItemPrice = regularItemPrice + amount;

  bool hasRegularItemPrice() => _regularItemPrice != null;

  // "sizeObjectId" field.
  String? _sizeObjectId;
  String get sizeObjectId => _sizeObjectId ?? '';
  set sizeObjectId(String? val) => _sizeObjectId = val;

  bool hasSizeObjectId() => _sizeObjectId != null;

  // "sizeTitle" field.
  String? _sizeTitle;
  String get sizeTitle => _sizeTitle ?? '';
  set sizeTitle(String? val) => _sizeTitle = val;

  bool hasSizeTitle() => _sizeTitle != null;

  static CartLinesStruct fromMap(Map<String, dynamic> data) => CartLinesStruct(
        qty: castToType<int>(data['qty']),
        title: data['title'] as String?,
        type: data['type'] as String?,
        productId: data['productId'] as String?,
        itemTotal: castToType<double>(data['item_total']),
        lineTotal: castToType<double>(data['line_total']),
        lineTax: castToType<double>(data['line_tax']),
        itemTax: castToType<double>(data['item_tax']),
        extraFields: getStructList(
          data['extra_fields'],
          ExtraFieldsStruct.fromMap,
        ),
        productImage: data['productImage'] as String?,
        onSale: data['onSale'] as bool?,
        regularItemPrice: castToType<double>(data['regular_item_price']),
        sizeObjectId: data['sizeObjectId'] as String?,
        sizeTitle: data['sizeTitle'] as String?,
      );

  static CartLinesStruct? maybeFromMap(dynamic data) => data is Map
      ? CartLinesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'qty': _qty,
        'title': _title,
        'type': _type,
        'productId': _productId,
        'item_total': _itemTotal,
        'line_total': _lineTotal,
        'line_tax': _lineTax,
        'item_tax': _itemTax,
        'extra_fields': _extraFields?.map((e) => e.toMap()).toList(),
        'productImage': _productImage,
        'onSale': _onSale,
        'regular_item_price': _regularItemPrice,
        'sizeObjectId': _sizeObjectId,
        'sizeTitle': _sizeTitle,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'qty': serializeParam(
          _qty,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'productId': serializeParam(
          _productId,
          ParamType.String,
        ),
        'item_total': serializeParam(
          _itemTotal,
          ParamType.double,
        ),
        'line_total': serializeParam(
          _lineTotal,
          ParamType.double,
        ),
        'line_tax': serializeParam(
          _lineTax,
          ParamType.double,
        ),
        'item_tax': serializeParam(
          _itemTax,
          ParamType.double,
        ),
        'extra_fields': serializeParam(
          _extraFields,
          ParamType.DataStruct,
          isList: true,
        ),
        'productImage': serializeParam(
          _productImage,
          ParamType.String,
        ),
        'onSale': serializeParam(
          _onSale,
          ParamType.bool,
        ),
        'regular_item_price': serializeParam(
          _regularItemPrice,
          ParamType.double,
        ),
        'sizeObjectId': serializeParam(
          _sizeObjectId,
          ParamType.String,
        ),
        'sizeTitle': serializeParam(
          _sizeTitle,
          ParamType.String,
        ),
      }.withoutNulls;

  static CartLinesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartLinesStruct(
        qty: deserializeParam(
          data['qty'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['productId'],
          ParamType.String,
          false,
        ),
        itemTotal: deserializeParam(
          data['item_total'],
          ParamType.double,
          false,
        ),
        lineTotal: deserializeParam(
          data['line_total'],
          ParamType.double,
          false,
        ),
        lineTax: deserializeParam(
          data['line_tax'],
          ParamType.double,
          false,
        ),
        itemTax: deserializeParam(
          data['item_tax'],
          ParamType.double,
          false,
        ),
        extraFields: deserializeStructParam<ExtraFieldsStruct>(
          data['extra_fields'],
          ParamType.DataStruct,
          true,
          structBuilder: ExtraFieldsStruct.fromSerializableMap,
        ),
        productImage: deserializeParam(
          data['productImage'],
          ParamType.String,
          false,
        ),
        onSale: deserializeParam(
          data['onSale'],
          ParamType.bool,
          false,
        ),
        regularItemPrice: deserializeParam(
          data['regular_item_price'],
          ParamType.double,
          false,
        ),
        sizeObjectId: deserializeParam(
          data['sizeObjectId'],
          ParamType.String,
          false,
        ),
        sizeTitle: deserializeParam(
          data['sizeTitle'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CartLinesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CartLinesStruct &&
        qty == other.qty &&
        title == other.title &&
        type == other.type &&
        productId == other.productId &&
        itemTotal == other.itemTotal &&
        lineTotal == other.lineTotal &&
        lineTax == other.lineTax &&
        itemTax == other.itemTax &&
        listEquality.equals(extraFields, other.extraFields) &&
        productImage == other.productImage &&
        onSale == other.onSale &&
        regularItemPrice == other.regularItemPrice &&
        sizeObjectId == other.sizeObjectId &&
        sizeTitle == other.sizeTitle;
  }

  @override
  int get hashCode => const ListEquality().hash([
        qty,
        title,
        type,
        productId,
        itemTotal,
        lineTotal,
        lineTax,
        itemTax,
        extraFields,
        productImage,
        onSale,
        regularItemPrice,
        sizeObjectId,
        sizeTitle
      ]);
}

CartLinesStruct createCartLinesStruct({
  int? qty,
  String? title,
  String? type,
  String? productId,
  double? itemTotal,
  double? lineTotal,
  double? lineTax,
  double? itemTax,
  String? productImage,
  bool? onSale,
  double? regularItemPrice,
  String? sizeObjectId,
  String? sizeTitle,
}) =>
    CartLinesStruct(
      qty: qty,
      title: title,
      type: type,
      productId: productId,
      itemTotal: itemTotal,
      lineTotal: lineTotal,
      lineTax: lineTax,
      itemTax: itemTax,
      productImage: productImage,
      onSale: onSale,
      regularItemPrice: regularItemPrice,
      sizeObjectId: sizeObjectId,
      sizeTitle: sizeTitle,
    );
