// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatsObjectStruct extends FFFirebaseStruct {
  StatsObjectStruct({
    int? awayAttacks,
    int? awayDangerousAttacks,
    int? awayInjuries,
    int? awaySubs,
    int? homeAttacks,
    int? homeDangerousAttacks,
    int? homeInjuries,
    int? homeSubs,
    int? awayCorners,
    int? awayPenaltiesWon,
    int? awayReds,
    int? awayShots,
    int? awayShotsOffTarget,
    int? awayShotsOnTarget,
    int? awayYellows,
    int? homeCorners,
    int? homePenaltiesWon,
    int? homePossession,
    int? homeReds,
    int? homeShots,
    int? homeShotsOffTarget,
    int? homeShotsOnTarget,
    int? homeYellows,
    int? awayPossession,
    int? statsChecker,
    int? homeFouls,
    int? awayFouls,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _awayAttacks = awayAttacks,
        _awayDangerousAttacks = awayDangerousAttacks,
        _awayInjuries = awayInjuries,
        _awaySubs = awaySubs,
        _homeAttacks = homeAttacks,
        _homeDangerousAttacks = homeDangerousAttacks,
        _homeInjuries = homeInjuries,
        _homeSubs = homeSubs,
        _awayCorners = awayCorners,
        _awayPenaltiesWon = awayPenaltiesWon,
        _awayReds = awayReds,
        _awayShots = awayShots,
        _awayShotsOffTarget = awayShotsOffTarget,
        _awayShotsOnTarget = awayShotsOnTarget,
        _awayYellows = awayYellows,
        _homeCorners = homeCorners,
        _homePenaltiesWon = homePenaltiesWon,
        _homePossession = homePossession,
        _homeReds = homeReds,
        _homeShots = homeShots,
        _homeShotsOffTarget = homeShotsOffTarget,
        _homeShotsOnTarget = homeShotsOnTarget,
        _homeYellows = homeYellows,
        _awayPossession = awayPossession,
        _statsChecker = statsChecker,
        _homeFouls = homeFouls,
        _awayFouls = awayFouls,
        super(firestoreUtilData);

  // "awayAttacks" field.
  int? _awayAttacks;
  int get awayAttacks => _awayAttacks ?? 0;
  set awayAttacks(int? val) => _awayAttacks = val;

  void incrementAwayAttacks(int amount) => awayAttacks = awayAttacks + amount;

  bool hasAwayAttacks() => _awayAttacks != null;

  // "awayDangerousAttacks" field.
  int? _awayDangerousAttacks;
  int get awayDangerousAttacks => _awayDangerousAttacks ?? 0;
  set awayDangerousAttacks(int? val) => _awayDangerousAttacks = val;

  void incrementAwayDangerousAttacks(int amount) =>
      awayDangerousAttacks = awayDangerousAttacks + amount;

  bool hasAwayDangerousAttacks() => _awayDangerousAttacks != null;

  // "awayInjuries" field.
  int? _awayInjuries;
  int get awayInjuries => _awayInjuries ?? 0;
  set awayInjuries(int? val) => _awayInjuries = val;

  void incrementAwayInjuries(int amount) =>
      awayInjuries = awayInjuries + amount;

  bool hasAwayInjuries() => _awayInjuries != null;

  // "awaySubs" field.
  int? _awaySubs;
  int get awaySubs => _awaySubs ?? 0;
  set awaySubs(int? val) => _awaySubs = val;

  void incrementAwaySubs(int amount) => awaySubs = awaySubs + amount;

  bool hasAwaySubs() => _awaySubs != null;

  // "homeAttacks" field.
  int? _homeAttacks;
  int get homeAttacks => _homeAttacks ?? 0;
  set homeAttacks(int? val) => _homeAttacks = val;

  void incrementHomeAttacks(int amount) => homeAttacks = homeAttacks + amount;

  bool hasHomeAttacks() => _homeAttacks != null;

  // "homeDangerousAttacks" field.
  int? _homeDangerousAttacks;
  int get homeDangerousAttacks => _homeDangerousAttacks ?? 0;
  set homeDangerousAttacks(int? val) => _homeDangerousAttacks = val;

  void incrementHomeDangerousAttacks(int amount) =>
      homeDangerousAttacks = homeDangerousAttacks + amount;

  bool hasHomeDangerousAttacks() => _homeDangerousAttacks != null;

  // "homeInjuries" field.
  int? _homeInjuries;
  int get homeInjuries => _homeInjuries ?? 0;
  set homeInjuries(int? val) => _homeInjuries = val;

  void incrementHomeInjuries(int amount) =>
      homeInjuries = homeInjuries + amount;

  bool hasHomeInjuries() => _homeInjuries != null;

  // "homeSubs" field.
  int? _homeSubs;
  int get homeSubs => _homeSubs ?? 0;
  set homeSubs(int? val) => _homeSubs = val;

  void incrementHomeSubs(int amount) => homeSubs = homeSubs + amount;

  bool hasHomeSubs() => _homeSubs != null;

  // "awayCorners" field.
  int? _awayCorners;
  int get awayCorners => _awayCorners ?? 0;
  set awayCorners(int? val) => _awayCorners = val;

  void incrementAwayCorners(int amount) => awayCorners = awayCorners + amount;

  bool hasAwayCorners() => _awayCorners != null;

  // "awayPenaltiesWon" field.
  int? _awayPenaltiesWon;
  int get awayPenaltiesWon => _awayPenaltiesWon ?? 0;
  set awayPenaltiesWon(int? val) => _awayPenaltiesWon = val;

  void incrementAwayPenaltiesWon(int amount) =>
      awayPenaltiesWon = awayPenaltiesWon + amount;

  bool hasAwayPenaltiesWon() => _awayPenaltiesWon != null;

  // "awayReds" field.
  int? _awayReds;
  int get awayReds => _awayReds ?? 0;
  set awayReds(int? val) => _awayReds = val;

  void incrementAwayReds(int amount) => awayReds = awayReds + amount;

  bool hasAwayReds() => _awayReds != null;

  // "awayShots" field.
  int? _awayShots;
  int get awayShots => _awayShots ?? 0;
  set awayShots(int? val) => _awayShots = val;

  void incrementAwayShots(int amount) => awayShots = awayShots + amount;

  bool hasAwayShots() => _awayShots != null;

  // "awayShotsOffTarget" field.
  int? _awayShotsOffTarget;
  int get awayShotsOffTarget => _awayShotsOffTarget ?? 0;
  set awayShotsOffTarget(int? val) => _awayShotsOffTarget = val;

  void incrementAwayShotsOffTarget(int amount) =>
      awayShotsOffTarget = awayShotsOffTarget + amount;

  bool hasAwayShotsOffTarget() => _awayShotsOffTarget != null;

  // "awayShotsOnTarget" field.
  int? _awayShotsOnTarget;
  int get awayShotsOnTarget => _awayShotsOnTarget ?? 0;
  set awayShotsOnTarget(int? val) => _awayShotsOnTarget = val;

  void incrementAwayShotsOnTarget(int amount) =>
      awayShotsOnTarget = awayShotsOnTarget + amount;

  bool hasAwayShotsOnTarget() => _awayShotsOnTarget != null;

  // "awayYellows" field.
  int? _awayYellows;
  int get awayYellows => _awayYellows ?? 0;
  set awayYellows(int? val) => _awayYellows = val;

  void incrementAwayYellows(int amount) => awayYellows = awayYellows + amount;

  bool hasAwayYellows() => _awayYellows != null;

  // "homeCorners" field.
  int? _homeCorners;
  int get homeCorners => _homeCorners ?? 0;
  set homeCorners(int? val) => _homeCorners = val;

  void incrementHomeCorners(int amount) => homeCorners = homeCorners + amount;

  bool hasHomeCorners() => _homeCorners != null;

  // "homePenaltiesWon" field.
  int? _homePenaltiesWon;
  int get homePenaltiesWon => _homePenaltiesWon ?? 0;
  set homePenaltiesWon(int? val) => _homePenaltiesWon = val;

  void incrementHomePenaltiesWon(int amount) =>
      homePenaltiesWon = homePenaltiesWon + amount;

  bool hasHomePenaltiesWon() => _homePenaltiesWon != null;

  // "homePossession" field.
  int? _homePossession;
  int get homePossession => _homePossession ?? 0;
  set homePossession(int? val) => _homePossession = val;

  void incrementHomePossession(int amount) =>
      homePossession = homePossession + amount;

  bool hasHomePossession() => _homePossession != null;

  // "homeReds" field.
  int? _homeReds;
  int get homeReds => _homeReds ?? 0;
  set homeReds(int? val) => _homeReds = val;

  void incrementHomeReds(int amount) => homeReds = homeReds + amount;

  bool hasHomeReds() => _homeReds != null;

  // "homeShots" field.
  int? _homeShots;
  int get homeShots => _homeShots ?? 0;
  set homeShots(int? val) => _homeShots = val;

  void incrementHomeShots(int amount) => homeShots = homeShots + amount;

  bool hasHomeShots() => _homeShots != null;

  // "homeShotsOffTarget" field.
  int? _homeShotsOffTarget;
  int get homeShotsOffTarget => _homeShotsOffTarget ?? 0;
  set homeShotsOffTarget(int? val) => _homeShotsOffTarget = val;

  void incrementHomeShotsOffTarget(int amount) =>
      homeShotsOffTarget = homeShotsOffTarget + amount;

  bool hasHomeShotsOffTarget() => _homeShotsOffTarget != null;

  // "homeShotsOnTarget" field.
  int? _homeShotsOnTarget;
  int get homeShotsOnTarget => _homeShotsOnTarget ?? 0;
  set homeShotsOnTarget(int? val) => _homeShotsOnTarget = val;

  void incrementHomeShotsOnTarget(int amount) =>
      homeShotsOnTarget = homeShotsOnTarget + amount;

  bool hasHomeShotsOnTarget() => _homeShotsOnTarget != null;

  // "homeYellows" field.
  int? _homeYellows;
  int get homeYellows => _homeYellows ?? 0;
  set homeYellows(int? val) => _homeYellows = val;

  void incrementHomeYellows(int amount) => homeYellows = homeYellows + amount;

  bool hasHomeYellows() => _homeYellows != null;

  // "awayPossession" field.
  int? _awayPossession;
  int get awayPossession => _awayPossession ?? 0;
  set awayPossession(int? val) => _awayPossession = val;

  void incrementAwayPossession(int amount) =>
      awayPossession = awayPossession + amount;

  bool hasAwayPossession() => _awayPossession != null;

  // "statsChecker" field.
  int? _statsChecker;
  int get statsChecker => _statsChecker ?? 0;
  set statsChecker(int? val) => _statsChecker = val;

  void incrementStatsChecker(int amount) =>
      statsChecker = statsChecker + amount;

  bool hasStatsChecker() => _statsChecker != null;

  // "homeFouls" field.
  int? _homeFouls;
  int get homeFouls => _homeFouls ?? 0;
  set homeFouls(int? val) => _homeFouls = val;

  void incrementHomeFouls(int amount) => homeFouls = homeFouls + amount;

  bool hasHomeFouls() => _homeFouls != null;

  // "awayFouls" field.
  int? _awayFouls;
  int get awayFouls => _awayFouls ?? 0;
  set awayFouls(int? val) => _awayFouls = val;

  void incrementAwayFouls(int amount) => awayFouls = awayFouls + amount;

  bool hasAwayFouls() => _awayFouls != null;

  static StatsObjectStruct fromMap(Map<String, dynamic> data) =>
      StatsObjectStruct(
        awayAttacks: castToType<int>(data['awayAttacks']),
        awayDangerousAttacks: castToType<int>(data['awayDangerousAttacks']),
        awayInjuries: castToType<int>(data['awayInjuries']),
        awaySubs: castToType<int>(data['awaySubs']),
        homeAttacks: castToType<int>(data['homeAttacks']),
        homeDangerousAttacks: castToType<int>(data['homeDangerousAttacks']),
        homeInjuries: castToType<int>(data['homeInjuries']),
        homeSubs: castToType<int>(data['homeSubs']),
        awayCorners: castToType<int>(data['awayCorners']),
        awayPenaltiesWon: castToType<int>(data['awayPenaltiesWon']),
        awayReds: castToType<int>(data['awayReds']),
        awayShots: castToType<int>(data['awayShots']),
        awayShotsOffTarget: castToType<int>(data['awayShotsOffTarget']),
        awayShotsOnTarget: castToType<int>(data['awayShotsOnTarget']),
        awayYellows: castToType<int>(data['awayYellows']),
        homeCorners: castToType<int>(data['homeCorners']),
        homePenaltiesWon: castToType<int>(data['homePenaltiesWon']),
        homePossession: castToType<int>(data['homePossession']),
        homeReds: castToType<int>(data['homeReds']),
        homeShots: castToType<int>(data['homeShots']),
        homeShotsOffTarget: castToType<int>(data['homeShotsOffTarget']),
        homeShotsOnTarget: castToType<int>(data['homeShotsOnTarget']),
        homeYellows: castToType<int>(data['homeYellows']),
        awayPossession: castToType<int>(data['awayPossession']),
        statsChecker: castToType<int>(data['statsChecker']),
        homeFouls: castToType<int>(data['homeFouls']),
        awayFouls: castToType<int>(data['awayFouls']),
      );

  static StatsObjectStruct? maybeFromMap(dynamic data) => data is Map
      ? StatsObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'awayAttacks': _awayAttacks,
        'awayDangerousAttacks': _awayDangerousAttacks,
        'awayInjuries': _awayInjuries,
        'awaySubs': _awaySubs,
        'homeAttacks': _homeAttacks,
        'homeDangerousAttacks': _homeDangerousAttacks,
        'homeInjuries': _homeInjuries,
        'homeSubs': _homeSubs,
        'awayCorners': _awayCorners,
        'awayPenaltiesWon': _awayPenaltiesWon,
        'awayReds': _awayReds,
        'awayShots': _awayShots,
        'awayShotsOffTarget': _awayShotsOffTarget,
        'awayShotsOnTarget': _awayShotsOnTarget,
        'awayYellows': _awayYellows,
        'homeCorners': _homeCorners,
        'homePenaltiesWon': _homePenaltiesWon,
        'homePossession': _homePossession,
        'homeReds': _homeReds,
        'homeShots': _homeShots,
        'homeShotsOffTarget': _homeShotsOffTarget,
        'homeShotsOnTarget': _homeShotsOnTarget,
        'homeYellows': _homeYellows,
        'awayPossession': _awayPossession,
        'statsChecker': _statsChecker,
        'homeFouls': _homeFouls,
        'awayFouls': _awayFouls,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'awayAttacks': serializeParam(
          _awayAttacks,
          ParamType.int,
        ),
        'awayDangerousAttacks': serializeParam(
          _awayDangerousAttacks,
          ParamType.int,
        ),
        'awayInjuries': serializeParam(
          _awayInjuries,
          ParamType.int,
        ),
        'awaySubs': serializeParam(
          _awaySubs,
          ParamType.int,
        ),
        'homeAttacks': serializeParam(
          _homeAttacks,
          ParamType.int,
        ),
        'homeDangerousAttacks': serializeParam(
          _homeDangerousAttacks,
          ParamType.int,
        ),
        'homeInjuries': serializeParam(
          _homeInjuries,
          ParamType.int,
        ),
        'homeSubs': serializeParam(
          _homeSubs,
          ParamType.int,
        ),
        'awayCorners': serializeParam(
          _awayCorners,
          ParamType.int,
        ),
        'awayPenaltiesWon': serializeParam(
          _awayPenaltiesWon,
          ParamType.int,
        ),
        'awayReds': serializeParam(
          _awayReds,
          ParamType.int,
        ),
        'awayShots': serializeParam(
          _awayShots,
          ParamType.int,
        ),
        'awayShotsOffTarget': serializeParam(
          _awayShotsOffTarget,
          ParamType.int,
        ),
        'awayShotsOnTarget': serializeParam(
          _awayShotsOnTarget,
          ParamType.int,
        ),
        'awayYellows': serializeParam(
          _awayYellows,
          ParamType.int,
        ),
        'homeCorners': serializeParam(
          _homeCorners,
          ParamType.int,
        ),
        'homePenaltiesWon': serializeParam(
          _homePenaltiesWon,
          ParamType.int,
        ),
        'homePossession': serializeParam(
          _homePossession,
          ParamType.int,
        ),
        'homeReds': serializeParam(
          _homeReds,
          ParamType.int,
        ),
        'homeShots': serializeParam(
          _homeShots,
          ParamType.int,
        ),
        'homeShotsOffTarget': serializeParam(
          _homeShotsOffTarget,
          ParamType.int,
        ),
        'homeShotsOnTarget': serializeParam(
          _homeShotsOnTarget,
          ParamType.int,
        ),
        'homeYellows': serializeParam(
          _homeYellows,
          ParamType.int,
        ),
        'awayPossession': serializeParam(
          _awayPossession,
          ParamType.int,
        ),
        'statsChecker': serializeParam(
          _statsChecker,
          ParamType.int,
        ),
        'homeFouls': serializeParam(
          _homeFouls,
          ParamType.int,
        ),
        'awayFouls': serializeParam(
          _awayFouls,
          ParamType.int,
        ),
      }.withoutNulls;

  static StatsObjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      StatsObjectStruct(
        awayAttacks: deserializeParam(
          data['awayAttacks'],
          ParamType.int,
          false,
        ),
        awayDangerousAttacks: deserializeParam(
          data['awayDangerousAttacks'],
          ParamType.int,
          false,
        ),
        awayInjuries: deserializeParam(
          data['awayInjuries'],
          ParamType.int,
          false,
        ),
        awaySubs: deserializeParam(
          data['awaySubs'],
          ParamType.int,
          false,
        ),
        homeAttacks: deserializeParam(
          data['homeAttacks'],
          ParamType.int,
          false,
        ),
        homeDangerousAttacks: deserializeParam(
          data['homeDangerousAttacks'],
          ParamType.int,
          false,
        ),
        homeInjuries: deserializeParam(
          data['homeInjuries'],
          ParamType.int,
          false,
        ),
        homeSubs: deserializeParam(
          data['homeSubs'],
          ParamType.int,
          false,
        ),
        awayCorners: deserializeParam(
          data['awayCorners'],
          ParamType.int,
          false,
        ),
        awayPenaltiesWon: deserializeParam(
          data['awayPenaltiesWon'],
          ParamType.int,
          false,
        ),
        awayReds: deserializeParam(
          data['awayReds'],
          ParamType.int,
          false,
        ),
        awayShots: deserializeParam(
          data['awayShots'],
          ParamType.int,
          false,
        ),
        awayShotsOffTarget: deserializeParam(
          data['awayShotsOffTarget'],
          ParamType.int,
          false,
        ),
        awayShotsOnTarget: deserializeParam(
          data['awayShotsOnTarget'],
          ParamType.int,
          false,
        ),
        awayYellows: deserializeParam(
          data['awayYellows'],
          ParamType.int,
          false,
        ),
        homeCorners: deserializeParam(
          data['homeCorners'],
          ParamType.int,
          false,
        ),
        homePenaltiesWon: deserializeParam(
          data['homePenaltiesWon'],
          ParamType.int,
          false,
        ),
        homePossession: deserializeParam(
          data['homePossession'],
          ParamType.int,
          false,
        ),
        homeReds: deserializeParam(
          data['homeReds'],
          ParamType.int,
          false,
        ),
        homeShots: deserializeParam(
          data['homeShots'],
          ParamType.int,
          false,
        ),
        homeShotsOffTarget: deserializeParam(
          data['homeShotsOffTarget'],
          ParamType.int,
          false,
        ),
        homeShotsOnTarget: deserializeParam(
          data['homeShotsOnTarget'],
          ParamType.int,
          false,
        ),
        homeYellows: deserializeParam(
          data['homeYellows'],
          ParamType.int,
          false,
        ),
        awayPossession: deserializeParam(
          data['awayPossession'],
          ParamType.int,
          false,
        ),
        statsChecker: deserializeParam(
          data['statsChecker'],
          ParamType.int,
          false,
        ),
        homeFouls: deserializeParam(
          data['homeFouls'],
          ParamType.int,
          false,
        ),
        awayFouls: deserializeParam(
          data['awayFouls'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'StatsObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatsObjectStruct &&
        awayAttacks == other.awayAttacks &&
        awayDangerousAttacks == other.awayDangerousAttacks &&
        awayInjuries == other.awayInjuries &&
        awaySubs == other.awaySubs &&
        homeAttacks == other.homeAttacks &&
        homeDangerousAttacks == other.homeDangerousAttacks &&
        homeInjuries == other.homeInjuries &&
        homeSubs == other.homeSubs &&
        awayCorners == other.awayCorners &&
        awayPenaltiesWon == other.awayPenaltiesWon &&
        awayReds == other.awayReds &&
        awayShots == other.awayShots &&
        awayShotsOffTarget == other.awayShotsOffTarget &&
        awayShotsOnTarget == other.awayShotsOnTarget &&
        awayYellows == other.awayYellows &&
        homeCorners == other.homeCorners &&
        homePenaltiesWon == other.homePenaltiesWon &&
        homePossession == other.homePossession &&
        homeReds == other.homeReds &&
        homeShots == other.homeShots &&
        homeShotsOffTarget == other.homeShotsOffTarget &&
        homeShotsOnTarget == other.homeShotsOnTarget &&
        homeYellows == other.homeYellows &&
        awayPossession == other.awayPossession &&
        statsChecker == other.statsChecker &&
        homeFouls == other.homeFouls &&
        awayFouls == other.awayFouls;
  }

  @override
  int get hashCode => const ListEquality().hash([
        awayAttacks,
        awayDangerousAttacks,
        awayInjuries,
        awaySubs,
        homeAttacks,
        homeDangerousAttacks,
        homeInjuries,
        homeSubs,
        awayCorners,
        awayPenaltiesWon,
        awayReds,
        awayShots,
        awayShotsOffTarget,
        awayShotsOnTarget,
        awayYellows,
        homeCorners,
        homePenaltiesWon,
        homePossession,
        homeReds,
        homeShots,
        homeShotsOffTarget,
        homeShotsOnTarget,
        homeYellows,
        awayPossession,
        statsChecker,
        homeFouls,
        awayFouls
      ]);
}

StatsObjectStruct createStatsObjectStruct({
  int? awayAttacks,
  int? awayDangerousAttacks,
  int? awayInjuries,
  int? awaySubs,
  int? homeAttacks,
  int? homeDangerousAttacks,
  int? homeInjuries,
  int? homeSubs,
  int? awayCorners,
  int? awayPenaltiesWon,
  int? awayReds,
  int? awayShots,
  int? awayShotsOffTarget,
  int? awayShotsOnTarget,
  int? awayYellows,
  int? homeCorners,
  int? homePenaltiesWon,
  int? homePossession,
  int? homeReds,
  int? homeShots,
  int? homeShotsOffTarget,
  int? homeShotsOnTarget,
  int? homeYellows,
  int? awayPossession,
  int? statsChecker,
  int? homeFouls,
  int? awayFouls,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatsObjectStruct(
      awayAttacks: awayAttacks,
      awayDangerousAttacks: awayDangerousAttacks,
      awayInjuries: awayInjuries,
      awaySubs: awaySubs,
      homeAttacks: homeAttacks,
      homeDangerousAttacks: homeDangerousAttacks,
      homeInjuries: homeInjuries,
      homeSubs: homeSubs,
      awayCorners: awayCorners,
      awayPenaltiesWon: awayPenaltiesWon,
      awayReds: awayReds,
      awayShots: awayShots,
      awayShotsOffTarget: awayShotsOffTarget,
      awayShotsOnTarget: awayShotsOnTarget,
      awayYellows: awayYellows,
      homeCorners: homeCorners,
      homePenaltiesWon: homePenaltiesWon,
      homePossession: homePossession,
      homeReds: homeReds,
      homeShots: homeShots,
      homeShotsOffTarget: homeShotsOffTarget,
      homeShotsOnTarget: homeShotsOnTarget,
      homeYellows: homeYellows,
      awayPossession: awayPossession,
      statsChecker: statsChecker,
      homeFouls: homeFouls,
      awayFouls: awayFouls,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatsObjectStruct? updateStatsObjectStruct(
  StatsObjectStruct? statsObject, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    statsObject
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatsObjectStructData(
  Map<String, dynamic> firestoreData,
  StatsObjectStruct? statsObject,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (statsObject == null) {
    return;
  }
  if (statsObject.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && statsObject.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statsObjectData =
      getStatsObjectFirestoreData(statsObject, forFieldValue);
  final nestedData =
      statsObjectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = statsObject.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatsObjectFirestoreData(
  StatsObjectStruct? statsObject, [
  bool forFieldValue = false,
]) {
  if (statsObject == null) {
    return {};
  }
  final firestoreData = mapToFirestore(statsObject.toMap());

  // Add any Firestore field values
  statsObject.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatsObjectListFirestoreData(
  List<StatsObjectStruct>? statsObjects,
) =>
    statsObjects?.map((e) => getStatsObjectFirestoreData(e, true)).toList() ??
    [];
