// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HivesOptionsStruct extends BaseStruct {
  HivesOptionsStruct({
    String? pushNotificationSender,
    String? websiteNewsFeedUrl,
    String? predictorGamePrize,
    double? programmePrice,
    String? commentaryLink,
    String? ticketingLink,
    String? socialMediaFeedUrl,
  })  : _pushNotificationSender = pushNotificationSender,
        _websiteNewsFeedUrl = websiteNewsFeedUrl,
        _predictorGamePrize = predictorGamePrize,
        _programmePrice = programmePrice,
        _commentaryLink = commentaryLink,
        _ticketingLink = ticketingLink,
        _socialMediaFeedUrl = socialMediaFeedUrl;

  // "pushNotificationSender" field.
  String? _pushNotificationSender;
  String get pushNotificationSender => _pushNotificationSender ?? '';
  set pushNotificationSender(String? val) => _pushNotificationSender = val;

  bool hasPushNotificationSender() => _pushNotificationSender != null;

  // "websiteNewsFeedUrl" field.
  String? _websiteNewsFeedUrl;
  String get websiteNewsFeedUrl => _websiteNewsFeedUrl ?? '';
  set websiteNewsFeedUrl(String? val) => _websiteNewsFeedUrl = val;

  bool hasWebsiteNewsFeedUrl() => _websiteNewsFeedUrl != null;

  // "predictorGamePrize" field.
  String? _predictorGamePrize;
  String get predictorGamePrize => _predictorGamePrize ?? '';
  set predictorGamePrize(String? val) => _predictorGamePrize = val;

  bool hasPredictorGamePrize() => _predictorGamePrize != null;

  // "programmePrice" field.
  double? _programmePrice;
  double get programmePrice => _programmePrice ?? 0.0;
  set programmePrice(double? val) => _programmePrice = val;

  void incrementProgrammePrice(double amount) =>
      programmePrice = programmePrice + amount;

  bool hasProgrammePrice() => _programmePrice != null;

  // "commentaryLink" field.
  String? _commentaryLink;
  String get commentaryLink => _commentaryLink ?? '';
  set commentaryLink(String? val) => _commentaryLink = val;

  bool hasCommentaryLink() => _commentaryLink != null;

  // "ticketingLink" field.
  String? _ticketingLink;
  String get ticketingLink => _ticketingLink ?? '';
  set ticketingLink(String? val) => _ticketingLink = val;

  bool hasTicketingLink() => _ticketingLink != null;

  // "socialMediaFeedUrl" field.
  String? _socialMediaFeedUrl;
  String get socialMediaFeedUrl => _socialMediaFeedUrl ?? '';
  set socialMediaFeedUrl(String? val) => _socialMediaFeedUrl = val;

  bool hasSocialMediaFeedUrl() => _socialMediaFeedUrl != null;

  static HivesOptionsStruct fromMap(Map<String, dynamic> data) =>
      HivesOptionsStruct(
        pushNotificationSender: data['pushNotificationSender'] as String?,
        websiteNewsFeedUrl: data['websiteNewsFeedUrl'] as String?,
        predictorGamePrize: data['predictorGamePrize'] as String?,
        programmePrice: castToType<double>(data['programmePrice']),
        commentaryLink: data['commentaryLink'] as String?,
        ticketingLink: data['ticketingLink'] as String?,
        socialMediaFeedUrl: data['socialMediaFeedUrl'] as String?,
      );

  static HivesOptionsStruct? maybeFromMap(dynamic data) => data is Map
      ? HivesOptionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'pushNotificationSender': _pushNotificationSender,
        'websiteNewsFeedUrl': _websiteNewsFeedUrl,
        'predictorGamePrize': _predictorGamePrize,
        'programmePrice': _programmePrice,
        'commentaryLink': _commentaryLink,
        'ticketingLink': _ticketingLink,
        'socialMediaFeedUrl': _socialMediaFeedUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pushNotificationSender': serializeParam(
          _pushNotificationSender,
          ParamType.String,
        ),
        'websiteNewsFeedUrl': serializeParam(
          _websiteNewsFeedUrl,
          ParamType.String,
        ),
        'predictorGamePrize': serializeParam(
          _predictorGamePrize,
          ParamType.String,
        ),
        'programmePrice': serializeParam(
          _programmePrice,
          ParamType.double,
        ),
        'commentaryLink': serializeParam(
          _commentaryLink,
          ParamType.String,
        ),
        'ticketingLink': serializeParam(
          _ticketingLink,
          ParamType.String,
        ),
        'socialMediaFeedUrl': serializeParam(
          _socialMediaFeedUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static HivesOptionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      HivesOptionsStruct(
        pushNotificationSender: deserializeParam(
          data['pushNotificationSender'],
          ParamType.String,
          false,
        ),
        websiteNewsFeedUrl: deserializeParam(
          data['websiteNewsFeedUrl'],
          ParamType.String,
          false,
        ),
        predictorGamePrize: deserializeParam(
          data['predictorGamePrize'],
          ParamType.String,
          false,
        ),
        programmePrice: deserializeParam(
          data['programmePrice'],
          ParamType.double,
          false,
        ),
        commentaryLink: deserializeParam(
          data['commentaryLink'],
          ParamType.String,
          false,
        ),
        ticketingLink: deserializeParam(
          data['ticketingLink'],
          ParamType.String,
          false,
        ),
        socialMediaFeedUrl: deserializeParam(
          data['socialMediaFeedUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HivesOptionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HivesOptionsStruct &&
        pushNotificationSender == other.pushNotificationSender &&
        websiteNewsFeedUrl == other.websiteNewsFeedUrl &&
        predictorGamePrize == other.predictorGamePrize &&
        programmePrice == other.programmePrice &&
        commentaryLink == other.commentaryLink &&
        ticketingLink == other.ticketingLink &&
        socialMediaFeedUrl == other.socialMediaFeedUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        pushNotificationSender,
        websiteNewsFeedUrl,
        predictorGamePrize,
        programmePrice,
        commentaryLink,
        ticketingLink,
        socialMediaFeedUrl
      ]);
}

HivesOptionsStruct createHivesOptionsStruct({
  String? pushNotificationSender,
  String? websiteNewsFeedUrl,
  String? predictorGamePrize,
  double? programmePrice,
  String? commentaryLink,
  String? ticketingLink,
  String? socialMediaFeedUrl,
}) =>
    HivesOptionsStruct(
      pushNotificationSender: pushNotificationSender,
      websiteNewsFeedUrl: websiteNewsFeedUrl,
      predictorGamePrize: predictorGamePrize,
      programmePrice: programmePrice,
      commentaryLink: commentaryLink,
      ticketingLink: ticketingLink,
      socialMediaFeedUrl: socialMediaFeedUrl,
    );
