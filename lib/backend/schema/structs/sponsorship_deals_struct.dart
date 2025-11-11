// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SponsorshipDealsStruct extends BaseStruct {
  SponsorshipDealsStruct({
    Color? colour,
    String? crmTitle,
    int? expiryDatetime,
    int? purchaseDatetime,
    String? shortDisplay,
    String? sponsorImage,
    String? sponsorName,
    String? type,
    double? value,
    String? objectId,
    String? sponsorWebsite,
    String? status,
    int? sortOrder,
  })  : _colour = colour,
        _crmTitle = crmTitle,
        _expiryDatetime = expiryDatetime,
        _purchaseDatetime = purchaseDatetime,
        _shortDisplay = shortDisplay,
        _sponsorImage = sponsorImage,
        _sponsorName = sponsorName,
        _type = type,
        _value = value,
        _objectId = objectId,
        _sponsorWebsite = sponsorWebsite,
        _status = status,
        _sortOrder = sortOrder;

  // "colour" field.
  Color? _colour;
  Color? get colour => _colour;
  set colour(Color? val) => _colour = val;

  bool hasColour() => _colour != null;

  // "crmTitle" field.
  String? _crmTitle;
  String get crmTitle => _crmTitle ?? '';
  set crmTitle(String? val) => _crmTitle = val;

  bool hasCrmTitle() => _crmTitle != null;

  // "expiryDatetime" field.
  int? _expiryDatetime;
  int get expiryDatetime => _expiryDatetime ?? 0;
  set expiryDatetime(int? val) => _expiryDatetime = val;

  void incrementExpiryDatetime(int amount) =>
      expiryDatetime = expiryDatetime + amount;

  bool hasExpiryDatetime() => _expiryDatetime != null;

  // "purchaseDatetime" field.
  int? _purchaseDatetime;
  int get purchaseDatetime => _purchaseDatetime ?? 0;
  set purchaseDatetime(int? val) => _purchaseDatetime = val;

  void incrementPurchaseDatetime(int amount) =>
      purchaseDatetime = purchaseDatetime + amount;

  bool hasPurchaseDatetime() => _purchaseDatetime != null;

  // "shortDisplay" field.
  String? _shortDisplay;
  String get shortDisplay => _shortDisplay ?? '';
  set shortDisplay(String? val) => _shortDisplay = val;

  bool hasShortDisplay() => _shortDisplay != null;

  // "sponsorImage" field.
  String? _sponsorImage;
  String get sponsorImage => _sponsorImage ?? '';
  set sponsorImage(String? val) => _sponsorImage = val;

  bool hasSponsorImage() => _sponsorImage != null;

  // "sponsorName" field.
  String? _sponsorName;
  String get sponsorName => _sponsorName ?? '';
  set sponsorName(String? val) => _sponsorName = val;

  bool hasSponsorName() => _sponsorName != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 10.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "sponsorWebsite" field.
  String? _sponsorWebsite;
  String get sponsorWebsite => _sponsorWebsite ?? '';
  set sponsorWebsite(String? val) => _sponsorWebsite = val;

  bool hasSponsorWebsite() => _sponsorWebsite != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "sortOrder" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 10;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  static SponsorshipDealsStruct fromMap(Map<String, dynamic> data) =>
      SponsorshipDealsStruct(
        colour: getSchemaColor(data['colour']),
        crmTitle: data['crmTitle'] as String?,
        expiryDatetime: castToType<int>(data['expiryDatetime']),
        purchaseDatetime: castToType<int>(data['purchaseDatetime']),
        shortDisplay: data['shortDisplay'] as String?,
        sponsorImage: data['sponsorImage'] as String?,
        sponsorName: data['sponsorName'] as String?,
        type: data['type'] as String?,
        value: castToType<double>(data['value']),
        objectId: data['objectId'] as String?,
        sponsorWebsite: data['sponsorWebsite'] as String?,
        status: data['status'] as String?,
        sortOrder: castToType<int>(data['sortOrder']),
      );

  static SponsorshipDealsStruct? maybeFromMap(dynamic data) => data is Map
      ? SponsorshipDealsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'colour': _colour,
        'crmTitle': _crmTitle,
        'expiryDatetime': _expiryDatetime,
        'purchaseDatetime': _purchaseDatetime,
        'shortDisplay': _shortDisplay,
        'sponsorImage': _sponsorImage,
        'sponsorName': _sponsorName,
        'type': _type,
        'value': _value,
        'objectId': _objectId,
        'sponsorWebsite': _sponsorWebsite,
        'status': _status,
        'sortOrder': _sortOrder,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'colour': serializeParam(
          _colour,
          ParamType.Color,
        ),
        'crmTitle': serializeParam(
          _crmTitle,
          ParamType.String,
        ),
        'expiryDatetime': serializeParam(
          _expiryDatetime,
          ParamType.int,
        ),
        'purchaseDatetime': serializeParam(
          _purchaseDatetime,
          ParamType.int,
        ),
        'shortDisplay': serializeParam(
          _shortDisplay,
          ParamType.String,
        ),
        'sponsorImage': serializeParam(
          _sponsorImage,
          ParamType.String,
        ),
        'sponsorName': serializeParam(
          _sponsorName,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'sponsorWebsite': serializeParam(
          _sponsorWebsite,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'sortOrder': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
      }.withoutNulls;

  static SponsorshipDealsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SponsorshipDealsStruct(
        colour: deserializeParam(
          data['colour'],
          ParamType.Color,
          false,
        ),
        crmTitle: deserializeParam(
          data['crmTitle'],
          ParamType.String,
          false,
        ),
        expiryDatetime: deserializeParam(
          data['expiryDatetime'],
          ParamType.int,
          false,
        ),
        purchaseDatetime: deserializeParam(
          data['purchaseDatetime'],
          ParamType.int,
          false,
        ),
        shortDisplay: deserializeParam(
          data['shortDisplay'],
          ParamType.String,
          false,
        ),
        sponsorImage: deserializeParam(
          data['sponsorImage'],
          ParamType.String,
          false,
        ),
        sponsorName: deserializeParam(
          data['sponsorName'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.double,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        sponsorWebsite: deserializeParam(
          data['sponsorWebsite'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        sortOrder: deserializeParam(
          data['sortOrder'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SponsorshipDealsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SponsorshipDealsStruct &&
        colour == other.colour &&
        crmTitle == other.crmTitle &&
        expiryDatetime == other.expiryDatetime &&
        purchaseDatetime == other.purchaseDatetime &&
        shortDisplay == other.shortDisplay &&
        sponsorImage == other.sponsorImage &&
        sponsorName == other.sponsorName &&
        type == other.type &&
        value == other.value &&
        objectId == other.objectId &&
        sponsorWebsite == other.sponsorWebsite &&
        status == other.status &&
        sortOrder == other.sortOrder;
  }

  @override
  int get hashCode => const ListEquality().hash([
        colour,
        crmTitle,
        expiryDatetime,
        purchaseDatetime,
        shortDisplay,
        sponsorImage,
        sponsorName,
        type,
        value,
        objectId,
        sponsorWebsite,
        status,
        sortOrder
      ]);
}

SponsorshipDealsStruct createSponsorshipDealsStruct({
  Color? colour,
  String? crmTitle,
  int? expiryDatetime,
  int? purchaseDatetime,
  String? shortDisplay,
  String? sponsorImage,
  String? sponsorName,
  String? type,
  double? value,
  String? objectId,
  String? sponsorWebsite,
  String? status,
  int? sortOrder,
}) =>
    SponsorshipDealsStruct(
      colour: colour,
      crmTitle: crmTitle,
      expiryDatetime: expiryDatetime,
      purchaseDatetime: purchaseDatetime,
      shortDisplay: shortDisplay,
      sponsorImage: sponsorImage,
      sponsorName: sponsorName,
      type: type,
      value: value,
      objectId: objectId,
      sponsorWebsite: sponsorWebsite,
      status: status,
      sortOrder: sortOrder,
    );
