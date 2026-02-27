// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamEventStruct extends FFFirebaseStruct {
  TeamEventStruct({
    String? description,
    int? endDateTime,
    String? eventName,
    String? locationString,
    UserStruct? owner,
    int? startDateTime,
    TeamStruct? team,
    String? type,
    String? objectId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _description = description,
        _endDateTime = endDateTime,
        _eventName = eventName,
        _locationString = locationString,
        _owner = owner,
        _startDateTime = startDateTime,
        _team = team,
        _type = type,
        _objectId = objectId,
        super(firestoreUtilData);

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "endDateTime" field.
  int? _endDateTime;
  int get endDateTime => _endDateTime ?? 0;
  set endDateTime(int? val) => _endDateTime = val;

  void incrementEndDateTime(int amount) => endDateTime = endDateTime + amount;

  bool hasEndDateTime() => _endDateTime != null;

  // "EventName" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  set eventName(String? val) => _eventName = val;

  bool hasEventName() => _eventName != null;

  // "LocationString" field.
  String? _locationString;
  String get locationString => _locationString ?? '';
  set locationString(String? val) => _locationString = val;

  bool hasLocationString() => _locationString != null;

  // "owner" field.
  UserStruct? _owner;
  UserStruct get owner => _owner ?? UserStruct();
  set owner(UserStruct? val) => _owner = val;

  void updateOwner(Function(UserStruct) updateFn) {
    updateFn(_owner ??= UserStruct());
  }

  bool hasOwner() => _owner != null;

  // "startDateTime" field.
  int? _startDateTime;
  int get startDateTime => _startDateTime ?? 0;
  set startDateTime(int? val) => _startDateTime = val;

  void incrementStartDateTime(int amount) =>
      startDateTime = startDateTime + amount;

  bool hasStartDateTime() => _startDateTime != null;

  // "team" field.
  TeamStruct? _team;
  TeamStruct get team => _team ?? TeamStruct();
  set team(TeamStruct? val) => _team = val;

  void updateTeam(Function(TeamStruct) updateFn) {
    updateFn(_team ??= TeamStruct());
  }

  bool hasTeam() => _team != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  static TeamEventStruct fromMap(Map<String, dynamic> data) => TeamEventStruct(
        description: data['Description'] as String?,
        endDateTime: castToType<int>(data['endDateTime']),
        eventName: data['EventName'] as String?,
        locationString: data['LocationString'] as String?,
        owner: data['owner'] is UserStruct
            ? data['owner']
            : UserStruct.maybeFromMap(data['owner']),
        startDateTime: castToType<int>(data['startDateTime']),
        team: data['team'] is TeamStruct
            ? data['team']
            : TeamStruct.maybeFromMap(data['team']),
        type: data['type'] as String?,
        objectId: data['objectId'] as String?,
      );

  static TeamEventStruct? maybeFromMap(dynamic data) => data is Map
      ? TeamEventStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Description': _description,
        'endDateTime': _endDateTime,
        'EventName': _eventName,
        'LocationString': _locationString,
        'owner': _owner?.toMap(),
        'startDateTime': _startDateTime,
        'team': _team?.toMap(),
        'type': _type,
        'objectId': _objectId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'endDateTime': serializeParam(
          _endDateTime,
          ParamType.int,
        ),
        'EventName': serializeParam(
          _eventName,
          ParamType.String,
        ),
        'LocationString': serializeParam(
          _locationString,
          ParamType.String,
        ),
        'owner': serializeParam(
          _owner,
          ParamType.DataStruct,
        ),
        'startDateTime': serializeParam(
          _startDateTime,
          ParamType.int,
        ),
        'team': serializeParam(
          _team,
          ParamType.DataStruct,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
      }.withoutNulls;

  static TeamEventStruct fromSerializableMap(Map<String, dynamic> data) =>
      TeamEventStruct(
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        endDateTime: deserializeParam(
          data['endDateTime'],
          ParamType.int,
          false,
        ),
        eventName: deserializeParam(
          data['EventName'],
          ParamType.String,
          false,
        ),
        locationString: deserializeParam(
          data['LocationString'],
          ParamType.String,
          false,
        ),
        owner: deserializeStructParam(
          data['owner'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        startDateTime: deserializeParam(
          data['startDateTime'],
          ParamType.int,
          false,
        ),
        team: deserializeStructParam(
          data['team'],
          ParamType.DataStruct,
          false,
          structBuilder: TeamStruct.fromSerializableMap,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TeamEventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TeamEventStruct &&
        description == other.description &&
        endDateTime == other.endDateTime &&
        eventName == other.eventName &&
        locationString == other.locationString &&
        owner == other.owner &&
        startDateTime == other.startDateTime &&
        team == other.team &&
        type == other.type &&
        objectId == other.objectId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        description,
        endDateTime,
        eventName,
        locationString,
        owner,
        startDateTime,
        team,
        type,
        objectId
      ]);
}

TeamEventStruct createTeamEventStruct({
  String? description,
  int? endDateTime,
  String? eventName,
  String? locationString,
  UserStruct? owner,
  int? startDateTime,
  TeamStruct? team,
  String? type,
  String? objectId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TeamEventStruct(
      description: description,
      endDateTime: endDateTime,
      eventName: eventName,
      locationString: locationString,
      owner: owner ?? (clearUnsetFields ? UserStruct() : null),
      startDateTime: startDateTime,
      team: team ?? (clearUnsetFields ? TeamStruct() : null),
      type: type,
      objectId: objectId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TeamEventStruct? updateTeamEventStruct(
  TeamEventStruct? teamEvent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    teamEvent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTeamEventStructData(
  Map<String, dynamic> firestoreData,
  TeamEventStruct? teamEvent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (teamEvent == null) {
    return;
  }
  if (teamEvent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && teamEvent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final teamEventData = getTeamEventFirestoreData(teamEvent, forFieldValue);
  final nestedData = teamEventData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = teamEvent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTeamEventFirestoreData(
  TeamEventStruct? teamEvent, [
  bool forFieldValue = false,
]) {
  if (teamEvent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(teamEvent.toMap());

  // Handle nested data for "owner" field.
  addUserStructData(
    firestoreData,
    teamEvent.hasOwner() ? teamEvent.owner : null,
    'owner',
    forFieldValue,
  );

  // Handle nested data for "team" field.
  addTeamStructData(
    firestoreData,
    teamEvent.hasTeam() ? teamEvent.team : null,
    'team',
    forFieldValue,
  );

  // Add any Firestore field values
  teamEvent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTeamEventListFirestoreData(
  List<TeamEventStruct>? teamEvents,
) =>
    teamEvents?.map((e) => getTeamEventFirestoreData(e, true)).toList() ?? [];
