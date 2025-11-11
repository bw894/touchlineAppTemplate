// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShippingMethodStruct extends BaseStruct {
  ShippingMethodStruct({
    /// e.g.
    ///
    /// Click & Collect
    String? name,
    int? id,
    double? price,

    /// e.g.
    ///
    /// Estimated Delivery on 29th August
    String? deliveryDesc,
    int? days,
  })  : _name = name,
        _id = id,
        _price = price,
        _deliveryDesc = deliveryDesc,
        _days = days;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "deliveryDesc" field.
  String? _deliveryDesc;
  String get deliveryDesc => _deliveryDesc ?? '';
  set deliveryDesc(String? val) => _deliveryDesc = val;

  bool hasDeliveryDesc() => _deliveryDesc != null;

  // "days" field.
  int? _days;
  int get days => _days ?? 0;
  set days(int? val) => _days = val;

  void incrementDays(int amount) => days = days + amount;

  bool hasDays() => _days != null;

  static ShippingMethodStruct fromMap(Map<String, dynamic> data) =>
      ShippingMethodStruct(
        name: data['name'] as String?,
        id: castToType<int>(data['id']),
        price: castToType<double>(data['price']),
        deliveryDesc: data['deliveryDesc'] as String?,
        days: castToType<int>(data['days']),
      );

  static ShippingMethodStruct? maybeFromMap(dynamic data) => data is Map
      ? ShippingMethodStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
        'price': _price,
        'deliveryDesc': _deliveryDesc,
        'days': _days,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'deliveryDesc': serializeParam(
          _deliveryDesc,
          ParamType.String,
        ),
        'days': serializeParam(
          _days,
          ParamType.int,
        ),
      }.withoutNulls;

  static ShippingMethodStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShippingMethodStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        deliveryDesc: deserializeParam(
          data['deliveryDesc'],
          ParamType.String,
          false,
        ),
        days: deserializeParam(
          data['days'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ShippingMethodStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShippingMethodStruct &&
        name == other.name &&
        id == other.id &&
        price == other.price &&
        deliveryDesc == other.deliveryDesc &&
        days == other.days;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, id, price, deliveryDesc, days]);
}

ShippingMethodStruct createShippingMethodStruct({
  String? name,
  int? id,
  double? price,
  String? deliveryDesc,
  int? days,
}) =>
    ShippingMethodStruct(
      name: name,
      id: id,
      price: price,
      deliveryDesc: deliveryDesc,
      days: days,
    );
