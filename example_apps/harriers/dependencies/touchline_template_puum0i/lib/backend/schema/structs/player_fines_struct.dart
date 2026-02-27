// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayerFinesStruct extends FFFirebaseStruct {
  PlayerFinesStruct({
    String? categoryCode,
    String? categoryDescription,
    bool? feesPassedOn,
    double? fineAmount,
    int? incidentDatetime,
    String? incidentDescription,
    int? issuedDatetime,
    PlayerStruct? player,
    double? processingFee,

    /// UNPAID | PAID | CANCELLED
    String? status,
    double? total,
    String? objectId,
    int? created,
    int? updated,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoryCode = categoryCode,
        _categoryDescription = categoryDescription,
        _feesPassedOn = feesPassedOn,
        _fineAmount = fineAmount,
        _incidentDatetime = incidentDatetime,
        _incidentDescription = incidentDescription,
        _issuedDatetime = issuedDatetime,
        _player = player,
        _processingFee = processingFee,
        _status = status,
        _total = total,
        _objectId = objectId,
        _created = created,
        _updated = updated,
        super(firestoreUtilData);

  // "categoryCode" field.
  String? _categoryCode;
  String get categoryCode => _categoryCode ?? '';
  set categoryCode(String? val) => _categoryCode = val;

  bool hasCategoryCode() => _categoryCode != null;

  // "categoryDescription" field.
  String? _categoryDescription;
  String get categoryDescription => _categoryDescription ?? '';
  set categoryDescription(String? val) => _categoryDescription = val;

  bool hasCategoryDescription() => _categoryDescription != null;

  // "feesPassedOn" field.
  bool? _feesPassedOn;
  bool get feesPassedOn => _feesPassedOn ?? false;
  set feesPassedOn(bool? val) => _feesPassedOn = val;

  bool hasFeesPassedOn() => _feesPassedOn != null;

  // "fineAmount" field.
  double? _fineAmount;
  double get fineAmount => _fineAmount ?? 0.0;
  set fineAmount(double? val) => _fineAmount = val;

  void incrementFineAmount(double amount) => fineAmount = fineAmount + amount;

  bool hasFineAmount() => _fineAmount != null;

  // "incidentDatetime" field.
  int? _incidentDatetime;
  int get incidentDatetime => _incidentDatetime ?? 0;
  set incidentDatetime(int? val) => _incidentDatetime = val;

  void incrementIncidentDatetime(int amount) =>
      incidentDatetime = incidentDatetime + amount;

  bool hasIncidentDatetime() => _incidentDatetime != null;

  // "incidentDescription" field.
  String? _incidentDescription;
  String get incidentDescription => _incidentDescription ?? '';
  set incidentDescription(String? val) => _incidentDescription = val;

  bool hasIncidentDescription() => _incidentDescription != null;

  // "issuedDatetime" field.
  int? _issuedDatetime;
  int get issuedDatetime => _issuedDatetime ?? 0;
  set issuedDatetime(int? val) => _issuedDatetime = val;

  void incrementIssuedDatetime(int amount) =>
      issuedDatetime = issuedDatetime + amount;

  bool hasIssuedDatetime() => _issuedDatetime != null;

  // "player" field.
  PlayerStruct? _player;
  PlayerStruct get player => _player ?? PlayerStruct();
  set player(PlayerStruct? val) => _player = val;

  void updatePlayer(Function(PlayerStruct) updateFn) {
    updateFn(_player ??= PlayerStruct());
  }

  bool hasPlayer() => _player != null;

  // "processingFee" field.
  double? _processingFee;
  double get processingFee => _processingFee ?? 0.0;
  set processingFee(double? val) => _processingFee = val;

  void incrementProcessingFee(double amount) =>
      processingFee = processingFee + amount;

  bool hasProcessingFee() => _processingFee != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  // "updated" field.
  int? _updated;
  int get updated => _updated ?? 0;
  set updated(int? val) => _updated = val;

  void incrementUpdated(int amount) => updated = updated + amount;

  bool hasUpdated() => _updated != null;

  static PlayerFinesStruct fromMap(Map<String, dynamic> data) =>
      PlayerFinesStruct(
        categoryCode: data['categoryCode'] as String?,
        categoryDescription: data['categoryDescription'] as String?,
        feesPassedOn: data['feesPassedOn'] as bool?,
        fineAmount: castToType<double>(data['fineAmount']),
        incidentDatetime: castToType<int>(data['incidentDatetime']),
        incidentDescription: data['incidentDescription'] as String?,
        issuedDatetime: castToType<int>(data['issuedDatetime']),
        player: data['player'] is PlayerStruct
            ? data['player']
            : PlayerStruct.maybeFromMap(data['player']),
        processingFee: castToType<double>(data['processingFee']),
        status: data['status'] as String?,
        total: castToType<double>(data['total']),
        objectId: data['objectId'] as String?,
        created: castToType<int>(data['created']),
        updated: castToType<int>(data['updated']),
      );

  static PlayerFinesStruct? maybeFromMap(dynamic data) => data is Map
      ? PlayerFinesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'categoryCode': _categoryCode,
        'categoryDescription': _categoryDescription,
        'feesPassedOn': _feesPassedOn,
        'fineAmount': _fineAmount,
        'incidentDatetime': _incidentDatetime,
        'incidentDescription': _incidentDescription,
        'issuedDatetime': _issuedDatetime,
        'player': _player?.toMap(),
        'processingFee': _processingFee,
        'status': _status,
        'total': _total,
        'objectId': _objectId,
        'created': _created,
        'updated': _updated,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'categoryCode': serializeParam(
          _categoryCode,
          ParamType.String,
        ),
        'categoryDescription': serializeParam(
          _categoryDescription,
          ParamType.String,
        ),
        'feesPassedOn': serializeParam(
          _feesPassedOn,
          ParamType.bool,
        ),
        'fineAmount': serializeParam(
          _fineAmount,
          ParamType.double,
        ),
        'incidentDatetime': serializeParam(
          _incidentDatetime,
          ParamType.int,
        ),
        'incidentDescription': serializeParam(
          _incidentDescription,
          ParamType.String,
        ),
        'issuedDatetime': serializeParam(
          _issuedDatetime,
          ParamType.int,
        ),
        'player': serializeParam(
          _player,
          ParamType.DataStruct,
        ),
        'processingFee': serializeParam(
          _processingFee,
          ParamType.double,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'updated': serializeParam(
          _updated,
          ParamType.int,
        ),
      }.withoutNulls;

  static PlayerFinesStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlayerFinesStruct(
        categoryCode: deserializeParam(
          data['categoryCode'],
          ParamType.String,
          false,
        ),
        categoryDescription: deserializeParam(
          data['categoryDescription'],
          ParamType.String,
          false,
        ),
        feesPassedOn: deserializeParam(
          data['feesPassedOn'],
          ParamType.bool,
          false,
        ),
        fineAmount: deserializeParam(
          data['fineAmount'],
          ParamType.double,
          false,
        ),
        incidentDatetime: deserializeParam(
          data['incidentDatetime'],
          ParamType.int,
          false,
        ),
        incidentDescription: deserializeParam(
          data['incidentDescription'],
          ParamType.String,
          false,
        ),
        issuedDatetime: deserializeParam(
          data['issuedDatetime'],
          ParamType.int,
          false,
        ),
        player: deserializeStructParam(
          data['player'],
          ParamType.DataStruct,
          false,
          structBuilder: PlayerStruct.fromSerializableMap,
        ),
        processingFee: deserializeParam(
          data['processingFee'],
          ParamType.double,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
        updated: deserializeParam(
          data['updated'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PlayerFinesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlayerFinesStruct &&
        categoryCode == other.categoryCode &&
        categoryDescription == other.categoryDescription &&
        feesPassedOn == other.feesPassedOn &&
        fineAmount == other.fineAmount &&
        incidentDatetime == other.incidentDatetime &&
        incidentDescription == other.incidentDescription &&
        issuedDatetime == other.issuedDatetime &&
        player == other.player &&
        processingFee == other.processingFee &&
        status == other.status &&
        total == other.total &&
        objectId == other.objectId &&
        created == other.created &&
        updated == other.updated;
  }

  @override
  int get hashCode => const ListEquality().hash([
        categoryCode,
        categoryDescription,
        feesPassedOn,
        fineAmount,
        incidentDatetime,
        incidentDescription,
        issuedDatetime,
        player,
        processingFee,
        status,
        total,
        objectId,
        created,
        updated
      ]);
}

PlayerFinesStruct createPlayerFinesStruct({
  String? categoryCode,
  String? categoryDescription,
  bool? feesPassedOn,
  double? fineAmount,
  int? incidentDatetime,
  String? incidentDescription,
  int? issuedDatetime,
  PlayerStruct? player,
  double? processingFee,
  String? status,
  double? total,
  String? objectId,
  int? created,
  int? updated,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlayerFinesStruct(
      categoryCode: categoryCode,
      categoryDescription: categoryDescription,
      feesPassedOn: feesPassedOn,
      fineAmount: fineAmount,
      incidentDatetime: incidentDatetime,
      incidentDescription: incidentDescription,
      issuedDatetime: issuedDatetime,
      player: player ?? (clearUnsetFields ? PlayerStruct() : null),
      processingFee: processingFee,
      status: status,
      total: total,
      objectId: objectId,
      created: created,
      updated: updated,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlayerFinesStruct? updatePlayerFinesStruct(
  PlayerFinesStruct? playerFines, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    playerFines
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlayerFinesStructData(
  Map<String, dynamic> firestoreData,
  PlayerFinesStruct? playerFines,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (playerFines == null) {
    return;
  }
  if (playerFines.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && playerFines.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final playerFinesData =
      getPlayerFinesFirestoreData(playerFines, forFieldValue);
  final nestedData =
      playerFinesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = playerFines.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlayerFinesFirestoreData(
  PlayerFinesStruct? playerFines, [
  bool forFieldValue = false,
]) {
  if (playerFines == null) {
    return {};
  }
  final firestoreData = mapToFirestore(playerFines.toMap());

  // Handle nested data for "player" field.
  addPlayerStructData(
    firestoreData,
    playerFines.hasPlayer() ? playerFines.player : null,
    'player',
    forFieldValue,
  );

  // Add any Firestore field values
  playerFines.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlayerFinesListFirestoreData(
  List<PlayerFinesStruct>? playerFiness,
) =>
    playerFiness?.map((e) => getPlayerFinesFirestoreData(e, true)).toList() ??
    [];
