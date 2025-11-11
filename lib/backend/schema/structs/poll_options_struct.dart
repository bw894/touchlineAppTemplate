// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PollOptionsStruct extends BaseStruct {
  PollOptionsStruct({
    String? optionTitle,
    int? votes,
    String? objectId,
    String? image,
    int? sortOrder,
  })  : _optionTitle = optionTitle,
        _votes = votes,
        _objectId = objectId,
        _image = image,
        _sortOrder = sortOrder;

  // "optionTitle" field.
  String? _optionTitle;
  String get optionTitle => _optionTitle ?? '';
  set optionTitle(String? val) => _optionTitle = val;

  bool hasOptionTitle() => _optionTitle != null;

  // "votes" field.
  int? _votes;
  int get votes => _votes ?? 0;
  set votes(int? val) => _votes = val;

  void incrementVotes(int amount) => votes = votes + amount;

  bool hasVotes() => _votes != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "sortOrder" field.
  int? _sortOrder;
  int get sortOrder => _sortOrder ?? 10;
  set sortOrder(int? val) => _sortOrder = val;

  void incrementSortOrder(int amount) => sortOrder = sortOrder + amount;

  bool hasSortOrder() => _sortOrder != null;

  static PollOptionsStruct fromMap(Map<String, dynamic> data) =>
      PollOptionsStruct(
        optionTitle: data['optionTitle'] as String?,
        votes: castToType<int>(data['votes']),
        objectId: data['objectId'] as String?,
        image: data['image'] as String?,
        sortOrder: castToType<int>(data['sortOrder']),
      );

  static PollOptionsStruct? maybeFromMap(dynamic data) => data is Map
      ? PollOptionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'optionTitle': _optionTitle,
        'votes': _votes,
        'objectId': _objectId,
        'image': _image,
        'sortOrder': _sortOrder,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'optionTitle': serializeParam(
          _optionTitle,
          ParamType.String,
        ),
        'votes': serializeParam(
          _votes,
          ParamType.int,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'sortOrder': serializeParam(
          _sortOrder,
          ParamType.int,
        ),
      }.withoutNulls;

  static PollOptionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      PollOptionsStruct(
        optionTitle: deserializeParam(
          data['optionTitle'],
          ParamType.String,
          false,
        ),
        votes: deserializeParam(
          data['votes'],
          ParamType.int,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        sortOrder: deserializeParam(
          data['sortOrder'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PollOptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PollOptionsStruct &&
        optionTitle == other.optionTitle &&
        votes == other.votes &&
        objectId == other.objectId &&
        image == other.image &&
        sortOrder == other.sortOrder;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([optionTitle, votes, objectId, image, sortOrder]);
}

PollOptionsStruct createPollOptionsStruct({
  String? optionTitle,
  int? votes,
  String? objectId,
  String? image,
  int? sortOrder,
}) =>
    PollOptionsStruct(
      optionTitle: optionTitle,
      votes: votes,
      objectId: objectId,
      image: image,
      sortOrder: sortOrder,
    );
