// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayerStruct extends FFFirebaseStruct {
  PlayerStruct({
    String? dateOfBirth,
    bool? showInGame,
    String? homeSponsor,
    bool? showInSquadHub,
    String? position,
    int? created,
    String? awaySponsor,
    String? ownerId,
    String? posAbr,
    String? playerName,
    String? biography,
    int? updated,
    String? objectId,
    String? playerPictureurl,
    int? number,
    int? apps,
    int? assists,
    int? goals,
    int? reds,
    int? yellows,
    TeamStruct? team,
    List<SponsorshipDealsStruct>? sponsorship,
    String? email,
    String? gender,
    String? mobile,
    String? address1,
    String? address2,
    String? town,
    String? city,
    String? postcode,
    String? country,
    bool? canPhotograph,
    bool? canPhotgraphSocialMedia,
    bool? medicalTreatmentEmergency,
    String? allergies,
    String? disabilities,
    String? medicalConditions,
    String? additionalRequirements,
    String? additionalInfo,
    bool? termsOptIn,
    int? termsOptInDatetime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dateOfBirth = dateOfBirth,
        _showInGame = showInGame,
        _homeSponsor = homeSponsor,
        _showInSquadHub = showInSquadHub,
        _position = position,
        _created = created,
        _awaySponsor = awaySponsor,
        _ownerId = ownerId,
        _posAbr = posAbr,
        _playerName = playerName,
        _biography = biography,
        _updated = updated,
        _objectId = objectId,
        _playerPictureurl = playerPictureurl,
        _number = number,
        _apps = apps,
        _assists = assists,
        _goals = goals,
        _reds = reds,
        _yellows = yellows,
        _team = team,
        _sponsorship = sponsorship,
        _email = email,
        _gender = gender,
        _mobile = mobile,
        _address1 = address1,
        _address2 = address2,
        _town = town,
        _city = city,
        _postcode = postcode,
        _country = country,
        _canPhotograph = canPhotograph,
        _canPhotgraphSocialMedia = canPhotgraphSocialMedia,
        _medicalTreatmentEmergency = medicalTreatmentEmergency,
        _allergies = allergies,
        _disabilities = disabilities,
        _medicalConditions = medicalConditions,
        _additionalRequirements = additionalRequirements,
        _additionalInfo = additionalInfo,
        _termsOptIn = termsOptIn,
        _termsOptInDatetime = termsOptInDatetime,
        super(firestoreUtilData);

  // "DateOfBirth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  set dateOfBirth(String? val) => _dateOfBirth = val;

  bool hasDateOfBirth() => _dateOfBirth != null;

  // "showInGame" field.
  bool? _showInGame;
  bool get showInGame => _showInGame ?? true;
  set showInGame(bool? val) => _showInGame = val;

  bool hasShowInGame() => _showInGame != null;

  // "HomeSponsor" field.
  String? _homeSponsor;
  String get homeSponsor => _homeSponsor ?? '';
  set homeSponsor(String? val) => _homeSponsor = val;

  bool hasHomeSponsor() => _homeSponsor != null;

  // "showInSquadHub" field.
  bool? _showInSquadHub;
  bool get showInSquadHub => _showInSquadHub ?? true;
  set showInSquadHub(bool? val) => _showInSquadHub = val;

  bool hasShowInSquadHub() => _showInSquadHub != null;

  // "Position" field.
  String? _position;
  String get position => _position ?? '';
  set position(String? val) => _position = val;

  bool hasPosition() => _position != null;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  // "AwaySponsor" field.
  String? _awaySponsor;
  String get awaySponsor => _awaySponsor ?? '';
  set awaySponsor(String? val) => _awaySponsor = val;

  bool hasAwaySponsor() => _awaySponsor != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "posAbr" field.
  String? _posAbr;
  String get posAbr => _posAbr ?? '';
  set posAbr(String? val) => _posAbr = val;

  bool hasPosAbr() => _posAbr != null;

  // "PlayerName" field.
  String? _playerName;
  String get playerName => _playerName ?? '';
  set playerName(String? val) => _playerName = val;

  bool hasPlayerName() => _playerName != null;

  // "Biography" field.
  String? _biography;
  String get biography => _biography ?? '';
  set biography(String? val) => _biography = val;

  bool hasBiography() => _biography != null;

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

  // "PlayerPictureurl" field.
  String? _playerPictureurl;
  String get playerPictureurl => _playerPictureurl ?? '';
  set playerPictureurl(String? val) => _playerPictureurl = val;

  bool hasPlayerPictureurl() => _playerPictureurl != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;

  void incrementNumber(int amount) => number = number + amount;

  bool hasNumber() => _number != null;

  // "Apps" field.
  int? _apps;
  int get apps => _apps ?? 0;
  set apps(int? val) => _apps = val;

  void incrementApps(int amount) => apps = apps + amount;

  bool hasApps() => _apps != null;

  // "Assists" field.
  int? _assists;
  int get assists => _assists ?? 0;
  set assists(int? val) => _assists = val;

  void incrementAssists(int amount) => assists = assists + amount;

  bool hasAssists() => _assists != null;

  // "Goals" field.
  int? _goals;
  int get goals => _goals ?? 0;
  set goals(int? val) => _goals = val;

  void incrementGoals(int amount) => goals = goals + amount;

  bool hasGoals() => _goals != null;

  // "Reds" field.
  int? _reds;
  int get reds => _reds ?? 0;
  set reds(int? val) => _reds = val;

  void incrementReds(int amount) => reds = reds + amount;

  bool hasReds() => _reds != null;

  // "Yellows" field.
  int? _yellows;
  int get yellows => _yellows ?? 0;
  set yellows(int? val) => _yellows = val;

  void incrementYellows(int amount) => yellows = yellows + amount;

  bool hasYellows() => _yellows != null;

  // "team" field.
  TeamStruct? _team;
  TeamStruct get team => _team ?? TeamStruct();
  set team(TeamStruct? val) => _team = val;

  void updateTeam(Function(TeamStruct) updateFn) {
    updateFn(_team ??= TeamStruct());
  }

  bool hasTeam() => _team != null;

  // "sponsorship" field.
  List<SponsorshipDealsStruct>? _sponsorship;
  List<SponsorshipDealsStruct> get sponsorship => _sponsorship ?? const [];
  set sponsorship(List<SponsorshipDealsStruct>? val) => _sponsorship = val;

  void updateSponsorship(Function(List<SponsorshipDealsStruct>) updateFn) {
    updateFn(_sponsorship ??= []);
  }

  bool hasSponsorship() => _sponsorship != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  set mobile(String? val) => _mobile = val;

  bool hasMobile() => _mobile != null;

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

  // "town" field.
  String? _town;
  String get town => _town ?? '';
  set town(String? val) => _town = val;

  bool hasTown() => _town != null;

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

  // "can_photograph" field.
  bool? _canPhotograph;
  bool get canPhotograph => _canPhotograph ?? false;
  set canPhotograph(bool? val) => _canPhotograph = val;

  bool hasCanPhotograph() => _canPhotograph != null;

  // "can_photgraph_social_media" field.
  bool? _canPhotgraphSocialMedia;
  bool get canPhotgraphSocialMedia => _canPhotgraphSocialMedia ?? false;
  set canPhotgraphSocialMedia(bool? val) => _canPhotgraphSocialMedia = val;

  bool hasCanPhotgraphSocialMedia() => _canPhotgraphSocialMedia != null;

  // "medical_treatment_emergency" field.
  bool? _medicalTreatmentEmergency;
  bool get medicalTreatmentEmergency => _medicalTreatmentEmergency ?? true;
  set medicalTreatmentEmergency(bool? val) => _medicalTreatmentEmergency = val;

  bool hasMedicalTreatmentEmergency() => _medicalTreatmentEmergency != null;

  // "allergies" field.
  String? _allergies;
  String get allergies => _allergies ?? '';
  set allergies(String? val) => _allergies = val;

  bool hasAllergies() => _allergies != null;

  // "disabilities" field.
  String? _disabilities;
  String get disabilities => _disabilities ?? '';
  set disabilities(String? val) => _disabilities = val;

  bool hasDisabilities() => _disabilities != null;

  // "medical_conditions" field.
  String? _medicalConditions;
  String get medicalConditions => _medicalConditions ?? '';
  set medicalConditions(String? val) => _medicalConditions = val;

  bool hasMedicalConditions() => _medicalConditions != null;

  // "additional_requirements" field.
  String? _additionalRequirements;
  String get additionalRequirements => _additionalRequirements ?? '';
  set additionalRequirements(String? val) => _additionalRequirements = val;

  bool hasAdditionalRequirements() => _additionalRequirements != null;

  // "additional_info" field.
  String? _additionalInfo;
  String get additionalInfo => _additionalInfo ?? '';
  set additionalInfo(String? val) => _additionalInfo = val;

  bool hasAdditionalInfo() => _additionalInfo != null;

  // "termsOptIn" field.
  bool? _termsOptIn;
  bool get termsOptIn => _termsOptIn ?? false;
  set termsOptIn(bool? val) => _termsOptIn = val;

  bool hasTermsOptIn() => _termsOptIn != null;

  // "termsOptInDatetime" field.
  int? _termsOptInDatetime;
  int get termsOptInDatetime => _termsOptInDatetime ?? 0;
  set termsOptInDatetime(int? val) => _termsOptInDatetime = val;

  void incrementTermsOptInDatetime(int amount) =>
      termsOptInDatetime = termsOptInDatetime + amount;

  bool hasTermsOptInDatetime() => _termsOptInDatetime != null;

  static PlayerStruct fromMap(Map<String, dynamic> data) => PlayerStruct(
        dateOfBirth: data['DateOfBirth'] as String?,
        showInGame: data['showInGame'] as bool?,
        homeSponsor: data['HomeSponsor'] as String?,
        showInSquadHub: data['showInSquadHub'] as bool?,
        position: data['Position'] as String?,
        created: castToType<int>(data['created']),
        awaySponsor: data['AwaySponsor'] as String?,
        ownerId: data['ownerId'] as String?,
        posAbr: data['posAbr'] as String?,
        playerName: data['PlayerName'] as String?,
        biography: data['Biography'] as String?,
        updated: castToType<int>(data['updated']),
        objectId: data['objectId'] as String?,
        playerPictureurl: data['PlayerPictureurl'] as String?,
        number: castToType<int>(data['number']),
        apps: castToType<int>(data['Apps']),
        assists: castToType<int>(data['Assists']),
        goals: castToType<int>(data['Goals']),
        reds: castToType<int>(data['Reds']),
        yellows: castToType<int>(data['Yellows']),
        team: data['team'] is TeamStruct
            ? data['team']
            : TeamStruct.maybeFromMap(data['team']),
        sponsorship: getStructList(
          data['sponsorship'],
          SponsorshipDealsStruct.fromMap,
        ),
        email: data['email'] as String?,
        gender: data['gender'] as String?,
        mobile: data['mobile'] as String?,
        address1: data['address_1'] as String?,
        address2: data['address_2'] as String?,
        town: data['town'] as String?,
        city: data['city'] as String?,
        postcode: data['postcode'] as String?,
        country: data['country'] as String?,
        canPhotograph: data['can_photograph'] as bool?,
        canPhotgraphSocialMedia: data['can_photgraph_social_media'] as bool?,
        medicalTreatmentEmergency: data['medical_treatment_emergency'] as bool?,
        allergies: data['allergies'] as String?,
        disabilities: data['disabilities'] as String?,
        medicalConditions: data['medical_conditions'] as String?,
        additionalRequirements: data['additional_requirements'] as String?,
        additionalInfo: data['additional_info'] as String?,
        termsOptIn: data['termsOptIn'] as bool?,
        termsOptInDatetime: castToType<int>(data['termsOptInDatetime']),
      );

  static PlayerStruct? maybeFromMap(dynamic data) =>
      data is Map ? PlayerStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'DateOfBirth': _dateOfBirth,
        'showInGame': _showInGame,
        'HomeSponsor': _homeSponsor,
        'showInSquadHub': _showInSquadHub,
        'Position': _position,
        'created': _created,
        'AwaySponsor': _awaySponsor,
        'ownerId': _ownerId,
        'posAbr': _posAbr,
        'PlayerName': _playerName,
        'Biography': _biography,
        'updated': _updated,
        'objectId': _objectId,
        'PlayerPictureurl': _playerPictureurl,
        'number': _number,
        'Apps': _apps,
        'Assists': _assists,
        'Goals': _goals,
        'Reds': _reds,
        'Yellows': _yellows,
        'team': _team?.toMap(),
        'sponsorship': _sponsorship?.map((e) => e.toMap()).toList(),
        'email': _email,
        'gender': _gender,
        'mobile': _mobile,
        'address_1': _address1,
        'address_2': _address2,
        'town': _town,
        'city': _city,
        'postcode': _postcode,
        'country': _country,
        'can_photograph': _canPhotograph,
        'can_photgraph_social_media': _canPhotgraphSocialMedia,
        'medical_treatment_emergency': _medicalTreatmentEmergency,
        'allergies': _allergies,
        'disabilities': _disabilities,
        'medical_conditions': _medicalConditions,
        'additional_requirements': _additionalRequirements,
        'additional_info': _additionalInfo,
        'termsOptIn': _termsOptIn,
        'termsOptInDatetime': _termsOptInDatetime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'DateOfBirth': serializeParam(
          _dateOfBirth,
          ParamType.String,
        ),
        'showInGame': serializeParam(
          _showInGame,
          ParamType.bool,
        ),
        'HomeSponsor': serializeParam(
          _homeSponsor,
          ParamType.String,
        ),
        'showInSquadHub': serializeParam(
          _showInSquadHub,
          ParamType.bool,
        ),
        'Position': serializeParam(
          _position,
          ParamType.String,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'AwaySponsor': serializeParam(
          _awaySponsor,
          ParamType.String,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'posAbr': serializeParam(
          _posAbr,
          ParamType.String,
        ),
        'PlayerName': serializeParam(
          _playerName,
          ParamType.String,
        ),
        'Biography': serializeParam(
          _biography,
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
        'PlayerPictureurl': serializeParam(
          _playerPictureurl,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
        'Apps': serializeParam(
          _apps,
          ParamType.int,
        ),
        'Assists': serializeParam(
          _assists,
          ParamType.int,
        ),
        'Goals': serializeParam(
          _goals,
          ParamType.int,
        ),
        'Reds': serializeParam(
          _reds,
          ParamType.int,
        ),
        'Yellows': serializeParam(
          _yellows,
          ParamType.int,
        ),
        'team': serializeParam(
          _team,
          ParamType.DataStruct,
        ),
        'sponsorship': serializeParam(
          _sponsorship,
          ParamType.DataStruct,
          isList: true,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'mobile': serializeParam(
          _mobile,
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
        'town': serializeParam(
          _town,
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
        'can_photograph': serializeParam(
          _canPhotograph,
          ParamType.bool,
        ),
        'can_photgraph_social_media': serializeParam(
          _canPhotgraphSocialMedia,
          ParamType.bool,
        ),
        'medical_treatment_emergency': serializeParam(
          _medicalTreatmentEmergency,
          ParamType.bool,
        ),
        'allergies': serializeParam(
          _allergies,
          ParamType.String,
        ),
        'disabilities': serializeParam(
          _disabilities,
          ParamType.String,
        ),
        'medical_conditions': serializeParam(
          _medicalConditions,
          ParamType.String,
        ),
        'additional_requirements': serializeParam(
          _additionalRequirements,
          ParamType.String,
        ),
        'additional_info': serializeParam(
          _additionalInfo,
          ParamType.String,
        ),
        'termsOptIn': serializeParam(
          _termsOptIn,
          ParamType.bool,
        ),
        'termsOptInDatetime': serializeParam(
          _termsOptInDatetime,
          ParamType.int,
        ),
      }.withoutNulls;

  static PlayerStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlayerStruct(
        dateOfBirth: deserializeParam(
          data['DateOfBirth'],
          ParamType.String,
          false,
        ),
        showInGame: deserializeParam(
          data['showInGame'],
          ParamType.bool,
          false,
        ),
        homeSponsor: deserializeParam(
          data['HomeSponsor'],
          ParamType.String,
          false,
        ),
        showInSquadHub: deserializeParam(
          data['showInSquadHub'],
          ParamType.bool,
          false,
        ),
        position: deserializeParam(
          data['Position'],
          ParamType.String,
          false,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
        awaySponsor: deserializeParam(
          data['AwaySponsor'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['ownerId'],
          ParamType.String,
          false,
        ),
        posAbr: deserializeParam(
          data['posAbr'],
          ParamType.String,
          false,
        ),
        playerName: deserializeParam(
          data['PlayerName'],
          ParamType.String,
          false,
        ),
        biography: deserializeParam(
          data['Biography'],
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
        playerPictureurl: deserializeParam(
          data['PlayerPictureurl'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
        apps: deserializeParam(
          data['Apps'],
          ParamType.int,
          false,
        ),
        assists: deserializeParam(
          data['Assists'],
          ParamType.int,
          false,
        ),
        goals: deserializeParam(
          data['Goals'],
          ParamType.int,
          false,
        ),
        reds: deserializeParam(
          data['Reds'],
          ParamType.int,
          false,
        ),
        yellows: deserializeParam(
          data['Yellows'],
          ParamType.int,
          false,
        ),
        team: deserializeStructParam(
          data['team'],
          ParamType.DataStruct,
          false,
          structBuilder: TeamStruct.fromSerializableMap,
        ),
        sponsorship: deserializeStructParam<SponsorshipDealsStruct>(
          data['sponsorship'],
          ParamType.DataStruct,
          true,
          structBuilder: SponsorshipDealsStruct.fromSerializableMap,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        mobile: deserializeParam(
          data['mobile'],
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
        town: deserializeParam(
          data['town'],
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
        canPhotograph: deserializeParam(
          data['can_photograph'],
          ParamType.bool,
          false,
        ),
        canPhotgraphSocialMedia: deserializeParam(
          data['can_photgraph_social_media'],
          ParamType.bool,
          false,
        ),
        medicalTreatmentEmergency: deserializeParam(
          data['medical_treatment_emergency'],
          ParamType.bool,
          false,
        ),
        allergies: deserializeParam(
          data['allergies'],
          ParamType.String,
          false,
        ),
        disabilities: deserializeParam(
          data['disabilities'],
          ParamType.String,
          false,
        ),
        medicalConditions: deserializeParam(
          data['medical_conditions'],
          ParamType.String,
          false,
        ),
        additionalRequirements: deserializeParam(
          data['additional_requirements'],
          ParamType.String,
          false,
        ),
        additionalInfo: deserializeParam(
          data['additional_info'],
          ParamType.String,
          false,
        ),
        termsOptIn: deserializeParam(
          data['termsOptIn'],
          ParamType.bool,
          false,
        ),
        termsOptInDatetime: deserializeParam(
          data['termsOptInDatetime'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PlayerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlayerStruct &&
        dateOfBirth == other.dateOfBirth &&
        showInGame == other.showInGame &&
        homeSponsor == other.homeSponsor &&
        showInSquadHub == other.showInSquadHub &&
        position == other.position &&
        created == other.created &&
        awaySponsor == other.awaySponsor &&
        ownerId == other.ownerId &&
        posAbr == other.posAbr &&
        playerName == other.playerName &&
        biography == other.biography &&
        updated == other.updated &&
        objectId == other.objectId &&
        playerPictureurl == other.playerPictureurl &&
        number == other.number &&
        apps == other.apps &&
        assists == other.assists &&
        goals == other.goals &&
        reds == other.reds &&
        yellows == other.yellows &&
        team == other.team &&
        listEquality.equals(sponsorship, other.sponsorship) &&
        email == other.email &&
        gender == other.gender &&
        mobile == other.mobile &&
        address1 == other.address1 &&
        address2 == other.address2 &&
        town == other.town &&
        city == other.city &&
        postcode == other.postcode &&
        country == other.country &&
        canPhotograph == other.canPhotograph &&
        canPhotgraphSocialMedia == other.canPhotgraphSocialMedia &&
        medicalTreatmentEmergency == other.medicalTreatmentEmergency &&
        allergies == other.allergies &&
        disabilities == other.disabilities &&
        medicalConditions == other.medicalConditions &&
        additionalRequirements == other.additionalRequirements &&
        additionalInfo == other.additionalInfo &&
        termsOptIn == other.termsOptIn &&
        termsOptInDatetime == other.termsOptInDatetime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        dateOfBirth,
        showInGame,
        homeSponsor,
        showInSquadHub,
        position,
        created,
        awaySponsor,
        ownerId,
        posAbr,
        playerName,
        biography,
        updated,
        objectId,
        playerPictureurl,
        number,
        apps,
        assists,
        goals,
        reds,
        yellows,
        team,
        sponsorship,
        email,
        gender,
        mobile,
        address1,
        address2,
        town,
        city,
        postcode,
        country,
        canPhotograph,
        canPhotgraphSocialMedia,
        medicalTreatmentEmergency,
        allergies,
        disabilities,
        medicalConditions,
        additionalRequirements,
        additionalInfo,
        termsOptIn,
        termsOptInDatetime
      ]);
}

PlayerStruct createPlayerStruct({
  String? dateOfBirth,
  bool? showInGame,
  String? homeSponsor,
  bool? showInSquadHub,
  String? position,
  int? created,
  String? awaySponsor,
  String? ownerId,
  String? posAbr,
  String? playerName,
  String? biography,
  int? updated,
  String? objectId,
  String? playerPictureurl,
  int? number,
  int? apps,
  int? assists,
  int? goals,
  int? reds,
  int? yellows,
  TeamStruct? team,
  String? email,
  String? gender,
  String? mobile,
  String? address1,
  String? address2,
  String? town,
  String? city,
  String? postcode,
  String? country,
  bool? canPhotograph,
  bool? canPhotgraphSocialMedia,
  bool? medicalTreatmentEmergency,
  String? allergies,
  String? disabilities,
  String? medicalConditions,
  String? additionalRequirements,
  String? additionalInfo,
  bool? termsOptIn,
  int? termsOptInDatetime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlayerStruct(
      dateOfBirth: dateOfBirth,
      showInGame: showInGame,
      homeSponsor: homeSponsor,
      showInSquadHub: showInSquadHub,
      position: position,
      created: created,
      awaySponsor: awaySponsor,
      ownerId: ownerId,
      posAbr: posAbr,
      playerName: playerName,
      biography: biography,
      updated: updated,
      objectId: objectId,
      playerPictureurl: playerPictureurl,
      number: number,
      apps: apps,
      assists: assists,
      goals: goals,
      reds: reds,
      yellows: yellows,
      team: team ?? (clearUnsetFields ? TeamStruct() : null),
      email: email,
      gender: gender,
      mobile: mobile,
      address1: address1,
      address2: address2,
      town: town,
      city: city,
      postcode: postcode,
      country: country,
      canPhotograph: canPhotograph,
      canPhotgraphSocialMedia: canPhotgraphSocialMedia,
      medicalTreatmentEmergency: medicalTreatmentEmergency,
      allergies: allergies,
      disabilities: disabilities,
      medicalConditions: medicalConditions,
      additionalRequirements: additionalRequirements,
      additionalInfo: additionalInfo,
      termsOptIn: termsOptIn,
      termsOptInDatetime: termsOptInDatetime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlayerStruct? updatePlayerStruct(
  PlayerStruct? player, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    player
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlayerStructData(
  Map<String, dynamic> firestoreData,
  PlayerStruct? player,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (player == null) {
    return;
  }
  if (player.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && player.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final playerData = getPlayerFirestoreData(player, forFieldValue);
  final nestedData = playerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = player.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlayerFirestoreData(
  PlayerStruct? player, [
  bool forFieldValue = false,
]) {
  if (player == null) {
    return {};
  }
  final firestoreData = mapToFirestore(player.toMap());

  // Handle nested data for "team" field.
  addTeamStructData(
    firestoreData,
    player.hasTeam() ? player.team : null,
    'team',
    forFieldValue,
  );

  // Add any Firestore field values
  player.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlayerListFirestoreData(
  List<PlayerStruct>? players,
) =>
    players?.map((e) => getPlayerFirestoreData(e, true)).toList() ?? [];
