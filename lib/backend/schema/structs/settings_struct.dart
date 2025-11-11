// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsStruct extends BaseStruct {
  SettingsStruct({
    String? socialMediaFeedLink,
    bool? liveScoresOnOff,
    String? websiteNewsFeedLink,
    bool? sponsorAdsOnOff,
    bool? scorersOnOff,
    String? ownerId,
    bool? clubShopOnOff,
    String? videoFeedPlaylistId,
    String? ticketsProviderName,
    bool? predictorGameOnOff,
    String? ticketsLink,
    bool? videoFeedOnOff,
    bool? socialPostingOnOff,
    String? commentaryLink,
    String? clubShopWPSecret,
    bool? websiteNewsFeedOnOff,
    bool? squadHubOnOff,
    bool? matchLineupsOnOff,
    bool? socialMediaFeedOnOff,
    bool? fixturesOnOff,
    String? objectId,
    bool? automatedStats,
    bool? matchStatsOnOff,
    int? created,
    bool? ticketsOnOff,
    String? pushNotificationsSenderUrl,
    String? videoFeedKey,
    bool? matchGalleryOnOff,
    bool? pushNotificationsOnOff,
    bool? digitalMatchProgrammesOnOff,
    bool? crmOnOff,
    String? clubShopWPKey,
    bool? leagueTableOnOff,
    String? predictorGamePrizeText,
    int? updated,
    bool? ticketsInApp,
    bool? commentary,
    double? digitalMatchProgrammesPrice,
  })  : _socialMediaFeedLink = socialMediaFeedLink,
        _liveScoresOnOff = liveScoresOnOff,
        _websiteNewsFeedLink = websiteNewsFeedLink,
        _sponsorAdsOnOff = sponsorAdsOnOff,
        _scorersOnOff = scorersOnOff,
        _ownerId = ownerId,
        _clubShopOnOff = clubShopOnOff,
        _videoFeedPlaylistId = videoFeedPlaylistId,
        _ticketsProviderName = ticketsProviderName,
        _predictorGameOnOff = predictorGameOnOff,
        _ticketsLink = ticketsLink,
        _videoFeedOnOff = videoFeedOnOff,
        _socialPostingOnOff = socialPostingOnOff,
        _commentaryLink = commentaryLink,
        _clubShopWPSecret = clubShopWPSecret,
        _websiteNewsFeedOnOff = websiteNewsFeedOnOff,
        _squadHubOnOff = squadHubOnOff,
        _matchLineupsOnOff = matchLineupsOnOff,
        _socialMediaFeedOnOff = socialMediaFeedOnOff,
        _fixturesOnOff = fixturesOnOff,
        _objectId = objectId,
        _automatedStats = automatedStats,
        _matchStatsOnOff = matchStatsOnOff,
        _created = created,
        _ticketsOnOff = ticketsOnOff,
        _pushNotificationsSenderUrl = pushNotificationsSenderUrl,
        _videoFeedKey = videoFeedKey,
        _matchGalleryOnOff = matchGalleryOnOff,
        _pushNotificationsOnOff = pushNotificationsOnOff,
        _digitalMatchProgrammesOnOff = digitalMatchProgrammesOnOff,
        _crmOnOff = crmOnOff,
        _clubShopWPKey = clubShopWPKey,
        _leagueTableOnOff = leagueTableOnOff,
        _predictorGamePrizeText = predictorGamePrizeText,
        _updated = updated,
        _ticketsInApp = ticketsInApp,
        _commentary = commentary,
        _digitalMatchProgrammesPrice = digitalMatchProgrammesPrice;

  // "socialMediaFeedLink" field.
  String? _socialMediaFeedLink;
  String get socialMediaFeedLink => _socialMediaFeedLink ?? '';
  set socialMediaFeedLink(String? val) => _socialMediaFeedLink = val;

  bool hasSocialMediaFeedLink() => _socialMediaFeedLink != null;

  // "liveScoresOnOff" field.
  bool? _liveScoresOnOff;
  bool get liveScoresOnOff => _liveScoresOnOff ?? false;
  set liveScoresOnOff(bool? val) => _liveScoresOnOff = val;

  bool hasLiveScoresOnOff() => _liveScoresOnOff != null;

  // "websiteNewsFeedLink" field.
  String? _websiteNewsFeedLink;
  String get websiteNewsFeedLink => _websiteNewsFeedLink ?? '';
  set websiteNewsFeedLink(String? val) => _websiteNewsFeedLink = val;

  bool hasWebsiteNewsFeedLink() => _websiteNewsFeedLink != null;

  // "sponsorAdsOnOff" field.
  bool? _sponsorAdsOnOff;
  bool get sponsorAdsOnOff => _sponsorAdsOnOff ?? false;
  set sponsorAdsOnOff(bool? val) => _sponsorAdsOnOff = val;

  bool hasSponsorAdsOnOff() => _sponsorAdsOnOff != null;

  // "scorersOnOff" field.
  bool? _scorersOnOff;
  bool get scorersOnOff => _scorersOnOff ?? false;
  set scorersOnOff(bool? val) => _scorersOnOff = val;

  bool hasScorersOnOff() => _scorersOnOff != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "clubShopOnOff" field.
  bool? _clubShopOnOff;
  bool get clubShopOnOff => _clubShopOnOff ?? false;
  set clubShopOnOff(bool? val) => _clubShopOnOff = val;

  bool hasClubShopOnOff() => _clubShopOnOff != null;

  // "videoFeedPlaylistId" field.
  String? _videoFeedPlaylistId;
  String get videoFeedPlaylistId => _videoFeedPlaylistId ?? '';
  set videoFeedPlaylistId(String? val) => _videoFeedPlaylistId = val;

  bool hasVideoFeedPlaylistId() => _videoFeedPlaylistId != null;

  // "ticketsProviderName" field.
  String? _ticketsProviderName;
  String get ticketsProviderName => _ticketsProviderName ?? '';
  set ticketsProviderName(String? val) => _ticketsProviderName = val;

  bool hasTicketsProviderName() => _ticketsProviderName != null;

  // "predictorGameOnOff" field.
  bool? _predictorGameOnOff;
  bool get predictorGameOnOff => _predictorGameOnOff ?? false;
  set predictorGameOnOff(bool? val) => _predictorGameOnOff = val;

  bool hasPredictorGameOnOff() => _predictorGameOnOff != null;

  // "ticketsLink" field.
  String? _ticketsLink;
  String get ticketsLink => _ticketsLink ?? '';
  set ticketsLink(String? val) => _ticketsLink = val;

  bool hasTicketsLink() => _ticketsLink != null;

  // "videoFeedOnOff" field.
  bool? _videoFeedOnOff;
  bool get videoFeedOnOff => _videoFeedOnOff ?? false;
  set videoFeedOnOff(bool? val) => _videoFeedOnOff = val;

  bool hasVideoFeedOnOff() => _videoFeedOnOff != null;

  // "socialPostingOnOff" field.
  bool? _socialPostingOnOff;
  bool get socialPostingOnOff => _socialPostingOnOff ?? false;
  set socialPostingOnOff(bool? val) => _socialPostingOnOff = val;

  bool hasSocialPostingOnOff() => _socialPostingOnOff != null;

  // "commentaryLink" field.
  String? _commentaryLink;
  String get commentaryLink => _commentaryLink ?? '';
  set commentaryLink(String? val) => _commentaryLink = val;

  bool hasCommentaryLink() => _commentaryLink != null;

  // "clubShopWPSecret" field.
  String? _clubShopWPSecret;
  String get clubShopWPSecret => _clubShopWPSecret ?? '';
  set clubShopWPSecret(String? val) => _clubShopWPSecret = val;

  bool hasClubShopWPSecret() => _clubShopWPSecret != null;

  // "websiteNewsFeedOnOff" field.
  bool? _websiteNewsFeedOnOff;
  bool get websiteNewsFeedOnOff => _websiteNewsFeedOnOff ?? false;
  set websiteNewsFeedOnOff(bool? val) => _websiteNewsFeedOnOff = val;

  bool hasWebsiteNewsFeedOnOff() => _websiteNewsFeedOnOff != null;

  // "squadHubOnOff" field.
  bool? _squadHubOnOff;
  bool get squadHubOnOff => _squadHubOnOff ?? false;
  set squadHubOnOff(bool? val) => _squadHubOnOff = val;

  bool hasSquadHubOnOff() => _squadHubOnOff != null;

  // "matchLineupsOnOff" field.
  bool? _matchLineupsOnOff;
  bool get matchLineupsOnOff => _matchLineupsOnOff ?? false;
  set matchLineupsOnOff(bool? val) => _matchLineupsOnOff = val;

  bool hasMatchLineupsOnOff() => _matchLineupsOnOff != null;

  // "socialMediaFeedOnOff" field.
  bool? _socialMediaFeedOnOff;
  bool get socialMediaFeedOnOff => _socialMediaFeedOnOff ?? false;
  set socialMediaFeedOnOff(bool? val) => _socialMediaFeedOnOff = val;

  bool hasSocialMediaFeedOnOff() => _socialMediaFeedOnOff != null;

  // "fixturesOnOff" field.
  bool? _fixturesOnOff;
  bool get fixturesOnOff => _fixturesOnOff ?? false;
  set fixturesOnOff(bool? val) => _fixturesOnOff = val;

  bool hasFixturesOnOff() => _fixturesOnOff != null;

  // "objectId" field.
  String? _objectId;
  String get objectId => _objectId ?? '';
  set objectId(String? val) => _objectId = val;

  bool hasObjectId() => _objectId != null;

  // "automatedStats" field.
  bool? _automatedStats;
  bool get automatedStats => _automatedStats ?? false;
  set automatedStats(bool? val) => _automatedStats = val;

  bool hasAutomatedStats() => _automatedStats != null;

  // "matchStatsOnOff" field.
  bool? _matchStatsOnOff;
  bool get matchStatsOnOff => _matchStatsOnOff ?? false;
  set matchStatsOnOff(bool? val) => _matchStatsOnOff = val;

  bool hasMatchStatsOnOff() => _matchStatsOnOff != null;

  // "created" field.
  int? _created;
  int get created => _created ?? 0;
  set created(int? val) => _created = val;

  void incrementCreated(int amount) => created = created + amount;

  bool hasCreated() => _created != null;

  // "ticketsOnOff" field.
  bool? _ticketsOnOff;
  bool get ticketsOnOff => _ticketsOnOff ?? false;
  set ticketsOnOff(bool? val) => _ticketsOnOff = val;

  bool hasTicketsOnOff() => _ticketsOnOff != null;

  // "pushNotificationsSenderUrl" field.
  String? _pushNotificationsSenderUrl;
  String get pushNotificationsSenderUrl => _pushNotificationsSenderUrl ?? '';
  set pushNotificationsSenderUrl(String? val) =>
      _pushNotificationsSenderUrl = val;

  bool hasPushNotificationsSenderUrl() => _pushNotificationsSenderUrl != null;

  // "videoFeedKey" field.
  String? _videoFeedKey;
  String get videoFeedKey => _videoFeedKey ?? '';
  set videoFeedKey(String? val) => _videoFeedKey = val;

  bool hasVideoFeedKey() => _videoFeedKey != null;

  // "matchGalleryOnOff" field.
  bool? _matchGalleryOnOff;
  bool get matchGalleryOnOff => _matchGalleryOnOff ?? false;
  set matchGalleryOnOff(bool? val) => _matchGalleryOnOff = val;

  bool hasMatchGalleryOnOff() => _matchGalleryOnOff != null;

  // "pushNotificationsOnOff" field.
  bool? _pushNotificationsOnOff;
  bool get pushNotificationsOnOff => _pushNotificationsOnOff ?? false;
  set pushNotificationsOnOff(bool? val) => _pushNotificationsOnOff = val;

  bool hasPushNotificationsOnOff() => _pushNotificationsOnOff != null;

  // "digitalMatchProgrammesOnOff" field.
  bool? _digitalMatchProgrammesOnOff;
  bool get digitalMatchProgrammesOnOff => _digitalMatchProgrammesOnOff ?? false;
  set digitalMatchProgrammesOnOff(bool? val) =>
      _digitalMatchProgrammesOnOff = val;

  bool hasDigitalMatchProgrammesOnOff() => _digitalMatchProgrammesOnOff != null;

  // "crmOnOff" field.
  bool? _crmOnOff;
  bool get crmOnOff => _crmOnOff ?? false;
  set crmOnOff(bool? val) => _crmOnOff = val;

  bool hasCrmOnOff() => _crmOnOff != null;

  // "clubShopWPKey" field.
  String? _clubShopWPKey;
  String get clubShopWPKey => _clubShopWPKey ?? '';
  set clubShopWPKey(String? val) => _clubShopWPKey = val;

  bool hasClubShopWPKey() => _clubShopWPKey != null;

  // "leagueTableOnOff" field.
  bool? _leagueTableOnOff;
  bool get leagueTableOnOff => _leagueTableOnOff ?? false;
  set leagueTableOnOff(bool? val) => _leagueTableOnOff = val;

  bool hasLeagueTableOnOff() => _leagueTableOnOff != null;

  // "predictorGamePrizeText" field.
  String? _predictorGamePrizeText;
  String get predictorGamePrizeText => _predictorGamePrizeText ?? '';
  set predictorGamePrizeText(String? val) => _predictorGamePrizeText = val;

  bool hasPredictorGamePrizeText() => _predictorGamePrizeText != null;

  // "updated" field.
  int? _updated;
  int get updated => _updated ?? 0;
  set updated(int? val) => _updated = val;

  void incrementUpdated(int amount) => updated = updated + amount;

  bool hasUpdated() => _updated != null;

  // "ticketsInApp" field.
  bool? _ticketsInApp;
  bool get ticketsInApp => _ticketsInApp ?? false;
  set ticketsInApp(bool? val) => _ticketsInApp = val;

  bool hasTicketsInApp() => _ticketsInApp != null;

  // "commentary" field.
  bool? _commentary;
  bool get commentary => _commentary ?? false;
  set commentary(bool? val) => _commentary = val;

  bool hasCommentary() => _commentary != null;

  // "digitalMatchProgrammesPrice" field.
  double? _digitalMatchProgrammesPrice;
  double get digitalMatchProgrammesPrice => _digitalMatchProgrammesPrice ?? 0.0;
  set digitalMatchProgrammesPrice(double? val) =>
      _digitalMatchProgrammesPrice = val;

  void incrementDigitalMatchProgrammesPrice(double amount) =>
      digitalMatchProgrammesPrice = digitalMatchProgrammesPrice + amount;

  bool hasDigitalMatchProgrammesPrice() => _digitalMatchProgrammesPrice != null;

  static SettingsStruct fromMap(Map<String, dynamic> data) => SettingsStruct(
        socialMediaFeedLink: data['socialMediaFeedLink'] as String?,
        liveScoresOnOff: data['liveScoresOnOff'] as bool?,
        websiteNewsFeedLink: data['websiteNewsFeedLink'] as String?,
        sponsorAdsOnOff: data['sponsorAdsOnOff'] as bool?,
        scorersOnOff: data['scorersOnOff'] as bool?,
        ownerId: data['ownerId'] as String?,
        clubShopOnOff: data['clubShopOnOff'] as bool?,
        videoFeedPlaylistId: data['videoFeedPlaylistId'] as String?,
        ticketsProviderName: data['ticketsProviderName'] as String?,
        predictorGameOnOff: data['predictorGameOnOff'] as bool?,
        ticketsLink: data['ticketsLink'] as String?,
        videoFeedOnOff: data['videoFeedOnOff'] as bool?,
        socialPostingOnOff: data['socialPostingOnOff'] as bool?,
        commentaryLink: data['commentaryLink'] as String?,
        clubShopWPSecret: data['clubShopWPSecret'] as String?,
        websiteNewsFeedOnOff: data['websiteNewsFeedOnOff'] as bool?,
        squadHubOnOff: data['squadHubOnOff'] as bool?,
        matchLineupsOnOff: data['matchLineupsOnOff'] as bool?,
        socialMediaFeedOnOff: data['socialMediaFeedOnOff'] as bool?,
        fixturesOnOff: data['fixturesOnOff'] as bool?,
        objectId: data['objectId'] as String?,
        automatedStats: data['automatedStats'] as bool?,
        matchStatsOnOff: data['matchStatsOnOff'] as bool?,
        created: castToType<int>(data['created']),
        ticketsOnOff: data['ticketsOnOff'] as bool?,
        pushNotificationsSenderUrl:
            data['pushNotificationsSenderUrl'] as String?,
        videoFeedKey: data['videoFeedKey'] as String?,
        matchGalleryOnOff: data['matchGalleryOnOff'] as bool?,
        pushNotificationsOnOff: data['pushNotificationsOnOff'] as bool?,
        digitalMatchProgrammesOnOff:
            data['digitalMatchProgrammesOnOff'] as bool?,
        crmOnOff: data['crmOnOff'] as bool?,
        clubShopWPKey: data['clubShopWPKey'] as String?,
        leagueTableOnOff: data['leagueTableOnOff'] as bool?,
        predictorGamePrizeText: data['predictorGamePrizeText'] as String?,
        updated: castToType<int>(data['updated']),
        ticketsInApp: data['ticketsInApp'] as bool?,
        commentary: data['commentary'] as bool?,
        digitalMatchProgrammesPrice:
            castToType<double>(data['digitalMatchProgrammesPrice']),
      );

  static SettingsStruct? maybeFromMap(dynamic data) =>
      data is Map ? SettingsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'socialMediaFeedLink': _socialMediaFeedLink,
        'liveScoresOnOff': _liveScoresOnOff,
        'websiteNewsFeedLink': _websiteNewsFeedLink,
        'sponsorAdsOnOff': _sponsorAdsOnOff,
        'scorersOnOff': _scorersOnOff,
        'ownerId': _ownerId,
        'clubShopOnOff': _clubShopOnOff,
        'videoFeedPlaylistId': _videoFeedPlaylistId,
        'ticketsProviderName': _ticketsProviderName,
        'predictorGameOnOff': _predictorGameOnOff,
        'ticketsLink': _ticketsLink,
        'videoFeedOnOff': _videoFeedOnOff,
        'socialPostingOnOff': _socialPostingOnOff,
        'commentaryLink': _commentaryLink,
        'clubShopWPSecret': _clubShopWPSecret,
        'websiteNewsFeedOnOff': _websiteNewsFeedOnOff,
        'squadHubOnOff': _squadHubOnOff,
        'matchLineupsOnOff': _matchLineupsOnOff,
        'socialMediaFeedOnOff': _socialMediaFeedOnOff,
        'fixturesOnOff': _fixturesOnOff,
        'objectId': _objectId,
        'automatedStats': _automatedStats,
        'matchStatsOnOff': _matchStatsOnOff,
        'created': _created,
        'ticketsOnOff': _ticketsOnOff,
        'pushNotificationsSenderUrl': _pushNotificationsSenderUrl,
        'videoFeedKey': _videoFeedKey,
        'matchGalleryOnOff': _matchGalleryOnOff,
        'pushNotificationsOnOff': _pushNotificationsOnOff,
        'digitalMatchProgrammesOnOff': _digitalMatchProgrammesOnOff,
        'crmOnOff': _crmOnOff,
        'clubShopWPKey': _clubShopWPKey,
        'leagueTableOnOff': _leagueTableOnOff,
        'predictorGamePrizeText': _predictorGamePrizeText,
        'updated': _updated,
        'ticketsInApp': _ticketsInApp,
        'commentary': _commentary,
        'digitalMatchProgrammesPrice': _digitalMatchProgrammesPrice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'socialMediaFeedLink': serializeParam(
          _socialMediaFeedLink,
          ParamType.String,
        ),
        'liveScoresOnOff': serializeParam(
          _liveScoresOnOff,
          ParamType.bool,
        ),
        'websiteNewsFeedLink': serializeParam(
          _websiteNewsFeedLink,
          ParamType.String,
        ),
        'sponsorAdsOnOff': serializeParam(
          _sponsorAdsOnOff,
          ParamType.bool,
        ),
        'scorersOnOff': serializeParam(
          _scorersOnOff,
          ParamType.bool,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'clubShopOnOff': serializeParam(
          _clubShopOnOff,
          ParamType.bool,
        ),
        'videoFeedPlaylistId': serializeParam(
          _videoFeedPlaylistId,
          ParamType.String,
        ),
        'ticketsProviderName': serializeParam(
          _ticketsProviderName,
          ParamType.String,
        ),
        'predictorGameOnOff': serializeParam(
          _predictorGameOnOff,
          ParamType.bool,
        ),
        'ticketsLink': serializeParam(
          _ticketsLink,
          ParamType.String,
        ),
        'videoFeedOnOff': serializeParam(
          _videoFeedOnOff,
          ParamType.bool,
        ),
        'socialPostingOnOff': serializeParam(
          _socialPostingOnOff,
          ParamType.bool,
        ),
        'commentaryLink': serializeParam(
          _commentaryLink,
          ParamType.String,
        ),
        'clubShopWPSecret': serializeParam(
          _clubShopWPSecret,
          ParamType.String,
        ),
        'websiteNewsFeedOnOff': serializeParam(
          _websiteNewsFeedOnOff,
          ParamType.bool,
        ),
        'squadHubOnOff': serializeParam(
          _squadHubOnOff,
          ParamType.bool,
        ),
        'matchLineupsOnOff': serializeParam(
          _matchLineupsOnOff,
          ParamType.bool,
        ),
        'socialMediaFeedOnOff': serializeParam(
          _socialMediaFeedOnOff,
          ParamType.bool,
        ),
        'fixturesOnOff': serializeParam(
          _fixturesOnOff,
          ParamType.bool,
        ),
        'objectId': serializeParam(
          _objectId,
          ParamType.String,
        ),
        'automatedStats': serializeParam(
          _automatedStats,
          ParamType.bool,
        ),
        'matchStatsOnOff': serializeParam(
          _matchStatsOnOff,
          ParamType.bool,
        ),
        'created': serializeParam(
          _created,
          ParamType.int,
        ),
        'ticketsOnOff': serializeParam(
          _ticketsOnOff,
          ParamType.bool,
        ),
        'pushNotificationsSenderUrl': serializeParam(
          _pushNotificationsSenderUrl,
          ParamType.String,
        ),
        'videoFeedKey': serializeParam(
          _videoFeedKey,
          ParamType.String,
        ),
        'matchGalleryOnOff': serializeParam(
          _matchGalleryOnOff,
          ParamType.bool,
        ),
        'pushNotificationsOnOff': serializeParam(
          _pushNotificationsOnOff,
          ParamType.bool,
        ),
        'digitalMatchProgrammesOnOff': serializeParam(
          _digitalMatchProgrammesOnOff,
          ParamType.bool,
        ),
        'crmOnOff': serializeParam(
          _crmOnOff,
          ParamType.bool,
        ),
        'clubShopWPKey': serializeParam(
          _clubShopWPKey,
          ParamType.String,
        ),
        'leagueTableOnOff': serializeParam(
          _leagueTableOnOff,
          ParamType.bool,
        ),
        'predictorGamePrizeText': serializeParam(
          _predictorGamePrizeText,
          ParamType.String,
        ),
        'updated': serializeParam(
          _updated,
          ParamType.int,
        ),
        'ticketsInApp': serializeParam(
          _ticketsInApp,
          ParamType.bool,
        ),
        'commentary': serializeParam(
          _commentary,
          ParamType.bool,
        ),
        'digitalMatchProgrammesPrice': serializeParam(
          _digitalMatchProgrammesPrice,
          ParamType.double,
        ),
      }.withoutNulls;

  static SettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SettingsStruct(
        socialMediaFeedLink: deserializeParam(
          data['socialMediaFeedLink'],
          ParamType.String,
          false,
        ),
        liveScoresOnOff: deserializeParam(
          data['liveScoresOnOff'],
          ParamType.bool,
          false,
        ),
        websiteNewsFeedLink: deserializeParam(
          data['websiteNewsFeedLink'],
          ParamType.String,
          false,
        ),
        sponsorAdsOnOff: deserializeParam(
          data['sponsorAdsOnOff'],
          ParamType.bool,
          false,
        ),
        scorersOnOff: deserializeParam(
          data['scorersOnOff'],
          ParamType.bool,
          false,
        ),
        ownerId: deserializeParam(
          data['ownerId'],
          ParamType.String,
          false,
        ),
        clubShopOnOff: deserializeParam(
          data['clubShopOnOff'],
          ParamType.bool,
          false,
        ),
        videoFeedPlaylistId: deserializeParam(
          data['videoFeedPlaylistId'],
          ParamType.String,
          false,
        ),
        ticketsProviderName: deserializeParam(
          data['ticketsProviderName'],
          ParamType.String,
          false,
        ),
        predictorGameOnOff: deserializeParam(
          data['predictorGameOnOff'],
          ParamType.bool,
          false,
        ),
        ticketsLink: deserializeParam(
          data['ticketsLink'],
          ParamType.String,
          false,
        ),
        videoFeedOnOff: deserializeParam(
          data['videoFeedOnOff'],
          ParamType.bool,
          false,
        ),
        socialPostingOnOff: deserializeParam(
          data['socialPostingOnOff'],
          ParamType.bool,
          false,
        ),
        commentaryLink: deserializeParam(
          data['commentaryLink'],
          ParamType.String,
          false,
        ),
        clubShopWPSecret: deserializeParam(
          data['clubShopWPSecret'],
          ParamType.String,
          false,
        ),
        websiteNewsFeedOnOff: deserializeParam(
          data['websiteNewsFeedOnOff'],
          ParamType.bool,
          false,
        ),
        squadHubOnOff: deserializeParam(
          data['squadHubOnOff'],
          ParamType.bool,
          false,
        ),
        matchLineupsOnOff: deserializeParam(
          data['matchLineupsOnOff'],
          ParamType.bool,
          false,
        ),
        socialMediaFeedOnOff: deserializeParam(
          data['socialMediaFeedOnOff'],
          ParamType.bool,
          false,
        ),
        fixturesOnOff: deserializeParam(
          data['fixturesOnOff'],
          ParamType.bool,
          false,
        ),
        objectId: deserializeParam(
          data['objectId'],
          ParamType.String,
          false,
        ),
        automatedStats: deserializeParam(
          data['automatedStats'],
          ParamType.bool,
          false,
        ),
        matchStatsOnOff: deserializeParam(
          data['matchStatsOnOff'],
          ParamType.bool,
          false,
        ),
        created: deserializeParam(
          data['created'],
          ParamType.int,
          false,
        ),
        ticketsOnOff: deserializeParam(
          data['ticketsOnOff'],
          ParamType.bool,
          false,
        ),
        pushNotificationsSenderUrl: deserializeParam(
          data['pushNotificationsSenderUrl'],
          ParamType.String,
          false,
        ),
        videoFeedKey: deserializeParam(
          data['videoFeedKey'],
          ParamType.String,
          false,
        ),
        matchGalleryOnOff: deserializeParam(
          data['matchGalleryOnOff'],
          ParamType.bool,
          false,
        ),
        pushNotificationsOnOff: deserializeParam(
          data['pushNotificationsOnOff'],
          ParamType.bool,
          false,
        ),
        digitalMatchProgrammesOnOff: deserializeParam(
          data['digitalMatchProgrammesOnOff'],
          ParamType.bool,
          false,
        ),
        crmOnOff: deserializeParam(
          data['crmOnOff'],
          ParamType.bool,
          false,
        ),
        clubShopWPKey: deserializeParam(
          data['clubShopWPKey'],
          ParamType.String,
          false,
        ),
        leagueTableOnOff: deserializeParam(
          data['leagueTableOnOff'],
          ParamType.bool,
          false,
        ),
        predictorGamePrizeText: deserializeParam(
          data['predictorGamePrizeText'],
          ParamType.String,
          false,
        ),
        updated: deserializeParam(
          data['updated'],
          ParamType.int,
          false,
        ),
        ticketsInApp: deserializeParam(
          data['ticketsInApp'],
          ParamType.bool,
          false,
        ),
        commentary: deserializeParam(
          data['commentary'],
          ParamType.bool,
          false,
        ),
        digitalMatchProgrammesPrice: deserializeParam(
          data['digitalMatchProgrammesPrice'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsStruct &&
        socialMediaFeedLink == other.socialMediaFeedLink &&
        liveScoresOnOff == other.liveScoresOnOff &&
        websiteNewsFeedLink == other.websiteNewsFeedLink &&
        sponsorAdsOnOff == other.sponsorAdsOnOff &&
        scorersOnOff == other.scorersOnOff &&
        ownerId == other.ownerId &&
        clubShopOnOff == other.clubShopOnOff &&
        videoFeedPlaylistId == other.videoFeedPlaylistId &&
        ticketsProviderName == other.ticketsProviderName &&
        predictorGameOnOff == other.predictorGameOnOff &&
        ticketsLink == other.ticketsLink &&
        videoFeedOnOff == other.videoFeedOnOff &&
        socialPostingOnOff == other.socialPostingOnOff &&
        commentaryLink == other.commentaryLink &&
        clubShopWPSecret == other.clubShopWPSecret &&
        websiteNewsFeedOnOff == other.websiteNewsFeedOnOff &&
        squadHubOnOff == other.squadHubOnOff &&
        matchLineupsOnOff == other.matchLineupsOnOff &&
        socialMediaFeedOnOff == other.socialMediaFeedOnOff &&
        fixturesOnOff == other.fixturesOnOff &&
        objectId == other.objectId &&
        automatedStats == other.automatedStats &&
        matchStatsOnOff == other.matchStatsOnOff &&
        created == other.created &&
        ticketsOnOff == other.ticketsOnOff &&
        pushNotificationsSenderUrl == other.pushNotificationsSenderUrl &&
        videoFeedKey == other.videoFeedKey &&
        matchGalleryOnOff == other.matchGalleryOnOff &&
        pushNotificationsOnOff == other.pushNotificationsOnOff &&
        digitalMatchProgrammesOnOff == other.digitalMatchProgrammesOnOff &&
        crmOnOff == other.crmOnOff &&
        clubShopWPKey == other.clubShopWPKey &&
        leagueTableOnOff == other.leagueTableOnOff &&
        predictorGamePrizeText == other.predictorGamePrizeText &&
        updated == other.updated &&
        ticketsInApp == other.ticketsInApp &&
        commentary == other.commentary &&
        digitalMatchProgrammesPrice == other.digitalMatchProgrammesPrice;
  }

  @override
  int get hashCode => const ListEquality().hash([
        socialMediaFeedLink,
        liveScoresOnOff,
        websiteNewsFeedLink,
        sponsorAdsOnOff,
        scorersOnOff,
        ownerId,
        clubShopOnOff,
        videoFeedPlaylistId,
        ticketsProviderName,
        predictorGameOnOff,
        ticketsLink,
        videoFeedOnOff,
        socialPostingOnOff,
        commentaryLink,
        clubShopWPSecret,
        websiteNewsFeedOnOff,
        squadHubOnOff,
        matchLineupsOnOff,
        socialMediaFeedOnOff,
        fixturesOnOff,
        objectId,
        automatedStats,
        matchStatsOnOff,
        created,
        ticketsOnOff,
        pushNotificationsSenderUrl,
        videoFeedKey,
        matchGalleryOnOff,
        pushNotificationsOnOff,
        digitalMatchProgrammesOnOff,
        crmOnOff,
        clubShopWPKey,
        leagueTableOnOff,
        predictorGamePrizeText,
        updated,
        ticketsInApp,
        commentary,
        digitalMatchProgrammesPrice
      ]);
}

SettingsStruct createSettingsStruct({
  String? socialMediaFeedLink,
  bool? liveScoresOnOff,
  String? websiteNewsFeedLink,
  bool? sponsorAdsOnOff,
  bool? scorersOnOff,
  String? ownerId,
  bool? clubShopOnOff,
  String? videoFeedPlaylistId,
  String? ticketsProviderName,
  bool? predictorGameOnOff,
  String? ticketsLink,
  bool? videoFeedOnOff,
  bool? socialPostingOnOff,
  String? commentaryLink,
  String? clubShopWPSecret,
  bool? websiteNewsFeedOnOff,
  bool? squadHubOnOff,
  bool? matchLineupsOnOff,
  bool? socialMediaFeedOnOff,
  bool? fixturesOnOff,
  String? objectId,
  bool? automatedStats,
  bool? matchStatsOnOff,
  int? created,
  bool? ticketsOnOff,
  String? pushNotificationsSenderUrl,
  String? videoFeedKey,
  bool? matchGalleryOnOff,
  bool? pushNotificationsOnOff,
  bool? digitalMatchProgrammesOnOff,
  bool? crmOnOff,
  String? clubShopWPKey,
  bool? leagueTableOnOff,
  String? predictorGamePrizeText,
  int? updated,
  bool? ticketsInApp,
  bool? commentary,
  double? digitalMatchProgrammesPrice,
}) =>
    SettingsStruct(
      socialMediaFeedLink: socialMediaFeedLink,
      liveScoresOnOff: liveScoresOnOff,
      websiteNewsFeedLink: websiteNewsFeedLink,
      sponsorAdsOnOff: sponsorAdsOnOff,
      scorersOnOff: scorersOnOff,
      ownerId: ownerId,
      clubShopOnOff: clubShopOnOff,
      videoFeedPlaylistId: videoFeedPlaylistId,
      ticketsProviderName: ticketsProviderName,
      predictorGameOnOff: predictorGameOnOff,
      ticketsLink: ticketsLink,
      videoFeedOnOff: videoFeedOnOff,
      socialPostingOnOff: socialPostingOnOff,
      commentaryLink: commentaryLink,
      clubShopWPSecret: clubShopWPSecret,
      websiteNewsFeedOnOff: websiteNewsFeedOnOff,
      squadHubOnOff: squadHubOnOff,
      matchLineupsOnOff: matchLineupsOnOff,
      socialMediaFeedOnOff: socialMediaFeedOnOff,
      fixturesOnOff: fixturesOnOff,
      objectId: objectId,
      automatedStats: automatedStats,
      matchStatsOnOff: matchStatsOnOff,
      created: created,
      ticketsOnOff: ticketsOnOff,
      pushNotificationsSenderUrl: pushNotificationsSenderUrl,
      videoFeedKey: videoFeedKey,
      matchGalleryOnOff: matchGalleryOnOff,
      pushNotificationsOnOff: pushNotificationsOnOff,
      digitalMatchProgrammesOnOff: digitalMatchProgrammesOnOff,
      crmOnOff: crmOnOff,
      clubShopWPKey: clubShopWPKey,
      leagueTableOnOff: leagueTableOnOff,
      predictorGamePrizeText: predictorGamePrizeText,
      updated: updated,
      ticketsInApp: ticketsInApp,
      commentary: commentary,
      digitalMatchProgrammesPrice: digitalMatchProgrammesPrice,
    );
