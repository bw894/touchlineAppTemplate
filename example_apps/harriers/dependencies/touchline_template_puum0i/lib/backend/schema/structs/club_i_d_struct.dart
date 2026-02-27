// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClubIDStruct extends FFFirebaseStruct {
  ClubIDStruct({
    String? clubName,
    SettingsStruct? settings,
    String? bLappId,
    int? created,
    String? settingsIdentifier,
    String? shortName,
    String? ownerId,
    String? socialLink,
    String? abr,
    String? bLRestApiKey,
    String? clubColour,
    int? updated,
    String? objectId,
    String? badgeURL,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _clubName = clubName,
        _settings = settings,
        _bLappId = bLappId,
        _created = created,
        _settingsIdentifier = settingsIdentifier,
        _shortName = shortName,
        _ownerId = ownerId,
        _socialLink = socialLink,
        _abr = abr,
        _bLRestApiKey = bLRestApiKey,
        _clubColour = clubColour,
        _updated = updated,
        _objectId = objectId,
        _badgeURL = badgeURL,
        super(firestoreUtilData);

  // "ClubName" field.
  String? _clubName;
  String get clubName => _clubName ?? '';
  set clubName(String? val) => _clubName = val;

  bool hasClubName() => _clubName != null;

  // "settings" field.
  SettingsStruct? _settings;
  SettingsStruct get settings => _settings ?? SettingsStruct();
  set settings(SettingsStruct? val) => _settings = val;

  void updateSettings(Function(SettingsStruct) updateFn) {
    updateFn(_settings ??= SettingsStruct());
  }

  bool hasSettings() => _settings != null;

  // "BLappId" field.
  String? _bLappId;
  String get bLappId => _bLappId ?? '';
  set bLappId(String? val) => _bLappId = val;

  bool hasBLappId() => _bLappId != null;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  // "settingsIdentifier" field.
  String? _settingsIdentifier;
  String get settingsIdentifier => _settingsIdentifier ?? '';
  set settingsIdentifier(String? val) => _settingsIdentifier = val;

  bool hasSettingsIdentifier() => _settingsIdentifier != null;

  // "ShortName" field.
  String? _shortName;
  String get shortName => _shortName ?? '';
  set shortName(String? val) => _shortName = val;

  bool hasShortName() => _shortName != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "socialLink" field.
  String? _socialLink;
  String get socialLink => _socialLink ?? '';
  set socialLink(String? val) => _socialLink = val;

  bool hasSocialLink() => _socialLink != null;

  // "ABR" field.
  String? _abr;
  String get abr => _abr ?? '';
  set abr(String? val) => _abr = val;

  bool hasAbr() => _abr != null;

  // "BLRestApiKey" field.
  String? _bLRestApiKey;
  String get bLRestApiKey => _bLRestApiKey ?? '';
  set bLRestApiKey(String? val) => _bLRestApiKey = val;

  bool hasBLRestApiKey() => _bLRestApiKey != null;

  // "clubColour" field.
  String? _clubColour;
  String get clubColour => _clubColour ?? '';
  set clubColour(String? val) => _clubColour = val;

  bool hasClubColour() => _clubColour != null;

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

  // "BadgeURL" field.
  String? _badgeURL;
  String get badgeURL => _badgeURL ?? '';
  set badgeURL(String? val) => _badgeURL = val;

  bool hasBadgeURL() => _badgeURL != null;

  static ClubIDStruct fromMap(Map<String, dynamic> data) => ClubIDStruct(
        clubName: data['ClubName'] as String?,
        settings: data['settings'] is SettingsStruct
            ? data['settings']
            : SettingsStruct.maybeFromMap(data['settings']),
        bLappId: data['BLappId'] as String?,
        created: castToType<int>(data['created']),
        settingsIdentifier: data['settingsIdentifier'] as String?,
        shortName: data['ShortName'] as String?,
        ownerId: data['ownerId'] as String?,
        socialLink: data['socialLink'] as String?,
        abr: data['ABR'] as String?,
        bLRestApiKey: data['BLRestApiKey'] as String?,
        clubColour: data['clubColour'] as String?,
        updated: castToType<int>(data['updated']),
        objectId: data['objectId'] as String?,
        badgeURL: data['BadgeURL'] as String?,
      );

  static ClubIDStruct? maybeFromMap(dynamic data) =>
      data is Map ? ClubIDStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ClubName': _clubName,
        'settings': _settings?.toMap(),
        'BLappId': _bLappId,
        'created': _created,
        'settingsIdentifier': _settingsIdentifier,
        'ShortName': _shortName,
        'ownerId': _ownerId,
        'socialLink': _socialLink,
        'ABR': _abr,
        'BLRestApiKey': _bLRestApiKey,
        'clubColour': _clubColour,
        'updated': _updated,
        'objectId': _objectId,
        'BadgeURL': _badgeURL,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ClubName': serializeParam(
          _clubName,
          ParamType.String,
        ),
        'settings': serializeParam(
          _settings,
          ParamType.DataStruct,
        ),
        'BLappId': serializeParam(
          _bLappId,
          ParamType.String,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'settingsIdentifier': serializeParam(
          _settingsIdentifier,
          ParamType.String,
        ),
        'ShortName': serializeParam(
          _shortName,
          ParamType.String,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'socialLink': serializeParam(
          _socialLink,
          ParamType.String,
        ),
        'ABR': serializeParam(
          _abr,
          ParamType.String,
        ),
        'BLRestApiKey': serializeParam(
          _bLRestApiKey,
          ParamType.String,
        ),
        'clubColour': serializeParam(
          _clubColour,
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
        'BadgeURL': serializeParam(
          _badgeURL,
          ParamType.String,
        ),
      }.withoutNulls;

  static ClubIDStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClubIDStruct(
        clubName: deserializeParam(
          data['ClubName'],
          ParamType.String,
          false,
        ),
        settings: deserializeStructParam(
          data['settings'],
          ParamType.DataStruct,
          false,
          structBuilder: SettingsStruct.fromSerializableMap,
        ),
        bLappId: deserializeParam(
          data['BLappId'],
          ParamType.String,
          false,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
        settingsIdentifier: deserializeParam(
          data['settingsIdentifier'],
          ParamType.String,
          false,
        ),
        shortName: deserializeParam(
          data['ShortName'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['ownerId'],
          ParamType.String,
          false,
        ),
        socialLink: deserializeParam(
          data['socialLink'],
          ParamType.String,
          false,
        ),
        abr: deserializeParam(
          data['ABR'],
          ParamType.String,
          false,
        ),
        bLRestApiKey: deserializeParam(
          data['BLRestApiKey'],
          ParamType.String,
          false,
        ),
        clubColour: deserializeParam(
          data['clubColour'],
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
        badgeURL: deserializeParam(
          data['BadgeURL'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ClubIDStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ClubIDStruct &&
        clubName == other.clubName &&
        settings == other.settings &&
        bLappId == other.bLappId &&
        created == other.created &&
        settingsIdentifier == other.settingsIdentifier &&
        shortName == other.shortName &&
        ownerId == other.ownerId &&
        socialLink == other.socialLink &&
        abr == other.abr &&
        bLRestApiKey == other.bLRestApiKey &&
        clubColour == other.clubColour &&
        updated == other.updated &&
        objectId == other.objectId &&
        badgeURL == other.badgeURL;
  }

  @override
  int get hashCode => const ListEquality().hash([
        clubName,
        settings,
        bLappId,
        created,
        settingsIdentifier,
        shortName,
        ownerId,
        socialLink,
        abr,
        bLRestApiKey,
        clubColour,
        updated,
        objectId,
        badgeURL
      ]);
}

ClubIDStruct createClubIDStruct({
  String? clubName,
  SettingsStruct? settings,
  String? bLappId,
  int? created,
  String? settingsIdentifier,
  String? shortName,
  String? ownerId,
  String? socialLink,
  String? abr,
  String? bLRestApiKey,
  String? clubColour,
  int? updated,
  String? objectId,
  String? badgeURL,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ClubIDStruct(
      clubName: clubName,
      settings: settings ?? (clearUnsetFields ? SettingsStruct() : null),
      bLappId: bLappId,
      created: created,
      settingsIdentifier: settingsIdentifier,
      shortName: shortName,
      ownerId: ownerId,
      socialLink: socialLink,
      abr: abr,
      bLRestApiKey: bLRestApiKey,
      clubColour: clubColour,
      updated: updated,
      objectId: objectId,
      badgeURL: badgeURL,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ClubIDStruct? updateClubIDStruct(
  ClubIDStruct? clubID, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    clubID
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addClubIDStructData(
  Map<String, dynamic> firestoreData,
  ClubIDStruct? clubID,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (clubID == null) {
    return;
  }
  if (clubID.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && clubID.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final clubIDData = getClubIDFirestoreData(clubID, forFieldValue);
  final nestedData = clubIDData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = clubID.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getClubIDFirestoreData(
  ClubIDStruct? clubID, [
  bool forFieldValue = false,
]) {
  if (clubID == null) {
    return {};
  }
  final firestoreData = mapToFirestore(clubID.toMap());

  // Handle nested data for "settings" field.
  addSettingsStructData(
    firestoreData,
    clubID.hasSettings() ? clubID.settings : null,
    'settings',
    forFieldValue,
  );

  // Add any Firestore field values
  clubID.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getClubIDListFirestoreData(
  List<ClubIDStruct>? clubIDs,
) =>
    clubIDs?.map((e) => getClubIDFirestoreData(e, true)).toList() ?? [];
