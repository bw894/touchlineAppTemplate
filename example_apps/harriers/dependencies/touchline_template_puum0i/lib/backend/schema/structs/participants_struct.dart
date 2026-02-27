// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParticipantsStruct extends FFFirebaseStruct {
  ParticipantsStruct({
    int? id,
    MetaStruct? meta,
    String? name,
    String? type,
    String? gender,
    int? founded,
    int? sportId,
    int? venueId,
    int? countryId,
    String? shortCode,
    bool? placeholder,
    String? lastPlayedAt,
    String? imagePath,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _meta = meta,
        _name = name,
        _type = type,
        _gender = gender,
        _founded = founded,
        _sportId = sportId,
        _venueId = venueId,
        _countryId = countryId,
        _shortCode = shortCode,
        _placeholder = placeholder,
        _lastPlayedAt = lastPlayedAt,
        _imagePath = imagePath,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "meta" field.
  MetaStruct? _meta;
  MetaStruct get meta => _meta ?? MetaStruct();
  set meta(MetaStruct? val) => _meta = val;

  void updateMeta(Function(MetaStruct) updateFn) {
    updateFn(_meta ??= MetaStruct());
  }

  bool hasMeta() => _meta != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "founded" field.
  int? _founded;
  int get founded => _founded ?? 0;
  set founded(int? val) => _founded = val;

  void incrementFounded(int amount) => founded = founded + amount;

  bool hasFounded() => _founded != null;

  // "sport_id" field.
  int? _sportId;
  int get sportId => _sportId ?? 0;
  set sportId(int? val) => _sportId = val;

  void incrementSportId(int amount) => sportId = sportId + amount;

  bool hasSportId() => _sportId != null;

  // "venue_id" field.
  int? _venueId;
  int get venueId => _venueId ?? 0;
  set venueId(int? val) => _venueId = val;

  void incrementVenueId(int amount) => venueId = venueId + amount;

  bool hasVenueId() => _venueId != null;

  // "country_id" field.
  int? _countryId;
  int get countryId => _countryId ?? 0;
  set countryId(int? val) => _countryId = val;

  void incrementCountryId(int amount) => countryId = countryId + amount;

  bool hasCountryId() => _countryId != null;

  // "short_code" field.
  String? _shortCode;
  String get shortCode => _shortCode ?? '';
  set shortCode(String? val) => _shortCode = val;

  bool hasShortCode() => _shortCode != null;

  // "placeholder" field.
  bool? _placeholder;
  bool get placeholder => _placeholder ?? false;
  set placeholder(bool? val) => _placeholder = val;

  bool hasPlaceholder() => _placeholder != null;

  // "last_played_at" field.
  String? _lastPlayedAt;
  String get lastPlayedAt => _lastPlayedAt ?? '';
  set lastPlayedAt(String? val) => _lastPlayedAt = val;

  bool hasLastPlayedAt() => _lastPlayedAt != null;

  // "image_path" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  set imagePath(String? val) => _imagePath = val;

  bool hasImagePath() => _imagePath != null;

  static ParticipantsStruct fromMap(Map<String, dynamic> data) =>
      ParticipantsStruct(
        id: castToType<int>(data['id']),
        meta: data['meta'] is MetaStruct
            ? data['meta']
            : MetaStruct.maybeFromMap(data['meta']),
        name: data['name'] as String?,
        type: data['type'] as String?,
        gender: data['gender'] as String?,
        founded: castToType<int>(data['founded']),
        sportId: castToType<int>(data['sport_id']),
        venueId: castToType<int>(data['venue_id']),
        countryId: castToType<int>(data['country_id']),
        shortCode: data['short_code'] as String?,
        placeholder: data['placeholder'] as bool?,
        lastPlayedAt: data['last_played_at'] as String?,
        imagePath: data['image_path'] as String?,
      );

  static ParticipantsStruct? maybeFromMap(dynamic data) => data is Map
      ? ParticipantsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'meta': _meta?.toMap(),
        'name': _name,
        'type': _type,
        'gender': _gender,
        'founded': _founded,
        'sport_id': _sportId,
        'venue_id': _venueId,
        'country_id': _countryId,
        'short_code': _shortCode,
        'placeholder': _placeholder,
        'last_played_at': _lastPlayedAt,
        'image_path': _imagePath,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'meta': serializeParam(
          _meta,
          ParamType.DataStruct,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'founded': serializeParam(
          _founded,
          ParamType.int,
        ),
        'sport_id': serializeParam(
          _sportId,
          ParamType.int,
        ),
        'venue_id': serializeParam(
          _venueId,
          ParamType.int,
        ),
        'country_id': serializeParam(
          _countryId,
          ParamType.int,
        ),
        'short_code': serializeParam(
          _shortCode,
          ParamType.String,
        ),
        'placeholder': serializeParam(
          _placeholder,
          ParamType.bool,
        ),
        'last_played_at': serializeParam(
          _lastPlayedAt,
          ParamType.String,
        ),
        'image_path': serializeParam(
          _imagePath,
          ParamType.String,
        ),
      }.withoutNulls;

  static ParticipantsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ParticipantsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        meta: deserializeStructParam(
          data['meta'],
          ParamType.DataStruct,
          false,
          structBuilder: MetaStruct.fromSerializableMap,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        founded: deserializeParam(
          data['founded'],
          ParamType.int,
          false,
        ),
        sportId: deserializeParam(
          data['sport_id'],
          ParamType.int,
          false,
        ),
        venueId: deserializeParam(
          data['venue_id'],
          ParamType.int,
          false,
        ),
        countryId: deserializeParam(
          data['country_id'],
          ParamType.int,
          false,
        ),
        shortCode: deserializeParam(
          data['short_code'],
          ParamType.String,
          false,
        ),
        placeholder: deserializeParam(
          data['placeholder'],
          ParamType.bool,
          false,
        ),
        lastPlayedAt: deserializeParam(
          data['last_played_at'],
          ParamType.String,
          false,
        ),
        imagePath: deserializeParam(
          data['image_path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ParticipantsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ParticipantsStruct &&
        id == other.id &&
        meta == other.meta &&
        name == other.name &&
        type == other.type &&
        gender == other.gender &&
        founded == other.founded &&
        sportId == other.sportId &&
        venueId == other.venueId &&
        countryId == other.countryId &&
        shortCode == other.shortCode &&
        placeholder == other.placeholder &&
        lastPlayedAt == other.lastPlayedAt &&
        imagePath == other.imagePath;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        meta,
        name,
        type,
        gender,
        founded,
        sportId,
        venueId,
        countryId,
        shortCode,
        placeholder,
        lastPlayedAt,
        imagePath
      ]);
}

ParticipantsStruct createParticipantsStruct({
  int? id,
  MetaStruct? meta,
  String? name,
  String? type,
  String? gender,
  int? founded,
  int? sportId,
  int? venueId,
  int? countryId,
  String? shortCode,
  bool? placeholder,
  String? lastPlayedAt,
  String? imagePath,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ParticipantsStruct(
      id: id,
      meta: meta ?? (clearUnsetFields ? MetaStruct() : null),
      name: name,
      type: type,
      gender: gender,
      founded: founded,
      sportId: sportId,
      venueId: venueId,
      countryId: countryId,
      shortCode: shortCode,
      placeholder: placeholder,
      lastPlayedAt: lastPlayedAt,
      imagePath: imagePath,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ParticipantsStruct? updateParticipantsStruct(
  ParticipantsStruct? participants, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    participants
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addParticipantsStructData(
  Map<String, dynamic> firestoreData,
  ParticipantsStruct? participants,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (participants == null) {
    return;
  }
  if (participants.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && participants.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final participantsData =
      getParticipantsFirestoreData(participants, forFieldValue);
  final nestedData =
      participantsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = participants.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getParticipantsFirestoreData(
  ParticipantsStruct? participants, [
  bool forFieldValue = false,
]) {
  if (participants == null) {
    return {};
  }
  final firestoreData = mapToFirestore(participants.toMap());

  // Handle nested data for "meta" field.
  addMetaStructData(
    firestoreData,
    participants.hasMeta() ? participants.meta : null,
    'meta',
    forFieldValue,
  );

  // Add any Firestore field values
  participants.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getParticipantsListFirestoreData(
  List<ParticipantsStruct>? participantss,
) =>
    participantss?.map((e) => getParticipantsFirestoreData(e, true)).toList() ??
    [];
