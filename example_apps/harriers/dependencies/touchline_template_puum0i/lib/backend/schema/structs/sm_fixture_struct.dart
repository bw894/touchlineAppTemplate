// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SmFixtureStruct extends FFFirebaseStruct {
  SmFixtureStruct({
    int? id,
    String? leg,
    String? name,
    int? length,
    List<ScoresStruct>? scores,
    String? details,
    List<PeriodsStruct>? periods,
    String? groupId,
    bool? hasOdds,
    int? roundId,
    int? sportId,
    int? stageId,
    int? stateId,
    int? venueId,
    int? leagueId,
    int? seasonId,
    bool? placeholder,
    String? resultInfo,
    String? startingAt,
    String? aggregateId,
    List<ParticipantsStruct>? participants,
    bool? hasPremiumOdds,
    int? startingAtTimestamp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _leg = leg,
        _name = name,
        _length = length,
        _scores = scores,
        _details = details,
        _periods = periods,
        _groupId = groupId,
        _hasOdds = hasOdds,
        _roundId = roundId,
        _sportId = sportId,
        _stageId = stageId,
        _stateId = stateId,
        _venueId = venueId,
        _leagueId = leagueId,
        _seasonId = seasonId,
        _placeholder = placeholder,
        _resultInfo = resultInfo,
        _startingAt = startingAt,
        _aggregateId = aggregateId,
        _participants = participants,
        _hasPremiumOdds = hasPremiumOdds,
        _startingAtTimestamp = startingAtTimestamp,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "leg" field.
  String? _leg;
  String get leg => _leg ?? '';
  set leg(String? val) => _leg = val;

  bool hasLeg() => _leg != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "length" field.
  int? _length;
  int get length => _length ?? 0;
  set length(int? val) => _length = val;

  void incrementLength(int amount) => length = length + amount;

  bool hasLength() => _length != null;

  // "scores" field.
  List<ScoresStruct>? _scores;
  List<ScoresStruct> get scores => _scores ?? const [];
  set scores(List<ScoresStruct>? val) => _scores = val;

  void updateScores(Function(List<ScoresStruct>) updateFn) {
    updateFn(_scores ??= []);
  }

  bool hasScores() => _scores != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  set details(String? val) => _details = val;

  bool hasDetails() => _details != null;

  // "periods" field.
  List<PeriodsStruct>? _periods;
  List<PeriodsStruct> get periods => _periods ?? const [];
  set periods(List<PeriodsStruct>? val) => _periods = val;

  void updatePeriods(Function(List<PeriodsStruct>) updateFn) {
    updateFn(_periods ??= []);
  }

  bool hasPeriods() => _periods != null;

  // "group_id" field.
  String? _groupId;
  String get groupId => _groupId ?? '';
  set groupId(String? val) => _groupId = val;

  bool hasGroupId() => _groupId != null;

  // "has_odds" field.
  bool? _hasOdds;
  bool get hasOdds => _hasOdds ?? false;
  set hasOdds(bool? val) => _hasOdds = val;

  bool hasHasOdds() => _hasOdds != null;

  // "round_id" field.
  int? _roundId;
  int get roundId => _roundId ?? 0;
  set roundId(int? val) => _roundId = val;

  void incrementRoundId(int amount) => roundId = roundId + amount;

  bool hasRoundId() => _roundId != null;

  // "sport_id" field.
  int? _sportId;
  int get sportId => _sportId ?? 0;
  set sportId(int? val) => _sportId = val;

  void incrementSportId(int amount) => sportId = sportId + amount;

  bool hasSportId() => _sportId != null;

  // "stage_id" field.
  int? _stageId;
  int get stageId => _stageId ?? 0;
  set stageId(int? val) => _stageId = val;

  void incrementStageId(int amount) => stageId = stageId + amount;

  bool hasStageId() => _stageId != null;

  // "state_id" field.
  int? _stateId;
  int get stateId => _stateId ?? 0;
  set stateId(int? val) => _stateId = val;

  void incrementStateId(int amount) => stateId = stateId + amount;

  bool hasStateId() => _stateId != null;

  // "venue_id" field.
  int? _venueId;
  int get venueId => _venueId ?? 0;
  set venueId(int? val) => _venueId = val;

  void incrementVenueId(int amount) => venueId = venueId + amount;

  bool hasVenueId() => _venueId != null;

  // "league_id" field.
  int? _leagueId;
  int get leagueId => _leagueId ?? 0;
  set leagueId(int? val) => _leagueId = val;

  void incrementLeagueId(int amount) => leagueId = leagueId + amount;

  bool hasLeagueId() => _leagueId != null;

  // "season_id" field.
  int? _seasonId;
  int get seasonId => _seasonId ?? 0;
  set seasonId(int? val) => _seasonId = val;

  void incrementSeasonId(int amount) => seasonId = seasonId + amount;

  bool hasSeasonId() => _seasonId != null;

  // "placeholder" field.
  bool? _placeholder;
  bool get placeholder => _placeholder ?? false;
  set placeholder(bool? val) => _placeholder = val;

  bool hasPlaceholder() => _placeholder != null;

  // "result_info" field.
  String? _resultInfo;
  String get resultInfo => _resultInfo ?? '';
  set resultInfo(String? val) => _resultInfo = val;

  bool hasResultInfo() => _resultInfo != null;

  // "starting_at" field.
  String? _startingAt;
  String get startingAt => _startingAt ?? '';
  set startingAt(String? val) => _startingAt = val;

  bool hasStartingAt() => _startingAt != null;

  // "aggregate_id" field.
  String? _aggregateId;
  String get aggregateId => _aggregateId ?? '';
  set aggregateId(String? val) => _aggregateId = val;

  bool hasAggregateId() => _aggregateId != null;

  // "participants" field.
  List<ParticipantsStruct>? _participants;
  List<ParticipantsStruct> get participants => _participants ?? const [];
  set participants(List<ParticipantsStruct>? val) => _participants = val;

  void updateParticipants(Function(List<ParticipantsStruct>) updateFn) {
    updateFn(_participants ??= []);
  }

  bool hasParticipants() => _participants != null;

  // "has_premium_odds" field.
  bool? _hasPremiumOdds;
  bool get hasPremiumOdds => _hasPremiumOdds ?? false;
  set hasPremiumOdds(bool? val) => _hasPremiumOdds = val;

  bool hasHasPremiumOdds() => _hasPremiumOdds != null;

  // "starting_at_timestamp" field.
  int? _startingAtTimestamp;
  int get startingAtTimestamp => _startingAtTimestamp ?? 0;
  set startingAtTimestamp(int? val) => _startingAtTimestamp = val;

  void incrementStartingAtTimestamp(int amount) =>
      startingAtTimestamp = startingAtTimestamp + amount;

  bool hasStartingAtTimestamp() => _startingAtTimestamp != null;

  static SmFixtureStruct fromMap(Map<String, dynamic> data) => SmFixtureStruct(
        id: castToType<int>(data['id']),
        leg: data['leg'] as String?,
        name: data['name'] as String?,
        length: castToType<int>(data['length']),
        scores: getStructList(
          data['scores'],
          ScoresStruct.fromMap,
        ),
        details: data['details'] as String?,
        periods: getStructList(
          data['periods'],
          PeriodsStruct.fromMap,
        ),
        groupId: data['group_id'] as String?,
        hasOdds: data['has_odds'] as bool?,
        roundId: castToType<int>(data['round_id']),
        sportId: castToType<int>(data['sport_id']),
        stageId: castToType<int>(data['stage_id']),
        stateId: castToType<int>(data['state_id']),
        venueId: castToType<int>(data['venue_id']),
        leagueId: castToType<int>(data['league_id']),
        seasonId: castToType<int>(data['season_id']),
        placeholder: data['placeholder'] as bool?,
        resultInfo: data['result_info'] as String?,
        startingAt: data['starting_at'] as String?,
        aggregateId: data['aggregate_id'] as String?,
        participants: getStructList(
          data['participants'],
          ParticipantsStruct.fromMap,
        ),
        hasPremiumOdds: data['has_premium_odds'] as bool?,
        startingAtTimestamp: castToType<int>(data['starting_at_timestamp']),
      );

  static SmFixtureStruct? maybeFromMap(dynamic data) => data is Map
      ? SmFixtureStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'leg': _leg,
        'name': _name,
        'length': _length,
        'scores': _scores?.map((e) => e.toMap()).toList(),
        'details': _details,
        'periods': _periods?.map((e) => e.toMap()).toList(),
        'group_id': _groupId,
        'has_odds': _hasOdds,
        'round_id': _roundId,
        'sport_id': _sportId,
        'stage_id': _stageId,
        'state_id': _stateId,
        'venue_id': _venueId,
        'league_id': _leagueId,
        'season_id': _seasonId,
        'placeholder': _placeholder,
        'result_info': _resultInfo,
        'starting_at': _startingAt,
        'aggregate_id': _aggregateId,
        'participants': _participants?.map((e) => e.toMap()).toList(),
        'has_premium_odds': _hasPremiumOdds,
        'starting_at_timestamp': _startingAtTimestamp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'leg': serializeParam(
          _leg,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'length': serializeParam(
          _length,
          ParamType.int,
        ),
        'scores': serializeParam(
          _scores,
          ParamType.DataStruct,
          isList: true,
        ),
        'details': serializeParam(
          _details,
          ParamType.String,
        ),
        'periods': serializeParam(
          _periods,
          ParamType.DataStruct,
          isList: true,
        ),
        'group_id': serializeParam(
          _groupId,
          ParamType.String,
        ),
        'has_odds': serializeParam(
          _hasOdds,
          ParamType.bool,
        ),
        'round_id': serializeParam(
          _roundId,
          ParamType.int,
        ),
        'sport_id': serializeParam(
          _sportId,
          ParamType.int,
        ),
        'stage_id': serializeParam(
          _stageId,
          ParamType.int,
        ),
        'state_id': serializeParam(
          _stateId,
          ParamType.int,
        ),
        'venue_id': serializeParam(
          _venueId,
          ParamType.int,
        ),
        'league_id': serializeParam(
          _leagueId,
          ParamType.int,
        ),
        'season_id': serializeParam(
          _seasonId,
          ParamType.int,
        ),
        'placeholder': serializeParam(
          _placeholder,
          ParamType.bool,
        ),
        'result_info': serializeParam(
          _resultInfo,
          ParamType.String,
        ),
        'starting_at': serializeParam(
          _startingAt,
          ParamType.String,
        ),
        'aggregate_id': serializeParam(
          _aggregateId,
          ParamType.String,
        ),
        'participants': serializeParam(
          _participants,
          ParamType.DataStruct,
          isList: true,
        ),
        'has_premium_odds': serializeParam(
          _hasPremiumOdds,
          ParamType.bool,
        ),
        'starting_at_timestamp': serializeParam(
          _startingAtTimestamp,
          ParamType.int,
        ),
      }.withoutNulls;

  static SmFixtureStruct fromSerializableMap(Map<String, dynamic> data) =>
      SmFixtureStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        leg: deserializeParam(
          data['leg'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        length: deserializeParam(
          data['length'],
          ParamType.int,
          false,
        ),
        scores: deserializeStructParam<ScoresStruct>(
          data['scores'],
          ParamType.DataStruct,
          true,
          structBuilder: ScoresStruct.fromSerializableMap,
        ),
        details: deserializeParam(
          data['details'],
          ParamType.String,
          false,
        ),
        periods: deserializeStructParam<PeriodsStruct>(
          data['periods'],
          ParamType.DataStruct,
          true,
          structBuilder: PeriodsStruct.fromSerializableMap,
        ),
        groupId: deserializeParam(
          data['group_id'],
          ParamType.String,
          false,
        ),
        hasOdds: deserializeParam(
          data['has_odds'],
          ParamType.bool,
          false,
        ),
        roundId: deserializeParam(
          data['round_id'],
          ParamType.int,
          false,
        ),
        sportId: deserializeParam(
          data['sport_id'],
          ParamType.int,
          false,
        ),
        stageId: deserializeParam(
          data['stage_id'],
          ParamType.int,
          false,
        ),
        stateId: deserializeParam(
          data['state_id'],
          ParamType.int,
          false,
        ),
        venueId: deserializeParam(
          data['venue_id'],
          ParamType.int,
          false,
        ),
        leagueId: deserializeParam(
          data['league_id'],
          ParamType.int,
          false,
        ),
        seasonId: deserializeParam(
          data['season_id'],
          ParamType.int,
          false,
        ),
        placeholder: deserializeParam(
          data['placeholder'],
          ParamType.bool,
          false,
        ),
        resultInfo: deserializeParam(
          data['result_info'],
          ParamType.String,
          false,
        ),
        startingAt: deserializeParam(
          data['starting_at'],
          ParamType.String,
          false,
        ),
        aggregateId: deserializeParam(
          data['aggregate_id'],
          ParamType.String,
          false,
        ),
        participants: deserializeStructParam<ParticipantsStruct>(
          data['participants'],
          ParamType.DataStruct,
          true,
          structBuilder: ParticipantsStruct.fromSerializableMap,
        ),
        hasPremiumOdds: deserializeParam(
          data['has_premium_odds'],
          ParamType.bool,
          false,
        ),
        startingAtTimestamp: deserializeParam(
          data['starting_at_timestamp'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SmFixtureStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SmFixtureStruct &&
        id == other.id &&
        leg == other.leg &&
        name == other.name &&
        length == other.length &&
        listEquality.equals(scores, other.scores) &&
        details == other.details &&
        listEquality.equals(periods, other.periods) &&
        groupId == other.groupId &&
        hasOdds == other.hasOdds &&
        roundId == other.roundId &&
        sportId == other.sportId &&
        stageId == other.stageId &&
        stateId == other.stateId &&
        venueId == other.venueId &&
        leagueId == other.leagueId &&
        seasonId == other.seasonId &&
        placeholder == other.placeholder &&
        resultInfo == other.resultInfo &&
        startingAt == other.startingAt &&
        aggregateId == other.aggregateId &&
        listEquality.equals(participants, other.participants) &&
        hasPremiumOdds == other.hasPremiumOdds &&
        startingAtTimestamp == other.startingAtTimestamp;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        leg,
        name,
        length,
        scores,
        details,
        periods,
        groupId,
        hasOdds,
        roundId,
        sportId,
        stageId,
        stateId,
        venueId,
        leagueId,
        seasonId,
        placeholder,
        resultInfo,
        startingAt,
        aggregateId,
        participants,
        hasPremiumOdds,
        startingAtTimestamp
      ]);
}

SmFixtureStruct createSmFixtureStruct({
  int? id,
  String? leg,
  String? name,
  int? length,
  String? details,
  String? groupId,
  bool? hasOdds,
  int? roundId,
  int? sportId,
  int? stageId,
  int? stateId,
  int? venueId,
  int? leagueId,
  int? seasonId,
  bool? placeholder,
  String? resultInfo,
  String? startingAt,
  String? aggregateId,
  bool? hasPremiumOdds,
  int? startingAtTimestamp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SmFixtureStruct(
      id: id,
      leg: leg,
      name: name,
      length: length,
      details: details,
      groupId: groupId,
      hasOdds: hasOdds,
      roundId: roundId,
      sportId: sportId,
      stageId: stageId,
      stateId: stateId,
      venueId: venueId,
      leagueId: leagueId,
      seasonId: seasonId,
      placeholder: placeholder,
      resultInfo: resultInfo,
      startingAt: startingAt,
      aggregateId: aggregateId,
      hasPremiumOdds: hasPremiumOdds,
      startingAtTimestamp: startingAtTimestamp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SmFixtureStruct? updateSmFixtureStruct(
  SmFixtureStruct? smFixture, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    smFixture
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSmFixtureStructData(
  Map<String, dynamic> firestoreData,
  SmFixtureStruct? smFixture,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (smFixture == null) {
    return;
  }
  if (smFixture.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && smFixture.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final smFixtureData = getSmFixtureFirestoreData(smFixture, forFieldValue);
  final nestedData = smFixtureData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = smFixture.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSmFixtureFirestoreData(
  SmFixtureStruct? smFixture, [
  bool forFieldValue = false,
]) {
  if (smFixture == null) {
    return {};
  }
  final firestoreData = mapToFirestore(smFixture.toMap());

  // Add any Firestore field values
  smFixture.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSmFixtureListFirestoreData(
  List<SmFixtureStruct>? smFixtures,
) =>
    smFixtures?.map((e) => getSmFixtureFirestoreData(e, true)).toList() ?? [];
