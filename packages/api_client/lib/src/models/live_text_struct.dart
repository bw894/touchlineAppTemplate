// ignore_for_file: unnecessary_getters_setters


import 'index.dart';

class LiveTextStruct extends BaseStruct {
  LiveTextStruct({
    int? currentAwayGoals,
    int? currentHomeGoals,
    String? description,
    String? imagePathUrl,
    String? mainImageUrl,
    String? minuteIndicator,
    bool? postToLiveTextFeed,
    bool? postToXFeed,
    BLESSfixtureStruct? relatedMatch,
    String? tweetTime,
    String? type,
    int? created,
    int? updated,
    String? objectId,
    String? heading,
  })  : _currentAwayGoals = currentAwayGoals,
        _currentHomeGoals = currentHomeGoals,
        _description = description,
        _imagePathUrl = imagePathUrl,
        _mainImageUrl = mainImageUrl,
        _minuteIndicator = minuteIndicator,
        _postToLiveTextFeed = postToLiveTextFeed,
        _postToXFeed = postToXFeed,
        _relatedMatch = relatedMatch,
        _tweetTime = tweetTime,
        _type = type,
        _created = created,
        _updated = updated,
        _objectId = objectId,
        _heading = heading;

  // "currentAwayGoals" field.
  int? _currentAwayGoals;
  int get currentAwayGoals => _currentAwayGoals ?? 0;
  set currentAwayGoals(int? val) => _currentAwayGoals = val;

  void incrementCurrentAwayGoals(int amount) =>
      currentAwayGoals = currentAwayGoals + amount;

  bool hasCurrentAwayGoals() => _currentAwayGoals != null;

  // "currentHomeGoals" field.
  int? _currentHomeGoals;
  int get currentHomeGoals => _currentHomeGoals ?? 0;
  set currentHomeGoals(int? val) => _currentHomeGoals = val;

  void incrementCurrentHomeGoals(int amount) =>
      currentHomeGoals = currentHomeGoals + amount;

  bool hasCurrentHomeGoals() => _currentHomeGoals != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "imagePathUrl" field.
  String? _imagePathUrl;
  String get imagePathUrl => _imagePathUrl ?? '';
  set imagePathUrl(String? val) => _imagePathUrl = val;

  bool hasImagePathUrl() => _imagePathUrl != null;

  // "mainImageUrl" field.
  String? _mainImageUrl;
  String get mainImageUrl => _mainImageUrl ?? '';
  set mainImageUrl(String? val) => _mainImageUrl = val;

  bool hasMainImageUrl() => _mainImageUrl != null;

  // "MinuteIndicator" field.
  String? _minuteIndicator;
  String get minuteIndicator => _minuteIndicator ?? '';
  set minuteIndicator(String? val) => _minuteIndicator = val;

  bool hasMinuteIndicator() => _minuteIndicator != null;

  // "postToLiveTextFeed" field.
  bool? _postToLiveTextFeed;
  bool get postToLiveTextFeed => _postToLiveTextFeed ?? false;
  set postToLiveTextFeed(bool? val) => _postToLiveTextFeed = val;

  bool hasPostToLiveTextFeed() => _postToLiveTextFeed != null;

  // "postToXFeed" field.
  bool? _postToXFeed;
  bool get postToXFeed => _postToXFeed ?? false;
  set postToXFeed(bool? val) => _postToXFeed = val;

  bool hasPostToXFeed() => _postToXFeed != null;

  // "relatedMatch" field.
  BLESSfixtureStruct? _relatedMatch;
  BLESSfixtureStruct get relatedMatch => _relatedMatch ?? BLESSfixtureStruct();
  set relatedMatch(BLESSfixtureStruct? val) => _relatedMatch = val;

  void updateRelatedMatch(Function(BLESSfixtureStruct) updateFn) {
    updateFn(_relatedMatch ??= BLESSfixtureStruct());
  }

  bool hasRelatedMatch() => _relatedMatch != null;

  // "tweetTime" field.
  String? _tweetTime;
  String get tweetTime => _tweetTime ?? '';
  set tweetTime(String? val) => _tweetTime = val;

  bool hasTweetTime() => _tweetTime != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

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

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "heading" field.
  String? _heading;
  String get heading => _heading ?? '';
  set heading(String? val) => _heading = val;

  bool hasHeading() => _heading != null;

  static LiveTextStruct fromMap(Map<String, dynamic> data) => LiveTextStruct(
        currentAwayGoals: castToType<int>(data['currentAwayGoals']),
        currentHomeGoals: castToType<int>(data['currentHomeGoals']),
        description: data['description'] as String?,
        imagePathUrl: data['imagePathUrl'] as String?,
        mainImageUrl: data['mainImageUrl'] as String?,
        minuteIndicator: data['MinuteIndicator'] as String?,
        postToLiveTextFeed: data['postToLiveTextFeed'] as bool?,
        postToXFeed: data['postToXFeed'] as bool?,
        relatedMatch: data['relatedMatch'] is BLESSfixtureStruct
            ? data['relatedMatch']
            : BLESSfixtureStruct.maybeFromMap(data['relatedMatch']),
        tweetTime: data['tweetTime'] as String?,
        type: data['type'] as String?,
        created: castToType<int>(data['created']),
        updated: castToType<int>(data['updated']),
        objectId: data['objectId'] as String?,
        heading: data['heading'] as String?,
      );

  static LiveTextStruct? maybeFromMap(dynamic data) =>
      data is Map ? LiveTextStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'currentAwayGoals': _currentAwayGoals,
        'currentHomeGoals': _currentHomeGoals,
        'description': _description,
        'imagePathUrl': _imagePathUrl,
        'mainImageUrl': _mainImageUrl,
        'MinuteIndicator': _minuteIndicator,
        'postToLiveTextFeed': _postToLiveTextFeed,
        'postToXFeed': _postToXFeed,
        'relatedMatch': _relatedMatch?.toMap(),
        'tweetTime': _tweetTime,
        'type': _type,
        'created': _created,
        'updated': _updated,
        'objectId': _objectId,
        'heading': _heading,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'currentAwayGoals': serializeParam(
          _currentAwayGoals,
          ParamType.int,
        ),
        'currentHomeGoals': serializeParam(
          _currentHomeGoals,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'imagePathUrl': serializeParam(
          _imagePathUrl,
          ParamType.String,
        ),
        'mainImageUrl': serializeParam(
          _mainImageUrl,
          ParamType.String,
        ),
        'MinuteIndicator': serializeParam(
          _minuteIndicator,
          ParamType.String,
        ),
        'postToLiveTextFeed': serializeParam(
          _postToLiveTextFeed,
          ParamType.bool,
        ),
        'postToXFeed': serializeParam(
          _postToXFeed,
          ParamType.bool,
        ),
        'relatedMatch': serializeParam(
          _relatedMatch,
          ParamType.DataStruct,
        ),
        'tweetTime': serializeParam(
          _tweetTime,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
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
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'heading': serializeParam(
          _heading,
          ParamType.String,
        ),
      }.withoutNulls;

  static LiveTextStruct fromSerializableMap(Map<String, dynamic> data) =>
      LiveTextStruct(
        currentAwayGoals: deserializeParam(
          data['currentAwayGoals'],
          ParamType.int,
          false,
        ),
        currentHomeGoals: deserializeParam(
          data['currentHomeGoals'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        imagePathUrl: deserializeParam(
          data['imagePathUrl'],
          ParamType.String,
          false,
        ),
        mainImageUrl: deserializeParam(
          data['mainImageUrl'],
          ParamType.String,
          false,
        ),
        minuteIndicator: deserializeParam(
          data['MinuteIndicator'],
          ParamType.String,
          false,
        ),
        postToLiveTextFeed: deserializeParam(
          data['postToLiveTextFeed'],
          ParamType.bool,
          false,
        ),
        postToXFeed: deserializeParam(
          data['postToXFeed'],
          ParamType.bool,
          false,
        ),
        relatedMatch: deserializeStructParam(
          data['relatedMatch'],
          ParamType.DataStruct,
          false,
          structBuilder: BLESSfixtureStruct.fromSerializableMap,
        ),
        tweetTime: deserializeParam(
          data['tweetTime'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
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
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        heading: deserializeParam(
          data['heading'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LiveTextStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LiveTextStruct &&
        currentAwayGoals == other.currentAwayGoals &&
        currentHomeGoals == other.currentHomeGoals &&
        description == other.description &&
        imagePathUrl == other.imagePathUrl &&
        mainImageUrl == other.mainImageUrl &&
        minuteIndicator == other.minuteIndicator &&
        postToLiveTextFeed == other.postToLiveTextFeed &&
        postToXFeed == other.postToXFeed &&
        relatedMatch == other.relatedMatch &&
        tweetTime == other.tweetTime &&
        type == other.type &&
        created == other.created &&
        updated == other.updated &&
        objectId == other.objectId &&
        heading == other.heading;
  }

  @override
  int get hashCode => const ListEquality().hash([
        currentAwayGoals,
        currentHomeGoals,
        description,
        imagePathUrl,
        mainImageUrl,
        minuteIndicator,
        postToLiveTextFeed,
        postToXFeed,
        relatedMatch,
        tweetTime,
        type,
        created,
        updated,
        objectId,
        heading
      ]);
}

LiveTextStruct createLiveTextStruct({
  int? currentAwayGoals,
  int? currentHomeGoals,
  String? description,
  String? imagePathUrl,
  String? mainImageUrl,
  String? minuteIndicator,
  bool? postToLiveTextFeed,
  bool? postToXFeed,
  BLESSfixtureStruct? relatedMatch,
  String? tweetTime,
  String? type,
  int? created,
  int? updated,
  String? objectId,
  String? heading,
}) =>
    LiveTextStruct(
      currentAwayGoals: currentAwayGoals,
      currentHomeGoals: currentHomeGoals,
      description: description,
      imagePathUrl: imagePathUrl,
      mainImageUrl: mainImageUrl,
      minuteIndicator: minuteIndicator,
      postToLiveTextFeed: postToLiveTextFeed,
      postToXFeed: postToXFeed,
      relatedMatch: relatedMatch ?? BLESSfixtureStruct(),
      tweetTime: tweetTime,
      type: type,
      created: created,
      updated: updated,
      objectId: objectId,
      heading: heading,
    );
