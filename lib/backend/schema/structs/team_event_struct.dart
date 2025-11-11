// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamEventStruct extends BaseStruct {
  TeamEventStruct({
    String? description,
    int? endDateTime,
    String? eventName,
    String? locationString,
    UserStruct? owner,
    List<PlayerStruct>? rsvpNO,
    List<PlayerStruct>? rsvpUNSURE,
    List<PlayerStruct>? rsvpYES,
    int? startDateTime,
    TeamStruct? team,
    String? type,
  })  : _description = description,
        _endDateTime = endDateTime,
        _eventName = eventName,
        _locationString = locationString,
        _owner = owner,
        _rsvpNO = rsvpNO,
        _rsvpUNSURE = rsvpUNSURE,
        _rsvpYES = rsvpYES,
        _startDateTime = startDateTime,
        _team = team,
        _type = type;

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

  // "rsvpNO" field.
  List<PlayerStruct>? _rsvpNO;
  List<PlayerStruct> get rsvpNO => _rsvpNO ?? const [];
  set rsvpNO(List<PlayerStruct>? val) => _rsvpNO = val;

  void updateRsvpNO(Function(List<PlayerStruct>) updateFn) {
    updateFn(_rsvpNO ??= []);
  }

  bool hasRsvpNO() => _rsvpNO != null;

  // "rsvpUNSURE" field.
  List<PlayerStruct>? _rsvpUNSURE;
  List<PlayerStruct> get rsvpUNSURE => _rsvpUNSURE ?? const [];
  set rsvpUNSURE(List<PlayerStruct>? val) => _rsvpUNSURE = val;

  void updateRsvpUNSURE(Function(List<PlayerStruct>) updateFn) {
    updateFn(_rsvpUNSURE ??= []);
  }

  bool hasRsvpUNSURE() => _rsvpUNSURE != null;

  // "rsvpYES" field.
  List<PlayerStruct>? _rsvpYES;
  List<PlayerStruct> get rsvpYES => _rsvpYES ?? const [];
  set rsvpYES(List<PlayerStruct>? val) => _rsvpYES = val;

  void updateRsvpYES(Function(List<PlayerStruct>) updateFn) {
    updateFn(_rsvpYES ??= []);
  }

  bool hasRsvpYES() => _rsvpYES != null;

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

  static TeamEventStruct fromMap(Map<String, dynamic> data) => TeamEventStruct(
        description: data['Description'] as String?,
        endDateTime: castToType<int>(data['endDateTime']),
        eventName: data['EventName'] as String?,
        locationString: data['LocationString'] as String?,
        owner: data['owner'] is UserStruct
            ? data['owner']
            : UserStruct.maybeFromMap(data['owner']),
        rsvpNO: getStructList(
          data['rsvpNO'],
          PlayerStruct.fromMap,
        ),
        rsvpUNSURE: getStructList(
          data['rsvpUNSURE'],
          PlayerStruct.fromMap,
        ),
        rsvpYES: getStructList(
          data['rsvpYES'],
          PlayerStruct.fromMap,
        ),
        startDateTime: castToType<int>(data['startDateTime']),
        team: data['team'] is TeamStruct
            ? data['team']
            : TeamStruct.maybeFromMap(data['team']),
        type: data['type'] as String?,
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
        'rsvpNO': _rsvpNO?.map((e) => e.toMap()).toList(),
        'rsvpUNSURE': _rsvpUNSURE?.map((e) => e.toMap()).toList(),
        'rsvpYES': _rsvpYES?.map((e) => e.toMap()).toList(),
        'startDateTime': _startDateTime,
        'team': _team?.toMap(),
        'type': _type,
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
        'rsvpNO': serializeParam(
          _rsvpNO,
          ParamType.DataStruct,
          isList: true,
        ),
        'rsvpUNSURE': serializeParam(
          _rsvpUNSURE,
          ParamType.DataStruct,
          isList: true,
        ),
        'rsvpYES': serializeParam(
          _rsvpYES,
          ParamType.DataStruct,
          isList: true,
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
        rsvpNO: deserializeStructParam<PlayerStruct>(
          data['rsvpNO'],
          ParamType.DataStruct,
          true,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
        rsvpUNSURE: deserializeStructParam<PlayerStruct>(
          data['rsvpUNSURE'],
          ParamType.DataStruct,
          true,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
        rsvpYES: deserializeStructParam<PlayerStruct>(
          data['rsvpYES'],
          ParamType.DataStruct,
          true,
          structBuilder: PlayerStruct.fromSerializableMap,
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
      );

  @override
  String toString() => 'TeamEventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TeamEventStruct &&
        description == other.description &&
        endDateTime == other.endDateTime &&
        eventName == other.eventName &&
        locationString == other.locationString &&
        owner == other.owner &&
        listEquality.equals(rsvpNO, other.rsvpNO) &&
        listEquality.equals(rsvpUNSURE, other.rsvpUNSURE) &&
        listEquality.equals(rsvpYES, other.rsvpYES) &&
        startDateTime == other.startDateTime &&
        team == other.team &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([
        description,
        endDateTime,
        eventName,
        locationString,
        owner,
        rsvpNO,
        rsvpUNSURE,
        rsvpYES,
        startDateTime,
        team,
        type
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
}) =>
    TeamEventStruct(
      description: description,
      endDateTime: endDateTime,
      eventName: eventName,
      locationString: locationString,
      owner: owner ?? UserStruct(),
      startDateTime: startDateTime,
      team: team ?? TeamStruct(),
      type: type,
    );
