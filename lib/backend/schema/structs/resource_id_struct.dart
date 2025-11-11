// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResourceIdStruct extends BaseStruct {
  ResourceIdStruct({
    String? videoId,
  }) : _videoId = videoId;

  // "videoId" field.
  String? _videoId;
  String get videoId => _videoId ?? '';
  set videoId(String? val) => _videoId = val;

  bool hasVideoId() => _videoId != null;

  static ResourceIdStruct fromMap(Map<String, dynamic> data) =>
      ResourceIdStruct(
        videoId: data['videoId'] as String?,
      );

  static ResourceIdStruct? maybeFromMap(dynamic data) => data is Map
      ? ResourceIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'videoId': _videoId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'videoId': serializeParam(
          _videoId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ResourceIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResourceIdStruct(
        videoId: deserializeParam(
          data['videoId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ResourceIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResourceIdStruct && videoId == other.videoId;
  }

  @override
  int get hashCode => const ListEquality().hash([videoId]);
}

ResourceIdStruct createResourceIdStruct({
  String? videoId,
}) =>
    ResourceIdStruct(
      videoId: videoId,
    );
