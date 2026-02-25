// ignore_for_file: non_constant_identifier_names

import '../api_manager.dart';
import '../schema_util.dart';
import 'endpoint_utils.dart';

export '../api_manager.dart' show ApiCallResponse;

// Default season used by AllResults / AllFixtures when caller does not supply one.
const int kDefaultSeason = 20256;

class BackendlessDatabaseGroup {
  static String getBaseUrl({
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) =>
      'https://api.touchlineclub.com:7500/${bLProjectId}/${bLRestAPIKey}';

  static Map<String, String> headers = {};

  static UpcomingSixFixturesCall upcomingSixFixturesCall =
      UpcomingSixFixturesCall();
  static NextFixtureSliderDetailsCall nextFixtureSliderDetailsCall =
      NextFixtureSliderDetailsCall();
  static PredictorNextGameCall predictorNextGameCall = PredictorNextGameCall();
  static AllUpcomingCall allUpcomingCall = AllUpcomingCall();
  static UpcomingOneFixturesCall upcomingOneFixturesCall =
      UpcomingOneFixturesCall();
  static UpcomingOneFixturesStartEndCall upcomingOneFixturesStartEndCall =
      UpcomingOneFixturesStartEndCall();
  static UpcomingOneFixturesObjectIDONLYCall
      upcomingOneFixturesObjectIDONLYCall =
      UpcomingOneFixturesObjectIDONLYCall();
  static UpcomingOneFixturesObjectIdStartEventTimelineCall
      upcomingOneFixturesObjectIdStartEventTimelineCall =
      UpcomingOneFixturesObjectIdStartEventTimelineCall();
  static TopLevelFixtureDetailsCall topLevelFixtureDetailsCall =
      TopLevelFixtureDetailsCall();
  static AllResultsCall allResultsCall = AllResultsCall();
  static AllFixturesCall allFixturesCall = AllFixturesCall();
  static PlayPredictorOneCall playPredictorOneCall = PlayPredictorOneCall();
  static PlayPredictorTwoCall playPredictorTwoCall = PlayPredictorTwoCall();
  static CheckIfTheyvePlayedPredictorThisWeekCall
      checkIfTheyvePlayedPredictorThisWeekCall =
      CheckIfTheyvePlayedPredictorThisWeekCall();
  static GetSpecificFixtureCall getSpecificFixtureCall =
      GetSpecificFixtureCall();
  static GetSpecificFixtureTopLevelDetailsCall
      getSpecificFixtureTopLevelDetailsCall =
      GetSpecificFixtureTopLevelDetailsCall();
  static GetStatsForMatchCall getStatsForMatchCall = GetStatsForMatchCall();
  static PredictorHistoryCall predictorHistoryCall = PredictorHistoryCall();
  static GetTopTenOfPredictorTableCall getTopTenOfPredictorTableCall =
      GetTopTenOfPredictorTableCall();
  static GetUsersPredictorStatsCall getUsersPredictorStatsCall =
      GetUsersPredictorStatsCall();
  static NewLeagueTableCall newLeagueTableCall = NewLeagueTableCall();
  static NewLeagueTableDetailsOnlyCall newLeagueTableDetailsOnlyCall =
      NewLeagueTableDetailsOnlyCall();
  static GetAllFixturesWithAProgrammeCall getAllFixturesWithAProgrammeCall =
      GetAllFixturesWithAProgrammeCall();
  static PlayerNewSquadHubCall playerNewSquadHubCall = PlayerNewSquadHubCall();
  static PlayerNewPredictorCall playerNewPredictorCall =
      PlayerNewPredictorCall();
  static GetSpecificPlayerCall getSpecificPlayerCall = GetSpecificPlayerCall();
  static GetMatchGalleryItemsForMatchCall getMatchGalleryItemsForMatchCall =
      GetMatchGalleryItemsForMatchCall();
  static SponsorAdsCall sponsorAdsCall = SponsorAdsCall();
  static GetInternalContentForASpecifedKeyCall
      getInternalContentForASpecifedKeyCall =
      GetInternalContentForASpecifedKeyCall();
  static GetPagesWhereContainedEqualsTermCall
      getPagesWhereContainedEqualsTermCall =
      GetPagesWhereContainedEqualsTermCall();
  static GetStaticPageContentByIDCall getStaticPageContentByIDCall =
      GetStaticPageContentByIDCall();
  static GetSpecificPollCall getSpecificPollCall = GetSpecificPollCall();
  static GetSpecificGenericPollCall getSpecificGenericPollCall =
      GetSpecificGenericPollCall();
  static CheckIfUserHasVotedCall checkIfUserHasVotedCall =
      CheckIfUserHasVotedCall();
  static CheckIfUserHasPlayedQuizCall checkIfUserHasPlayedQuizCall =
      CheckIfUserHasPlayedQuizCall();
  static CheckIfUserHasSubmittedAFormCall checkIfUserHasSubmittedAFormCall =
      CheckIfUserHasSubmittedAFormCall();
  static CheckForPollsWithRelatedMatchesCall
      checkForPollsWithRelatedMatchesCall =
      CheckForPollsWithRelatedMatchesCall();
  static CheckForAllPollsCall checkForAllPollsCall = CheckForAllPollsCall();
  static GetLiveTextItemsForRelatedMatchCall
      getLiveTextItemsForRelatedMatchCall =
      GetLiveTextItemsForRelatedMatchCall();
  static PlayersForLineupsBuilderCall playersForLineupsBuilderCall =
      PlayersForLineupsBuilderCall();
  static AddLineupsBuilderEntryCall addLineupsBuilderEntryCall =
      AddLineupsBuilderEntryCall();
  static AddMatchToLineupsBuilderEntryCall addMatchToLineupsBuilderEntryCall =
      AddMatchToLineupsBuilderEntryCall();
  static GetLineupsBuilderEntryByIDCall getLineupsBuilderEntryByIDCall =
      GetLineupsBuilderEntryByIDCall();
  static CheckIfLineupsBuilderHasBeenPlayedForMatchCall
      checkIfLineupsBuilderHasBeenPlayedForMatchCall =
      CheckIfLineupsBuilderHasBeenPlayedForMatchCall();
  static LineupsBuilderCacheCall lineupsBuilderCacheCall =
      LineupsBuilderCacheCall();
  static SetLineupsBuilderCacheCall setLineupsBuilderCacheCall =
      SetLineupsBuilderCacheCall();
  static AddQuizEntryCall addQuizEntryCall = AddQuizEntryCall();
  static AddQuizEntryToPollCall addQuizEntryToPollCall =
      AddQuizEntryToPollCall();
  static GetUpcomingCommercialEventsCall getUpcomingCommercialEventsCall =
      GetUpcomingCommercialEventsCall();
  static GetCommercialEventByIDCall getCommercialEventByIDCall =
      GetCommercialEventByIDCall();
  static GetPaymentPlansForSeasonCall getPaymentPlansForSeasonCall =
      GetPaymentPlansForSeasonCall();
}

// ---------------------------------------------------------------------------
// Fixture / schedule calls
// ---------------------------------------------------------------------------

class UpcomingSixFixturesCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UpcomingSixFixtures',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=6&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// Used by NextFixtureSlider variants. Pass [userToken] when the user is
/// logged in so Backendless can serve personalised data.
class NextFixtureSliderDetailsCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? userToken = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Next Fixture Slider Details',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=6&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&property=%60AwayBadge%60&property=%60HomeBadge%60&property=%60start%60&property=%60objectId%60&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: (userToken?.isNotEmpty ?? false)
          ? {'user-token': userToken!}
          : {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PredictorNextGameCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PredictorNextGame',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=1&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&property=%60AwayBadge%60&property=%60HomeBadge%60&property=%60start%60&property=%60objectId%60&property=%60AwayAbr%60&property=%60HomeAbr%60&property=%60HomeTeamName%60&property=%60AwayTeamName%60&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AllUpcomingCall {
  Future<ApiCallResponse> call({
    int? time,
    int? season = kDefaultSeason,
    String? teamObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'AllUpcoming',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=100&where=end%20%3C%20\'${time}\'%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'%20AND%20season%20%3D%20${season}&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpcomingOneFixturesCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UpcomingOneFixtures',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=1&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpcomingOneFixturesStartEndCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UpcomingOneFixtures Start End',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=1&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&property=%60start%60&property=%60end%60&property=%60objectId%60&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpcomingOneFixturesObjectIDONLYCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UpcomingOneFixtures ObjectID ONLY',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=1&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&property=objectId&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpcomingOneFixturesObjectIdStartEventTimelineCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UpcomingOneFixtures objectId start eventTimeline',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=1&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&property=%60objectId%60&property=%60start%60&property=%60eventTimeline%60&property=%60awayTeamId%60&property=%60homeTeamId%60&property=%60predictor%60&property=%60tickets%60&property=%60scoreOnlyFT%60&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TopLevelFixtureDetailsCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Top Level Fixture Details',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=1&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&property=%60AwayAbr%60&property=%60AwayBadge%60&property=%60awayGoals%60&property=%60awayPenalties%60&property=%60awayPenaltyBreakdown%60&property=%60awayTeamId%60&property=%60AwayTeamName%60&property=%60city%60&property=%60comp%60&property=%60end%60&property=%60eventTimeline%60&property=%60halfStartTimestamp%60&property=%60HomeAbr%60&property=%60HomeBadge%60&property=%60homeGoals%60&property=%60homePenalties%60&property=%60homePenaltyBreakdown%60&property=%60homeTeamId%60&property=%60HomeTeamName%60&property=%60isPostponed%60&property=%60leagueBadgeUrl%60&property=%60location%60&property=%60matchBackground%60&property=%60objectId%60&property=%60outputStatus%60&property=%60penaltiesText%60&property=%60penaltyShootout%60&property=%60postponedText%60&property=%60predictor%60&property=%60stadiumName%60&property=%60start%60&property=%60status%60&property=%60tickets%60&property=%60updated%60&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// All results for a season. Pass [userToken] when user is logged in.
class AllResultsCall {
  Future<ApiCallResponse> call({
    int? time,
    int? season,
    String? userToken = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    season ??= kDefaultSeason;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'All Results',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=100&where=end%20%3C%20\'${time}\'%20AND%20season%20%3D%20${season}&property=%60AwayBadge%60&property=%60awayGoals%60&property=%60AwayTeamName%60&property=%60comp%60&property=%60highlights%60&property=%60interview%60&property=%60HomeBadge%60&property=%60homeGoals%60&property=%60HomeTeamName%60&property=%60report%60&property=%60isPostponed%60&property=%60postponedText%60&property=%60start%60&property=%60objectId%60&sortBy=%60start%60%20desc',
      callType: ApiCallType.GET,
      headers: (userToken?.isNotEmpty ?? false)
          ? {'user-token': userToken!}
          : {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// All upcoming fixtures for a season. Pass [userToken] when user is logged in.
class AllFixturesCall {
  Future<ApiCallResponse> call({
    int? time,
    int? season,
    String? teamObjectId = '',
    String? userToken = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    season ??= kDefaultSeason;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'All Fixtures',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=100&where=end%20%3E%20\'${time}\'%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'%20AND%20season%20%3D%20${season}&property=%60HomeAbr%60&property=%60HomeTeamName%60&property=%60AwayTeamName%60&property=%60HomeBadge%60&property=%60AwayBadge%60&property=%60predictor%60&property=%60tickets%60&property=%60comp%60&property=%60start%60&property=%60objectId%60&property=%60isPostponed%60&property=%60postponedText%60&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: (userToken?.isNotEmpty ?? false)
          ? {'user-token': userToken!}
          : {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

// ---------------------------------------------------------------------------
// Predictor calls
// ---------------------------------------------------------------------------

class PlayPredictorOneCall {
  Future<ApiCallResponse> call({
    int? awayScore,
    int? homeScore,
    String? email = '',
    String? name = '',
    String? scorerName = '',
    String? uid = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    final ffApiRequestBody = '''
{
  "awayScore": ${awayScore},
  "homeScore": ${homeScore},
  "email": "${email}",
  "name": "${name}",
  "scorerName": "${scorerName}",
  "uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'playPredictorOne',
      apiUrl: '${baseUrl}/data/PredictorEntries',
      callType: ApiCallType.POST,
      headers: {'Content-Type': 'application/json'},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? objectId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.objectId''',
      ));
}

class PlayPredictorTwoCall {
  Future<ApiCallResponse> call({
    String? objectIdToAdd = '',
    String? objectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    final ffApiRequestBody = '''
{
  "objectId": "${objectIdToAdd}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'playPredictorTwo',
      apiUrl: '${baseUrl}/data/PredictorEntries/${objectId}/match',
      callType: ApiCallType.POST,
      headers: {'Content-Type': 'application/json'},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckIfTheyvePlayedPredictorThisWeekCall {
  Future<ApiCallResponse> call({
    String? matchObjectId = '',
    String? uid = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'checkIfTheyvePlayedPredictorThisWeek',
      apiUrl:
          '${baseUrl}/data/PredictorEntries?where=match.objectId%20%3D%20\'${matchObjectId}\'%20AND%20uid%20%3D%20\'${uid}\'&property=%60objectId%60',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PredictorHistoryCall {
  Future<ApiCallResponse> call({
    String? uid = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PredictorHistory',
      apiUrl:
          '${baseUrl}/data/PredictorEntries?where=uid%20%3D%20\'${uid}\'&property=match.AwayABR%20as%20AwayABR&property=match.AwayBadge%20as%20awayBadge&property=match.HomeABR%20as%20HomeABR&property=match.HomeBadge%20as%20homeBadge&property=%60awayScore%60&property=%60bonusPoints%60&property=%60created%60&property=%60email%60&property=%60entryPoints%60&property=%60homeScore%60&property=%60name%60&property=%60ownerId%60&property=%60pointsForScore%60&property=%60pointsForScorer%60&property=%60scorerName%60&property=%60uid%60&sortBy=%60created%60%20desc&pageSize=100',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTopTenOfPredictorTableCall {
  Future<ApiCallResponse> call({
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Top Ten of Predictor Table',
      apiUrl:
          '${baseUrl}/data/PredictorTable?pageSize=10&sortBy=%60rank%60%20asc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUsersPredictorStatsCall {
  Future<ApiCallResponse> call({
    String? uid = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Users Predictor Stats',
      apiUrl: '${baseUrl}/data/PredictorTable?where=uid%20%3D%20\'${uid}\'',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

// ---------------------------------------------------------------------------
// Fixture detail calls
// ---------------------------------------------------------------------------

class GetSpecificFixtureCall {
  Future<ApiCallResponse> call({
    String? objectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetSpecificFixture',
      apiUrl:
          '${baseUrl}/data/Fixtures/${objectId}?loadRelations=team%2Csponsorship',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSpecificFixtureTopLevelDetailsCall {
  Future<ApiCallResponse> call({
    String? objectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetSpecificFixture Top Level Details',
      apiUrl:
          '${baseUrl}/data/Fixtures/${objectId}?property=%60AwayAbr%60&property=%60scoreOnlyFT%60&property=%60overallAttendance%60&property=%60awayAttendance%60&property=%60AwayBadge%60&property=%60awayGoals%60&property=%60awayPenalties%60&property=%60awayPenaltyBreakdown%60&property=%60awayTeamId%60&property=%60AwayTeamName%60&property=%60city%60&property=%60comp%60&property=%60end%60&property=%60eventTimeline%60&property=%60halfStartTimestamp%60&property=%60HomeAbr%60&property=%60HomeBadge%60&property=%60homeGoals%60&property=%60homePenalties%60&property=%60homePenaltyBreakdown%60&property=%60homeTeamId%60&property=%60HomeTeamName%60&property=%60isPostponed%60&property=%60leagueBadgeUrl%60&property=%60location%60&property=%60matchBackground%60&property=%60objectId%60&property=%60outputStatus%60&property=%60penaltiesText%60&property=%60penaltyShootout%60&property=%60postponedText%60&property=%60predictor%60&property=%60stadiumName%60&property=%60start%60&property=%60status%60&property=%60tickets%60&property=%60updated%60&loadRelations=team%2Csponsorship',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

// ---------------------------------------------------------------------------
// Stats / live text calls
// ---------------------------------------------------------------------------

class GetStatsForMatchCall {
  Future<ApiCallResponse> call({
    String? objectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getStatsForMatch',
      apiUrl:
          '${baseUrl}/data/Stats?where=relatedMatch.objectId%20%3D%20\'${objectId}\'',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? awayYellows(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].awayYellows''',
      ));
  int? homeYellows(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].homeYellows''',
      ));
  int? homeReds(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].homeReds''',
      ));
  int? homeShots(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].homeShots''',
      ));
  int? homeOffsides(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].homeOffsides''',
      ));
  int? homeFouls(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].homeFouls''',
      ));
  int? awayOffsides(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].awayOffsides''',
      ));
  int? awayShots(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].awayShots''',
      ));
  int? awayFouls(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].awayFouls''',
      ));
  int? homeShotsOnTarget(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].homeShotsOnTarget''',
      ));
  int? awayReds(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].awayReds''',
      ));
  int? awayCorners(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].awayCorners''',
      ));
  int? awayShotsOnTarget(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].awayShotsOnTarget''',
      ));
  int? homeCorners(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].homeCorners''',
      ));
  bool? live(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$[:].live''',
      ));
}

class GetLiveTextItemsForRelatedMatchCall {
  Future<ApiCallResponse> call({
    String? matchObjectId = '',
    int? currentTime,
    int? pageSize = 20,
    int? offset = 0,
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Live Text Items for related Match',
      apiUrl:
          '${baseUrl}/data/liveText?pageSize=${pageSize}&offset=${offset}&where=%60postToLiveTextFeed%60%20%3D%20TRUE%20AND%20%60relatedMatch%60.%60objectId%60%20%3D%20\'${matchObjectId}\'%20AND%20%60created%60%20%3C%20\'${currentTime}\'&sortBy=%60created%60%20desc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

// ---------------------------------------------------------------------------
// League table calls
// ---------------------------------------------------------------------------

class NewLeagueTableCall {
  Future<ApiCallResponse> call({
    String? sort = 'rank',
    String? sortDir = 'asc',
    String? gDterm = 'GoalDifference',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'NewLeagueTable',
      apiUrl:
          '${baseUrl}/data/LeagueTable?pageSize=30&sortBy=%60${sort}%60%20${sortDir}%2C%60${gDterm}%60%20desc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NewLeagueTableDetailsOnlyCall {
  Future<ApiCallResponse> call({
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'NewLeagueTable DetailsOnly',
      apiUrl:
          '${baseUrl}/data/LeagueTable?pageSize=30&property=%60rank%60&property=%60imageURL%60&property=%60name%60&property=%60OverallMatchesPlayed%60&property=%60goalDiff%60&property=%60GoalDifference%60&property=%60points%60&property=%60OverallPoints%60&property=%60played%60&sortBy=%60rank%60%20asc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

// ---------------------------------------------------------------------------
// Player / squad calls
// ---------------------------------------------------------------------------

class GetAllFixturesWithAProgrammeCall {
  Future<ApiCallResponse> call({
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetAllFixturesWithAProgramme',
      apiUrl: '${baseUrl}/data/Fixtures?where=programmeFileURL%20!%3D%20null',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PlayerNewSquadHubCall {
  Future<ApiCallResponse> call({
    String? sort = 'number',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PlayerNewSquadHub',
      apiUrl:
          '${baseUrl}/data/players?pageSize=100&where=showInSquadHub%20%3D%20TRUE&property=%60PlayerName%60&property=%60PlayerPictureurl%60&property=%60objectId%60&property=%60number%60&property=%60onLoan%60&property=%60loanEndDate%60&property=%60loaned%60&property=%60loanClub%60&property=%60loanBadge%60&sortBy=%60${sort}%60%20asc%2C%60PlayerName%60%20asc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PlayerNewPredictorCall {
  Future<ApiCallResponse> call({
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PlayerNewPredictor',
      apiUrl:
          '${baseUrl}/data/players?pageSize=100&where=showInGame%20%3D%20TRUE&property=%60PlayerName%60&property=%60PlayerPictureurl%60&property=%60objectId%60',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSpecificPlayerCall {
  Future<ApiCallResponse> call({
    String? playerObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetSpecificPlayer',
      apiUrl:
          '${baseUrl}/data/players/${playerObjectId}?loadRelations=sponsorship',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMatchGalleryItemsForMatchCall {
  Future<ApiCallResponse> call({
    String? matchObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Match Gallery Items for match',
      apiUrl:
          '${baseUrl}/data/matchGallery?where=relatedMatch.objectId%20%3D%20\'${matchObjectId}\'',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

// ---------------------------------------------------------------------------
// Sponsor / ad calls
// ---------------------------------------------------------------------------

class SponsorAdsCall {
  Future<ApiCallResponse> call({
    String? locationKey = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'sponsor ads',
      apiUrl:
          '${baseUrl}/data/SponsorAds?where=location%20%3D%20\'${locationKey}\'&sortBy=%60sortOrder%60%20asc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

// ---------------------------------------------------------------------------
// Internal / CMS page calls
// ---------------------------------------------------------------------------

class GetInternalContentForASpecifedKeyCall {
  Future<ApiCallResponse> call({
    String? pageKey = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Internal Content for a specifed key',
      apiUrl:
          '${baseUrl}/data/InternalPages?where=Title%20%3D%20\'${pageKey}\'%20AND%20visible%20%3D%20TRUE&sortBy=%60sortOrder%60%20asc&loadRelations=containedPages',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPagesWhereContainedEqualsTermCall {
  Future<ApiCallResponse> call({
    String? pageKey = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get pages where contained equals term',
      apiUrl:
          '${baseUrl}/data/InternalPages?where=InternalPages%5BcontainedPages%5D.Title%3D\'${pageKey}\'%20AND%20visible%20%3D%20TRUE&sortBy=%60sortOrder%60%20asc&loadRelations=containedPages&pageSize=100',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetStaticPageContentByIDCall {
  Future<ApiCallResponse> call({
    String? pageObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get static page content by ID',
      apiUrl: '${baseUrl}/data/InternalPages/${pageObjectId}',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

// ---------------------------------------------------------------------------
// Poll / quiz calls
// ---------------------------------------------------------------------------

class GetSpecificPollCall {
  Future<ApiCallResponse> call({
    String? pollObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get specific poll',
      apiUrl:
          '${baseUrl}/data/Polls/${pollObjectId}?loadRelations=options%2CrelatedMatch',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSpecificGenericPollCall {
  Future<ApiCallResponse> call({
    String? pollObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get specific generic  poll',
      apiUrl:
          '${baseUrl}/data/Polls/${pollObjectId}?loadRelations=formFields%2Coptions%2CquizQuestions%2CquizQuestions.questionOptions',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckIfUserHasVotedCall {
  Future<ApiCallResponse> call({
    String? userEmail = '',
    String? pollObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Check if user has voted',
      apiUrl:
          '${baseUrl}/data/Polls?where=objectId%20%3D%20\'${pollObjectId}\'%20AND%20options.members.email%3D%20\'${userEmail}\'',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckIfUserHasPlayedQuizCall {
  Future<ApiCallResponse> call({
    String? userObjectId = '',
    String? pollObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Check if user has played quiz',
      apiUrl:
          '${baseUrl}/data/Polls?where=objectId%20%3D%20\'${pollObjectId}\'%20AND%20quizEntries.ownerId%3D%20\'${userObjectId}\'',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckIfUserHasSubmittedAFormCall {
  Future<ApiCallResponse> call({
    String? userObjectId = '',
    String? pollObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Check if user has submitted a form',
      apiUrl:
          '${baseUrl}/data/Polls?where=objectId%20%3D%20\'${pollObjectId}\'%20AND%20formEntries.ownerId%3D%20\'${userObjectId}\'',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckForPollsWithRelatedMatchesCall {
  Future<ApiCallResponse> call({
    int? currentTime,
    String? matchObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Check for polls with related matches',
      apiUrl:
          '${baseUrl}/data/Polls?where=endDatetime%20%3E%20\'${currentTime}\'%20AND%20startDatetime%20%3C%20\'${currentTime}\'%20AND%20relatedMatch.objectId%20%3D%20\'${matchObjectId}\'',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckForAllPollsCall {
  Future<ApiCallResponse> call({
    int? currentTime,
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Check for all polls',
      apiUrl:
          '${baseUrl}/data/Polls?pageSize=100&where=endDatetime%20%3E%20\'${currentTime}\'%20AND%20startDatetime%20%3C%20\'${currentTime}\'',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

// ---------------------------------------------------------------------------
// Lineups builder calls
// ---------------------------------------------------------------------------

class PlayersForLineupsBuilderCall {
  Future<ApiCallResponse> call({
    String? teamObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Players for Lineups Builder',
      apiUrl:
          '${baseUrl}/data/players?pageSize=100&where=(%60Position%60%20%3D%20\'01%20-%20Goalkeeper\'%20OR%20%60Position%60%20%3D%20\'02%20-%20Defender\'%20OR%20%60Position%60%20%3D%20\'03%20-%20Midfielder\'%20OR%20%60Position%60%20%3D%20\'04%20-%20Striker\')%20AND%20(%60team%60.%60objectId%60%20%3D%20\'${teamObjectId}\')&property=%60PlayerName%60&property=%60PlayerPictureurl%60&property=%60objectId%60&property=%60posAbr%60&sortBy=%60number%60%20asc%2C%60Position%60%20asc%2C%60PlayerName%60%20asc',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddLineupsBuilderEntryCall {
  Future<ApiCallResponse> call({
    String? userName = '',
    dynamic selectedPlayersJson,
    String? playerMap = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    final selectedPlayers = serializeJson(selectedPlayersJson);
    final ffApiRequestBody = '''
{
  "userName": "${escapeStringForJson(userName)}",
  "playerMap": "${escapeStringForJson(playerMap)}",
  "selectedPlayers": ${selectedPlayers}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Lineups Builder Entry',
      apiUrl: '${baseUrl}/data/lineupsBuilder',
      callType: ApiCallType.POST,
      headers: {'Content-Type': 'application/json'},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddMatchToLineupsBuilderEntryCall {
  Future<ApiCallResponse> call({
    String? lineupsObjectId = '',
    String? matchObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    final ffApiRequestBody = '''
[
  "${escapeStringForJson(matchObjectId)}"
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Match to Lineups Builder Entry',
      apiUrl: '${baseUrl}/data/lineupsBuilder/${lineupsObjectId}/relatedMatch',
      callType: ApiCallType.POST,
      headers: {'Content-Type': 'application/json'},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetLineupsBuilderEntryByIDCall {
  Future<ApiCallResponse> call({
    String? objectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Lineups Builder Entry by ID',
      apiUrl: '${baseUrl}/data/lineupsBuilder/${objectId}',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckIfLineupsBuilderHasBeenPlayedForMatchCall {
  Future<ApiCallResponse> call({
    String? ownerId = '',
    String? matchObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Check if Lineups Builder has been played for match',
      apiUrl:
          '${baseUrl}/data/lineupsBuilder?where=%60ownerId%60%20%3D%20\'${ownerId}\'%20AND%20%60relatedMatch%60.%60objectId%60%20%3D%20\'${matchObjectId}\'&property=%60objectId%60',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LineupsBuilderCacheCall {
  Future<ApiCallResponse> call({
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Lineups builder cache',
      apiUrl: '${baseUrl}/cache/lineupsBuilder',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SetLineupsBuilderCacheCall {
  Future<ApiCallResponse> call({
    dynamic valueeJson,
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    final valuee = serializeJson(valueeJson);
    final ffApiRequestBody = '''
${valuee}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Set Lineups builder cache',
      apiUrl: '${baseUrl}/cache/lineupsBuilder',
      callType: ApiCallType.PUT,
      headers: {'Content-Type': 'application/json'},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

// ---------------------------------------------------------------------------
// Quiz entry calls
// ---------------------------------------------------------------------------

class AddQuizEntryCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? name = '',
    int? pointsScored = 0,
    int? totalPointsAvailable = 0,
    String? uid = '',
    String? ownerId = '',
    dynamic breakdownJson,
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    final breakdown = serializeJson(breakdownJson);
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "name": "${escapeStringForJson(name)}",
  "pointsScored": ${pointsScored},
  "totalPointsAvailable": ${totalPointsAvailable},
  "uid": "${escapeStringForJson(uid)}",
  "breakdown": ${breakdown},
  "ownerId": "${escapeStringForJson(ownerId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Quiz Entry',
      apiUrl: '${baseUrl}/data/QuizEntries',
      callType: ApiCallType.POST,
      headers: {'Content-Type': 'application/json'},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddQuizEntryToPollCall {
  Future<ApiCallResponse> call({
    String? pollObjectId = '',
    String? quizEntryObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    final ffApiRequestBody = '''
[
  "${escapeStringForJson(quizEntryObjectId)}"
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Quiz Entry to Poll',
      apiUrl: '${baseUrl}/data/Polls/${pollObjectId}/quizEntries',
      callType: ApiCallType.POST,
      headers: {'Content-Type': 'application/json'},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

// ---------------------------------------------------------------------------
// Commercial events / payment plans
// ---------------------------------------------------------------------------

class GetUpcomingCommercialEventsCall {
  Future<ApiCallResponse> call({
    int? currentTime,
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get upcoming commercial events',
      apiUrl:
          '${baseUrl}/data/commercialEvents?where=%60endDatetime%60%20%3E%20\'${currentTime}\'',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCommercialEventByIDCall {
  Future<ApiCallResponse> call({
    String? eventObjectId = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get commercial event by ID',
      apiUrl: '${baseUrl}/data/commercialEvents/${eventObjectId}',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPaymentPlansForSeasonCall {
  Future<ApiCallResponse> call({
    String? season = '',
    String? bLProjectId = '',
    String? bLRestAPIKey = '',
  }) async {
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get payment plans for season',
      apiUrl:
          '${baseUrl}/data/paymentPlans?where=%60season%60%20%3D%20\'${season}\'%20AND%20%60type%60%20%3D%20\'youth\'',
      callType: ApiCallType.GET,
      headers: {'Content-Type': 'application/json'},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

// CalendarStatusCall lives in misc_endpoints.dart (already exported from api_client).
