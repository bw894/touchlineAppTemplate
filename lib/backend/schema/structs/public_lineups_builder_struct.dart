// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PublicLineupsBuilderStruct extends BaseStruct {
  PublicLineupsBuilderStruct({
    String? objectId,
    String? userName,
    List<LineupBuilderPlayersStruct>? selectedPlayers,
    String? playerMap,
  })  : _objectId = objectId,
        _userName = userName,
        _selectedPlayers = selectedPlayers,
        _playerMap = playerMap;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "selectedPlayers" field.
  List<LineupBuilderPlayersStruct>? _selectedPlayers;
  List<LineupBuilderPlayersStruct> get selectedPlayers =>
      _selectedPlayers ?? const [];
  set selectedPlayers(List<LineupBuilderPlayersStruct>? val) =>
      _selectedPlayers = val;

  void updateSelectedPlayers(
      Function(List<LineupBuilderPlayersStruct>) updateFn) {
    updateFn(_selectedPlayers ??= []);
  }

  bool hasSelectedPlayers() => _selectedPlayers != null;

  // "playerMap" field.
  String? _playerMap;
  String get playerMap => _playerMap ?? '';
  set playerMap(String? val) => _playerMap = val;

  bool hasPlayerMap() => _playerMap != null;

  static PublicLineupsBuilderStruct fromMap(Map<String, dynamic> data) =>
      PublicLineupsBuilderStruct(
        objectId: data['objectId'] as String?,
        userName: data['userName'] as String?,
        selectedPlayers: getStructList(
          data['selectedPlayers'],
          LineupBuilderPlayersStruct.fromMap,
        ),
        playerMap: data['playerMap'] as String?,
      );

  static PublicLineupsBuilderStruct? maybeFromMap(dynamic data) => data is Map
      ? PublicLineupsBuilderStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'objectId': _objectId,
        'userName': _userName,
        'selectedPlayers': _selectedPlayers?.map((e) => e.toMap()).toList(),
        'playerMap': _playerMap,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'selectedPlayers': serializeParam(
          _selectedPlayers,
          ParamType.DataStruct,
          isList: true,
        ),
        'playerMap': serializeParam(
          _playerMap,
          ParamType.String,
        ),
      }.withoutNulls;

  static PublicLineupsBuilderStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PublicLineupsBuilderStruct(
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        selectedPlayers: deserializeStructParam<LineupBuilderPlayersStruct>(
          data['selectedPlayers'],
          ParamType.DataStruct,
          true,
          structBuilder: LineupBuilderPlayersStruct.fromSerializableMap,
        ),
        playerMap: deserializeParam(
          data['playerMap'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PublicLineupsBuilderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PublicLineupsBuilderStruct &&
        objectId == other.objectId &&
        userName == other.userName &&
        listEquality.equals(selectedPlayers, other.selectedPlayers) &&
        playerMap == other.playerMap;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([objectId, userName, selectedPlayers, playerMap]);
}

PublicLineupsBuilderStruct createPublicLineupsBuilderStruct({
  String? objectId,
  String? userName,
  String? playerMap,
}) =>
    PublicLineupsBuilderStruct(
      objectId: objectId,
      userName: userName,
      playerMap: playerMap,
    );
