// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckoutStruct extends FFFirebaseStruct {
  CheckoutStruct({
    double? platformFee,
    BillingDetailsStruct? billingDetails,
    ShippingDetailsStruct? shippingDetails,

    /// Total of the order, including the platform fee
    double? orderTotal,

    /// If checked, we should hide the contents of this order on any emails to the
    /// customer
    ///
    bool? gift,
    ShippingMethodStruct? shippingMethod,
    List<CartLinesStruct>? cartLines,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _platformFee = platformFee,
        _billingDetails = billingDetails,
        _shippingDetails = shippingDetails,
        _orderTotal = orderTotal,
        _gift = gift,
        _shippingMethod = shippingMethod,
        _cartLines = cartLines,
        super(firestoreUtilData);

  // "platform_fee" field.
  double? _platformFee;
  double get platformFee => _platformFee ?? 0.5;
  set platformFee(double? val) => _platformFee = val;

  void incrementPlatformFee(double amount) =>
      platformFee = platformFee + amount;

  bool hasPlatformFee() => _platformFee != null;

  // "billing_details" field.
  BillingDetailsStruct? _billingDetails;
  BillingDetailsStruct get billingDetails =>
      _billingDetails ?? BillingDetailsStruct();
  set billingDetails(BillingDetailsStruct? val) => _billingDetails = val;

  void updateBillingDetails(Function(BillingDetailsStruct) updateFn) {
    updateFn(_billingDetails ??= BillingDetailsStruct());
  }

  bool hasBillingDetails() => _billingDetails != null;

  // "shipping_details" field.
  ShippingDetailsStruct? _shippingDetails;
  ShippingDetailsStruct get shippingDetails =>
      _shippingDetails ?? ShippingDetailsStruct();
  set shippingDetails(ShippingDetailsStruct? val) => _shippingDetails = val;

  void updateShippingDetails(Function(ShippingDetailsStruct) updateFn) {
    updateFn(_shippingDetails ??= ShippingDetailsStruct());
  }

  bool hasShippingDetails() => _shippingDetails != null;

  // "order_total" field.
  double? _orderTotal;
  double get orderTotal => _orderTotal ?? 0.0;
  set orderTotal(double? val) => _orderTotal = val;

  void incrementOrderTotal(double amount) => orderTotal = orderTotal + amount;

  bool hasOrderTotal() => _orderTotal != null;

  // "gift" field.
  bool? _gift;
  bool get gift => _gift ?? false;
  set gift(bool? val) => _gift = val;

  bool hasGift() => _gift != null;

  // "shipping_method" field.
  ShippingMethodStruct? _shippingMethod;
  ShippingMethodStruct get shippingMethod =>
      _shippingMethod ?? ShippingMethodStruct();
  set shippingMethod(ShippingMethodStruct? val) => _shippingMethod = val;

  void updateShippingMethod(Function(ShippingMethodStruct) updateFn) {
    updateFn(_shippingMethod ??= ShippingMethodStruct());
  }

  bool hasShippingMethod() => _shippingMethod != null;

  // "cart_lines" field.
  List<CartLinesStruct>? _cartLines;
  List<CartLinesStruct> get cartLines => _cartLines ?? const [];
  set cartLines(List<CartLinesStruct>? val) => _cartLines = val;

  void updateCartLines(Function(List<CartLinesStruct>) updateFn) {
    updateFn(_cartLines ??= []);
  }

  bool hasCartLines() => _cartLines != null;

  static CheckoutStruct fromMap(Map<String, dynamic> data) => CheckoutStruct(
        platformFee: castToType<double>(data['platform_fee']),
        billingDetails: data['billing_details'] is BillingDetailsStruct
            ? data['billing_details']
            : BillingDetailsStruct.maybeFromMap(data['billing_details']),
        shippingDetails: data['shipping_details'] is ShippingDetailsStruct
            ? data['shipping_details']
            : ShippingDetailsStruct.maybeFromMap(data['shipping_details']),
        orderTotal: castToType<double>(data['order_total']),
        gift: data['gift'] as bool?,
        shippingMethod: data['shipping_method'] is ShippingMethodStruct
            ? data['shipping_method']
            : ShippingMethodStruct.maybeFromMap(data['shipping_method']),
        cartLines: getStructList(
          data['cart_lines'],
          CartLinesStruct.fromMap,
        ),
      );

  static CheckoutStruct? maybeFromMap(dynamic data) =>
      data is Map ? CheckoutStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'platform_fee': _platformFee,
        'billing_details': _billingDetails?.toMap(),
        'shipping_details': _shippingDetails?.toMap(),
        'order_total': _orderTotal,
        'gift': _gift,
        'shipping_method': _shippingMethod?.toMap(),
        'cart_lines': _cartLines?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'platform_fee': serializeParam(
          _platformFee,
          ParamType.double,
        ),
        'billing_details': serializeParam(
          _billingDetails,
          ParamType.DataStruct,
        ),
        'shipping_details': serializeParam(
          _shippingDetails,
          ParamType.DataStruct,
        ),
        'order_total': serializeParam(
          _orderTotal,
          ParamType.double,
        ),
        'gift': serializeParam(
          _gift,
          ParamType.bool,
        ),
        'shipping_method': serializeParam(
          _shippingMethod,
          ParamType.DataStruct,
        ),
        'cart_lines': serializeParam(
          _cartLines,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CheckoutStruct fromSerializableMap(Map<String, dynamic> data) =>
      CheckoutStruct(
        platformFee: deserializeParam(
          data['platform_fee'],
          ParamType.double,
          false,
        ),
        billingDetails: deserializeStructParam(
          data['billing_details'],
          ParamType.DataStruct,
          false,
          structBuilder: BillingDetailsStruct.fromSerializableMap,
        ),
        shippingDetails: deserializeStructParam(
          data['shipping_details'],
          ParamType.DataStruct,
          false,
          structBuilder: ShippingDetailsStruct.fromSerializableMap,
        ),
        orderTotal: deserializeParam(
          data['order_total'],
          ParamType.double,
          false,
        ),
        gift: deserializeParam(
          data['gift'],
          ParamType.bool,
          false,
        ),
        shippingMethod: deserializeStructParam(
          data['shipping_method'],
          ParamType.DataStruct,
          false,
          structBuilder: ShippingMethodStruct.fromSerializableMap,
        ),
        cartLines: deserializeStructParam<CartLinesStruct>(
          data['cart_lines'],
          ParamType.DataStruct,
          true,
          structBuilder: CartLinesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CheckoutStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CheckoutStruct &&
        platformFee == other.platformFee &&
        billingDetails == other.billingDetails &&
        shippingDetails == other.shippingDetails &&
        orderTotal == other.orderTotal &&
        gift == other.gift &&
        shippingMethod == other.shippingMethod &&
        listEquality.equals(cartLines, other.cartLines);
  }

  @override
  int get hashCode => const ListEquality().hash([
        platformFee,
        billingDetails,
        shippingDetails,
        orderTotal,
        gift,
        shippingMethod,
        cartLines
      ]);
}

CheckoutStruct createCheckoutStruct({
  double? platformFee,
  BillingDetailsStruct? billingDetails,
  ShippingDetailsStruct? shippingDetails,
  double? orderTotal,
  bool? gift,
  ShippingMethodStruct? shippingMethod,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CheckoutStruct(
      platformFee: platformFee,
      billingDetails:
          billingDetails ?? (clearUnsetFields ? BillingDetailsStruct() : null),
      shippingDetails: shippingDetails ??
          (clearUnsetFields ? ShippingDetailsStruct() : null),
      orderTotal: orderTotal,
      gift: gift,
      shippingMethod:
          shippingMethod ?? (clearUnsetFields ? ShippingMethodStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CheckoutStruct? updateCheckoutStruct(
  CheckoutStruct? checkout, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    checkout
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCheckoutStructData(
  Map<String, dynamic> firestoreData,
  CheckoutStruct? checkout,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (checkout == null) {
    return;
  }
  if (checkout.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && checkout.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checkoutData = getCheckoutFirestoreData(checkout, forFieldValue);
  final nestedData = checkoutData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = checkout.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCheckoutFirestoreData(
  CheckoutStruct? checkout, [
  bool forFieldValue = false,
]) {
  if (checkout == null) {
    return {};
  }
  final firestoreData = mapToFirestore(checkout.toMap());

  // Handle nested data for "billing_details" field.
  addBillingDetailsStructData(
    firestoreData,
    checkout.hasBillingDetails() ? checkout.billingDetails : null,
    'billing_details',
    forFieldValue,
  );

  // Handle nested data for "shipping_details" field.
  addShippingDetailsStructData(
    firestoreData,
    checkout.hasShippingDetails() ? checkout.shippingDetails : null,
    'shipping_details',
    forFieldValue,
  );

  // Handle nested data for "shipping_method" field.
  addShippingMethodStructData(
    firestoreData,
    checkout.hasShippingMethod() ? checkout.shippingMethod : null,
    'shipping_method',
    forFieldValue,
  );

  // Add any Firestore field values
  checkout.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCheckoutListFirestoreData(
  List<CheckoutStruct>? checkouts,
) =>
    checkouts?.map((e) => getCheckoutFirestoreData(e, true)).toList() ?? [];
