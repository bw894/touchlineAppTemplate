// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeagueTableItemStruct extends FFFirebaseStruct {
  LeagueTableItemStruct({
    int? rank,
    String? name,
    int? goalDiff,
    String? imageURL,
    int? played,
    int? points,
    String? trend,
    int? homeMatchesPlayed,
    int? homePoints,
    int? homeWins,
    int? homeDraws,
    int? homeLost,
    int? homeGoalsScored,
    int? homeGoalsConceded,
    int? awayMatchesPlayed,
    int? awayPoints,
    int? awayWins,
    int? awayDraws,
    int? awayLost,
    int? awayGoalsScored,
    int? awayGoalsConceded,
    int? overallMatchesPlayed,
    int? overallWins,
    int? overallDraws,
    int? overallLost,
    int? overallGoalsScored,
    int? overallGoalsConceded,
    int? goalDifference,
    int? overallPoints,
    int? homeGoalDifference,
    int? awayGoalDifference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rank = rank,
        _name = name,
        _goalDiff = goalDiff,
        _imageURL = imageURL,
        _played = played,
        _points = points,
        _trend = trend,
        _homeMatchesPlayed = homeMatchesPlayed,
        _homePoints = homePoints,
        _homeWins = homeWins,
        _homeDraws = homeDraws,
        _homeLost = homeLost,
        _homeGoalsScored = homeGoalsScored,
        _homeGoalsConceded = homeGoalsConceded,
        _awayMatchesPlayed = awayMatchesPlayed,
        _awayPoints = awayPoints,
        _awayWins = awayWins,
        _awayDraws = awayDraws,
        _awayLost = awayLost,
        _awayGoalsScored = awayGoalsScored,
        _awayGoalsConceded = awayGoalsConceded,
        _overallMatchesPlayed = overallMatchesPlayed,
        _overallWins = overallWins,
        _overallDraws = overallDraws,
        _overallLost = overallLost,
        _overallGoalsScored = overallGoalsScored,
        _overallGoalsConceded = overallGoalsConceded,
        _goalDifference = goalDifference,
        _overallPoints = overallPoints,
        _homeGoalDifference = homeGoalDifference,
        _awayGoalDifference = awayGoalDifference,
        super(firestoreUtilData);

  // "rank" field.
  int? _rank;
  int get rank => _rank ?? 0;
  set rank(int? val) => _rank = val;

  void incrementRank(int amount) => rank = rank + amount;

  bool hasRank() => _rank != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "goalDiff" field.
  int? _goalDiff;
  int get goalDiff => _goalDiff ?? 0;
  set goalDiff(int? val) => _goalDiff = val;

  void incrementGoalDiff(int amount) => goalDiff = goalDiff + amount;

  bool hasGoalDiff() => _goalDiff != null;

  // "imageURL" field.
  String? _imageURL;
  String get imageURL => _imageURL ?? '';
  set imageURL(String? val) => _imageURL = val;

  bool hasImageURL() => _imageURL != null;

  // "played" field.
  int? _played;
  int get played => _played ?? 0;
  set played(int? val) => _played = val;

  void incrementPlayed(int amount) => played = played + amount;

  bool hasPlayed() => _played != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  set points(int? val) => _points = val;

  void incrementPoints(int amount) => points = points + amount;

  bool hasPoints() => _points != null;

  // "trend" field.
  String? _trend;
  String get trend => _trend ?? '';
  set trend(String? val) => _trend = val;

  bool hasTrend() => _trend != null;

  // "HomeMatchesPlayed" field.
  int? _homeMatchesPlayed;
  int get homeMatchesPlayed => _homeMatchesPlayed ?? 0;
  set homeMatchesPlayed(int? val) => _homeMatchesPlayed = val;

  void incrementHomeMatchesPlayed(int amount) =>
      homeMatchesPlayed = homeMatchesPlayed + amount;

  bool hasHomeMatchesPlayed() => _homeMatchesPlayed != null;

  // "HomePoints" field.
  int? _homePoints;
  int get homePoints => _homePoints ?? 0;
  set homePoints(int? val) => _homePoints = val;

  void incrementHomePoints(int amount) => homePoints = homePoints + amount;

  bool hasHomePoints() => _homePoints != null;

  // "HomeWins" field.
  int? _homeWins;
  int get homeWins => _homeWins ?? 0;
  set homeWins(int? val) => _homeWins = val;

  void incrementHomeWins(int amount) => homeWins = homeWins + amount;

  bool hasHomeWins() => _homeWins != null;

  // "HomeDraws" field.
  int? _homeDraws;
  int get homeDraws => _homeDraws ?? 0;
  set homeDraws(int? val) => _homeDraws = val;

  void incrementHomeDraws(int amount) => homeDraws = homeDraws + amount;

  bool hasHomeDraws() => _homeDraws != null;

  // "HomeLost" field.
  int? _homeLost;
  int get homeLost => _homeLost ?? 0;
  set homeLost(int? val) => _homeLost = val;

  void incrementHomeLost(int amount) => homeLost = homeLost + amount;

  bool hasHomeLost() => _homeLost != null;

  // "HomeGoalsScored" field.
  int? _homeGoalsScored;
  int get homeGoalsScored => _homeGoalsScored ?? 0;
  set homeGoalsScored(int? val) => _homeGoalsScored = val;

  void incrementHomeGoalsScored(int amount) =>
      homeGoalsScored = homeGoalsScored + amount;

  bool hasHomeGoalsScored() => _homeGoalsScored != null;

  // "HomeGoalsConceded" field.
  int? _homeGoalsConceded;
  int get homeGoalsConceded => _homeGoalsConceded ?? 0;
  set homeGoalsConceded(int? val) => _homeGoalsConceded = val;

  void incrementHomeGoalsConceded(int amount) =>
      homeGoalsConceded = homeGoalsConceded + amount;

  bool hasHomeGoalsConceded() => _homeGoalsConceded != null;

  // "AwayMatchesPlayed" field.
  int? _awayMatchesPlayed;
  int get awayMatchesPlayed => _awayMatchesPlayed ?? 0;
  set awayMatchesPlayed(int? val) => _awayMatchesPlayed = val;

  void incrementAwayMatchesPlayed(int amount) =>
      awayMatchesPlayed = awayMatchesPlayed + amount;

  bool hasAwayMatchesPlayed() => _awayMatchesPlayed != null;

  // "AwayPoints" field.
  int? _awayPoints;
  int get awayPoints => _awayPoints ?? 0;
  set awayPoints(int? val) => _awayPoints = val;

  void incrementAwayPoints(int amount) => awayPoints = awayPoints + amount;

  bool hasAwayPoints() => _awayPoints != null;

  // "AwayWins" field.
  int? _awayWins;
  int get awayWins => _awayWins ?? 0;
  set awayWins(int? val) => _awayWins = val;

  void incrementAwayWins(int amount) => awayWins = awayWins + amount;

  bool hasAwayWins() => _awayWins != null;

  // "AwayDraws" field.
  int? _awayDraws;
  int get awayDraws => _awayDraws ?? 0;
  set awayDraws(int? val) => _awayDraws = val;

  void incrementAwayDraws(int amount) => awayDraws = awayDraws + amount;

  bool hasAwayDraws() => _awayDraws != null;

  // "AwayLost" field.
  int? _awayLost;
  int get awayLost => _awayLost ?? 0;
  set awayLost(int? val) => _awayLost = val;

  void incrementAwayLost(int amount) => awayLost = awayLost + amount;

  bool hasAwayLost() => _awayLost != null;

  // "AwayGoalsScored" field.
  int? _awayGoalsScored;
  int get awayGoalsScored => _awayGoalsScored ?? 0;
  set awayGoalsScored(int? val) => _awayGoalsScored = val;

  void incrementAwayGoalsScored(int amount) =>
      awayGoalsScored = awayGoalsScored + amount;

  bool hasAwayGoalsScored() => _awayGoalsScored != null;

  // "AwayGoalsConceded" field.
  int? _awayGoalsConceded;
  int get awayGoalsConceded => _awayGoalsConceded ?? 0;
  set awayGoalsConceded(int? val) => _awayGoalsConceded = val;

  void incrementAwayGoalsConceded(int amount) =>
      awayGoalsConceded = awayGoalsConceded + amount;

  bool hasAwayGoalsConceded() => _awayGoalsConceded != null;

  // "OverallMatchesPlayed" field.
  int? _overallMatchesPlayed;
  int get overallMatchesPlayed => _overallMatchesPlayed ?? 0;
  set overallMatchesPlayed(int? val) => _overallMatchesPlayed = val;

  void incrementOverallMatchesPlayed(int amount) =>
      overallMatchesPlayed = overallMatchesPlayed + amount;

  bool hasOverallMatchesPlayed() => _overallMatchesPlayed != null;

  // "OverallWins" field.
  int? _overallWins;
  int get overallWins => _overallWins ?? 0;
  set overallWins(int? val) => _overallWins = val;

  void incrementOverallWins(int amount) => overallWins = overallWins + amount;

  bool hasOverallWins() => _overallWins != null;

  // "OverallDraws" field.
  int? _overallDraws;
  int get overallDraws => _overallDraws ?? 0;
  set overallDraws(int? val) => _overallDraws = val;

  void incrementOverallDraws(int amount) =>
      overallDraws = overallDraws + amount;

  bool hasOverallDraws() => _overallDraws != null;

  // "OverallLost" field.
  int? _overallLost;
  int get overallLost => _overallLost ?? 0;
  set overallLost(int? val) => _overallLost = val;

  void incrementOverallLost(int amount) => overallLost = overallLost + amount;

  bool hasOverallLost() => _overallLost != null;

  // "OverallGoalsScored" field.
  int? _overallGoalsScored;
  int get overallGoalsScored => _overallGoalsScored ?? 0;
  set overallGoalsScored(int? val) => _overallGoalsScored = val;

  void incrementOverallGoalsScored(int amount) =>
      overallGoalsScored = overallGoalsScored + amount;

  bool hasOverallGoalsScored() => _overallGoalsScored != null;

  // "OverallGoalsConceded" field.
  int? _overallGoalsConceded;
  int get overallGoalsConceded => _overallGoalsConceded ?? 0;
  set overallGoalsConceded(int? val) => _overallGoalsConceded = val;

  void incrementOverallGoalsConceded(int amount) =>
      overallGoalsConceded = overallGoalsConceded + amount;

  bool hasOverallGoalsConceded() => _overallGoalsConceded != null;

  // "GoalDifference" field.
  int? _goalDifference;
  int get goalDifference => _goalDifference ?? 0;
  set goalDifference(int? val) => _goalDifference = val;

  void incrementGoalDifference(int amount) =>
      goalDifference = goalDifference + amount;

  bool hasGoalDifference() => _goalDifference != null;

  // "OverallPoints" field.
  int? _overallPoints;
  int get overallPoints => _overallPoints ?? 0;
  set overallPoints(int? val) => _overallPoints = val;

  void incrementOverallPoints(int amount) =>
      overallPoints = overallPoints + amount;

  bool hasOverallPoints() => _overallPoints != null;

  // "HomeGoalDifference" field.
  int? _homeGoalDifference;
  int get homeGoalDifference => _homeGoalDifference ?? 0;
  set homeGoalDifference(int? val) => _homeGoalDifference = val;

  void incrementHomeGoalDifference(int amount) =>
      homeGoalDifference = homeGoalDifference + amount;

  bool hasHomeGoalDifference() => _homeGoalDifference != null;

  // "AwayGoalDifference" field.
  int? _awayGoalDifference;
  int get awayGoalDifference => _awayGoalDifference ?? 0;
  set awayGoalDifference(int? val) => _awayGoalDifference = val;

  void incrementAwayGoalDifference(int amount) =>
      awayGoalDifference = awayGoalDifference + amount;

  bool hasAwayGoalDifference() => _awayGoalDifference != null;

  static LeagueTableItemStruct fromMap(Map<String, dynamic> data) =>
      LeagueTableItemStruct(
        rank: castToType<int>(data['rank']),
        name: data['name'] as String?,
        goalDiff: castToType<int>(data['goalDiff']),
        imageURL: data['imageURL'] as String?,
        played: castToType<int>(data['played']),
        points: castToType<int>(data['points']),
        trend: data['trend'] as String?,
        homeMatchesPlayed: castToType<int>(data['HomeMatchesPlayed']),
        homePoints: castToType<int>(data['HomePoints']),
        homeWins: castToType<int>(data['HomeWins']),
        homeDraws: castToType<int>(data['HomeDraws']),
        homeLost: castToType<int>(data['HomeLost']),
        homeGoalsScored: castToType<int>(data['HomeGoalsScored']),
        homeGoalsConceded: castToType<int>(data['HomeGoalsConceded']),
        awayMatchesPlayed: castToType<int>(data['AwayMatchesPlayed']),
        awayPoints: castToType<int>(data['AwayPoints']),
        awayWins: castToType<int>(data['AwayWins']),
        awayDraws: castToType<int>(data['AwayDraws']),
        awayLost: castToType<int>(data['AwayLost']),
        awayGoalsScored: castToType<int>(data['AwayGoalsScored']),
        awayGoalsConceded: castToType<int>(data['AwayGoalsConceded']),
        overallMatchesPlayed: castToType<int>(data['OverallMatchesPlayed']),
        overallWins: castToType<int>(data['OverallWins']),
        overallDraws: castToType<int>(data['OverallDraws']),
        overallLost: castToType<int>(data['OverallLost']),
        overallGoalsScored: castToType<int>(data['OverallGoalsScored']),
        overallGoalsConceded: castToType<int>(data['OverallGoalsConceded']),
        goalDifference: castToType<int>(data['GoalDifference']),
        overallPoints: castToType<int>(data['OverallPoints']),
        homeGoalDifference: castToType<int>(data['HomeGoalDifference']),
        awayGoalDifference: castToType<int>(data['AwayGoalDifference']),
      );

  static LeagueTableItemStruct? maybeFromMap(dynamic data) => data is Map
      ? LeagueTableItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'rank': _rank,
        'name': _name,
        'goalDiff': _goalDiff,
        'imageURL': _imageURL,
        'played': _played,
        'points': _points,
        'trend': _trend,
        'HomeMatchesPlayed': _homeMatchesPlayed,
        'HomePoints': _homePoints,
        'HomeWins': _homeWins,
        'HomeDraws': _homeDraws,
        'HomeLost': _homeLost,
        'HomeGoalsScored': _homeGoalsScored,
        'HomeGoalsConceded': _homeGoalsConceded,
        'AwayMatchesPlayed': _awayMatchesPlayed,
        'AwayPoints': _awayPoints,
        'AwayWins': _awayWins,
        'AwayDraws': _awayDraws,
        'AwayLost': _awayLost,
        'AwayGoalsScored': _awayGoalsScored,
        'AwayGoalsConceded': _awayGoalsConceded,
        'OverallMatchesPlayed': _overallMatchesPlayed,
        'OverallWins': _overallWins,
        'OverallDraws': _overallDraws,
        'OverallLost': _overallLost,
        'OverallGoalsScored': _overallGoalsScored,
        'OverallGoalsConceded': _overallGoalsConceded,
        'GoalDifference': _goalDifference,
        'OverallPoints': _overallPoints,
        'HomeGoalDifference': _homeGoalDifference,
        'AwayGoalDifference': _awayGoalDifference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rank': serializeParam(
          _rank,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'goalDiff': serializeParam(
          _goalDiff,
          ParamType.int,
        ),
        'imageURL': serializeParam(
          _imageURL,
          ParamType.String,
        ),
        'played': serializeParam(
          _played,
          ParamType.int,
        ),
        'points': serializeParam(
          _points,
          ParamType.int,
        ),
        'trend': serializeParam(
          _trend,
          ParamType.String,
        ),
        'HomeMatchesPlayed': serializeParam(
          _homeMatchesPlayed,
          ParamType.int,
        ),
        'HomePoints': serializeParam(
          _homePoints,
          ParamType.int,
        ),
        'HomeWins': serializeParam(
          _homeWins,
          ParamType.int,
        ),
        'HomeDraws': serializeParam(
          _homeDraws,
          ParamType.int,
        ),
        'HomeLost': serializeParam(
          _homeLost,
          ParamType.int,
        ),
        'HomeGoalsScored': serializeParam(
          _homeGoalsScored,
          ParamType.int,
        ),
        'HomeGoalsConceded': serializeParam(
          _homeGoalsConceded,
          ParamType.int,
        ),
        'AwayMatchesPlayed': serializeParam(
          _awayMatchesPlayed,
          ParamType.int,
        ),
        'AwayPoints': serializeParam(
          _awayPoints,
          ParamType.int,
        ),
        'AwayWins': serializeParam(
          _awayWins,
          ParamType.int,
        ),
        'AwayDraws': serializeParam(
          _awayDraws,
          ParamType.int,
        ),
        'AwayLost': serializeParam(
          _awayLost,
          ParamType.int,
        ),
        'AwayGoalsScored': serializeParam(
          _awayGoalsScored,
          ParamType.int,
        ),
        'AwayGoalsConceded': serializeParam(
          _awayGoalsConceded,
          ParamType.int,
        ),
        'OverallMatchesPlayed': serializeParam(
          _overallMatchesPlayed,
          ParamType.int,
        ),
        'OverallWins': serializeParam(
          _overallWins,
          ParamType.int,
        ),
        'OverallDraws': serializeParam(
          _overallDraws,
          ParamType.int,
        ),
        'OverallLost': serializeParam(
          _overallLost,
          ParamType.int,
        ),
        'OverallGoalsScored': serializeParam(
          _overallGoalsScored,
          ParamType.int,
        ),
        'OverallGoalsConceded': serializeParam(
          _overallGoalsConceded,
          ParamType.int,
        ),
        'GoalDifference': serializeParam(
          _goalDifference,
          ParamType.int,
        ),
        'OverallPoints': serializeParam(
          _overallPoints,
          ParamType.int,
        ),
        'HomeGoalDifference': serializeParam(
          _homeGoalDifference,
          ParamType.int,
        ),
        'AwayGoalDifference': serializeParam(
          _awayGoalDifference,
          ParamType.int,
        ),
      }.withoutNulls;

  static LeagueTableItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeagueTableItemStruct(
        rank: deserializeParam(
          data['rank'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        goalDiff: deserializeParam(
          data['goalDiff'],
          ParamType.int,
          false,
        ),
        imageURL: deserializeParam(
          data['imageURL'],
          ParamType.String,
          false,
        ),
        played: deserializeParam(
          data['played'],
          ParamType.int,
          false,
        ),
        points: deserializeParam(
          data['points'],
          ParamType.int,
          false,
        ),
        trend: deserializeParam(
          data['trend'],
          ParamType.String,
          false,
        ),
        homeMatchesPlayed: deserializeParam(
          data['HomeMatchesPlayed'],
          ParamType.int,
          false,
        ),
        homePoints: deserializeParam(
          data['HomePoints'],
          ParamType.int,
          false,
        ),
        homeWins: deserializeParam(
          data['HomeWins'],
          ParamType.int,
          false,
        ),
        homeDraws: deserializeParam(
          data['HomeDraws'],
          ParamType.int,
          false,
        ),
        homeLost: deserializeParam(
          data['HomeLost'],
          ParamType.int,
          false,
        ),
        homeGoalsScored: deserializeParam(
          data['HomeGoalsScored'],
          ParamType.int,
          false,
        ),
        homeGoalsConceded: deserializeParam(
          data['HomeGoalsConceded'],
          ParamType.int,
          false,
        ),
        awayMatchesPlayed: deserializeParam(
          data['AwayMatchesPlayed'],
          ParamType.int,
          false,
        ),
        awayPoints: deserializeParam(
          data['AwayPoints'],
          ParamType.int,
          false,
        ),
        awayWins: deserializeParam(
          data['AwayWins'],
          ParamType.int,
          false,
        ),
        awayDraws: deserializeParam(
          data['AwayDraws'],
          ParamType.int,
          false,
        ),
        awayLost: deserializeParam(
          data['AwayLost'],
          ParamType.int,
          false,
        ),
        awayGoalsScored: deserializeParam(
          data['AwayGoalsScored'],
          ParamType.int,
          false,
        ),
        awayGoalsConceded: deserializeParam(
          data['AwayGoalsConceded'],
          ParamType.int,
          false,
        ),
        overallMatchesPlayed: deserializeParam(
          data['OverallMatchesPlayed'],
          ParamType.int,
          false,
        ),
        overallWins: deserializeParam(
          data['OverallWins'],
          ParamType.int,
          false,
        ),
        overallDraws: deserializeParam(
          data['OverallDraws'],
          ParamType.int,
          false,
        ),
        overallLost: deserializeParam(
          data['OverallLost'],
          ParamType.int,
          false,
        ),
        overallGoalsScored: deserializeParam(
          data['OverallGoalsScored'],
          ParamType.int,
          false,
        ),
        overallGoalsConceded: deserializeParam(
          data['OverallGoalsConceded'],
          ParamType.int,
          false,
        ),
        goalDifference: deserializeParam(
          data['GoalDifference'],
          ParamType.int,
          false,
        ),
        overallPoints: deserializeParam(
          data['OverallPoints'],
          ParamType.int,
          false,
        ),
        homeGoalDifference: deserializeParam(
          data['HomeGoalDifference'],
          ParamType.int,
          false,
        ),
        awayGoalDifference: deserializeParam(
          data['AwayGoalDifference'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'LeagueTableItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeagueTableItemStruct &&
        rank == other.rank &&
        name == other.name &&
        goalDiff == other.goalDiff &&
        imageURL == other.imageURL &&
        played == other.played &&
        points == other.points &&
        trend == other.trend &&
        homeMatchesPlayed == other.homeMatchesPlayed &&
        homePoints == other.homePoints &&
        homeWins == other.homeWins &&
        homeDraws == other.homeDraws &&
        homeLost == other.homeLost &&
        homeGoalsScored == other.homeGoalsScored &&
        homeGoalsConceded == other.homeGoalsConceded &&
        awayMatchesPlayed == other.awayMatchesPlayed &&
        awayPoints == other.awayPoints &&
        awayWins == other.awayWins &&
        awayDraws == other.awayDraws &&
        awayLost == other.awayLost &&
        awayGoalsScored == other.awayGoalsScored &&
        awayGoalsConceded == other.awayGoalsConceded &&
        overallMatchesPlayed == other.overallMatchesPlayed &&
        overallWins == other.overallWins &&
        overallDraws == other.overallDraws &&
        overallLost == other.overallLost &&
        overallGoalsScored == other.overallGoalsScored &&
        overallGoalsConceded == other.overallGoalsConceded &&
        goalDifference == other.goalDifference &&
        overallPoints == other.overallPoints &&
        homeGoalDifference == other.homeGoalDifference &&
        awayGoalDifference == other.awayGoalDifference;
  }

  @override
  int get hashCode => const ListEquality().hash([
        rank,
        name,
        goalDiff,
        imageURL,
        played,
        points,
        trend,
        homeMatchesPlayed,
        homePoints,
        homeWins,
        homeDraws,
        homeLost,
        homeGoalsScored,
        homeGoalsConceded,
        awayMatchesPlayed,
        awayPoints,
        awayWins,
        awayDraws,
        awayLost,
        awayGoalsScored,
        awayGoalsConceded,
        overallMatchesPlayed,
        overallWins,
        overallDraws,
        overallLost,
        overallGoalsScored,
        overallGoalsConceded,
        goalDifference,
        overallPoints,
        homeGoalDifference,
        awayGoalDifference
      ]);
}

LeagueTableItemStruct createLeagueTableItemStruct({
  int? rank,
  String? name,
  int? goalDiff,
  String? imageURL,
  int? played,
  int? points,
  String? trend,
  int? homeMatchesPlayed,
  int? homePoints,
  int? homeWins,
  int? homeDraws,
  int? homeLost,
  int? homeGoalsScored,
  int? homeGoalsConceded,
  int? awayMatchesPlayed,
  int? awayPoints,
  int? awayWins,
  int? awayDraws,
  int? awayLost,
  int? awayGoalsScored,
  int? awayGoalsConceded,
  int? overallMatchesPlayed,
  int? overallWins,
  int? overallDraws,
  int? overallLost,
  int? overallGoalsScored,
  int? overallGoalsConceded,
  int? goalDifference,
  int? overallPoints,
  int? homeGoalDifference,
  int? awayGoalDifference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeagueTableItemStruct(
      rank: rank,
      name: name,
      goalDiff: goalDiff,
      imageURL: imageURL,
      played: played,
      points: points,
      trend: trend,
      homeMatchesPlayed: homeMatchesPlayed,
      homePoints: homePoints,
      homeWins: homeWins,
      homeDraws: homeDraws,
      homeLost: homeLost,
      homeGoalsScored: homeGoalsScored,
      homeGoalsConceded: homeGoalsConceded,
      awayMatchesPlayed: awayMatchesPlayed,
      awayPoints: awayPoints,
      awayWins: awayWins,
      awayDraws: awayDraws,
      awayLost: awayLost,
      awayGoalsScored: awayGoalsScored,
      awayGoalsConceded: awayGoalsConceded,
      overallMatchesPlayed: overallMatchesPlayed,
      overallWins: overallWins,
      overallDraws: overallDraws,
      overallLost: overallLost,
      overallGoalsScored: overallGoalsScored,
      overallGoalsConceded: overallGoalsConceded,
      goalDifference: goalDifference,
      overallPoints: overallPoints,
      homeGoalDifference: homeGoalDifference,
      awayGoalDifference: awayGoalDifference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeagueTableItemStruct? updateLeagueTableItemStruct(
  LeagueTableItemStruct? leagueTableItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leagueTableItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeagueTableItemStructData(
  Map<String, dynamic> firestoreData,
  LeagueTableItemStruct? leagueTableItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leagueTableItem == null) {
    return;
  }
  if (leagueTableItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leagueTableItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leagueTableItemData =
      getLeagueTableItemFirestoreData(leagueTableItem, forFieldValue);
  final nestedData =
      leagueTableItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = leagueTableItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeagueTableItemFirestoreData(
  LeagueTableItemStruct? leagueTableItem, [
  bool forFieldValue = false,
]) {
  if (leagueTableItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leagueTableItem.toMap());

  // Add any Firestore field values
  leagueTableItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeagueTableItemListFirestoreData(
  List<LeagueTableItemStruct>? leagueTableItems,
) =>
    leagueTableItems
        ?.map((e) => getLeagueTableItemFirestoreData(e, true))
        .toList() ??
    [];
