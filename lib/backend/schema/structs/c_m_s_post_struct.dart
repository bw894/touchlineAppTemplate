// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CMSPostStruct extends BaseStruct {
  CMSPostStruct({
    bool? enableComments,
    int? created,
    int? viewsNumber,
    String? shortBody,
    String? type,
    String? title,
    String? ownerId,
    int? commentsNumber,
    int? likesNumber,
    bool? displayInteractionStats,
    String? fullBody,
    String? objectId,
    String? imageUrl,
    String? videoUrl,
    List<String>? categories,
    List<String>? tags,
    int? postDateOverride,
    int? outputPostDate,
    String? authorName,
  })  : _enableComments = enableComments,
        _created = created,
        _viewsNumber = viewsNumber,
        _shortBody = shortBody,
        _type = type,
        _title = title,
        _ownerId = ownerId,
        _commentsNumber = commentsNumber,
        _likesNumber = likesNumber,
        _displayInteractionStats = displayInteractionStats,
        _fullBody = fullBody,
        _objectId = objectId,
        _imageUrl = imageUrl,
        _videoUrl = videoUrl,
        _categories = categories,
        _tags = tags,
        _postDateOverride = postDateOverride,
        _outputPostDate = outputPostDate,
        _authorName = authorName;

  // "enableComments" field.
  bool? _enableComments;
  bool get enableComments => _enableComments ?? false;
  set enableComments(bool? val) => _enableComments = val;

  bool hasEnableComments() => _enableComments != null;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  // "viewsNumber" field.
  int? _viewsNumber;
  int get viewsNumber => _viewsNumber ?? 0;
  set viewsNumber(int? val) => _viewsNumber = val;

  void incrementViewsNumber(int amount) => viewsNumber = viewsNumber + amount;

  bool hasViewsNumber() => _viewsNumber != null;

  // "shortBody" field.
  String? _shortBody;
  String get shortBody => _shortBody ?? '';
  set shortBody(String? val) => _shortBody = val;

  bool hasShortBody() => _shortBody != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "commentsNumber" field.
  int? _commentsNumber;
  int get commentsNumber => _commentsNumber ?? 0;
  set commentsNumber(int? val) => _commentsNumber = val;

  void incrementCommentsNumber(int amount) =>
      commentsNumber = commentsNumber + amount;

  bool hasCommentsNumber() => _commentsNumber != null;

  // "likesNumber" field.
  int? _likesNumber;
  int get likesNumber => _likesNumber ?? 0;
  set likesNumber(int? val) => _likesNumber = val;

  void incrementLikesNumber(int amount) => likesNumber = likesNumber + amount;

  bool hasLikesNumber() => _likesNumber != null;

  // "displayInteractionStats" field.
  bool? _displayInteractionStats;
  bool get displayInteractionStats => _displayInteractionStats ?? false;
  set displayInteractionStats(bool? val) => _displayInteractionStats = val;

  bool hasDisplayInteractionStats() => _displayInteractionStats != null;

  // "fullBody" field.
  String? _fullBody;
  String get fullBody => _fullBody ?? '';
  set fullBody(String? val) => _fullBody = val;

  bool hasFullBody() => _fullBody != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  set videoUrl(String? val) => _videoUrl = val;

  bool hasVideoUrl() => _videoUrl != null;

  // "categories" field.
  List<String>? _categories;
  List<String> get categories => _categories ?? const [];
  set categories(List<String>? val) => _categories = val;

  void updateCategories(Function(List<String>) updateFn) {
    updateFn(_categories ??= []);
  }

  bool hasCategories() => _categories != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  set tags(List<String>? val) => _tags = val;

  void updateTags(Function(List<String>) updateFn) {
    updateFn(_tags ??= []);
  }

  bool hasTags() => _tags != null;

  // "postDateOverride" field.
  int? _postDateOverride;
  int get postDateOverride => _postDateOverride ?? 0;
  set postDateOverride(int? val) => _postDateOverride = val;

  void incrementPostDateOverride(int amount) =>
      postDateOverride = postDateOverride + amount;

  bool hasPostDateOverride() => _postDateOverride != null;

  // "outputPostDate" field.
  int? _outputPostDate;
  int get outputPostDate => _outputPostDate ?? 0;
  set outputPostDate(int? val) => _outputPostDate = val;

  void incrementOutputPostDate(int amount) =>
      outputPostDate = outputPostDate + amount;

  bool hasOutputPostDate() => _outputPostDate != null;

  // "authorName" field.
  String? _authorName;
  String get authorName => _authorName ?? '';
  set authorName(String? val) => _authorName = val;

  bool hasAuthorName() => _authorName != null;

  static CMSPostStruct fromMap(Map<String, dynamic> data) => CMSPostStruct(
        enableComments: data['enableComments'] as bool?,
        created: castToType<int>(data['created']),
        viewsNumber: castToType<int>(data['viewsNumber']),
        shortBody: data['shortBody'] as String?,
        type: data['type'] as String?,
        title: data['title'] as String?,
        ownerId: data['ownerId'] as String?,
        commentsNumber: castToType<int>(data['commentsNumber']),
        likesNumber: castToType<int>(data['likesNumber']),
        displayInteractionStats: data['displayInteractionStats'] as bool?,
        fullBody: data['fullBody'] as String?,
        objectId: data['objectId'] as String?,
        imageUrl: data['imageUrl'] as String?,
        videoUrl: data['videoUrl'] as String?,
        categories: getDataList(data['categories']),
        tags: getDataList(data['tags']),
        postDateOverride: castToType<int>(data['postDateOverride']),
        outputPostDate: castToType<int>(data['outputPostDate']),
        authorName: data['authorName'] as String?,
      );

  static CMSPostStruct? maybeFromMap(dynamic data) =>
      data is Map ? CMSPostStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'enableComments': _enableComments,
        'created': _created,
        'viewsNumber': _viewsNumber,
        'shortBody': _shortBody,
        'type': _type,
        'title': _title,
        'ownerId': _ownerId,
        'commentsNumber': _commentsNumber,
        'likesNumber': _likesNumber,
        'displayInteractionStats': _displayInteractionStats,
        'fullBody': _fullBody,
        'objectId': _objectId,
        'imageUrl': _imageUrl,
        'videoUrl': _videoUrl,
        'categories': _categories,
        'tags': _tags,
        'postDateOverride': _postDateOverride,
        'outputPostDate': _outputPostDate,
        'authorName': _authorName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'enableComments': serializeParam(
          _enableComments,
          ParamType.bool,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'viewsNumber': serializeParam(
          _viewsNumber,
          ParamType.int,
        ),
        'shortBody': serializeParam(
          _shortBody,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'commentsNumber': serializeParam(
          _commentsNumber,
          ParamType.int,
        ),
        'likesNumber': serializeParam(
          _likesNumber,
          ParamType.int,
        ),
        'displayInteractionStats': serializeParam(
          _displayInteractionStats,
          ParamType.bool,
        ),
        'fullBody': serializeParam(
          _fullBody,
          ParamType.String,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'imageUrl': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'videoUrl': serializeParam(
          _videoUrl,
          ParamType.String,
        ),
        'categories': serializeParam(
          _categories,
          ParamType.String,
          isList: true,
        ),
        'tags': serializeParam(
          _tags,
          ParamType.String,
          isList: true,
        ),
        'postDateOverride': serializeParam(
          _postDateOverride,
          ParamType.int,
        ),
        'outputPostDate': serializeParam(
          _outputPostDate,
          ParamType.int,
        ),
        'authorName': serializeParam(
          _authorName,
          ParamType.String,
        ),
      }.withoutNulls;

  static CMSPostStruct fromSerializableMap(Map<String, dynamic> data) =>
      CMSPostStruct(
        enableComments: deserializeParam(
          data['enableComments'],
          ParamType.bool,
          false,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
        viewsNumber: deserializeParam(
          data['viewsNumber'],
          ParamType.int,
          false,
        ),
        shortBody: deserializeParam(
          data['shortBody'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['ownerId'],
          ParamType.String,
          false,
        ),
        commentsNumber: deserializeParam(
          data['commentsNumber'],
          ParamType.int,
          false,
        ),
        likesNumber: deserializeParam(
          data['likesNumber'],
          ParamType.int,
          false,
        ),
        displayInteractionStats: deserializeParam(
          data['displayInteractionStats'],
          ParamType.bool,
          false,
        ),
        fullBody: deserializeParam(
          data['fullBody'],
          ParamType.String,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
        videoUrl: deserializeParam(
          data['videoUrl'],
          ParamType.String,
          false,
        ),
        categories: deserializeParam<String>(
          data['categories'],
          ParamType.String,
          true,
        ),
        tags: deserializeParam<String>(
          data['tags'],
          ParamType.String,
          true,
        ),
        postDateOverride: deserializeParam(
          data['postDateOverride'],
          ParamType.int,
          false,
        ),
        outputPostDate: deserializeParam(
          data['outputPostDate'],
          ParamType.int,
          false,
        ),
        authorName: deserializeParam(
          data['authorName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CMSPostStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CMSPostStruct &&
        enableComments == other.enableComments &&
        created == other.created &&
        viewsNumber == other.viewsNumber &&
        shortBody == other.shortBody &&
        type == other.type &&
        title == other.title &&
        ownerId == other.ownerId &&
        commentsNumber == other.commentsNumber &&
        likesNumber == other.likesNumber &&
        displayInteractionStats == other.displayInteractionStats &&
        fullBody == other.fullBody &&
        objectId == other.objectId &&
        imageUrl == other.imageUrl &&
        videoUrl == other.videoUrl &&
        listEquality.equals(categories, other.categories) &&
        listEquality.equals(tags, other.tags) &&
        postDateOverride == other.postDateOverride &&
        outputPostDate == other.outputPostDate &&
        authorName == other.authorName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        enableComments,
        created,
        viewsNumber,
        shortBody,
        type,
        title,
        ownerId,
        commentsNumber,
        likesNumber,
        displayInteractionStats,
        fullBody,
        objectId,
        imageUrl,
        videoUrl,
        categories,
        tags,
        postDateOverride,
        outputPostDate,
        authorName
      ]);
}

CMSPostStruct createCMSPostStruct({
  bool? enableComments,
  int? created,
  int? viewsNumber,
  String? shortBody,
  String? type,
  String? title,
  String? ownerId,
  int? commentsNumber,
  int? likesNumber,
  bool? displayInteractionStats,
  String? fullBody,
  String? objectId,
  String? imageUrl,
  String? videoUrl,
  int? postDateOverride,
  int? outputPostDate,
  String? authorName,
}) =>
    CMSPostStruct(
      enableComments: enableComments,
      created: created,
      viewsNumber: viewsNumber,
      shortBody: shortBody,
      type: type,
      title: title,
      ownerId: ownerId,
      commentsNumber: commentsNumber,
      likesNumber: likesNumber,
      displayInteractionStats: displayInteractionStats,
      fullBody: fullBody,
      objectId: objectId,
      imageUrl: imageUrl,
      videoUrl: videoUrl,
      postDateOverride: postDateOverride,
      outputPostDate: outputPostDate,
      authorName: authorName,
    );
