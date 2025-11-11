// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    List<TeamStruct>? teams,
    String? email,
    String? name,
    String? ownerId,
    String? objectId,
    int? created,
    List<PlayerStruct>? players,
    String? userToken,
    String? category,
    String? age,
    String? company,
    String? gender,
    String? location,
    bool? marketing,
    int? obsNumber,
    bool? publicName,
    String? mobile,
  })  : _teams = teams,
        _email = email,
        _name = name,
        _ownerId = ownerId,
        _objectId = objectId,
        _created = created,
        _players = players,
        _userToken = userToken,
        _category = category,
        _age = age,
        _company = company,
        _gender = gender,
        _location = location,
        _marketing = marketing,
        _obsNumber = obsNumber,
        _publicName = publicName,
        _mobile = mobile;

  // "teams" field.
  List<TeamStruct>? _teams;
  List<TeamStruct> get teams => _teams ?? const [];
  set teams(List<TeamStruct>? val) => _teams = val;

  void updateTeams(Function(List<TeamStruct>) updateFn) {
    updateFn(_teams ??= []);
  }

  bool hasTeams() => _teams != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

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

  // "players" field.
  List<PlayerStruct>? _players;
  List<PlayerStruct> get players => _players ?? const [];
  set players(List<PlayerStruct>? val) => _players = val;

  void updatePlayers(Function(List<PlayerStruct>) updateFn) {
    updateFn(_players ??= []);
  }

  bool hasPlayers() => _players != null;

  // "user-token" field.
  String? _userToken;
  String get userToken => _userToken ?? '';
  set userToken(String? val) => _userToken = val;

  bool hasUserToken() => _userToken != null;

  // "CATEGORY" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "Age" field.
  String? _age;
  String get age => _age ?? '';
  set age(String? val) => _age = val;

  bool hasAge() => _age != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  set company(String? val) => _company = val;

  bool hasCompany() => _company != null;

  // "Gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "marketing" field.
  bool? _marketing;
  bool get marketing => _marketing ?? false;
  set marketing(bool? val) => _marketing = val;

  bool hasMarketing() => _marketing != null;

  // "obsNumber" field.
  int? _obsNumber;
  int get obsNumber => _obsNumber ?? 0;
  set obsNumber(int? val) => _obsNumber = val;

  void incrementObsNumber(int amount) => obsNumber = obsNumber + amount;

  bool hasObsNumber() => _obsNumber != null;

  // "publicName" field.
  bool? _publicName;
  bool get publicName => _publicName ?? false;
  set publicName(bool? val) => _publicName = val;

  bool hasPublicName() => _publicName != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  set mobile(String? val) => _mobile = val;

  bool hasMobile() => _mobile != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        teams: getStructList(
          data['teams'],
          TeamStruct.fromMap,
        ),
        email: data['email'] as String?,
        name: data['name'] as String?,
        ownerId: data['ownerId'] as String?,
        objectId: data['objectId'] as String?,
        created: castToType<int>(data['created']),
        players: getStructList(
          data['players'],
          PlayerStruct.fromMap,
        ),
        userToken: data['user-token'] as String?,
        category: data['CATEGORY'] as String?,
        age: data['Age'] as String?,
        company: data['company'] as String?,
        gender: data['Gender'] as String?,
        location: data['Location'] as String?,
        marketing: data['marketing'] as bool?,
        obsNumber: castToType<int>(data['obsNumber']),
        publicName: data['publicName'] as bool?,
        mobile: data['mobile'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'teams': _teams?.map((e) => e.toMap()).toList(),
        'email': _email,
        'name': _name,
        'ownerId': _ownerId,
        'objectId': _objectId,
        'created': _created,
        'players': _players?.map((e) => e.toMap()).toList(),
        'user-token': _userToken,
        'CATEGORY': _category,
        'Age': _age,
        'company': _company,
        'Gender': _gender,
        'Location': _location,
        'marketing': _marketing,
        'obsNumber': _obsNumber,
        'publicName': _publicName,
        'mobile': _mobile,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'teams': serializeParam(
          _teams,
          ParamType.DataStruct,
          isList: true,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
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
        'players': serializeParam(
          _players,
          ParamType.DataStruct,
          isList: true,
        ),
        'user-token': serializeParam(
          _userToken,
          ParamType.String,
        ),
        'CATEGORY': serializeParam(
          _category,
          ParamType.String,
        ),
        'Age': serializeParam(
          _age,
          ParamType.String,
        ),
        'company': serializeParam(
          _company,
          ParamType.String,
        ),
        'Gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'Location': serializeParam(
          _location,
          ParamType.String,
        ),
        'marketing': serializeParam(
          _marketing,
          ParamType.bool,
        ),
        'obsNumber': serializeParam(
          _obsNumber,
          ParamType.int,
        ),
        'publicName': serializeParam(
          _publicName,
          ParamType.bool,
        ),
        'mobile': serializeParam(
          _mobile,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        teams: deserializeStructParam<TeamStruct>(
          data['teams'],
          ParamType.DataStruct,
          true,
          structBuilder: TeamStruct.fromSerializableMap,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
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
        players: deserializeStructParam<PlayerStruct>(
          data['players'],
          ParamType.DataStruct,
          true,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
        userToken: deserializeParam(
          data['user-token'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['CATEGORY'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['Age'],
          ParamType.String,
          false,
        ),
        company: deserializeParam(
          data['company'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['Gender'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['Location'],
          ParamType.String,
          false,
        ),
        marketing: deserializeParam(
          data['marketing'],
          ParamType.bool,
          false,
        ),
        obsNumber: deserializeParam(
          data['obsNumber'],
          ParamType.int,
          false,
        ),
        publicName: deserializeParam(
          data['publicName'],
          ParamType.bool,
          false,
        ),
        mobile: deserializeParam(
          data['mobile'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        listEquality.equals(teams, other.teams) &&
        email == other.email &&
        name == other.name &&
        ownerId == other.ownerId &&
        objectId == other.objectId &&
        created == other.created &&
        listEquality.equals(players, other.players) &&
        userToken == other.userToken &&
        category == other.category &&
        age == other.age &&
        company == other.company &&
        gender == other.gender &&
        location == other.location &&
        marketing == other.marketing &&
        obsNumber == other.obsNumber &&
        publicName == other.publicName &&
        mobile == other.mobile;
  }

  @override
  int get hashCode => const ListEquality().hash([
        teams,
        email,
        name,
        ownerId,
        objectId,
        created,
        players,
        userToken,
        category,
        age,
        company,
        gender,
        location,
        marketing,
        obsNumber,
        publicName,
        mobile
      ]);
}

UserStruct createUserStruct({
  String? email,
  String? name,
  String? ownerId,
  String? objectId,
  int? created,
  String? userToken,
  String? category,
  String? age,
  String? company,
  String? gender,
  String? location,
  bool? marketing,
  int? obsNumber,
  bool? publicName,
  String? mobile,
}) =>
    UserStruct(
      email: email,
      name: name,
      ownerId: ownerId,
      objectId: objectId,
      created: created,
      userToken: userToken,
      category: category,
      age: age,
      company: company,
      gender: gender,
      location: location,
      marketing: marketing,
      obsNumber: obsNumber,
      publicName: publicName,
      mobile: mobile,
    );
