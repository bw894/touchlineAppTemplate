// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CampaignStruct extends BaseStruct {
  CampaignStruct({
    String? appTargetLink,
    String? desktopImage,
    int? endDatetime,
    String? mobileImage,
    int? sortOrder,
    int? startDatetime,
    String? webTargetLink,
    String? ownerId,
    String? objectId,
    int? created,
    int? updated,
    bool? mobileOnOff,
    int? mobileClick,
  })  : _appTargetLink = appTargetLink,
        _desktopImage = desktopImage,
        _endDatetime = endDatetime,
        _mobileImage = mobileImage,
        _sortOrder = sortOrder,
        _startDatetime = startDatetime,
        _webTargetLink = webTargetLink,
        _ownerId = ownerId,
        _objectId = objectId,
        _created = created,
        _updated = updated,
        _mobileOnOff = mobileOnOff,
        _mobileClick = mobileClick;

  // "appTargetLink" field.
  String? _appTargetLink;
  String get appTargetLink => _appTargetLink ?? '';
  set appTargetLink(String? val) => _appTargetLink = val;

  bool hasAppTargetLink() => _appTargetLink != null;

  // "desktopImage" field.
  String? _desktopImage;
  String get desktopImage => _desktopImage ?? '';
  set desktopImage(String? val) => _desktopImage = val;

  bool hasDesktopImage() => _desktopImage != null;

  // "endDatetime" field.
  int? _endDatetime;
  int get endDatetime => _endDatetime ?? 0;
  set endDatetime(int? val) => _endDatetime = val;

  void incrementEndDatetime(int amount) => endDatetime = endDatetime + amount;

  bool hasEndDatetime() => _endDatetime != null;

  // "mobileImage" field.
  String? _mobileImage;
  String get mobileImage => _mobileImage ?? '';
  set mobileImage(String? val) => _mobileImage = val;

  bool hasMobileImage() => _mobileImage != null;

  // "sortOrder" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 10;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  // "startDatetime" field.
  int? _startDatetime;
  int get startDatetime => _startDatetime ?? 0;
  set startDatetime(int? val) => _startDatetime = val;

  void incrementStartDatetime(int amount) =>
      startDatetime = startDatetime + amount;

  bool hasStartDatetime() => _startDatetime != null;

  // "webTargetLink" field.
  String? _webTargetLink;
  String get webTargetLink => _webTargetLink ?? '';
  set webTargetLink(String? val) => _webTargetLink = val;

  bool hasWebTargetLink() => _webTargetLink != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

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

  // "mobileOnOff" field.
  bool? _mobileOnOff;
  bool get mobileOnOff => _mobileOnOff ?? true;
  set mobileOnOff(bool? val) => _mobileOnOff = val;

  bool hasMobileOnOff() => _mobileOnOff != null;

  // "mobile_click" field.
  int? _mobileClick;
  int get mobileClick => _mobileClick ?? 0;
  set mobileClick(int? val) => _mobileClick = val;

  void incrementMobileClick(int amount) => mobileClick = mobileClick + amount;

  bool hasMobileClick() => _mobileClick != null;

  static CampaignStruct fromMap(Map<String, dynamic> data) => CampaignStruct(
        appTargetLink: data['appTargetLink'] as String?,
        desktopImage: data['desktopImage'] as String?,
        endDatetime: castToType<int>(data['endDatetime']),
        mobileImage: data['mobileImage'] as String?,
        sortOrder: castToType<int>(data['sortOrder']),
        startDatetime: castToType<int>(data['startDatetime']),
        webTargetLink: data['webTargetLink'] as String?,
        ownerId: data['ownerId'] as String?,
        objectId: data['objectId'] as String?,
        created: castToType<int>(data['created']),
        updated: castToType<int>(data['updated']),
        mobileOnOff: data['mobileOnOff'] as bool?,
        mobileClick: castToType<int>(data['mobile_click']),
      );

  static CampaignStruct? maybeFromMap(dynamic data) =>
      data is Map ? CampaignStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'appTargetLink': _appTargetLink,
        'desktopImage': _desktopImage,
        'endDatetime': _endDatetime,
        'mobileImage': _mobileImage,
        'sortOrder': _sortOrder,
        'startDatetime': _startDatetime,
        'webTargetLink': _webTargetLink,
        'ownerId': _ownerId,
        'objectId': _objectId,
        'created': _created,
        'updated': _updated,
        'mobileOnOff': _mobileOnOff,
        'mobile_click': _mobileClick,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'appTargetLink': serializeParam(
          _appTargetLink,
          ParamType.String,
        ),
        'desktopImage': serializeParam(
          _desktopImage,
          ParamType.String,
        ),
        'endDatetime': serializeParam(
          _endDatetime,
          ParamType.int,
        ),
        'mobileImage': serializeParam(
          _mobileImage,
          ParamType.String,
        ),
        'sortOrder': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
        'startDatetime': serializeParam(
          _startDatetime,
          ParamType.int,
        ),
        'webTargetLink': serializeParam(
          _webTargetLink,
          ParamType.String,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
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
        'mobileOnOff': serializeParam(
          _mobileOnOff,
          ParamType.bool,
        ),
        'mobile_click': serializeParam(
          _mobileClick,
          ParamType.int,
        ),
      }.withoutNulls;

  static CampaignStruct fromSerializableMap(Map<String, dynamic> data) =>
      CampaignStruct(
        appTargetLink: deserializeParam(
          data['appTargetLink'],
          ParamType.String,
          false,
        ),
        desktopImage: deserializeParam(
          data['desktopImage'],
          ParamType.String,
          false,
        ),
        endDatetime: deserializeParam(
          data['endDatetime'],
          ParamType.int,
          false,
        ),
        mobileImage: deserializeParam(
          data['mobileImage'],
          ParamType.String,
          false,
        ),
        sortOrder: deserializeParam(
          data['sortOrder'],
          ParamType.int,
          false,
        ),
        startDatetime: deserializeParam(
          data['startDatetime'],
          ParamType.int,
          false,
        ),
        webTargetLink: deserializeParam(
          data['webTargetLink'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['ownerId'],
          ParamType.String,
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
        mobileOnOff: deserializeParam(
          data['mobileOnOff'],
          ParamType.bool,
          false,
        ),
        mobileClick: deserializeParam(
          data['mobile_click'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CampaignStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CampaignStruct &&
        appTargetLink == other.appTargetLink &&
        desktopImage == other.desktopImage &&
        endDatetime == other.endDatetime &&
        mobileImage == other.mobileImage &&
        sortOrder == other.sortOrder &&
        startDatetime == other.startDatetime &&
        webTargetLink == other.webTargetLink &&
        ownerId == other.ownerId &&
        objectId == other.objectId &&
        created == other.created &&
        updated == other.updated &&
        mobileOnOff == other.mobileOnOff &&
        mobileClick == other.mobileClick;
  }

  @override
  int get hashCode => const ListEquality().hash([
        appTargetLink,
        desktopImage,
        endDatetime,
        mobileImage,
        sortOrder,
        startDatetime,
        webTargetLink,
        ownerId,
        objectId,
        created,
        updated,
        mobileOnOff,
        mobileClick
      ]);
}

CampaignStruct createCampaignStruct({
  String? appTargetLink,
  String? desktopImage,
  int? endDatetime,
  String? mobileImage,
  int? sortOrder,
  int? startDatetime,
  String? webTargetLink,
  String? ownerId,
  String? objectId,
  int? created,
  int? updated,
  bool? mobileOnOff,
  int? mobileClick,
}) =>
    CampaignStruct(
      appTargetLink: appTargetLink,
      desktopImage: desktopImage,
      endDatetime: endDatetime,
      mobileImage: mobileImage,
      sortOrder: sortOrder,
      startDatetime: startDatetime,
      webTargetLink: webTargetLink,
      ownerId: ownerId,
      objectId: objectId,
      created: created,
      updated: updated,
      mobileOnOff: mobileOnOff,
      mobileClick: mobileClick,
    );
