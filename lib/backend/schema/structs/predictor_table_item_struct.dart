// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PredictorTableItemStruct extends BaseStruct {
  PredictorTableItemStruct({
    String? positional,
    int? rank,
    int? gamesPlayed,
    int? totalPoints,
    String? email,
    String? name,
    String? uid,
  })  : _positional = positional,
        _rank = rank,
        _gamesPlayed = gamesPlayed,
        _totalPoints = totalPoints,
        _email = email,
        _name = name,
        _uid = uid;

  // "positional" field.
  String? _positional;
  String get positional => _positional ?? '';
  set positional(String? val) => _positional = val;

  bool hasPositional() => _positional != null;

  // "rank" field.
  int? _rank;
  int get rank => _rank ?? 0;
  set rank(int? val) => _rank = val;

  void incrementRank(int amount) => rank = rank + amount;

  bool hasRank() => _rank != null;

  // "GamesPlayed" field.
  int? _gamesPlayed;
  int get gamesPlayed => _gamesPlayed ?? 0;
  set gamesPlayed(int? val) => _gamesPlayed = val;

  void incrementGamesPlayed(int amount) => gamesPlayed = gamesPlayed + amount;

  bool hasGamesPlayed() => _gamesPlayed != null;

  // "TotalPoints" field.
  int? _totalPoints;
  int get totalPoints => _totalPoints ?? 0;
  set totalPoints(int? val) => _totalPoints = val;

  void incrementTotalPoints(int amount) => totalPoints = totalPoints + amount;

  bool hasTotalPoints() => _totalPoints != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  static PredictorTableItemStruct fromMap(Map<String, dynamic> data) =>
      PredictorTableItemStruct(
        positional: data['positional'] as String?,
        rank: castToType<int>(data['rank']),
        gamesPlayed: castToType<int>(data['GamesPlayed']),
        totalPoints: castToType<int>(data['TotalPoints']),
        email: data['Email'] as String?,
        name: data['Name'] as String?,
        uid: data['uid'] as String?,
      );

  static PredictorTableItemStruct? maybeFromMap(dynamic data) => data is Map
      ? PredictorTableItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'positional': _positional,
        'rank': _rank,
        'GamesPlayed': _gamesPlayed,
        'TotalPoints': _totalPoints,
        'Email': _email,
        'Name': _name,
        'uid': _uid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'positional': serializeParam(
          _positional,
          ParamType.String,
        ),
        'rank': serializeParam(
          _rank,
          ParamType.int,
        ),
        'GamesPlayed': serializeParam(
          _gamesPlayed,
          ParamType.int,
        ),
        'TotalPoints': serializeParam(
          _totalPoints,
          ParamType.int,
        ),
        'Email': serializeParam(
          _email,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
      }.withoutNulls;

  static PredictorTableItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PredictorTableItemStruct(
        positional: deserializeParam(
          data['positional'],
          ParamType.String,
          false,
        ),
        rank: deserializeParam(
          data['rank'],
          ParamType.int,
          false,
        ),
        gamesPlayed: deserializeParam(
          data['GamesPlayed'],
          ParamType.int,
          false,
        ),
        totalPoints: deserializeParam(
          data['TotalPoints'],
          ParamType.int,
          false,
        ),
        email: deserializeParam(
          data['Email'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PredictorTableItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PredictorTableItemStruct &&
        positional == other.positional &&
        rank == other.rank &&
        gamesPlayed == other.gamesPlayed &&
        totalPoints == other.totalPoints &&
        email == other.email &&
        name == other.name &&
        uid == other.uid;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([positional, rank, gamesPlayed, totalPoints, email, name, uid]);
}

PredictorTableItemStruct createPredictorTableItemStruct({
  String? positional,
  int? rank,
  int? gamesPlayed,
  int? totalPoints,
  String? email,
  String? name,
  String? uid,
}) =>
    PredictorTableItemStruct(
      positional: positional,
      rank: rank,
      gamesPlayed: gamesPlayed,
      totalPoints: totalPoints,
      email: email,
      name: name,
      uid: uid,
    );
