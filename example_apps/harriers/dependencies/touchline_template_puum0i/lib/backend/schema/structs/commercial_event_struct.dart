// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommercialEventStruct extends FFFirebaseStruct {
  CommercialEventStruct({
    String? description,
    int? endDatetime,
    String? image,
    String? location,
    String? name,
    int? startDatetime,
    String? objectId,
    int? created,
    List<UserStruct>? interested,
    List<UserStruct>? going,
    String? teaserText,
    String? ticketsInfo,
    String? ticketLink,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _description = description,
        _endDatetime = endDatetime,
        _image = image,
        _location = location,
        _name = name,
        _startDatetime = startDatetime,
        _objectId = objectId,
        _created = created,
        _interested = interested,
        _going = going,
        _teaserText = teaserText,
        _ticketsInfo = ticketsInfo,
        _ticketLink = ticketLink,
        super(firestoreUtilData);

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "endDatetime" field.
  int? _endDatetime;
  int get endDatetime => _endDatetime ?? 0;
  set endDatetime(int? val) => _endDatetime = val;

  void incrementEndDatetime(int amount) => endDatetime = endDatetime + amount;

  bool hasEndDatetime() => _endDatetime != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "startDatetime" field.
  int? _startDatetime;
  int get startDatetime => _startDatetime ?? 0;
  set startDatetime(int? val) => _startDatetime = val;

  void incrementStartDatetime(int amount) =>
      startDatetime = startDatetime + amount;

  bool hasStartDatetime() => _startDatetime != null;

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

  // "interested" field.
  List<UserStruct>? _interested;
  List<UserStruct> get interested => _interested ?? const [];
  set interested(List<UserStruct>? val) => _interested = val;

  void updateInterested(Function(List<UserStruct>) updateFn) {
    updateFn(_interested ??= []);
  }

  bool hasInterested() => _interested != null;

  // "going" field.
  List<UserStruct>? _going;
  List<UserStruct> get going => _going ?? const [];
  set going(List<UserStruct>? val) => _going = val;

  void updateGoing(Function(List<UserStruct>) updateFn) {
    updateFn(_going ??= []);
  }

  bool hasGoing() => _going != null;

  // "teaserText" field.
  String? _teaserText;
  String get teaserText => _teaserText ?? '';
  set teaserText(String? val) => _teaserText = val;

  bool hasTeaserText() => _teaserText != null;

  // "ticketsInfo" field.
  String? _ticketsInfo;
  String get ticketsInfo => _ticketsInfo ?? '';
  set ticketsInfo(String? val) => _ticketsInfo = val;

  bool hasTicketsInfo() => _ticketsInfo != null;

  // "ticketLink" field.
  String? _ticketLink;
  String get ticketLink => _ticketLink ?? '';
  set ticketLink(String? val) => _ticketLink = val;

  bool hasTicketLink() => _ticketLink != null;

  static CommercialEventStruct fromMap(Map<String, dynamic> data) =>
      CommercialEventStruct(
        description: data['description'] as String?,
        endDatetime: castToType<int>(data['endDatetime']),
        image: data['image'] as String?,
        location: data['location'] as String?,
        name: data['name'] as String?,
        startDatetime: castToType<int>(data['startDatetime']),
        objectId: data['objectId'] as String?,
        created: castToType<int>(data['created']),
        interested: getStructList(
          data['interested'],
          UserStruct.fromMap,
        ),
        going: getStructList(
          data['going'],
          UserStruct.fromMap,
        ),
        teaserText: data['teaserText'] as String?,
        ticketsInfo: data['ticketsInfo'] as String?,
        ticketLink: data['ticketLink'] as String?,
      );

  static CommercialEventStruct? maybeFromMap(dynamic data) => data is Map
      ? CommercialEventStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'description': _description,
        'endDatetime': _endDatetime,
        'image': _image,
        'location': _location,
        'name': _name,
        'startDatetime': _startDatetime,
        'objectId': _objectId,
        'created': _created,
        'interested': _interested?.map((e) => e.toMap()).toList(),
        'going': _going?.map((e) => e.toMap()).toList(),
        'teaserText': _teaserText,
        'ticketsInfo': _ticketsInfo,
        'ticketLink': _ticketLink,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'endDatetime': serializeParam(
          _endDatetime,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'startDatetime': serializeParam(
          _startDatetime,
          ParamType.int,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'interested': serializeParam(
          _interested,
          ParamType.DataStruct,
          isList: true,
        ),
        'going': serializeParam(
          _going,
          ParamType.DataStruct,
          isList: true,
        ),
        'teaserText': serializeParam(
          _teaserText,
          ParamType.String,
        ),
        'ticketsInfo': serializeParam(
          _ticketsInfo,
          ParamType.String,
        ),
        'ticketLink': serializeParam(
          _ticketLink,
          ParamType.String,
        ),
      }.withoutNulls;

  static CommercialEventStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommercialEventStruct(
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        endDatetime: deserializeParam(
          data['endDatetime'],
          ParamType.int,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        startDatetime: deserializeParam(
          data['startDatetime'],
          ParamType.int,
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
        interested: deserializeStructParam<UserStruct>(
          data['interested'],
          ParamType.DataStruct,
          true,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        going: deserializeStructParam<UserStruct>(
          data['going'],
          ParamType.DataStruct,
          true,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        teaserText: deserializeParam(
          data['teaserText'],
          ParamType.String,
          false,
        ),
        ticketsInfo: deserializeParam(
          data['ticketsInfo'],
          ParamType.String,
          false,
        ),
        ticketLink: deserializeParam(
          data['ticketLink'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CommercialEventStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CommercialEventStruct &&
        description == other.description &&
        endDatetime == other.endDatetime &&
        image == other.image &&
        location == other.location &&
        name == other.name &&
        startDatetime == other.startDatetime &&
        objectId == other.objectId &&
        created == other.created &&
        listEquality.equals(interested, other.interested) &&
        listEquality.equals(going, other.going) &&
        teaserText == other.teaserText &&
        ticketsInfo == other.ticketsInfo &&
        ticketLink == other.ticketLink;
  }

  @override
  int get hashCode => const ListEquality().hash([
        description,
        endDatetime,
        image,
        location,
        name,
        startDatetime,
        objectId,
        created,
        interested,
        going,
        teaserText,
        ticketsInfo,
        ticketLink
      ]);
}

CommercialEventStruct createCommercialEventStruct({
  String? description,
  int? endDatetime,
  String? image,
  String? location,
  String? name,
  int? startDatetime,
  String? objectId,
  int? created,
  String? teaserText,
  String? ticketsInfo,
  String? ticketLink,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommercialEventStruct(
      description: description,
      endDatetime: endDatetime,
      image: image,
      location: location,
      name: name,
      startDatetime: startDatetime,
      objectId: objectId,
      created: created,
      teaserText: teaserText,
      ticketsInfo: ticketsInfo,
      ticketLink: ticketLink,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommercialEventStruct? updateCommercialEventStruct(
  CommercialEventStruct? commercialEvent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    commercialEvent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommercialEventStructData(
  Map<String, dynamic> firestoreData,
  CommercialEventStruct? commercialEvent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (commercialEvent == null) {
    return;
  }
  if (commercialEvent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && commercialEvent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commercialEventData =
      getCommercialEventFirestoreData(commercialEvent, forFieldValue);
  final nestedData =
      commercialEventData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = commercialEvent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommercialEventFirestoreData(
  CommercialEventStruct? commercialEvent, [
  bool forFieldValue = false,
]) {
  if (commercialEvent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(commercialEvent.toMap());

  // Add any Firestore field values
  commercialEvent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommercialEventListFirestoreData(
  List<CommercialEventStruct>? commercialEvents,
) =>
    commercialEvents
        ?.map((e) => getCommercialEventFirestoreData(e, true))
        .toList() ??
    [];
