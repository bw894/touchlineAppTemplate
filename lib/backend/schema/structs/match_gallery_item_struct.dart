// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MatchGalleryItemStruct extends BaseStruct {
  MatchGalleryItemStruct({
    String? imagePath,
    BLESSfixtureStruct? relatedMatch,
    String? objectId,
  })  : _imagePath = imagePath,
        _relatedMatch = relatedMatch,
        _objectId = objectId;

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  set imagePath(String? val) => _imagePath = val;

  bool hasImagePath() => _imagePath != null;

  // "relatedMatch" field.
  BLESSfixtureStruct? _relatedMatch;
  BLESSfixtureStruct get relatedMatch => _relatedMatch ?? BLESSfixtureStruct();
  set relatedMatch(BLESSfixtureStruct? val) => _relatedMatch = val;

  void updateRelatedMatch(Function(BLESSfixtureStruct) updateFn) {
    updateFn(_relatedMatch ??= BLESSfixtureStruct());
  }

  bool hasRelatedMatch() => _relatedMatch != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  static MatchGalleryItemStruct fromMap(Map<String, dynamic> data) =>
      MatchGalleryItemStruct(
        imagePath: data['imagePath'] as String?,
        relatedMatch: data['relatedMatch'] is BLESSfixtureStruct
            ? data['relatedMatch']
            : BLESSfixtureStruct.maybeFromMap(data['relatedMatch']),
        objectId: data['objectId'] as String?,
      );

  static MatchGalleryItemStruct? maybeFromMap(dynamic data) => data is Map
      ? MatchGalleryItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'imagePath': _imagePath,
        'relatedMatch': _relatedMatch?.toMap(),
        'objectId': _objectId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imagePath': serializeParam(
          _imagePath,
          ParamType.String,
        ),
        'relatedMatch': serializeParam(
          _relatedMatch,
          ParamType.DataStruct,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
      }.withoutNulls;

  static MatchGalleryItemStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MatchGalleryItemStruct(
        imagePath: deserializeParam(
          data['imagePath'],
          ParamType.String,
          false,
        ),
        relatedMatch: deserializeStructParam(
          data['relatedMatch'],
          ParamType.DataStruct,
          false,
          structBuilder: BLESSfixtureStruct.fromSerializableMap,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MatchGalleryItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MatchGalleryItemStruct &&
        imagePath == other.imagePath &&
        relatedMatch == other.relatedMatch &&
        objectId == other.objectId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([imagePath, relatedMatch, objectId]);
}

MatchGalleryItemStruct createMatchGalleryItemStruct({
  String? imagePath,
  BLESSfixtureStruct? relatedMatch,
  String? objectId,
}) =>
    MatchGalleryItemStruct(
      imagePath: imagePath,
      relatedMatch: relatedMatch ?? BLESSfixtureStruct(),
      objectId: objectId,
    );
