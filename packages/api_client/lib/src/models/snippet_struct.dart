// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class SnippetStruct extends BaseStruct {
  SnippetStruct({
    String? title,
    String? description,
    ThumbnailsStruct? thumbnails,
    ResourceIdStruct? resourceId,
    String? publishedAt,
  })  : _title = title,
        _description = description,
        _thumbnails = thumbnails,
        _resourceId = resourceId,
        _publishedAt = publishedAt;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "thumbnails" field.
  ThumbnailsStruct? _thumbnails;
  ThumbnailsStruct get thumbnails => _thumbnails ?? ThumbnailsStruct();
  set thumbnails(ThumbnailsStruct? val) => _thumbnails = val;

  void updateThumbnails(Function(ThumbnailsStruct) updateFn) {
    updateFn(_thumbnails ??= ThumbnailsStruct());
  }

  bool hasThumbnails() => _thumbnails != null;

  // "resourceId" field.
  ResourceIdStruct? _resourceId;
  ResourceIdStruct get resourceId => _resourceId ?? ResourceIdStruct();
  set resourceId(ResourceIdStruct? val) => _resourceId = val;

  void updateResourceId(Function(ResourceIdStruct) updateFn) {
    updateFn(_resourceId ??= ResourceIdStruct());
  }

  bool hasResourceId() => _resourceId != null;

  // "publishedAt" field.
  String? _publishedAt;
  String get publishedAt => _publishedAt ?? '';
  set publishedAt(String? val) => _publishedAt = val;

  bool hasPublishedAt() => _publishedAt != null;

  static SnippetStruct fromMap(Map<String, dynamic> data) => SnippetStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        thumbnails: data['thumbnails'] is ThumbnailsStruct
            ? data['thumbnails']
            : ThumbnailsStruct.maybeFromMap(data['thumbnails']),
        resourceId: data['resourceId'] is ResourceIdStruct
            ? data['resourceId']
            : ResourceIdStruct.maybeFromMap(data['resourceId']),
        publishedAt: data['publishedAt'] as String?,
      );

  static SnippetStruct? maybeFromMap(dynamic data) =>
      data is Map ? SnippetStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'thumbnails': _thumbnails?.toMap(),
        'resourceId': _resourceId?.toMap(),
        'publishedAt': _publishedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'thumbnails': serializeParam(
          _thumbnails,
          ParamType.DataStruct,
        ),
        'resourceId': serializeParam(
          _resourceId,
          ParamType.DataStruct,
        ),
        'publishedAt': serializeParam(
          _publishedAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static SnippetStruct fromSerializableMap(Map<String, dynamic> data) =>
      SnippetStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        thumbnails: deserializeStructParam(
          data['thumbnails'],
          ParamType.DataStruct,
          false,
          structBuilder: ThumbnailsStruct.fromSerializableMap,
        ),
        resourceId: deserializeStructParam(
          data['resourceId'],
          ParamType.DataStruct,
          false,
          structBuilder: ResourceIdStruct.fromSerializableMap,
        ),
        publishedAt: deserializeParam(
          data['publishedAt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SnippetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SnippetStruct &&
        title == other.title &&
        description == other.description &&
        thumbnails == other.thumbnails &&
        resourceId == other.resourceId &&
        publishedAt == other.publishedAt;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, description, thumbnails, resourceId, publishedAt]);
}

SnippetStruct createSnippetStruct({
  String? title,
  String? description,
  ThumbnailsStruct? thumbnails,
  ResourceIdStruct? resourceId,
  String? publishedAt,
}) =>
    SnippetStruct(
      title: title,
      description: description,
      thumbnails: thumbnails ?? ThumbnailsStruct(),
      resourceId: resourceId ?? ResourceIdStruct(),
      publishedAt: publishedAt,
    );
