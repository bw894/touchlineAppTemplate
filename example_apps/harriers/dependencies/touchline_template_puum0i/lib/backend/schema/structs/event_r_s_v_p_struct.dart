// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventRSVPStruct extends FFFirebaseStruct {
  EventRSVPStruct({
    String? eventObjectId,
    String? playerObjectId,
    String? objectId,
    int? created,
    String? status,
    int? updated,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _eventObjectId = eventObjectId,
        _playerObjectId = playerObjectId,
        _objectId = objectId,
        _created = created,
        _status = status,
        _updated = updated,
        super(firestoreUtilData);

  // "eventObjectId" field.
  String? _eventObjectId;
  String get eventObjectId => _eventObjectId ?? '';
  set eventObjectId(String? val) => _eventObjectId = val;

  bool hasEventObjectId() => _eventObjectId != null;

  // "playerObjectId" field.
  String? _playerObjectId;
  String get playerObjectId => _playerObjectId ?? '';
  set playerObjectId(String? val) => _playerObjectId = val;

  bool hasPlayerObjectId() => _playerObjectId != null;

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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "updated" field.
  int? _updated;
  int get updated => _updated ?? 0;
  set updated(int? val) => _updated = val;

  void incrementUpdated(int amount) => updated = updated + amount;

  bool hasUpdated() => _updated != null;

  static EventRSVPStruct fromMap(Map<String, dynamic> data) => EventRSVPStruct(
        eventObjectId: data['eventObjectId'] as String?,
        playerObjectId: data['playerObjectId'] as String?,
        objectId: data['objectId'] as String?,
        created: castToType<int>(data['created']),
        status: data['status'] as String?,
        updated: castToType<int>(data['updated']),
      );

  static EventRSVPStruct? maybeFromMap(dynamic data) => data is Map
      ? EventRSVPStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'eventObjectId': _eventObjectId,
        'playerObjectId': _playerObjectId,
        'objectId': _objectId,
        'created': _created,
        'status': _status,
        'updated': _updated,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'eventObjectId': serializeParam(
          _eventObjectId,
          ParamType.String,
        ),
        'playerObjectId': serializeParam(
          _playerObjectId,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'updated': serializeParam(
          _updated,
          ParamType.int,
        ),
      }.withoutNulls;

  static EventRSVPStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventRSVPStruct(
        eventObjectId: deserializeParam(
          data['eventObjectId'],
          ParamType.String,
          false,
        ),
        playerObjectId: deserializeParam(
          data['playerObjectId'],
          ParamType.String,
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
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        updated: deserializeParam(
          data['updated'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'EventRSVPStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventRSVPStruct &&
        eventObjectId == other.eventObjectId &&
        playerObjectId == other.playerObjectId &&
        objectId == other.objectId &&
        created == other.created &&
        status == other.status &&
        updated == other.updated;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [eventObjectId, playerObjectId, objectId, created, status, updated]);
}

EventRSVPStruct createEventRSVPStruct({
  String? eventObjectId,
  String? playerObjectId,
  String? objectId,
  int? created,
  String? status,
  int? updated,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EventRSVPStruct(
      eventObjectId: eventObjectId,
      playerObjectId: playerObjectId,
      objectId: objectId,
      created: created,
      status: status,
      updated: updated,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EventRSVPStruct? updateEventRSVPStruct(
  EventRSVPStruct? eventRSVP, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    eventRSVP
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEventRSVPStructData(
  Map<String, dynamic> firestoreData,
  EventRSVPStruct? eventRSVP,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (eventRSVP == null) {
    return;
  }
  if (eventRSVP.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && eventRSVP.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final eventRSVPData = getEventRSVPFirestoreData(eventRSVP, forFieldValue);
  final nestedData = eventRSVPData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = eventRSVP.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEventRSVPFirestoreData(
  EventRSVPStruct? eventRSVP, [
  bool forFieldValue = false,
]) {
  if (eventRSVP == null) {
    return {};
  }
  final firestoreData = mapToFirestore(eventRSVP.toMap());

  // Add any Firestore field values
  eventRSVP.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEventRSVPListFirestoreData(
  List<EventRSVPStruct>? eventRSVPs,
) =>
    eventRSVPs?.map((e) => getEventRSVPFirestoreData(e, true)).toList() ?? [];
