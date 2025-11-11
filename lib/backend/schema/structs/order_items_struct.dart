// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderItemsStruct extends BaseStruct {
  OrderItemsStruct({
    int? qty,
    String? name,
    double? unitPrice,
    String? optionName,
    String? optionValue,
    String? image,
    int? id,
    String? type,
    int? variationId,
  })  : _qty = qty,
        _name = name,
        _unitPrice = unitPrice,
        _optionName = optionName,
        _optionValue = optionValue,
        _image = image,
        _id = id,
        _type = type,
        _variationId = variationId;

  // "qty" field.
  int? _qty;
  int get qty => _qty ?? 0;
  set qty(int? val) => _qty = val;

  void incrementQty(int amount) => qty = qty + amount;

  bool hasQty() => _qty != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "unitPrice" field.
  double? _unitPrice;
  double get unitPrice => _unitPrice ?? 0.0;
  set unitPrice(double? val) => _unitPrice = val;

  void incrementUnitPrice(double amount) => unitPrice = unitPrice + amount;

  bool hasUnitPrice() => _unitPrice != null;

  // "optionName" field.
  String? _optionName;
  String get optionName => _optionName ?? '';
  set optionName(String? val) => _optionName = val;

  bool hasOptionName() => _optionName != null;

  // "optionValue" field.
  String? _optionValue;
  String get optionValue => _optionValue ?? '';
  set optionValue(String? val) => _optionValue = val;

  bool hasOptionValue() => _optionValue != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "variationId" field.
  int? _variationId;
  int get variationId => _variationId ?? 0;
  set variationId(int? val) => _variationId = val;

  void incrementVariationId(int amount) => variationId = variationId + amount;

  bool hasVariationId() => _variationId != null;

  static OrderItemsStruct fromMap(Map<String, dynamic> data) =>
      OrderItemsStruct(
        qty: castToType<int>(data['qty']),
        name: data['name'] as String?,
        unitPrice: castToType<double>(data['unitPrice']),
        optionName: data['optionName'] as String?,
        optionValue: data['optionValue'] as String?,
        image: data['image'] as String?,
        id: castToType<int>(data['id']),
        type: data['type'] as String?,
        variationId: castToType<int>(data['variationId']),
      );

  static OrderItemsStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderItemsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'qty': _qty,
        'name': _name,
        'unitPrice': _unitPrice,
        'optionName': _optionName,
        'optionValue': _optionValue,
        'image': _image,
        'id': _id,
        'type': _type,
        'variationId': _variationId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'qty': serializeParam(
          _qty,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'unitPrice': serializeParam(
          _unitPrice,
          ParamType.double,
        ),
        'optionName': serializeParam(
          _optionName,
          ParamType.String,
        ),
        'optionValue': serializeParam(
          _optionValue,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'variationId': serializeParam(
          _variationId,
          ParamType.int,
        ),
      }.withoutNulls;

  static OrderItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderItemsStruct(
        qty: deserializeParam(
          data['qty'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        unitPrice: deserializeParam(
          data['unitPrice'],
          ParamType.double,
          false,
        ),
        optionName: deserializeParam(
          data['optionName'],
          ParamType.String,
          false,
        ),
        optionValue: deserializeParam(
          data['optionValue'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        variationId: deserializeParam(
          data['variationId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'OrderItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderItemsStruct &&
        qty == other.qty &&
        name == other.name &&
        unitPrice == other.unitPrice &&
        optionName == other.optionName &&
        optionValue == other.optionValue &&
        image == other.image &&
        id == other.id &&
        type == other.type &&
        variationId == other.variationId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        qty,
        name,
        unitPrice,
        optionName,
        optionValue,
        image,
        id,
        type,
        variationId
      ]);
}

OrderItemsStruct createOrderItemsStruct({
  int? qty,
  String? name,
  double? unitPrice,
  String? optionName,
  String? optionValue,
  String? image,
  int? id,
  String? type,
  int? variationId,
}) =>
    OrderItemsStruct(
      qty: qty,
      name: name,
      unitPrice: unitPrice,
      optionName: optionName,
      optionValue: optionValue,
      image: image,
      id: id,
      type: type,
      variationId: variationId,
    );
