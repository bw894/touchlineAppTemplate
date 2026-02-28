// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class PlayerJSONStruct extends BaseStruct {
  PlayerJSONStruct({
    String? playerFirst,
    String? playerLast,
    int? playerNumber,
    int? numberOfCards,
    int? minuteOn,
    bool? isInjured,
    bool? isOnPitch,
    int? numberOfGoals,
    bool? nominated,
    String? playerProfileURL,
    bool? startedOnPitch,
    String? playerObjectId,
  })  : _playerFirst = playerFirst,
        _playerLast = playerLast,
        _playerNumber = playerNumber,
        _numberOfCards = numberOfCards,
        _minuteOn = minuteOn,
        _isInjured = isInjured,
        _isOnPitch = isOnPitch,
        _numberOfGoals = numberOfGoals,
        _nominated = nominated,
        _playerProfileURL = playerProfileURL,
        _startedOnPitch = startedOnPitch,
        _playerObjectId = playerObjectId;

  // "playerFirst" field.
  String? _playerFirst;
  String get playerFirst => _playerFirst ?? '';
  set playerFirst(String? val) => _playerFirst = val;

  bool hasPlayerFirst() => _playerFirst != null;

  // "playerLast" field.
  String? _playerLast;
  String get playerLast => _playerLast ?? '';
  set playerLast(String? val) => _playerLast = val;

  bool hasPlayerLast() => _playerLast != null;

  // "playerNumber" field.
  int? _playerNumber;
  int get playerNumber => _playerNumber ?? 0;
  set playerNumber(int? val) => _playerNumber = val;

  void incrementPlayerNumber(int amount) =>
      playerNumber = playerNumber + amount;

  bool hasPlayerNumber() => _playerNumber != null;

  // "numberOfCards" field.
  int? _numberOfCards;
  int get numberOfCards => _numberOfCards ?? 0;
  set numberOfCards(int? val) => _numberOfCards = val;

  void incrementNumberOfCards(int amount) =>
      numberOfCards = numberOfCards + amount;

  bool hasNumberOfCards() => _numberOfCards != null;

  // "minuteOn" field.
  int? _minuteOn;
  int get minuteOn => _minuteOn ?? 0;
  set minuteOn(int? val) => _minuteOn = val;

  void incrementMinuteOn(int amount) => minuteOn = minuteOn + amount;

  bool hasMinuteOn() => _minuteOn != null;

  // "isInjured" field.
  bool? _isInjured;
  bool get isInjured => _isInjured ?? false;
  set isInjured(bool? val) => _isInjured = val;

  bool hasIsInjured() => _isInjured != null;

  // "isOnPitch" field.
  bool? _isOnPitch;
  bool get isOnPitch => _isOnPitch ?? true;
  set isOnPitch(bool? val) => _isOnPitch = val;

  bool hasIsOnPitch() => _isOnPitch != null;

  // "numberOfGoals" field.
  int? _numberOfGoals;
  int get numberOfGoals => _numberOfGoals ?? 0;
  set numberOfGoals(int? val) => _numberOfGoals = val;

  void incrementNumberOfGoals(int amount) =>
      numberOfGoals = numberOfGoals + amount;

  bool hasNumberOfGoals() => _numberOfGoals != null;

  // "nominated" field.
  bool? _nominated;
  bool get nominated => _nominated ?? false;
  set nominated(bool? val) => _nominated = val;

  bool hasNominated() => _nominated != null;

  // "playerProfileURL" field.
  String? _playerProfileURL;
  String get playerProfileURL =>
      _playerProfileURL ??
      'https://st.depositphotos.com/1000591/2954/v/450/depositphotos_29541083-stock-illustration-silhouette-of-a-man.jpg';
  set playerProfileURL(String? val) => _playerProfileURL = val;

  bool hasPlayerProfileURL() => _playerProfileURL != null;

  // "startedOnPitch" field.
  bool? _startedOnPitch;
  bool get startedOnPitch => _startedOnPitch ?? true;
  set startedOnPitch(bool? val) => _startedOnPitch = val;

  bool hasStartedOnPitch() => _startedOnPitch != null;

  // "playerObjectId" field.
  String? _playerObjectId;
  String get playerObjectId => _playerObjectId ?? '';
  set playerObjectId(String? val) => _playerObjectId = val;

  bool hasPlayerObjectId() => _playerObjectId != null;

  static PlayerJSONStruct fromMap(Map<String, dynamic> data) =>
      PlayerJSONStruct(
        playerFirst: data['playerFirst'] as String?,
        playerLast: data['playerLast'] as String?,
        playerNumber: castToType<int>(data['playerNumber']),
        numberOfCards: castToType<int>(data['numberOfCards']),
        minuteOn: castToType<int>(data['minuteOn']),
        isInjured: data['isInjured'] as bool?,
        isOnPitch: data['isOnPitch'] as bool?,
        numberOfGoals: castToType<int>(data['numberOfGoals']),
        nominated: data['nominated'] as bool?,
        playerProfileURL: data['playerProfileURL'] as String?,
        startedOnPitch: data['startedOnPitch'] as bool?,
        playerObjectId: data['playerObjectId'] as String?,
      );

  static PlayerJSONStruct? maybeFromMap(dynamic data) => data is Map
      ? PlayerJSONStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'playerFirst': _playerFirst,
        'playerLast': _playerLast,
        'playerNumber': _playerNumber,
        'numberOfCards': _numberOfCards,
        'minuteOn': _minuteOn,
        'isInjured': _isInjured,
        'isOnPitch': _isOnPitch,
        'numberOfGoals': _numberOfGoals,
        'nominated': _nominated,
        'playerProfileURL': _playerProfileURL,
        'startedOnPitch': _startedOnPitch,
        'playerObjectId': _playerObjectId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'playerFirst': serializeParam(
          _playerFirst,
          ParamType.String,
        ),
        'playerLast': serializeParam(
          _playerLast,
          ParamType.String,
        ),
        'playerNumber': serializeParam(
          _playerNumber,
          ParamType.int,
        ),
        'numberOfCards': serializeParam(
          _numberOfCards,
          ParamType.int,
        ),
        'minuteOn': serializeParam(
          _minuteOn,
          ParamType.int,
        ),
        'isInjured': serializeParam(
          _isInjured,
          ParamType.bool,
        ),
        'isOnPitch': serializeParam(
          _isOnPitch,
          ParamType.bool,
        ),
        'numberOfGoals': serializeParam(
          _numberOfGoals,
          ParamType.int,
        ),
        'nominated': serializeParam(
          _nominated,
          ParamType.bool,
        ),
        'playerProfileURL': serializeParam(
          _playerProfileURL,
          ParamType.String,
        ),
        'startedOnPitch': serializeParam(
          _startedOnPitch,
          ParamType.bool,
        ),
        'playerObjectId': serializeParam(
          _playerObjectId,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlayerJSONStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlayerJSONStruct(
        playerFirst: deserializeParam(
          data['playerFirst'],
          ParamType.String,
          false,
        ),
        playerLast: deserializeParam(
          data['playerLast'],
          ParamType.String,
          false,
        ),
        playerNumber: deserializeParam(
          data['playerNumber'],
          ParamType.int,
          false,
        ),
        numberOfCards: deserializeParam(
          data['numberOfCards'],
          ParamType.int,
          false,
        ),
        minuteOn: deserializeParam(
          data['minuteOn'],
          ParamType.int,
          false,
        ),
        isInjured: deserializeParam(
          data['isInjured'],
          ParamType.bool,
          false,
        ),
        isOnPitch: deserializeParam(
          data['isOnPitch'],
          ParamType.bool,
          false,
        ),
        numberOfGoals: deserializeParam(
          data['numberOfGoals'],
          ParamType.int,
          false,
        ),
        nominated: deserializeParam(
          data['nominated'],
          ParamType.bool,
          false,
        ),
        playerProfileURL: deserializeParam(
          data['playerProfileURL'],
          ParamType.String,
          false,
        ),
        startedOnPitch: deserializeParam(
          data['startedOnPitch'],
          ParamType.bool,
          false,
        ),
        playerObjectId: deserializeParam(
          data['playerObjectId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PlayerJSONStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlayerJSONStruct &&
        playerFirst == other.playerFirst &&
        playerLast == other.playerLast &&
        playerNumber == other.playerNumber &&
        numberOfCards == other.numberOfCards &&
        minuteOn == other.minuteOn &&
        isInjured == other.isInjured &&
        isOnPitch == other.isOnPitch &&
        numberOfGoals == other.numberOfGoals &&
        nominated == other.nominated &&
        playerProfileURL == other.playerProfileURL &&
        startedOnPitch == other.startedOnPitch &&
        playerObjectId == other.playerObjectId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        playerFirst,
        playerLast,
        playerNumber,
        numberOfCards,
        minuteOn,
        isInjured,
        isOnPitch,
        numberOfGoals,
        nominated,
        playerProfileURL,
        startedOnPitch,
        playerObjectId
      ]);
}

PlayerJSONStruct createPlayerJSONStruct({
  String? playerFirst,
  String? playerLast,
  int? playerNumber,
  int? numberOfCards,
  int? minuteOn,
  bool? isInjured,
  bool? isOnPitch,
  int? numberOfGoals,
  bool? nominated,
  String? playerProfileURL,
  bool? startedOnPitch,
  String? playerObjectId,
}) =>
    PlayerJSONStruct(
      playerFirst: playerFirst,
      playerLast: playerLast,
      playerNumber: playerNumber,
      numberOfCards: numberOfCards,
      minuteOn: minuteOn,
      isInjured: isInjured,
      isOnPitch: isOnPitch,
      numberOfGoals: numberOfGoals,
      nominated: nominated,
      playerProfileURL: playerProfileURL,
      startedOnPitch: startedOnPitch,
      playerObjectId: playerObjectId,
    );
