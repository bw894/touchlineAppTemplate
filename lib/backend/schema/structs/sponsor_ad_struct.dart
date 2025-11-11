// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SponsorAdStruct extends BaseStruct {
  SponsorAdStruct({
    int? created,
    int? sortOrder,
    String? link,
    String? location,
    int? updated,
    String? objectId,
    String? fileURL,
  })  : _created = created,
        _sortOrder = sortOrder,
        _link = link,
        _location = location,
        _updated = updated,
        _objectId = objectId,
        _fileURL = fileURL;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  // "sortOrder" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "updated" field.
  int? _updated;
  int get updated => _updated ?? 0;
  set updated(int? val) => _updated = val;

  void incrementUpdated(int amount) => updated = updated + amount;

  bool hasUpdated() => _updated != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "fileURL" field.
  String? _fileURL;
  String get fileURL => _fileURL ?? '';
  set fileURL(String? val) => _fileURL = val;

  bool hasFileURL() => _fileURL != null;

  static SponsorAdStruct fromMap(Map<String, dynamic> data) => SponsorAdStruct(
        created: castToType<int>(data['created']),
        sortOrder: castToType<int>(data['sortOrder']),
        link: data['link'] as String?,
        location: data['location'] as String?,
        updated: castToType<int>(data['updated']),
        objectId: data['objectId'] as String?,
        fileURL: data['fileURL'] as String?,
      );

  static SponsorAdStruct? maybeFromMap(dynamic data) => data is Map
      ? SponsorAdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created': _created,
        'sortOrder': _sortOrder,
        'link': _link,
        'location': _location,
        'updated': _updated,
        'objectId': _objectId,
        'fileURL': _fileURL,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'sortOrder': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'updated': serializeParam(
          _updated,
          ParamType.int,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'fileURL': serializeParam(
          _fileURL,
          ParamType.String,
        ),
      }.withoutNulls;

  static SponsorAdStruct fromSerializableMap(Map<String, dynamic> data) =>
      SponsorAdStruct(
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
        sortOrder: deserializeParam(
          data['sortOrder'],
          ParamType.int,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        updated: deserializeParam(
          data['updated'],
          ParamType.int,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        fileURL: deserializeParam(
          data['fileURL'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SponsorAdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SponsorAdStruct &&
        created == other.created &&
        sortOrder == other.sortOrder &&
        link == other.link &&
        location == other.location &&
        updated == other.updated &&
        objectId == other.objectId &&
        fileURL == other.fileURL;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([created, sortOrder, link, location, updated, objectId, fileURL]);
}

SponsorAdStruct createSponsorAdStruct({
  int? created,
  int? sortOrder,
  String? link,
  String? location,
  int? updated,
  String? objectId,
  String? fileURL,
}) =>
    SponsorAdStruct(
      created: created,
      sortOrder: sortOrder,
      link: link,
      location: location,
      updated: updated,
      objectId: objectId,
      fileURL: fileURL,
    );
