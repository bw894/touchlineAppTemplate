// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShippingMethodStruct extends FFFirebaseStruct {
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
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _id = id,
        _price = price,
        _deliveryDesc = deliveryDesc,
        _days = days,
        super(firestoreUtilData);

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
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShippingMethodStruct(
      name: name,
      id: id,
      price: price,
      deliveryDesc: deliveryDesc,
      days: days,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShippingMethodStruct? updateShippingMethodStruct(
  ShippingMethodStruct? shippingMethod, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    shippingMethod
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShippingMethodStructData(
  Map<String, dynamic> firestoreData,
  ShippingMethodStruct? shippingMethod,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shippingMethod == null) {
    return;
  }
  if (shippingMethod.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && shippingMethod.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shippingMethodData =
      getShippingMethodFirestoreData(shippingMethod, forFieldValue);
  final nestedData =
      shippingMethodData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = shippingMethod.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShippingMethodFirestoreData(
  ShippingMethodStruct? shippingMethod, [
  bool forFieldValue = false,
]) {
  if (shippingMethod == null) {
    return {};
  }
  final firestoreData = mapToFirestore(shippingMethod.toMap());

  // Add any Firestore field values
  shippingMethod.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShippingMethodListFirestoreData(
  List<ShippingMethodStruct>? shippingMethods,
) =>
    shippingMethods
        ?.map((e) => getShippingMethodFirestoreData(e, true))
        .toList() ??
    [];
