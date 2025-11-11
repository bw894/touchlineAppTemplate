// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HivesTeamStruct extends BaseStruct {
  HivesTeamStruct({
    String? clubAbr,
    String? clubNicknamePlural,
    int? leagueId,
    int? teamId,
    String? clubNickname,
    String? clubShortName,
  })  : _clubAbr = clubAbr,
        _clubNicknamePlural = clubNicknamePlural,
        _leagueId = leagueId,
        _teamId = teamId,
        _clubNickname = clubNickname,
        _clubShortName = clubShortName;

  // "ClubAbr" field.
  String? _clubAbr;
  String get clubAbr => _clubAbr ?? '';
  set clubAbr(String? val) => _clubAbr = val;

  bool hasClubAbr() => _clubAbr != null;

  // "ClubNicknamePlural" field.
  String? _clubNicknamePlural;
  String get clubNicknamePlural => _clubNicknamePlural ?? '';
  set clubNicknamePlural(String? val) => _clubNicknamePlural = val;

  bool hasClubNicknamePlural() => _clubNicknamePlural != null;

  // "leagueId" field.
  int? _leagueId;
  int get leagueId => _leagueId ?? 0;
  set leagueId(int? val) => _leagueId = val;

  void incrementLeagueId(int amount) => leagueId = leagueId + amount;

  bool hasLeagueId() => _leagueId != null;

  // "teamId" field.
  int? _teamId;
  int get teamId => _teamId ?? 0;
  set teamId(int? val) => _teamId = val;

  void incrementTeamId(int amount) => teamId = teamId + amount;

  bool hasTeamId() => _teamId != null;

  // "ClubNickname" field.
  String? _clubNickname;
  String get clubNickname => _clubNickname ?? '';
  set clubNickname(String? val) => _clubNickname = val;

  bool hasClubNickname() => _clubNickname != null;

  // "ClubShortName" field.
  String? _clubShortName;
  String get clubShortName => _clubShortName ?? '';
  set clubShortName(String? val) => _clubShortName = val;

  bool hasClubShortName() => _clubShortName != null;

  static HivesTeamStruct fromMap(Map<String, dynamic> data) => HivesTeamStruct(
        clubAbr: data['ClubAbr'] as String?,
        clubNicknamePlural: data['ClubNicknamePlural'] as String?,
        leagueId: castToType<int>(data['leagueId']),
        teamId: castToType<int>(data['teamId']),
        clubNickname: data['ClubNickname'] as String?,
        clubShortName: data['ClubShortName'] as String?,
      );

  static HivesTeamStruct? maybeFromMap(dynamic data) => data is Map
      ? HivesTeamStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ClubAbr': _clubAbr,
        'ClubNicknamePlural': _clubNicknamePlural,
        'leagueId': _leagueId,
        'teamId': _teamId,
        'ClubNickname': _clubNickname,
        'ClubShortName': _clubShortName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ClubAbr': serializeParam(
          _clubAbr,
          ParamType.String,
        ),
        'ClubNicknamePlural': serializeParam(
          _clubNicknamePlural,
          ParamType.String,
        ),
        'leagueId': serializeParam(
          _leagueId,
          ParamType.int,
        ),
        'teamId': serializeParam(
          _teamId,
          ParamType.int,
        ),
        'ClubNickname': serializeParam(
          _clubNickname,
          ParamType.String,
        ),
        'ClubShortName': serializeParam(
          _clubShortName,
          ParamType.String,
        ),
      }.withoutNulls;

  static HivesTeamStruct fromSerializableMap(Map<String, dynamic> data) =>
      HivesTeamStruct(
        clubAbr: deserializeParam(
          data['ClubAbr'],
          ParamType.String,
          false,
        ),
        clubNicknamePlural: deserializeParam(
          data['ClubNicknamePlural'],
          ParamType.String,
          false,
        ),
        leagueId: deserializeParam(
          data['leagueId'],
          ParamType.int,
          false,
        ),
        teamId: deserializeParam(
          data['teamId'],
          ParamType.int,
          false,
        ),
        clubNickname: deserializeParam(
          data['ClubNickname'],
          ParamType.String,
          false,
        ),
        clubShortName: deserializeParam(
          data['ClubShortName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HivesTeamStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HivesTeamStruct &&
        clubAbr == other.clubAbr &&
        clubNicknamePlural == other.clubNicknamePlural &&
        leagueId == other.leagueId &&
        teamId == other.teamId &&
        clubNickname == other.clubNickname &&
        clubShortName == other.clubShortName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        clubAbr,
        clubNicknamePlural,
        leagueId,
        teamId,
        clubNickname,
        clubShortName
      ]);
}

HivesTeamStruct createHivesTeamStruct({
  String? clubAbr,
  String? clubNicknamePlural,
  int? leagueId,
  int? teamId,
  String? clubNickname,
  String? clubShortName,
}) =>
    HivesTeamStruct(
      clubAbr: clubAbr,
      clubNicknamePlural: clubNicknamePlural,
      leagueId: leagueId,
      teamId: teamId,
      clubNickname: clubNickname,
      clubShortName: clubShortName,
    );
