// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class PeriodsStruct extends BaseStruct {
  PeriodsStruct({
    int? id,
    int? ended,
    int? minutes,
    int? seconds,
    int? started,
    bool? ticking,
    int? typeId,
    bool? hasTimer,
    int? fixtureId,
    int? sortOrder,
    int? timeAdded,
    int? countsFrom,
    String? description,
    int? periodLength,
  })  : _id = id,
        _ended = ended,
        _minutes = minutes,
        _seconds = seconds,
        _started = started,
        _ticking = ticking,
        _typeId = typeId,
        _hasTimer = hasTimer,
        _fixtureId = fixtureId,
        _sortOrder = sortOrder,
        _timeAdded = timeAdded,
        _countsFrom = countsFrom,
        _description = description,
        _periodLength = periodLength;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "ended" field.
  int? _ended;
  int get ended => _ended ?? 0;
  set ended(int? val) => _ended = val;

  void incrementEnded(int amount) => ended = ended + amount;

  bool hasEnded() => _ended != null;

  // "minutes" field.
  int? _minutes;
  int get minutes => _minutes ?? 0;
  set minutes(int? val) => _minutes = val;

  void incrementMinutes(int amount) => minutes = minutes + amount;

  bool hasMinutes() => _minutes != null;

  // "seconds" field.
  int? _seconds;
  int get seconds => _seconds ?? 0;
  set seconds(int? val) => _seconds = val;

  void incrementSeconds(int amount) => seconds = seconds + amount;

  bool hasSeconds() => _seconds != null;

  // "started" field.
  int? _started;
  int get started => _started ?? 0;
  set started(int? val) => _started = val;

  void incrementStarted(int amount) => started = started + amount;

  bool hasStarted() => _started != null;

  // "ticking" field.
  bool? _ticking;
  bool get ticking => _ticking ?? false;
  set ticking(bool? val) => _ticking = val;

  bool hasTicking() => _ticking != null;

  // "type_id" field.
  int? _typeId;
  int get typeId => _typeId ?? 0;
  set typeId(int? val) => _typeId = val;

  void incrementTypeId(int amount) => typeId = typeId + amount;

  bool hasTypeId() => _typeId != null;

  // "has_timer" field.
  bool? _hasTimer;
  bool get hasTimer => _hasTimer ?? false;
  set hasTimer(bool? val) => _hasTimer = val;

  bool hasHasTimer() => _hasTimer != null;

  // "fixture_id" field.
  int? _fixtureId;
  int get fixtureId => _fixtureId ?? 0;
  set fixtureId(int? val) => _fixtureId = val;

  void incrementFixtureId(int amount) => fixtureId = fixtureId + amount;

  bool hasFixtureId() => _fixtureId != null;

  // "sort_order" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  // "time_added" field.
  int? _timeAdded;
  int get timeAdded => _timeAdded ?? 0;
  set timeAdded(int? val) => _timeAdded = val;

  void incrementTimeAdded(int amount) => timeAdded = timeAdded + amount;

  bool hasTimeAdded() => _timeAdded != null;

  // "counts_from" field.
  int? _countsFrom;
  int get countsFrom => _countsFrom ?? 0;
  set countsFrom(int? val) => _countsFrom = val;

  void incrementCountsFrom(int amount) => countsFrom = countsFrom + amount;

  bool hasCountsFrom() => _countsFrom != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "period_length" field.
  int? _periodLength;
  int get periodLength => _periodLength ?? 0;
  set periodLength(int? val) => _periodLength = val;

  void incrementPeriodLength(int amount) =>
      periodLength = periodLength + amount;

  bool hasPeriodLength() => _periodLength != null;

  static PeriodsStruct fromMap(Map<String, dynamic> data) => PeriodsStruct(
        id: castToType<int>(data['id']),
        ended: castToType<int>(data['ended']),
        minutes: castToType<int>(data['minutes']),
        seconds: castToType<int>(data['seconds']),
        started: castToType<int>(data['started']),
        ticking: data['ticking'] as bool?,
        typeId: castToType<int>(data['type_id']),
        hasTimer: data['has_timer'] as bool?,
        fixtureId: castToType<int>(data['fixture_id']),
        sortOrder: castToType<int>(data['sort_order']),
        timeAdded: castToType<int>(data['time_added']),
        countsFrom: castToType<int>(data['counts_from']),
        description: data['description'] as String?,
        periodLength: castToType<int>(data['period_length']),
      );

  static PeriodsStruct? maybeFromMap(dynamic data) =>
      data is Map ? PeriodsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'ended': _ended,
        'minutes': _minutes,
        'seconds': _seconds,
        'started': _started,
        'ticking': _ticking,
        'type_id': _typeId,
        'has_timer': _hasTimer,
        'fixture_id': _fixtureId,
        'sort_order': _sortOrder,
        'time_added': _timeAdded,
        'counts_from': _countsFrom,
        'description': _description,
        'period_length': _periodLength,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'ended': serializeParam(
          _ended,
          ParamType.int,
        ),
        'minutes': serializeParam(
          _minutes,
          ParamType.int,
        ),
        'seconds': serializeParam(
          _seconds,
          ParamType.int,
        ),
        'started': serializeParam(
          _started,
          ParamType.int,
        ),
        'ticking': serializeParam(
          _ticking,
          ParamType.bool,
        ),
        'type_id': serializeParam(
          _typeId,
          ParamType.int,
        ),
        'has_timer': serializeParam(
          _hasTimer,
          ParamType.bool,
        ),
        'fixture_id': serializeParam(
          _fixtureId,
          ParamType.int,
        ),
        'sort_order': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
        'time_added': serializeParam(
          _timeAdded,
          ParamType.int,
        ),
        'counts_from': serializeParam(
          _countsFrom,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'period_length': serializeParam(
          _periodLength,
          ParamType.int,
        ),
      }.withoutNulls;

  static PeriodsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PeriodsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        ended: deserializeParam(
          data['ended'],
          ParamType.int,
          false,
        ),
        minutes: deserializeParam(
          data['minutes'],
          ParamType.int,
          false,
        ),
        seconds: deserializeParam(
          data['seconds'],
          ParamType.int,
          false,
        ),
        started: deserializeParam(
          data['started'],
          ParamType.int,
          false,
        ),
        ticking: deserializeParam(
          data['ticking'],
          ParamType.bool,
          false,
        ),
        typeId: deserializeParam(
          data['type_id'],
          ParamType.int,
          false,
        ),
        hasTimer: deserializeParam(
          data['has_timer'],
          ParamType.bool,
          false,
        ),
        fixtureId: deserializeParam(
          data['fixture_id'],
          ParamType.int,
          false,
        ),
        sortOrder: deserializeParam(
          data['sort_order'],
          ParamType.int,
          false,
        ),
        timeAdded: deserializeParam(
          data['time_added'],
          ParamType.int,
          false,
        ),
        countsFrom: deserializeParam(
          data['counts_from'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        periodLength: deserializeParam(
          data['period_length'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PeriodsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PeriodsStruct &&
        id == other.id &&
        ended == other.ended &&
        minutes == other.minutes &&
        seconds == other.seconds &&
        started == other.started &&
        ticking == other.ticking &&
        typeId == other.typeId &&
        hasTimer == other.hasTimer &&
        fixtureId == other.fixtureId &&
        sortOrder == other.sortOrder &&
        timeAdded == other.timeAdded &&
        countsFrom == other.countsFrom &&
        description == other.description &&
        periodLength == other.periodLength;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        ended,
        minutes,
        seconds,
        started,
        ticking,
        typeId,
        hasTimer,
        fixtureId,
        sortOrder,
        timeAdded,
        countsFrom,
        description,
        periodLength
      ]);
}

PeriodsStruct createPeriodsStruct({
  int? id,
  int? ended,
  int? minutes,
  int? seconds,
  int? started,
  bool? ticking,
  int? typeId,
  bool? hasTimer,
  int? fixtureId,
  int? sortOrder,
  int? timeAdded,
  int? countsFrom,
  String? description,
  int? periodLength,
}) =>
    PeriodsStruct(
      id: id,
      ended: ended,
      minutes: minutes,
      seconds: seconds,
      started: started,
      ticking: ticking,
      typeId: typeId,
      hasTimer: hasTimer,
      fixtureId: fixtureId,
      sortOrder: sortOrder,
      timeAdded: timeAdded,
      countsFrom: countsFrom,
      description: description,
      periodLength: periodLength,
    );
