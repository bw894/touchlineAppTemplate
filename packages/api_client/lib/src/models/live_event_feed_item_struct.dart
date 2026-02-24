// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class LiveEventFeedItemStruct extends BaseStruct {
  LiveEventFeedItemStruct({
    int? participantId,
    int? typeId,
    String? playerName,
    String? result,
    String? addition,
    int? minute,
    int? extraMinute,
    int? sortOrder,
  })  : _participantId = participantId,
        _typeId = typeId,
        _playerName = playerName,
        _result = result,
        _addition = addition,
        _minute = minute,
        _extraMinute = extraMinute,
        _sortOrder = sortOrder;

  // "participant_id" field.
  int? _participantId;
  int get participantId => _participantId ?? 0;
  set participantId(int? val) => _participantId = val;

  void incrementParticipantId(int amount) =>
      participantId = participantId + amount;

  bool hasParticipantId() => _participantId != null;

  // "type_id" field.
  int? _typeId;
  int get typeId => _typeId ?? 0;
  set typeId(int? val) => _typeId = val;

  void incrementTypeId(int amount) => typeId = typeId + amount;

  bool hasTypeId() => _typeId != null;

  // "player_name" field.
  String? _playerName;
  String get playerName => _playerName ?? '';
  set playerName(String? val) => _playerName = val;

  bool hasPlayerName() => _playerName != null;

  // "result" field.
  String? _result;
  String get result => _result ?? '';
  set result(String? val) => _result = val;

  bool hasResult() => _result != null;

  // "addition" field.
  String? _addition;
  String get addition => _addition ?? '';
  set addition(String? val) => _addition = val;

  bool hasAddition() => _addition != null;

  // "minute" field.
  int? _minute;
  int get minute => _minute ?? 0;
  set minute(int? val) => _minute = val;

  void incrementMinute(int amount) => minute = minute + amount;

  bool hasMinute() => _minute != null;

  // "extra_minute" field.
  int? _extraMinute;
  int get extraMinute => _extraMinute ?? 0;
  set extraMinute(int? val) => _extraMinute = val;

  void incrementExtraMinute(int amount) => extraMinute = extraMinute + amount;

  bool hasExtraMinute() => _extraMinute != null;

  // "sort_order" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 0;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  static LiveEventFeedItemStruct fromMap(Map<String, dynamic> data) =>
      LiveEventFeedItemStruct(
        participantId: castToType<int>(data['participant_id']),
        typeId: castToType<int>(data['type_id']),
        playerName: data['player_name'] as String?,
        result: data['result'] as String?,
        addition: data['addition'] as String?,
        minute: castToType<int>(data['minute']),
        extraMinute: castToType<int>(data['extra_minute']),
        sortOrder: castToType<int>(data['sort_order']),
      );

  static LiveEventFeedItemStruct? maybeFromMap(dynamic data) => data is Map
      ? LiveEventFeedItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'participant_id': _participantId,
        'type_id': _typeId,
        'player_name': _playerName,
        'result': _result,
        'addition': _addition,
        'minute': _minute,
        'extra_minute': _extraMinute,
        'sort_order': _sortOrder,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'participant_id': serializeParam(
          _participantId,
          ParamType.int,
        ),
        'type_id': serializeParam(
          _typeId,
          ParamType.int,
        ),
        'player_name': serializeParam(
          _playerName,
          ParamType.String,
        ),
        'result': serializeParam(
          _result,
          ParamType.String,
        ),
        'addition': serializeParam(
          _addition,
          ParamType.String,
        ),
        'minute': serializeParam(
          _minute,
          ParamType.int,
        ),
        'extra_minute': serializeParam(
          _extraMinute,
          ParamType.int,
        ),
        'sort_order': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
      }.withoutNulls;

  static LiveEventFeedItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LiveEventFeedItemStruct(
        participantId: deserializeParam(
          data['participant_id'],
          ParamType.int,
          false,
        ),
        typeId: deserializeParam(
          data['type_id'],
          ParamType.int,
          false,
        ),
        playerName: deserializeParam(
          data['player_name'],
          ParamType.String,
          false,
        ),
        result: deserializeParam(
          data['result'],
          ParamType.String,
          false,
        ),
        addition: deserializeParam(
          data['addition'],
          ParamType.String,
          false,
        ),
        minute: deserializeParam(
          data['minute'],
          ParamType.int,
          false,
        ),
        extraMinute: deserializeParam(
          data['extra_minute'],
          ParamType.int,
          false,
        ),
        sortOrder: deserializeParam(
          data['sort_order'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'LiveEventFeedItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LiveEventFeedItemStruct &&
        participantId == other.participantId &&
        typeId == other.typeId &&
        playerName == other.playerName &&
        result == other.result &&
        addition == other.addition &&
        minute == other.minute &&
        extraMinute == other.extraMinute &&
        sortOrder == other.sortOrder;
  }

  @override
  int get hashCode => const ListEquality().hash([
        participantId,
        typeId,
        playerName,
        result,
        addition,
        minute,
        extraMinute,
        sortOrder
      ]);
}

LiveEventFeedItemStruct createLiveEventFeedItemStruct({
  int? participantId,
  int? typeId,
  String? playerName,
  String? result,
  String? addition,
  int? minute,
  int? extraMinute,
  int? sortOrder,
}) =>
    LiveEventFeedItemStruct(
      participantId: participantId,
      typeId: typeId,
      playerName: playerName,
      result: result,
      addition: addition,
      minute: minute,
      extraMinute: extraMinute,
      sortOrder: sortOrder,
    );
