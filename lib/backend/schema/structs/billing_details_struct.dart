// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Billing details of the user
class BillingDetailsStruct extends BaseStruct {
  BillingDetailsStruct({
    String? name,
    String? phone,
    String? email,
    String? address1,
    String? address2,
    String? city,
    String? postcode,
    String? country,
  })  : _name = name,
        _phone = phone,
        _email = email,
        _address1 = address1,
        _address2 = address2,
        _city = city,
        _postcode = postcode,
        _country = country;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

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

  static BillingDetailsStruct fromMap(Map<String, dynamic> data) =>
      BillingDetailsStruct(
        name: data['name'] as String?,
        phone: data['phone'] as String?,
        email: data['email'] as String?,
        address1: data['address_1'] as String?,
        address2: data['address_2'] as String?,
        city: data['city'] as String?,
        postcode: data['postcode'] as String?,
        country: data['country'] as String?,
      );

  static BillingDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? BillingDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'phone': _phone,
        'email': _email,
        'address_1': _address1,
        'address_2': _address2,
        'city': _city,
        'postcode': _postcode,
        'country': _country,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
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

  static BillingDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      BillingDetailsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
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
  String toString() => 'BillingDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BillingDetailsStruct &&
        name == other.name &&
        phone == other.phone &&
        email == other.email &&
        address1 == other.address1 &&
        address2 == other.address2 &&
        city == other.city &&
        postcode == other.postcode &&
        country == other.country;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, phone, email, address1, address2, city, postcode, country]);
}

BillingDetailsStruct createBillingDetailsStruct({
  String? name,
  String? phone,
  String? email,
  String? address1,
  String? address2,
  String? city,
  String? postcode,
  String? country,
}) =>
    BillingDetailsStruct(
      name: name,
      phone: phone,
      email: email,
      address1: address1,
      address2: address2,
      city: city,
      postcode: postcode,
      country: country,
    );
