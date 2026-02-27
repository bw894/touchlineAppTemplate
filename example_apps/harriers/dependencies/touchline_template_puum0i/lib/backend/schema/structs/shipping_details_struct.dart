// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShippingDetailsStruct extends FFFirebaseStruct {
  ShippingDetailsStruct({
    String? address1,
    String? address2,
    String? city,
    String? postcode,
    String? country,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _address1 = address1,
        _address2 = address2,
        _city = city,
        _postcode = postcode,
        _country = country,
        super(firestoreUtilData);

  // "address_1" field.
  String? _address1;
  String get address1 => _address1 ?? '';
  set address1(String? val) => _address1 = val;

  bool hasAddress1() => _address1 != null;

  // "address_2" field.
  String? _address2;
  String get address2 => _address2 ?? '';
  set address2(String? val) => _address2 = val;

  bool hasAddress2() => _address2 != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "postcode" field.
  String? _postcode;
  String get postcode => _postcode ?? '';
  set postcode(String? val) => _postcode = val;

  bool hasPostcode() => _postcode != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  static ShippingDetailsStruct fromMap(Map<String, dynamic> data) =>
      ShippingDetailsStruct(
        address1: data['address_1'] as String?,
        address2: data['address_2'] as String?,
        city: data['city'] as String?,
        postcode: data['postcode'] as String?,
        country: data['country'] as String?,
      );

  static ShippingDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? ShippingDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'address_1': _address1,
        'address_2': _address2,
        'city': _city,
        'postcode': _postcode,
        'country': _country,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'address_1': serializeParam(
          _address1,
          ParamType.String,
        ),
        'address_2': serializeParam(
          _address2,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'postcode': serializeParam(
          _postcode,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
      }.withoutNulls;

  static ShippingDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShippingDetailsStruct(
        address1: deserializeParam(
          data['address_1'],
          ParamType.String,
          false,
        ),
        address2: deserializeParam(
          data['address_2'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        postcode: deserializeParam(
          data['postcode'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ShippingDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShippingDetailsStruct &&
        address1 == other.address1 &&
        address2 == other.address2 &&
        city == other.city &&
        postcode == other.postcode &&
        country == other.country;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([address1, address2, city, postcode, country]);
}

ShippingDetailsStruct createShippingDetailsStruct({
  String? address1,
  String? address2,
  String? city,
  String? postcode,
  String? country,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ShippingDetailsStruct(
      address1: address1,
      address2: address2,
      city: city,
      postcode: postcode,
      country: country,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ShippingDetailsStruct? updateShippingDetailsStruct(
  ShippingDetailsStruct? shippingDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    shippingDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addShippingDetailsStructData(
  Map<String, dynamic> firestoreData,
  ShippingDetailsStruct? shippingDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (shippingDetails == null) {
    return;
  }
  if (shippingDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && shippingDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final shippingDetailsData =
      getShippingDetailsFirestoreData(shippingDetails, forFieldValue);
  final nestedData =
      shippingDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = shippingDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getShippingDetailsFirestoreData(
  ShippingDetailsStruct? shippingDetails, [
  bool forFieldValue = false,
]) {
  if (shippingDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(shippingDetails.toMap());

  // Add any Firestore field values
  shippingDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getShippingDetailsListFirestoreData(
  List<ShippingDetailsStruct>? shippingDetailss,
) =>
    shippingDetailss
        ?.map((e) => getShippingDetailsFirestoreData(e, true))
        .toList() ??
    [];
