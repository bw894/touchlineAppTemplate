// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class ShopReviewsStruct extends BaseStruct {
  ShopReviewsStruct({
    UserStruct? author,
    String? comment,
    int? stars,
    String? objectId,
    int? created,
    int? updated,
    String? ownerId,
  })  : _author = author,
        _comment = comment,
        _stars = stars,
        _objectId = objectId,
        _created = created,
        _updated = updated,
        _ownerId = ownerId;

  // "author" field.
  UserStruct? _author;
  UserStruct get author => _author ?? UserStruct();
  set author(UserStruct? val) => _author = val;

  void updateAuthor(Function(UserStruct) updateFn) {
    updateFn(_author ??= UserStruct());
  }

  bool hasAuthor() => _author != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  set comment(String? val) => _comment = val;

  bool hasComment() => _comment != null;

  // "stars" field.
  int? _stars;
  int get stars => _stars ?? 0;
  set stars(int? val) => _stars = val;

  void incrementStars(int amount) => stars = stars + amount;

  bool hasStars() => _stars != null;

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

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  static ShopReviewsStruct fromMap(Map<String, dynamic> data) =>
      ShopReviewsStruct(
        author: data['author'] is UserStruct
            ? data['author']
            : UserStruct.maybeFromMap(data['author']),
        comment: data['comment'] as String?,
        stars: castToType<int>(data['stars']),
        objectId: data['objectId'] as String?,
        created: castToType<int>(data['created']),
        updated: castToType<int>(data['updated']),
        ownerId: data['ownerId'] as String?,
      );

  static ShopReviewsStruct? maybeFromMap(dynamic data) => data is Map
      ? ShopReviewsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'author': _author?.toMap(),
        'comment': _comment,
        'stars': _stars,
        'objectId': _objectId,
        'created': _created,
        'updated': _updated,
        'ownerId': _ownerId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'author': serializeParam(
          _author,
          ParamType.DataStruct,
        ),
        'comment': serializeParam(
          _comment,
          ParamType.String,
        ),
        'stars': serializeParam(
          _stars,
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
        'updated': serializeParam(
          _updated,
          ParamType.int,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ShopReviewsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ShopReviewsStruct(
        author: deserializeStructParam(
          data['author'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
        comment: deserializeParam(
          data['comment'],
          ParamType.String,
          false,
        ),
        stars: deserializeParam(
          data['stars'],
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
        updated: deserializeParam(
          data['updated'],
          ParamType.int,
          false,
        ),
        ownerId: deserializeParam(
          data['ownerId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ShopReviewsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ShopReviewsStruct &&
        author == other.author &&
        comment == other.comment &&
        stars == other.stars &&
        objectId == other.objectId &&
        created == other.created &&
        updated == other.updated &&
        ownerId == other.ownerId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([author, comment, stars, objectId, created, updated, ownerId]);
}

ShopReviewsStruct createShopReviewsStruct({
  UserStruct? author,
  String? comment,
  int? stars,
  String? objectId,
  int? created,
  int? updated,
  String? ownerId,
}) =>
    ShopReviewsStruct(
      author: author ?? UserStruct(),
      comment: comment,
      stars: stars,
      objectId: objectId,
      created: created,
      updated: updated,
      ownerId: ownerId,
    );
