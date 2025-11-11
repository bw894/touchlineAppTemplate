// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PredictorItemHistStruct extends BaseStruct {
  PredictorItemHistStruct({
    int? homeScore,
    int? awayScore,
    String? scorerName,
    int? totalCorners,
    BLESSfixtureStruct? match,
    int? created,
    int? pointsForScore,
    int? pointsForScorer,
    int? entryPoints,
    int? bonusPoints,
    String? awayBadge,
    String? homeBadge,
    String? homeABR,
    String? awayABR,
  })  : _homeScore = homeScore,
        _awayScore = awayScore,
        _scorerName = scorerName,
        _totalCorners = totalCorners,
        _match = match,
        _created = created,
        _pointsForScore = pointsForScore,
        _pointsForScorer = pointsForScorer,
        _entryPoints = entryPoints,
        _bonusPoints = bonusPoints,
        _awayBadge = awayBadge,
        _homeBadge = homeBadge,
        _homeABR = homeABR,
        _awayABR = awayABR;

  // "homeScore" field.
  int? _homeScore;
  int get homeScore => _homeScore ?? 0;
  set homeScore(int? val) => _homeScore = val;

  void incrementHomeScore(int amount) => homeScore = homeScore + amount;

  bool hasHomeScore() => _homeScore != null;

  // "awayScore" field.
  int? _awayScore;
  int get awayScore => _awayScore ?? 0;
  set awayScore(int? val) => _awayScore = val;

  void incrementAwayScore(int amount) => awayScore = awayScore + amount;

  bool hasAwayScore() => _awayScore != null;

  // "scorerName" field.
  String? _scorerName;
  String get scorerName => _scorerName ?? '';
  set scorerName(String? val) => _scorerName = val;

  bool hasScorerName() => _scorerName != null;

  // "totalCorners" field.
  int? _totalCorners;
  int get totalCorners => _totalCorners ?? 0;
  set totalCorners(int? val) => _totalCorners = val;

  void incrementTotalCorners(int amount) =>
      totalCorners = totalCorners + amount;

  bool hasTotalCorners() => _totalCorners != null;

  // "match" field.
  BLESSfixtureStruct? _match;
  BLESSfixtureStruct get match => _match ?? BLESSfixtureStruct();
  set match(BLESSfixtureStruct? val) => _match = val;

  void updateMatch(Function(BLESSfixtureStruct) updateFn) {
    updateFn(_match ??= BLESSfixtureStruct());
  }

  bool hasMatch() => _match != null;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  // "pointsForScore" field.
  int? _pointsForScore;
  int get pointsForScore => _pointsForScore ?? 0;
  set pointsForScore(int? val) => _pointsForScore = val;

  void incrementPointsForScore(int amount) =>
      pointsForScore = pointsForScore + amount;

  bool hasPointsForScore() => _pointsForScore != null;

  // "pointsForScorer" field.
  int? _pointsForScorer;
  int get pointsForScorer => _pointsForScorer ?? 0;
  set pointsForScorer(int? val) => _pointsForScorer = val;

  void incrementPointsForScorer(int amount) =>
      pointsForScorer = pointsForScorer + amount;

  bool hasPointsForScorer() => _pointsForScorer != null;

  // "entryPoints" field.
  int? _entryPoints;
  int get entryPoints => _entryPoints ?? 0;
  set entryPoints(int? val) => _entryPoints = val;

  void incrementEntryPoints(int amount) => entryPoints = entryPoints + amount;

  bool hasEntryPoints() => _entryPoints != null;

  // "bonusPoints" field.
  int? _bonusPoints;
  int get bonusPoints => _bonusPoints ?? 0;
  set bonusPoints(int? val) => _bonusPoints = val;

  void incrementBonusPoints(int amount) => bonusPoints = bonusPoints + amount;

  bool hasBonusPoints() => _bonusPoints != null;

  // "awayBadge" field.
  String? _awayBadge;
  String get awayBadge => _awayBadge ?? '';
  set awayBadge(String? val) => _awayBadge = val;

  bool hasAwayBadge() => _awayBadge != null;

  // "homeBadge" field.
  String? _homeBadge;
  String get homeBadge => _homeBadge ?? '';
  set homeBadge(String? val) => _homeBadge = val;

  bool hasHomeBadge() => _homeBadge != null;

  // "HomeABR" field.
  String? _homeABR;
  String get homeABR => _homeABR ?? '';
  set homeABR(String? val) => _homeABR = val;

  bool hasHomeABR() => _homeABR != null;

  // "AwayABR" field.
  String? _awayABR;
  String get awayABR => _awayABR ?? '';
  set awayABR(String? val) => _awayABR = val;

  bool hasAwayABR() => _awayABR != null;

  static PredictorItemHistStruct fromMap(Map<String, dynamic> data) =>
      PredictorItemHistStruct(
        homeScore: castToType<int>(data['homeScore']),
        awayScore: castToType<int>(data['awayScore']),
        scorerName: data['scorerName'] as String?,
        totalCorners: castToType<int>(data['totalCorners']),
        match: data['match'] is BLESSfixtureStruct
            ? data['match']
            : BLESSfixtureStruct.maybeFromMap(data['match']),
        created: castToType<int>(data['created']),
        pointsForScore: castToType<int>(data['pointsForScore']),
        pointsForScorer: castToType<int>(data['pointsForScorer']),
        entryPoints: castToType<int>(data['entryPoints']),
        bonusPoints: castToType<int>(data['bonusPoints']),
        awayBadge: data['awayBadge'] as String?,
        homeBadge: data['homeBadge'] as String?,
        homeABR: data['HomeABR'] as String?,
        awayABR: data['AwayABR'] as String?,
      );

  static PredictorItemHistStruct? maybeFromMap(dynamic data) => data is Map
      ? PredictorItemHistStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'homeScore': _homeScore,
        'awayScore': _awayScore,
        'scorerName': _scorerName,
        'totalCorners': _totalCorners,
        'match': _match?.toMap(),
        'created': _created,
        'pointsForScore': _pointsForScore,
        'pointsForScorer': _pointsForScorer,
        'entryPoints': _entryPoints,
        'bonusPoints': _bonusPoints,
        'awayBadge': _awayBadge,
        'homeBadge': _homeBadge,
        'HomeABR': _homeABR,
        'AwayABR': _awayABR,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'homeScore': serializeParam(
          _homeScore,
          ParamType.int,
        ),
        'awayScore': serializeParam(
          _awayScore,
          ParamType.int,
        ),
        'scorerName': serializeParam(
          _scorerName,
          ParamType.String,
        ),
        'totalCorners': serializeParam(
          _totalCorners,
          ParamType.int,
        ),
        'match': serializeParam(
          _match,
          ParamType.DataStruct,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'pointsForScore': serializeParam(
          _pointsForScore,
          ParamType.int,
        ),
        'pointsForScorer': serializeParam(
          _pointsForScorer,
          ParamType.int,
        ),
        'entryPoints': serializeParam(
          _entryPoints,
          ParamType.int,
        ),
        'bonusPoints': serializeParam(
          _bonusPoints,
          ParamType.int,
        ),
        'awayBadge': serializeParam(
          _awayBadge,
          ParamType.String,
        ),
        'homeBadge': serializeParam(
          _homeBadge,
          ParamType.String,
        ),
        'HomeABR': serializeParam(
          _homeABR,
          ParamType.String,
        ),
        'AwayABR': serializeParam(
          _awayABR,
          ParamType.String,
        ),
      }.withoutNulls;

  static PredictorItemHistStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PredictorItemHistStruct(
        homeScore: deserializeParam(
          data['homeScore'],
          ParamType.int,
          false,
        ),
        awayScore: deserializeParam(
          data['awayScore'],
          ParamType.int,
          false,
        ),
        scorerName: deserializeParam(
          data['scorerName'],
          ParamType.String,
          false,
        ),
        totalCorners: deserializeParam(
          data['totalCorners'],
          ParamType.int,
          false,
        ),
        match: deserializeStructParam(
          data['match'],
          ParamType.DataStruct,
          false,
          structBuilder: BLESSfixtureStruct.fromSerializableMap,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
        pointsForScore: deserializeParam(
          data['pointsForScore'],
          ParamType.int,
          false,
        ),
        pointsForScorer: deserializeParam(
          data['pointsForScorer'],
          ParamType.int,
          false,
        ),
        entryPoints: deserializeParam(
          data['entryPoints'],
          ParamType.int,
          false,
        ),
        bonusPoints: deserializeParam(
          data['bonusPoints'],
          ParamType.int,
          false,
        ),
        awayBadge: deserializeParam(
          data['awayBadge'],
          ParamType.String,
          false,
        ),
        homeBadge: deserializeParam(
          data['homeBadge'],
          ParamType.String,
          false,
        ),
        homeABR: deserializeParam(
          data['HomeABR'],
          ParamType.String,
          false,
        ),
        awayABR: deserializeParam(
          data['AwayABR'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PredictorItemHistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PredictorItemHistStruct &&
        homeScore == other.homeScore &&
        awayScore == other.awayScore &&
        scorerName == other.scorerName &&
        totalCorners == other.totalCorners &&
        match == other.match &&
        created == other.created &&
        pointsForScore == other.pointsForScore &&
        pointsForScorer == other.pointsForScorer &&
        entryPoints == other.entryPoints &&
        bonusPoints == other.bonusPoints &&
        awayBadge == other.awayBadge &&
        homeBadge == other.homeBadge &&
        homeABR == other.homeABR &&
        awayABR == other.awayABR;
  }

  @override
  int get hashCode => const ListEquality().hash([
        homeScore,
        awayScore,
        scorerName,
        totalCorners,
        match,
        created,
        pointsForScore,
        pointsForScorer,
        entryPoints,
        bonusPoints,
        awayBadge,
        homeBadge,
        homeABR,
        awayABR
      ]);
}

PredictorItemHistStruct createPredictorItemHistStruct({
  int? homeScore,
  int? awayScore,
  String? scorerName,
  int? totalCorners,
  BLESSfixtureStruct? match,
  int? created,
  int? pointsForScore,
  int? pointsForScorer,
  int? entryPoints,
  int? bonusPoints,
  String? awayBadge,
  String? homeBadge,
  String? homeABR,
  String? awayABR,
}) =>
    PredictorItemHistStruct(
      homeScore: homeScore,
      awayScore: awayScore,
      scorerName: scorerName,
      totalCorners: totalCorners,
      match: match ?? BLESSfixtureStruct(),
      created: created,
      pointsForScore: pointsForScore,
      pointsForScorer: pointsForScorer,
      entryPoints: entryPoints,
      bonusPoints: bonusPoints,
      awayBadge: awayBadge,
      homeBadge: homeBadge,
      homeABR: homeABR,
      awayABR: awayABR,
    );
