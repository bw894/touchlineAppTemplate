// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HiveFeaturesStruct extends BaseStruct {
  HiveFeaturesStruct({
    bool? tickets,
    bool? digitalMatchProgrammes,
    bool? clubShop,
    bool? matchGallery,
    bool? squadHub,
    bool? predictorGame,
    bool? websiteNewsFeed,
    bool? fixtures,
    bool? socialMediaFeed,
    bool? socialPosting,
    bool? googleAnalytics,
    bool? pushNotifications,
    bool? videoFeed,
    bool? matchLineups,
    bool? sponsorAds,
    bool? liveScores,
    bool? results,
    bool? commentary,
    bool? matchStats,
    bool? crm,
  })  : _tickets = tickets,
        _digitalMatchProgrammes = digitalMatchProgrammes,
        _clubShop = clubShop,
        _matchGallery = matchGallery,
        _squadHub = squadHub,
        _predictorGame = predictorGame,
        _websiteNewsFeed = websiteNewsFeed,
        _fixtures = fixtures,
        _socialMediaFeed = socialMediaFeed,
        _socialPosting = socialPosting,
        _googleAnalytics = googleAnalytics,
        _pushNotifications = pushNotifications,
        _videoFeed = videoFeed,
        _matchLineups = matchLineups,
        _sponsorAds = sponsorAds,
        _liveScores = liveScores,
        _results = results,
        _commentary = commentary,
        _matchStats = matchStats,
        _crm = crm;

  // "tickets" field.
  bool? _tickets;
  bool get tickets => _tickets ?? true;
  set tickets(bool? val) => _tickets = val;

  bool hasTickets() => _tickets != null;

  // "digitalMatchProgrammes" field.
  bool? _digitalMatchProgrammes;
  bool get digitalMatchProgrammes => _digitalMatchProgrammes ?? true;
  set digitalMatchProgrammes(bool? val) => _digitalMatchProgrammes = val;

  bool hasDigitalMatchProgrammes() => _digitalMatchProgrammes != null;

  // "clubShop" field.
  bool? _clubShop;
  bool get clubShop => _clubShop ?? true;
  set clubShop(bool? val) => _clubShop = val;

  bool hasClubShop() => _clubShop != null;

  // "matchGallery" field.
  bool? _matchGallery;
  bool get matchGallery => _matchGallery ?? true;
  set matchGallery(bool? val) => _matchGallery = val;

  bool hasMatchGallery() => _matchGallery != null;

  // "squadHub" field.
  bool? _squadHub;
  bool get squadHub => _squadHub ?? true;
  set squadHub(bool? val) => _squadHub = val;

  bool hasSquadHub() => _squadHub != null;

  // "predictorGame" field.
  bool? _predictorGame;
  bool get predictorGame => _predictorGame ?? true;
  set predictorGame(bool? val) => _predictorGame = val;

  bool hasPredictorGame() => _predictorGame != null;

  // "websiteNewsFeed" field.
  bool? _websiteNewsFeed;
  bool get websiteNewsFeed => _websiteNewsFeed ?? true;
  set websiteNewsFeed(bool? val) => _websiteNewsFeed = val;

  bool hasWebsiteNewsFeed() => _websiteNewsFeed != null;

  // "fixtures" field.
  bool? _fixtures;
  bool get fixtures => _fixtures ?? true;
  set fixtures(bool? val) => _fixtures = val;

  bool hasFixtures() => _fixtures != null;

  // "socialMediaFeed" field.
  bool? _socialMediaFeed;
  bool get socialMediaFeed => _socialMediaFeed ?? true;
  set socialMediaFeed(bool? val) => _socialMediaFeed = val;

  bool hasSocialMediaFeed() => _socialMediaFeed != null;

  // "socialPosting" field.
  bool? _socialPosting;
  bool get socialPosting => _socialPosting ?? true;
  set socialPosting(bool? val) => _socialPosting = val;

  bool hasSocialPosting() => _socialPosting != null;

  // "googleAnalytics" field.
  bool? _googleAnalytics;
  bool get googleAnalytics => _googleAnalytics ?? true;
  set googleAnalytics(bool? val) => _googleAnalytics = val;

  bool hasGoogleAnalytics() => _googleAnalytics != null;

  // "pushNotifications" field.
  bool? _pushNotifications;
  bool get pushNotifications => _pushNotifications ?? true;
  set pushNotifications(bool? val) => _pushNotifications = val;

  bool hasPushNotifications() => _pushNotifications != null;

  // "videoFeed" field.
  bool? _videoFeed;
  bool get videoFeed => _videoFeed ?? true;
  set videoFeed(bool? val) => _videoFeed = val;

  bool hasVideoFeed() => _videoFeed != null;

  // "matchLineups" field.
  bool? _matchLineups;
  bool get matchLineups => _matchLineups ?? true;
  set matchLineups(bool? val) => _matchLineups = val;

  bool hasMatchLineups() => _matchLineups != null;

  // "sponsorAds" field.
  bool? _sponsorAds;
  bool get sponsorAds => _sponsorAds ?? true;
  set sponsorAds(bool? val) => _sponsorAds = val;

  bool hasSponsorAds() => _sponsorAds != null;

  // "liveScores" field.
  bool? _liveScores;
  bool get liveScores => _liveScores ?? true;
  set liveScores(bool? val) => _liveScores = val;

  bool hasLiveScores() => _liveScores != null;

  // "results" field.
  bool? _results;
  bool get results => _results ?? true;
  set results(bool? val) => _results = val;

  bool hasResults() => _results != null;

  // "commentary" field.
  bool? _commentary;
  bool get commentary => _commentary ?? true;
  set commentary(bool? val) => _commentary = val;

  bool hasCommentary() => _commentary != null;

  // "matchStats" field.
  bool? _matchStats;
  bool get matchStats => _matchStats ?? true;
  set matchStats(bool? val) => _matchStats = val;

  bool hasMatchStats() => _matchStats != null;

  // "crm" field.
  bool? _crm;
  bool get crm => _crm ?? true;
  set crm(bool? val) => _crm = val;

  bool hasCrm() => _crm != null;

  static HiveFeaturesStruct fromMap(Map<String, dynamic> data) =>
      HiveFeaturesStruct(
        tickets: data['tickets'] as bool?,
        digitalMatchProgrammes: data['digitalMatchProgrammes'] as bool?,
        clubShop: data['clubShop'] as bool?,
        matchGallery: data['matchGallery'] as bool?,
        squadHub: data['squadHub'] as bool?,
        predictorGame: data['predictorGame'] as bool?,
        websiteNewsFeed: data['websiteNewsFeed'] as bool?,
        fixtures: data['fixtures'] as bool?,
        socialMediaFeed: data['socialMediaFeed'] as bool?,
        socialPosting: data['socialPosting'] as bool?,
        googleAnalytics: data['googleAnalytics'] as bool?,
        pushNotifications: data['pushNotifications'] as bool?,
        videoFeed: data['videoFeed'] as bool?,
        matchLineups: data['matchLineups'] as bool?,
        sponsorAds: data['sponsorAds'] as bool?,
        liveScores: data['liveScores'] as bool?,
        results: data['results'] as bool?,
        commentary: data['commentary'] as bool?,
        matchStats: data['matchStats'] as bool?,
        crm: data['crm'] as bool?,
      );

  static HiveFeaturesStruct? maybeFromMap(dynamic data) => data is Map
      ? HiveFeaturesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tickets': _tickets,
        'digitalMatchProgrammes': _digitalMatchProgrammes,
        'clubShop': _clubShop,
        'matchGallery': _matchGallery,
        'squadHub': _squadHub,
        'predictorGame': _predictorGame,
        'websiteNewsFeed': _websiteNewsFeed,
        'fixtures': _fixtures,
        'socialMediaFeed': _socialMediaFeed,
        'socialPosting': _socialPosting,
        'googleAnalytics': _googleAnalytics,
        'pushNotifications': _pushNotifications,
        'videoFeed': _videoFeed,
        'matchLineups': _matchLineups,
        'sponsorAds': _sponsorAds,
        'liveScores': _liveScores,
        'results': _results,
        'commentary': _commentary,
        'matchStats': _matchStats,
        'crm': _crm,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tickets': serializeParam(
          _tickets,
          ParamType.bool,
        ),
        'digitalMatchProgrammes': serializeParam(
          _digitalMatchProgrammes,
          ParamType.bool,
        ),
        'clubShop': serializeParam(
          _clubShop,
          ParamType.bool,
        ),
        'matchGallery': serializeParam(
          _matchGallery,
          ParamType.bool,
        ),
        'squadHub': serializeParam(
          _squadHub,
          ParamType.bool,
        ),
        'predictorGame': serializeParam(
          _predictorGame,
          ParamType.bool,
        ),
        'websiteNewsFeed': serializeParam(
          _websiteNewsFeed,
          ParamType.bool,
        ),
        'fixtures': serializeParam(
          _fixtures,
          ParamType.bool,
        ),
        'socialMediaFeed': serializeParam(
          _socialMediaFeed,
          ParamType.bool,
        ),
        'socialPosting': serializeParam(
          _socialPosting,
          ParamType.bool,
        ),
        'googleAnalytics': serializeParam(
          _googleAnalytics,
          ParamType.bool,
        ),
        'pushNotifications': serializeParam(
          _pushNotifications,
          ParamType.bool,
        ),
        'videoFeed': serializeParam(
          _videoFeed,
          ParamType.bool,
        ),
        'matchLineups': serializeParam(
          _matchLineups,
          ParamType.bool,
        ),
        'sponsorAds': serializeParam(
          _sponsorAds,
          ParamType.bool,
        ),
        'liveScores': serializeParam(
          _liveScores,
          ParamType.bool,
        ),
        'results': serializeParam(
          _results,
          ParamType.bool,
        ),
        'commentary': serializeParam(
          _commentary,
          ParamType.bool,
        ),
        'matchStats': serializeParam(
          _matchStats,
          ParamType.bool,
        ),
        'crm': serializeParam(
          _crm,
          ParamType.bool,
        ),
      }.withoutNulls;

  static HiveFeaturesStruct fromSerializableMap(Map<String, dynamic> data) =>
      HiveFeaturesStruct(
        tickets: deserializeParam(
          data['tickets'],
          ParamType.bool,
          false,
        ),
        digitalMatchProgrammes: deserializeParam(
          data['digitalMatchProgrammes'],
          ParamType.bool,
          false,
        ),
        clubShop: deserializeParam(
          data['clubShop'],
          ParamType.bool,
          false,
        ),
        matchGallery: deserializeParam(
          data['matchGallery'],
          ParamType.bool,
          false,
        ),
        squadHub: deserializeParam(
          data['squadHub'],
          ParamType.bool,
          false,
        ),
        predictorGame: deserializeParam(
          data['predictorGame'],
          ParamType.bool,
          false,
        ),
        websiteNewsFeed: deserializeParam(
          data['websiteNewsFeed'],
          ParamType.bool,
          false,
        ),
        fixtures: deserializeParam(
          data['fixtures'],
          ParamType.bool,
          false,
        ),
        socialMediaFeed: deserializeParam(
          data['socialMediaFeed'],
          ParamType.bool,
          false,
        ),
        socialPosting: deserializeParam(
          data['socialPosting'],
          ParamType.bool,
          false,
        ),
        googleAnalytics: deserializeParam(
          data['googleAnalytics'],
          ParamType.bool,
          false,
        ),
        pushNotifications: deserializeParam(
          data['pushNotifications'],
          ParamType.bool,
          false,
        ),
        videoFeed: deserializeParam(
          data['videoFeed'],
          ParamType.bool,
          false,
        ),
        matchLineups: deserializeParam(
          data['matchLineups'],
          ParamType.bool,
          false,
        ),
        sponsorAds: deserializeParam(
          data['sponsorAds'],
          ParamType.bool,
          false,
        ),
        liveScores: deserializeParam(
          data['liveScores'],
          ParamType.bool,
          false,
        ),
        results: deserializeParam(
          data['results'],
          ParamType.bool,
          false,
        ),
        commentary: deserializeParam(
          data['commentary'],
          ParamType.bool,
          false,
        ),
        matchStats: deserializeParam(
          data['matchStats'],
          ParamType.bool,
          false,
        ),
        crm: deserializeParam(
          data['crm'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'HiveFeaturesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HiveFeaturesStruct &&
        tickets == other.tickets &&
        digitalMatchProgrammes == other.digitalMatchProgrammes &&
        clubShop == other.clubShop &&
        matchGallery == other.matchGallery &&
        squadHub == other.squadHub &&
        predictorGame == other.predictorGame &&
        websiteNewsFeed == other.websiteNewsFeed &&
        fixtures == other.fixtures &&
        socialMediaFeed == other.socialMediaFeed &&
        socialPosting == other.socialPosting &&
        googleAnalytics == other.googleAnalytics &&
        pushNotifications == other.pushNotifications &&
        videoFeed == other.videoFeed &&
        matchLineups == other.matchLineups &&
        sponsorAds == other.sponsorAds &&
        liveScores == other.liveScores &&
        results == other.results &&
        commentary == other.commentary &&
        matchStats == other.matchStats &&
        crm == other.crm;
  }

  @override
  int get hashCode => const ListEquality().hash([
        tickets,
        digitalMatchProgrammes,
        clubShop,
        matchGallery,
        squadHub,
        predictorGame,
        websiteNewsFeed,
        fixtures,
        socialMediaFeed,
        socialPosting,
        googleAnalytics,
        pushNotifications,
        videoFeed,
        matchLineups,
        sponsorAds,
        liveScores,
        results,
        commentary,
        matchStats,
        crm
      ]);
}

HiveFeaturesStruct createHiveFeaturesStruct({
  bool? tickets,
  bool? digitalMatchProgrammes,
  bool? clubShop,
  bool? matchGallery,
  bool? squadHub,
  bool? predictorGame,
  bool? websiteNewsFeed,
  bool? fixtures,
  bool? socialMediaFeed,
  bool? socialPosting,
  bool? googleAnalytics,
  bool? pushNotifications,
  bool? videoFeed,
  bool? matchLineups,
  bool? sponsorAds,
  bool? liveScores,
  bool? results,
  bool? commentary,
  bool? matchStats,
  bool? crm,
}) =>
    HiveFeaturesStruct(
      tickets: tickets,
      digitalMatchProgrammes: digitalMatchProgrammes,
      clubShop: clubShop,
      matchGallery: matchGallery,
      squadHub: squadHub,
      predictorGame: predictorGame,
      websiteNewsFeed: websiteNewsFeed,
      fixtures: fixtures,
      socialMediaFeed: socialMediaFeed,
      socialPosting: socialPosting,
      googleAnalytics: googleAnalytics,
      pushNotifications: pushNotifications,
      videoFeed: videoFeed,
      matchLineups: matchLineups,
      sponsorAds: sponsorAds,
      liveScores: liveScores,
      results: results,
      commentary: commentary,
      matchStats: matchStats,
      crm: crm,
    );
