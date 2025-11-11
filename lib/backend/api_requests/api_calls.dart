import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Backendless Database Group Code

class BackendlessDatabaseGroup {
  static String getBaseUrl({
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    return 'https://api.touchlineclub.com:7500/${bLProjectId}/${bLRestAPIKey}';
  }

  static Map<String, String> headers = {
    '[headerName]': '[headerValue]',
  };
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

class UpcomingSixFixturesCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UpcomingSixFixtures',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=6&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class NextFixtureSliderDetailsCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Next Fixture Slider Details',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=6&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&property=%60AwayBadge%60&property=%60HomeBadge%60&property=%60start%60&property=%60objectId%60&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class PredictorNextGameCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PredictorNextGame',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=1&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&property=%60AwayBadge%60&property=%60HomeBadge%60&property=%60start%60&property=%60objectId%60&property=%60AwayAbr%60&property=%60HomeAbr%60&property=%60HomeTeamName%60&property=%60AwayTeamName%60&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class AllUpcomingCall {
  Future<ApiCallResponse> call({
    int? time,
    int? season = 20245,
    String? teamObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'AllUpcoming',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=100&where=end%20%3C%20\'${time}\'%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'%20AND%20season%20%3D%20${season}&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class UpcomingOneFixturesCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UpcomingOneFixtures',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=1&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class UpcomingOneFixturesStartEndCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UpcomingOneFixtures Start End',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=1&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&property=%60start%60&property=%60end%60&property=%60objectId%60&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class UpcomingOneFixturesObjectIDONLYCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UpcomingOneFixtures ObjectID ONLY',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=1&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&property=objectId&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class UpcomingOneFixturesObjectIdStartEventTimelineCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UpcomingOneFixtures objectId start eventTimeline',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=1&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&property=%60objectId%60&property=%60start%60&property=%60eventTimeline%60&property=%60awayTeamId%60&property=%60homeTeamId%60&property=%60predictor%60&property=%60tickets%60&property=%60scoreOnlyFT%60&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class TopLevelFixtureDetailsCall {
  Future<ApiCallResponse> call({
    int? time,
    String? teamObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Top Level Fixture Details',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=1&where=end%20%3E%20\'${time}\'%20AND%20isPostponed%20%3D%20FALSE%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'&property=%60AwayAbr%60&property=%60AwayBadge%60&property=%60awayGoals%60&property=%60awayPenalties%60&property=%60awayPenaltyBreakdown%60&property=%60awayTeamId%60&property=%60AwayTeamName%60&property=%60city%60&property=%60comp%60&property=%60end%60&property=%60eventTimeline%60&property=%60halfStartTimestamp%60&property=%60HomeAbr%60&property=%60HomeBadge%60&property=%60homeGoals%60&property=%60homePenalties%60&property=%60homePenaltyBreakdown%60&property=%60homeTeamId%60&property=%60HomeTeamName%60&property=%60isPostponed%60&property=%60leagueBadgeUrl%60&property=%60location%60&property=%60matchBackground%60&property=%60objectId%60&property=%60outputStatus%60&property=%60penaltiesText%60&property=%60penaltyShootout%60&property=%60postponedText%60&property=%60predictor%60&property=%60stadiumName%60&property=%60start%60&property=%60status%60&property=%60tickets%60&property=%60updated%60&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class AllResultsCall {
  Future<ApiCallResponse> call({
    int? time,
    int? season,
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    season ??= FFAppConstants.defaultSeason;
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'All Results',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=100&where=end%20%3C%20\'${time}\'%20AND%20season%20%3D%20${season}&property=%60AwayBadge%60&property=%60awayGoals%60&property=%60AwayTeamName%60&property=%60comp%60&property=%60highlights%60&property=%60interview%60&property=%60HomeBadge%60&property=%60homeGoals%60&property=%60HomeTeamName%60&property=%60report%60&property=%60isPostponed%60&property=%60postponedText%60&property=%60start%60&property=%60objectId%60&sortBy=%60start%60%20desc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class AllFixturesCall {
  Future<ApiCallResponse> call({
    int? time,
    int? season,
    String? teamObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    season ??= FFAppConstants.defaultSeason;
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'All Fixtures',
      apiUrl:
          '${baseUrl}/data/Fixtures?pageSize=100&where=end%20%3E%20\'${time}\'%20AND%20team.objectId%20%3D%20\'${teamObjectId}\'%20AND%20season%20%3D%20${season}&property=%60HomeAbr%60&property=%60HomeTeamName%60&property=%60AwayTeamName%60&property=%60HomeBadge%60&property=%60AwayBadge%60&property=%60predictor%60&property=%60tickets%60&property=%60comp%60&property=%60start%60&property=%60objectId%60&property=%60isPostponed%60&property=%60postponedText%60&sortBy=%60start%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class PlayPredictorOneCall {
  Future<ApiCallResponse> call({
    int? awayScore,
    int? homeScore,
    String? email = '',
    String? name = '',
    String? scorerName = '',
    String? uid = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
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
      headers: {
        '${headerName}': '${headerValue}',
      },
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
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    final ffApiRequestBody = '''
{
  "objectId": "${objectIdToAdd}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'playPredictorTwo',
      apiUrl: '${baseUrl}/data/PredictorEntries/${objectId}/match',
      callType: ApiCallType.POST,
      headers: {
        '${headerName}': '${headerValue}',
      },
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
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'checkIfTheyvePlayedPredictorThisWeek',
      apiUrl:
          '${baseUrl}/data/PredictorEntries?where=match.objectId%20%3D%20\'${matchObjectId}\'%20AND%20uid%20%3D%20\'${uid}\'&property=%60objectId%60',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetSpecificFixtureCall {
  Future<ApiCallResponse> call({
    String? objectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetSpecificFixture',
      apiUrl:
          '${baseUrl}/data/Fixtures/${objectId}?loadRelations=team%2Csponsorship',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetSpecificFixtureTopLevelDetailsCall {
  Future<ApiCallResponse> call({
    String? objectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetSpecificFixture Top Level Details',
      apiUrl:
          '${baseUrl}/data/Fixtures/${objectId}?property=%60AwayAbr%60&property=%60scoreOnlyFT%60&property=%60overallAttendance%60&property=%60awayAttendance%60&property=%60AwayBadge%60&property=%60awayGoals%60&property=%60awayPenalties%60&property=%60awayPenaltyBreakdown%60&property=%60awayTeamId%60&property=%60AwayTeamName%60&property=%60city%60&property=%60comp%60&property=%60end%60&property=%60eventTimeline%60&property=%60halfStartTimestamp%60&property=%60HomeAbr%60&property=%60HomeBadge%60&property=%60homeGoals%60&property=%60homePenalties%60&property=%60homePenaltyBreakdown%60&property=%60homeTeamId%60&property=%60HomeTeamName%60&property=%60isPostponed%60&property=%60leagueBadgeUrl%60&property=%60location%60&property=%60matchBackground%60&property=%60objectId%60&property=%60outputStatus%60&property=%60penaltiesText%60&property=%60penaltyShootout%60&property=%60postponedText%60&property=%60predictor%60&property=%60stadiumName%60&property=%60start%60&property=%60status%60&property=%60tickets%60&property=%60updated%60&loadRelations=team%2Csponsorship',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetStatsForMatchCall {
  Future<ApiCallResponse> call({
    String? objectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getStatsForMatch',
      apiUrl:
          '${baseUrl}/data/Stats?where=relatedMatch.objectId%20%3D%20\'${objectId}\'',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class PredictorHistoryCall {
  Future<ApiCallResponse> call({
    String? uid = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PredictorHistory',
      apiUrl:
          '${baseUrl}/data/PredictorEntries?where=uid%20%3D%20\'${uid}\'&property=match.AwayABR%20as%20AwayABR&property=match.AwayBadge%20as%20awayBadge&property=match.HomeABR%20as%20HomeABR&property=match.HomeBadge%20as%20homeBadge&property=%60awayScore%60&property=%60bonusPoints%60&property=%60created%60&property=%60email%60&property=%60entryPoints%60&property=%60homeScore%60&property=%60name%60&property=%60ownerId%60&property=%60pointsForScore%60&property=%60pointsForScorer%60&property=%60scorerName%60&property=%60uid%60&sortBy=%60created%60%20desc&pageSize=100',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetTopTenOfPredictorTableCall {
  Future<ApiCallResponse> call({
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Top Ten of Predictor Table',
      apiUrl:
          '${baseUrl}/data/PredictorTable?pageSize=10&sortBy=%60rank%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetUsersPredictorStatsCall {
  Future<ApiCallResponse> call({
    String? uid = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Users Predictor Stats',
      apiUrl: '${baseUrl}/data/PredictorTable?where=uid%20%3D%20\'${uid}\'',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class NewLeagueTableCall {
  Future<ApiCallResponse> call({
    String? sort = 'rank',
    String? sortDir = 'asc',
    String? gDterm = 'GoalDifference',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'NewLeagueTable',
      apiUrl:
          '${baseUrl}/data/LeagueTable?pageSize=30&sortBy=%60${sort}%60%20${sortDir}%2C%60${gDterm}%60%20desc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class NewLeagueTableDetailsOnlyCall {
  Future<ApiCallResponse> call({
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'NewLeagueTable DetailsOnly',
      apiUrl:
          '${baseUrl}/data/LeagueTable?pageSize=30&property=%60rank%60&property=%60imageURL%60&property=%60name%60&property=%60OverallMatchesPlayed%60&property=%60goalDiff%60&property=%60GoalDifference%60&property=%60points%60&property=%60OverallPoints%60&property=%60played%60&sortBy=%60rank%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetAllFixturesWithAProgrammeCall {
  Future<ApiCallResponse> call({
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetAllFixturesWithAProgramme',
      apiUrl: '${baseUrl}/data/Fixtures?where=programmeFileURL%20!%3D%20null',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class PlayerNewSquadHubCall {
  Future<ApiCallResponse> call({
    String? sort = 'number',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PlayerNewSquadHub',
      apiUrl:
          '${baseUrl}/data/players?pageSize=100&where=showInSquadHub%20%3D%20TRUE&property=%60PlayerName%60&property=%60PlayerPictureurl%60&property=%60objectId%60&property=%60number%60&property=%60onLoan%60&property=%60loanEndDate%60&property=%60loaned%60&property=%60loanClub%60&property=%60loanBadge%60&sortBy=%60${sort}%60%20asc%2C%60PlayerName%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class PlayerNewPredictorCall {
  Future<ApiCallResponse> call({
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PlayerNewPredictor',
      apiUrl:
          '${baseUrl}/data/players?pageSize=100&where=showInGame%20%3D%20TRUE&property=%60PlayerName%60&property=%60PlayerPictureurl%60&property=%60objectId%60',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetSpecificPlayerCall {
  Future<ApiCallResponse> call({
    String? playerObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetSpecificPlayer',
      apiUrl:
          '${baseUrl}/data/players/${playerObjectId}?loadRelations=sponsorship',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetMatchGalleryItemsForMatchCall {
  Future<ApiCallResponse> call({
    String? matchObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Match Gallery Items for match',
      apiUrl:
          '${baseUrl}/data/matchGallery?where=relatedMatch.objectId%20%3D%20\'${matchObjectId}\'',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class SponsorAdsCall {
  Future<ApiCallResponse> call({
    String? locationKey = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'sponsor ads',
      apiUrl:
          '${baseUrl}/data/SponsorAds?where=location%20%3D%20\'${locationKey}\'&sortBy=%60sortOrder%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetInternalContentForASpecifedKeyCall {
  Future<ApiCallResponse> call({
    String? pageKey = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Internal Content for a specifed key',
      apiUrl:
          '${baseUrl}/data/InternalPages?where=Title%20%3D%20\'${pageKey}\'%20AND%20visible%20%3D%20TRUE&sortBy=%60sortOrder%60%20asc&loadRelations=containedPages',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetPagesWhereContainedEqualsTermCall {
  Future<ApiCallResponse> call({
    String? pageKey = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get pages where contained equals term',
      apiUrl:
          '${baseUrl}/data/InternalPages?where=InternalPages%5BcontainedPages%5D.Title%3D\'${pageKey}\'%20AND%20visible%20%3D%20TRUE&sortBy=%60sortOrder%60%20asc&loadRelations=containedPages&pageSize=100',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetStaticPageContentByIDCall {
  Future<ApiCallResponse> call({
    String? pageObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get static page content by ID',
      apiUrl: '${baseUrl}/data/InternalPages/${pageObjectId}',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetSpecificPollCall {
  Future<ApiCallResponse> call({
    String? pollObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get specific poll',
      apiUrl:
          '${baseUrl}/data/Polls/${pollObjectId}?loadRelations=options%2CrelatedMatch',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetSpecificGenericPollCall {
  Future<ApiCallResponse> call({
    String? pollObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get specific generic  poll',
      apiUrl:
          '${baseUrl}/data/Polls/${pollObjectId}?loadRelations=formFields%2Coptions%2CquizQuestions%2CquizQuestions.questionOptions',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class CheckIfUserHasVotedCall {
  Future<ApiCallResponse> call({
    String? userEmail = '',
    String? pollObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Check if user has voted',
      apiUrl:
          '${baseUrl}/data/Polls?where=objectId%20%3D%20\'${pollObjectId}\'%20AND%20options.members.email%3D%20\'${userEmail}\'',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class CheckIfUserHasPlayedQuizCall {
  Future<ApiCallResponse> call({
    String? userObjectId = '',
    String? pollObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Check if user has played quiz',
      apiUrl:
          '${baseUrl}/data/Polls?where=objectId%20%3D%20\'${pollObjectId}\'%20AND%20quizEntries.ownerId%3D%20\'${userObjectId}\'',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class CheckIfUserHasSubmittedAFormCall {
  Future<ApiCallResponse> call({
    String? userObjectId = '',
    String? pollObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Check if user has submitted a form',
      apiUrl:
          '${baseUrl}/data/Polls?where=objectId%20%3D%20\'${pollObjectId}\'%20AND%20formEntries.ownerId%3D%20\'${userObjectId}\'',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class CheckForPollsWithRelatedMatchesCall {
  Future<ApiCallResponse> call({
    int? currentTime,
    String? matchObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Check for polls with related matches',
      apiUrl:
          '${baseUrl}/data/Polls?where=endDatetime%20%3E%20\'${currentTime}\'%20AND%20startDatetime%20%3C%20\'${currentTime}\'%20AND%20relatedMatch.objectId%20%3D%20\'${matchObjectId}\'',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class CheckForAllPollsCall {
  Future<ApiCallResponse> call({
    int? currentTime,
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Check for all polls',
      apiUrl:
          '${baseUrl}/data/Polls?pageSize=100&where=endDatetime%20%3E%20\'${currentTime}\'%20AND%20startDatetime%20%3C%20\'${currentTime}\'',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetLiveTextItemsForRelatedMatchCall {
  Future<ApiCallResponse> call({
    String? matchObjectId = '',
    int? currentTime,
    int? pageSize = 20,
    int? offset = 0,
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Live Text Items for related Match',
      apiUrl:
          '${baseUrl}/data/liveText?pageSize=${pageSize}&offset=${offset}&where=%60postToLiveTextFeed%60%20%3D%20TRUE%20AND%20%60relatedMatch%60.%60objectId%60%20%3D%20\'${matchObjectId}\'%20AND%20%60created%60%20%3C%20\'${currentTime}\'&sortBy=%60created%60%20desc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class PlayersForLineupsBuilderCall {
  Future<ApiCallResponse> call({
    String? teamObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Players for Lineups Builder',
      apiUrl:
          '${baseUrl}/data/players?pageSize=100&where=(%60Position%60%20%3D%20\'01%20-%20Goalkeeper\'%20OR%20%60Position%60%20%3D%20\'02%20-%20Defender\'%20OR%20%60Position%60%20%3D%20\'03%20-%20Midfielder\'%20OR%20%60Position%60%20%3D%20\'04%20-%20Striker\')%20AND%20(%60team%60.%60objectId%60%20%3D%20\'${teamObjectId}\')&property=%60PlayerName%60&property=%60PlayerPictureurl%60&property=%60objectId%60&property=%60posAbr%60&sortBy=%60number%60%20asc%2C%60Position%60%20asc%2C%60PlayerName%60%20asc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class AddLineupsBuilderEntryCall {
  Future<ApiCallResponse> call({
    String? userName = '',
    dynamic selectedPlayersJson,
    String? playerMap = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    final selectedPlayers = _serializeJson(selectedPlayersJson);
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
      headers: {
        '${headerName}': '${headerValue}',
      },
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
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    final ffApiRequestBody = '''
[
  "${escapeStringForJson(matchObjectId)}"
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Match to Lineups Builder Entry',
      apiUrl: '${baseUrl}/data/lineupsBuilder/${lineupsObjectId}/relatedMatch',
      callType: ApiCallType.POST,
      headers: {
        '${headerName}': '${headerValue}',
      },
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
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Lineups Builder Entry by ID',
      apiUrl: '${baseUrl}/data/lineupsBuilder/${objectId}',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class CheckIfLineupsBuilderHasBeenPlayedForMatchCall {
  Future<ApiCallResponse> call({
    String? ownerId = '',
    String? matchObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Check if Lineups Builder has been played for match',
      apiUrl:
          '${baseUrl}/data/lineupsBuilder?where=%60ownerId%60%20%3D%20\'${ownerId}\'%20AND%20%60relatedMatch%60.%60objectId%60%20%3D%20\'${matchObjectId}\'&property=%60objectId%60',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class LineupsBuilderCacheCall {
  Future<ApiCallResponse> call({
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Lineups builder cache',
      apiUrl: '${baseUrl}/cache/lineupsBuilder',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class SetLineupsBuilderCacheCall {
  Future<ApiCallResponse> call({
    dynamic valueeJson,
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    final valuee = _serializeJson(valueeJson);
    final ffApiRequestBody = '''
${valuee}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Set Lineups builder cache',
      apiUrl: '${baseUrl}/cache/lineupsBuilder',
      callType: ApiCallType.PUT,
      headers: {
        '${headerName}': '${headerValue}',
      },
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

class AddQuizEntryCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? name = '',
    int? pointsScored = 0,
    int? totalPointsAvailable = 0,
    String? uid = '',
    String? ownerId = '',
    dynamic breakdownJson,
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    final breakdown = _serializeJson(breakdownJson);
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
      headers: {
        '${headerName}': '${headerValue}',
      },
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
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    final ffApiRequestBody = '''
[
  "${escapeStringForJson(quizEntryObjectId)}"
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Quiz Entry to Poll',
      apiUrl: '${baseUrl}/data/Polls/${pollObjectId}/quizEntries',
      callType: ApiCallType.POST,
      headers: {
        '${headerName}': '${headerValue}',
      },
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

class GetUpcomingCommercialEventsCall {
  Future<ApiCallResponse> call({
    int? currentTime,
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get upcoming commercial events',
      apiUrl:
          '${baseUrl}/data/commercialEvents?where=%60endDatetime%60%20%3E%20\'${currentTime}\'',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetCommercialEventByIDCall {
  Future<ApiCallResponse> call({
    String? eventObjectId = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get commercial event by ID',
      apiUrl: '${baseUrl}/data/commercialEvents/${eventObjectId}',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetPaymentPlansForSeasonCall {
  Future<ApiCallResponse> call({
    String? season = '',
    String? bLProjectId,
    String? bLRestAPIKey,
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    bLProjectId ??= FFLibraryValues().BLProjectId;
    bLRestAPIKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = BackendlessDatabaseGroup.getBaseUrl(
      bLProjectId: bLProjectId,
      bLRestAPIKey: bLRestAPIKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get payment plans for season',
      apiUrl:
          '${baseUrl}/data/paymentPlans?where=%60season%60%20%3D%20\'${season}\'%20AND%20%60type%60%20%3D%20\'youth\'',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

/// End Backendless Database Group Code

/// Start Wordpress Websites Group Code

class WordpressWebsitesGroup {
  static String getBaseUrl({
    String? websiteBaseUrl = '',
  }) =>
      'https://${websiteBaseUrl}/wp-json/wp/v2';
  static Map<String, String> headers = {};
  static NewsCall newsCall = NewsCall();
  static NewsOneHundredCall newsOneHundredCall = NewsOneHundredCall();
}

class NewsCall {
  Future<ApiCallResponse> call({
    String? websiteBaseUrl = '',
  }) async {
    final baseUrl = WordpressWebsitesGroup.getBaseUrl(
      websiteBaseUrl: websiteBaseUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'News',
      apiUrl: '${baseUrl}/posts',
      callType: ApiCallType.GET,
      headers: {},
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

class NewsOneHundredCall {
  Future<ApiCallResponse> call({
    String? websiteBaseUrl = '',
  }) async {
    final baseUrl = WordpressWebsitesGroup.getBaseUrl(
      websiteBaseUrl: websiteBaseUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'News One Hundred',
      apiUrl: '${baseUrl}/posts?per_page=100&page=1',
      callType: ApiCallType.GET,
      headers: {},
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

/// End Wordpress Websites Group Code

/// Start CMS Group Code

class CmsGroup {
  static String getBaseUrl({
    String? bLappId = '',
    String? bLRestApiKey = '',
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) =>
      'https://api.touchlineclub.com:7500/${bLappId}/${bLRestApiKey}';
  static Map<String, String> headers = {
    '[headerName]': '[headerValue]',
  };
  static GetLatestPostsCall getLatestPostsCall = GetLatestPostsCall();
  static GetCMSPostByIDCall getCMSPostByIDCall = GetCMSPostByIDCall();
  static RemoveLikeFromPostCall removeLikeFromPostCall =
      RemoveLikeFromPostCall();
  static AddLikeToPostCall addLikeToPostCall = AddLikeToPostCall();
  static GetRequiredCampaignsCall getRequiredCampaignsCall =
      GetRequiredCampaignsCall();
  static UpdateAppClicksForCampaignCall updateAppClicksForCampaignCall =
      UpdateAppClicksForCampaignCall();
}

class GetLatestPostsCall {
  Future<ApiCallResponse> call({
    int? number,
    int? currentTime,
    String? bLappId = '',
    String? bLRestApiKey = '',
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    final baseUrl = CmsGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get latest posts',
      apiUrl:
          '${baseUrl}/data/CMSContent?pageSize=${number}&where=%60outputPostDate%60%20%3C%20\'${currentTime}\'&property=%60outputPostDate%60&property=%60objectId%60&property=%60title%60&property=%60shortBody%60&property=%60imageUrl%60&sortBy=%60outputPostDate%60%20desc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class GetCMSPostByIDCall {
  Future<ApiCallResponse> call({
    String? cmsPostObjectId = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    final baseUrl = CmsGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get CMS Post by ID',
      apiUrl: '${baseUrl}/data/CMSContent/${cmsPostObjectId}',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

class RemoveLikeFromPostCall {
  Future<ApiCallResponse> call({
    String? postObjectId = '',
    String? userObjectId = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    final baseUrl = CmsGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Remove like from post',
      apiUrl:
          '${baseUrl}/data/CMSContent/${postObjectId}/likedUsers?whereClause=ownerId%20%3D%20\'${userObjectId}\'&loadRelations=likedUsers',
      callType: ApiCallType.DELETE,
      headers: {
        '${headerName}': '${headerValue}',
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

class AddLikeToPostCall {
  Future<ApiCallResponse> call({
    String? postObjectId = '',
    String? userObjectId = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    final baseUrl = CmsGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    final ffApiRequestBody = '''
["${escapeStringForJson(userObjectId)}"]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Like to post',
      apiUrl: '${baseUrl}/data/CMSContent/${postObjectId}/likedUsers',
      callType: ApiCallType.PUT,
      headers: {
        '${headerName}': '${headerValue}',
      },
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

class GetRequiredCampaignsCall {
  Future<ApiCallResponse> call({
    int? currentTime,
    String? bLappId = '',
    String? bLRestApiKey = '',
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    final baseUrl = CmsGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get required campaigns',
      apiUrl:
          '${baseUrl}/data/campaigns?pageSize=10&offset=0&where=%60startDatetime%60%20%3C%20\'${currentTime}\'%20AND%20%60endDatetime%60%20%3E%20\'${currentTime}\'%20AND%20%60mobileOnOff%60%20%3D%20TRUE&sortBy=%60sortOrder%60%20desc',
      callType: ApiCallType.GET,
      headers: {
        '${headerName}': '${headerValue}',
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

  List<String>? objectIdList(dynamic response) => (getJsonField(
        response,
        r'''$[:].objectId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class UpdateAppClicksForCampaignCall {
  Future<ApiCallResponse> call({
    int? mobileClick = 1,
    String? campaignObjectId = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
    String? headerName = 'Content-Type',
    String? headerValue = 'application/json',
  }) async {
    final baseUrl = CmsGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
      headerName: headerName,
      headerValue: headerValue,
    );

    final ffApiRequestBody = '''
{
  "mobile_click": ${mobileClick}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update app clicks for campaign',
      apiUrl: '${baseUrl}/data/campaigns/${campaignObjectId}',
      callType: ApiCallType.PUT,
      headers: {
        '${headerName}': '${headerValue}',
      },
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

/// End CMS Group Code

/// Start CRM Group Code

class CrmGroup {
  static String getBaseUrl({
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) =>
      'https://api.touchlineclub.com:7500/6B04E1E8-E97A-F586-FF06-64D80C519D00/D5E4193A-D1DB-4A18-957B-B45A0CAEFC78/services/clubCRM';
  static Map<String, String> headers = {};
  static QueryEmailCall queryEmailCall = QueryEmailCall();
  static AddActivityCall addActivityCall = AddActivityCall();
}

class QueryEmailCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = CrmGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
{
  "queryEmail": "${escapeStringForJson(email)}",
  "BLappId": "${escapeStringForJson(bLappId)}",
  "BLRestApiKey": "${escapeStringForJson(bLRestApiKey)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Query Email',
      apiUrl: '${baseUrl}/lookupEmail',
      callType: ApiCallType.POST,
      headers: {},
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
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
}

class AddActivityCall {
  Future<ApiCallResponse> call({
    String? targetEmail = '',
    String? activityType = '',
    String? activityOtherInfo = '',
    double? activityValue,
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = CrmGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
{
  "BLappId": "${escapeStringForJson(bLappId)}",
  "BLRestApiKey": "${escapeStringForJson(bLRestApiKey)}",
  "targetEmail": "${escapeStringForJson(targetEmail)}",
  "activityType": "${escapeStringForJson(activityType)}",
  "activityOtherInfo": "${escapeStringForJson(activityOtherInfo)}",
  "activityValue": ${activityValue}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddActivity',
      apiUrl: '${baseUrl}/addActivity',
      callType: ApiCallType.POST,
      headers: {},
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

/// End CRM Group Code

/// Start Teams Group Code

class TeamsGroup {
  static String getBaseUrl({
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) =>
      'https://api.touchlineclub.com:7500/${bLappId}/${bLRestApiKey}';
  static Map<String, String> headers = {
    'user-token': '[userToken]',
  };
  static GetTeamsCall getTeamsCall = GetTeamsCall();
  static GetTeamRequestsCall getTeamRequestsCall = GetTeamRequestsCall();
  static FollowPublicTeamCall followPublicTeamCall = FollowPublicTeamCall();
  static RequestAPrivateTeamCall requestAPrivateTeamCall =
      RequestAPrivateTeamCall();
  static AddTeamToPrivateTeamRequestCall addTeamToPrivateTeamRequestCall =
      AddTeamToPrivateTeamRequestCall();
  static AddUserToPrivateTeamRequestCall addUserToPrivateTeamRequestCall =
      AddUserToPrivateTeamRequestCall();
  static DeleteRequestForPrivateTeamCall deleteRequestForPrivateTeamCall =
      DeleteRequestForPrivateTeamCall();
  static UnfollowTeamCall unfollowTeamCall = UnfollowTeamCall();
  static RemoveRSVPForTeamEventCall removeRSVPForTeamEventCall =
      RemoveRSVPForTeamEventCall();
  static GetTeamEventByIDCall getTeamEventByIDCall = GetTeamEventByIDCall();
  static AddRSVPToTeamEventCall addRSVPToTeamEventCall =
      AddRSVPToTeamEventCall();
  static GetYouthSystemTeamsCall getYouthSystemTeamsCall =
      GetYouthSystemTeamsCall();
}

class GetTeamsCall {
  Future<ApiCallResponse> call({
    String? whereClause = 'category%20IS%20NOT%20NULL',
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = TeamsGroup.getBaseUrl(
      userToken: userToken,
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Teams',
      apiUrl: '${baseUrl}/data/teams?where=${whereClause}',
      callType: ApiCallType.GET,
      headers: {
        'user-token': '${userToken}',
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

class GetTeamRequestsCall {
  Future<ApiCallResponse> call({
    String? userObjectId = '',
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = TeamsGroup.getBaseUrl(
      userToken: userToken,
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Team Requests',
      apiUrl:
          '${baseUrl}/data/teamRequests/data/teamRequests?where=%60ownerId%60%20%3D%20\'${userObjectId}\'',
      callType: ApiCallType.GET,
      headers: {
        'user-token': '${userToken}',
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

class FollowPublicTeamCall {
  Future<ApiCallResponse> call({
    String? teamObjectId = '',
    String? userObjectId = '',
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = TeamsGroup.getBaseUrl(
      userToken: userToken,
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
[
  "${escapeStringForJson(teamObjectId)}"
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Follow Public Team',
      apiUrl: '${baseUrl}/data/Users/${userObjectId}/teams',
      callType: ApiCallType.PUT,
      headers: {
        'user-token': '${userToken}',
      },
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

class RequestAPrivateTeamCall {
  Future<ApiCallResponse> call({
    String? note = '',
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = TeamsGroup.getBaseUrl(
      userToken: userToken,
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
{
  "note": "${escapeStringForJson(note)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Request A Private Team',
      apiUrl: '${baseUrl}/data/teamRequests',
      callType: ApiCallType.POST,
      headers: {
        'user-token': '${userToken}',
      },
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

class AddTeamToPrivateTeamRequestCall {
  Future<ApiCallResponse> call({
    String? requestObjectId = '',
    String? teamObjectId = '',
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = TeamsGroup.getBaseUrl(
      userToken: userToken,
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
[
  "${escapeStringForJson(teamObjectId)}"
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Team To Private Team Request',
      apiUrl: '${baseUrl}/data/teamRequests/${requestObjectId}/team',
      callType: ApiCallType.POST,
      headers: {
        'user-token': '${userToken}',
      },
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

class AddUserToPrivateTeamRequestCall {
  Future<ApiCallResponse> call({
    String? requestObjectId = '',
    String? userObjectId = '',
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = TeamsGroup.getBaseUrl(
      userToken: userToken,
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
[
  "${escapeStringForJson(userObjectId)}"
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add User To Private Team Request',
      apiUrl: '${baseUrl}/data/teamRequests/${requestObjectId}/fromUser',
      callType: ApiCallType.POST,
      headers: {
        'user-token': '${userToken}',
      },
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

class DeleteRequestForPrivateTeamCall {
  Future<ApiCallResponse> call({
    String? requestObjectId = '',
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = TeamsGroup.getBaseUrl(
      userToken: userToken,
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Request For Private Team',
      apiUrl: '${baseUrl}/data/teamRequests/${requestObjectId}',
      callType: ApiCallType.DELETE,
      headers: {
        'user-token': '${userToken}',
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

class UnfollowTeamCall {
  Future<ApiCallResponse> call({
    String? userObjectId = '',
    String? teamObjectId = '',
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = TeamsGroup.getBaseUrl(
      userToken: userToken,
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Unfollow Team',
      apiUrl:
          '${baseUrl}/data/Users/${userObjectId}/teams?whereClause=%60objectId%60%20%3D%20\'${teamObjectId}\'',
      callType: ApiCallType.DELETE,
      headers: {
        'user-token': '${userToken}',
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

class RemoveRSVPForTeamEventCall {
  Future<ApiCallResponse> call({
    String? playerObjectId = '',
    String? teamEventObjectId = '',
    String? rsvp = '',
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = TeamsGroup.getBaseUrl(
      userToken: userToken,
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Remove RSVP for Team Event',
      apiUrl:
          '${baseUrl}/data/teamEvents/${teamEventObjectId}/rsvp${rsvp}?whereClause=%60objectId%60%20%3D%20\'${playerObjectId}\'',
      callType: ApiCallType.DELETE,
      headers: {
        'user-token': '${userToken}',
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

class GetTeamEventByIDCall {
  Future<ApiCallResponse> call({
    String? eventObjectId = '',
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = TeamsGroup.getBaseUrl(
      userToken: userToken,
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Team Event By ID',
      apiUrl: '${baseUrl}/data/teamEvents/${eventObjectId}',
      callType: ApiCallType.GET,
      headers: {
        'user-token': '${userToken}',
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

class AddRSVPToTeamEventCall {
  Future<ApiCallResponse> call({
    String? teamEventObjectId = '',
    String? rsvp = '',
    String? playerObjectId = '',
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = TeamsGroup.getBaseUrl(
      userToken: userToken,
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
[
  "${escapeStringForJson(playerObjectId)}"
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add RSVP to Team Event',
      apiUrl: '${baseUrl}/data/teamEvents/${teamEventObjectId}/rsvp${rsvp}',
      callType: ApiCallType.PUT,
      headers: {
        'user-token': '${userToken}',
      },
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

class GetYouthSystemTeamsCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = TeamsGroup.getBaseUrl(
      userToken: userToken,
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Youth System Teams',
      apiUrl: '${baseUrl}/data/teams?where=%60youthSystem%60%20%3D%20TRUE',
      callType: ApiCallType.GET,
      headers: {
        'user-token': '${userToken}',
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

/// End Teams Group Code

/// Start Auth Group Code

class AuthGroup {
  static String getBaseUrl({
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) =>
      'https://api.touchlineclub.com:7500/${bLappId}/${bLRestApiKey}';
  static Map<String, String> headers = {};
  static GetUserObjectCall getUserObjectCall = GetUserObjectCall();
  static UpdateAccountPrivacyCall updateAccountPrivacyCall =
      UpdateAccountPrivacyCall();
  static UpdateAccountFieldsCall updateAccountFieldsCall =
      UpdateAccountFieldsCall();
  static EmailLoginTokenExchangeCall emailLoginTokenExchangeCall =
      EmailLoginTokenExchangeCall();
  static GuestLoginTokenExchangeCall guestLoginTokenExchangeCall =
      GuestLoginTokenExchangeCall();
  static RegisterNewUserCall registerNewUserCall = RegisterNewUserCall();
  static IsMyUserTokenValidCall isMyUserTokenValidCall =
      IsMyUserTokenValidCall();
  static GetUserObjectIdByEmailCall getUserObjectIdByEmailCall =
      GetUserObjectIdByEmailCall();
}

class GetUserObjectCall {
  Future<ApiCallResponse> call({
    String? userObjectId = '',
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get User Object',
      apiUrl:
          '${baseUrl}/data/Users/${userObjectId}?loadRelations=teams%2Cplayers',
      callType: ApiCallType.GET,
      headers: {
        'user-token': '${userToken}',
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

class UpdateAccountPrivacyCall {
  Future<ApiCallResponse> call({
    String? userObjectId = '',
    String? userToken = '',
    bool? publicName = false,
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
{
  "publicName": ${publicName}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update account privacy',
      apiUrl: '${baseUrl}/data/Users/${userObjectId}',
      callType: ApiCallType.PUT,
      headers: {
        'user-token': '${userToken}',
      },
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

class UpdateAccountFieldsCall {
  Future<ApiCallResponse> call({
    String? userObjectId = '',
    String? userToken = '',
    String? email = '',
    String? name = '',
    String? mobile = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "name": "${escapeStringForJson(name)}",
  "mobile": "${escapeStringForJson(mobile)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update account fields',
      apiUrl: '${baseUrl}/data/Users/${userObjectId}',
      callType: ApiCallType.PUT,
      headers: {
        'user-token': '${userToken}',
      },
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

class EmailLoginTokenExchangeCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
{
  "login": "${escapeStringForJson(email)}",
  "password": "*X7#kP9mW!qZ2rT7\$vY8jL3@jY6cB1aD0lC4"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Email Login Token Exchange',
      apiUrl: '${baseUrl}/users/login',
      callType: ApiCallType.POST,
      headers: {},
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

class GuestLoginTokenExchangeCall {
  Future<ApiCallResponse> call({
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Guest Login Token Exchange',
      apiUrl: '${baseUrl}/users/register/guest',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterNewUserCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? uid = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "uid": "${escapeStringForJson(uid)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register New User',
      apiUrl: '${baseUrl}/services/TouchlineManual/newUser',
      callType: ApiCallType.POST,
      headers: {},
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

class IsMyUserTokenValidCall {
  Future<ApiCallResponse> call({
    String? userToken = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Is my user token valid',
      apiUrl: '${baseUrl}/users/isvalidusertoken/${userToken}',
      callType: ApiCallType.GET,
      headers: {},
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

class GetUserObjectIdByEmailCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? bLappId = '',
    String? bLRestApiKey = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get user objectId by email',
      apiUrl: '${baseUrl}/data/Users?where=email%20%3D%20\'${email}\'',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
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
        r'''$[:].objectId''',
      ));
}

/// End Auth Group Code

/// Start Shop Group Code

class ShopGroup {
  static String getBaseUrl({
    String? bLappId,
    String? bLRestApiKey,
  }) {
    bLappId ??= FFLibraryValues().BLProjectId;
    bLRestApiKey ??= FFLibraryValues().BLRestAPIKey;
    return 'https://api.touchlineclub.com:7500/${bLappId}/${bLRestApiKey}';
  }

  static Map<String, String> headers = {};
  static GetSingleShopItemCall getSingleShopItemCall = GetSingleShopItemCall();
  static GetNumberOfReviewsForASingleProductCall
      getNumberOfReviewsForASingleProductCall =
      GetNumberOfReviewsForASingleProductCall();
  static GetReviewsForAShopItemCall getReviewsForAShopItemCall =
      GetReviewsForAShopItemCall();
  static PostNewReviewContentCall postNewReviewContentCall =
      PostNewReviewContentCall();
  static AddAuthorToReviewCall addAuthorToReviewCall = AddAuthorToReviewCall();
  static AddReviewToShopItemCall addReviewToShopItemCall =
      AddReviewToShopItemCall();
}

class GetSingleShopItemCall {
  Future<ApiCallResponse> call({
    String? shopItemObjectId = '',
    String? bLappId,
    String? bLRestApiKey,
  }) async {
    bLappId ??= FFLibraryValues().BLProjectId;
    bLRestApiKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = ShopGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get single shop item',
      apiUrl: '${baseUrl}/shopItems/${shopItemObjectId}?loadRelations=sizes',
      callType: ApiCallType.GET,
      headers: {},
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

class GetNumberOfReviewsForASingleProductCall {
  Future<ApiCallResponse> call({
    String? shopItemObjectId = '',
    String? bLappId,
    String? bLRestApiKey,
  }) async {
    bLappId ??= FFLibraryValues().BLProjectId;
    bLRestApiKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = ShopGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get number of reviews for a single product',
      apiUrl:
          '${baseUrl}/data/shopReviews/count?where=shopItems%5Breviews%5D.objectId%3D%20%27${shopItemObjectId}%27',
      callType: ApiCallType.GET,
      headers: {},
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

class GetReviewsForAShopItemCall {
  Future<ApiCallResponse> call({
    String? shopItemObjectId = '',
    int? offset,
    String? bLappId,
    String? bLRestApiKey,
  }) async {
    bLappId ??= FFLibraryValues().BLProjectId;
    bLRestApiKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = ShopGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get reviews for a shop item',
      apiUrl:
          '${baseUrl}/data/shopReviews/count?pageSize=10&offset=${offset}&where=shopItems%5Breviews%5D.objectId%3D%20%27${shopItemObjectId}%27&loadRelations=author',
      callType: ApiCallType.GET,
      headers: {},
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

class PostNewReviewContentCall {
  Future<ApiCallResponse> call({
    int? stars,
    String? comment = '',
    String? bLappId,
    String? bLRestApiKey,
  }) async {
    bLappId ??= FFLibraryValues().BLProjectId;
    bLRestApiKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = ShopGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
{
  "stars": ${stars},
  "comment": "${escapeStringForJson(comment)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post New Review Content',
      apiUrl: '${baseUrl}/data/shopReviews',
      callType: ApiCallType.POST,
      headers: {},
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

class AddAuthorToReviewCall {
  Future<ApiCallResponse> call({
    String? reviewObjectId = '',
    String? userObjectId = '',
    String? bLappId,
    String? bLRestApiKey,
  }) async {
    bLappId ??= FFLibraryValues().BLProjectId;
    bLRestApiKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = ShopGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
[
  "${escapeStringForJson(userObjectId)}"
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Author to Review',
      apiUrl: '${baseUrl}/data/shopReviews/${reviewObjectId}/author',
      callType: ApiCallType.POST,
      headers: {},
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

class AddReviewToShopItemCall {
  Future<ApiCallResponse> call({
    String? shopItemObjectId = '',
    String? reviewObjectId = '',
    String? bLappId,
    String? bLRestApiKey,
  }) async {
    bLappId ??= FFLibraryValues().BLProjectId;
    bLRestApiKey ??= FFLibraryValues().BLRestAPIKey;
    final baseUrl = ShopGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
[
  "${escapeStringForJson(reviewObjectId)}"
]''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Review to Shop Item',
      apiUrl: '${baseUrl}/data/shopItems/${shopItemObjectId}/reviews',
      callType: ApiCallType.PUT,
      headers: {},
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

/// End Shop Group Code

class YouTubeVideosCall {
  static Future<ApiCallResponse> call({
    String? playlistId = '',
    String? tkeye = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'YouTube Videos',
      apiUrl:
          'https://www.googleapis.com/youtube/v3/playlistItems?key=${tkeye}&playlistId=${playlistId}&part=snippet&maxResults=5',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.publishedAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? desc(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? src(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.thumbnails.high.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? videoId(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].snippet.resourceId.videoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? items(dynamic response) => getJsonField(
        response,
        r'''$.items''',
        true,
      ) as List?;
  static int? code(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error.code''',
      ));
}

class LiveTextCall {
  static Future<ApiCallResponse> call({
    String? feedURL,
  }) async {
    feedURL ??= FFLibraryValues().feedURL!;

    return ApiManager.instance.makeApiCall(
      callName: 'liveText',
      apiUrl: '${feedURL}',
      callType: ApiCallType.GET,
      headers: {},
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

class AddViewtoCMSPostCall {
  static Future<ApiCallResponse> call({
    String? bLappId = '',
    String? bLRestApiKey = '',
    String? cmsPostObjectId = '',
    String? userEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "BLappId": "${escapeStringForJson(bLappId)}",
  "BLRestApiKey": "${escapeStringForJson(bLRestApiKey)}",
  "cmsPostObjectId": "${escapeStringForJson(cmsPostObjectId)}",
  "userEmail": "${escapeStringForJson(userEmail)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddViewtoCMSPost',
      apiUrl:
          'https://api.touchlineclub.com:7500/6B04E1E8-E97A-F586-FF06-64D80C519D00/D5E4193A-D1DB-4A18-957B-B45A0CAEFC78/services/clubCMS/addView',
      callType: ApiCallType.POST,
      headers: {},
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

  static bool? liked(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.liked''',
      ));
}

class AddLikeToCMSPostCall {
  static Future<ApiCallResponse> call({
    String? bLappId = '',
    String? bLRestApiKey = '',
    String? cmsPostObjectId = '',
    String? userEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "BLappId": "${escapeStringForJson(bLappId)}",
  "BLRestApiKey": "${escapeStringForJson(bLRestApiKey)}",
  "cmsPostObjectId": "${escapeStringForJson(cmsPostObjectId)}",
  "userEmail": "${escapeStringForJson(userEmail)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddLikeToCMSPost',
      apiUrl:
          'https://api.touchlineclub.com:7500/6B04E1E8-E97A-F586-FF06-64D80C519D00/D5E4193A-D1DB-4A18-957B-B45A0CAEFC78/services/clubCMS/addLike',
      callType: ApiCallType.POST,
      headers: {},
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

class AddVoteToPollCall {
  static Future<ApiCallResponse> call({
    String? bLappId = '',
    String? bLRestApiKey = '',
    String? optionObjectId = '',
    String? userEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "BLappId": "${escapeStringForJson(bLappId)}",
  "BLRestApiKey": "${escapeStringForJson(bLRestApiKey)}",
  "optionObjectId": "${escapeStringForJson(optionObjectId)}",
  "userEmail": "${escapeStringForJson(userEmail)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddVoteToPoll',
      apiUrl:
          'https://api.touchlineclub.com:7500/6B04E1E8-E97A-F586-FF06-64D80C519D00/D5E4193A-D1DB-4A18-957B-B45A0CAEFC78/services/clubCMS/addVotePoll',
      callType: ApiCallType.POST,
      headers: {},
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

  static int? newVotes(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.votes''',
      ));
}

class RemoveLikeFromCMSPostCall {
  static Future<ApiCallResponse> call({
    String? bLappId = '',
    String? bLRestApiKey = '',
    String? cmsPostObjectId = '',
    String? userEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "BLappId": "${escapeStringForJson(bLappId)}",
  "BLRestApiKey": "${escapeStringForJson(bLRestApiKey)}",
  "cmsPostObjectId": "${escapeStringForJson(cmsPostObjectId)}",
  "userEmail": "${escapeStringForJson(userEmail)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RemoveLikeFromCMSPost',
      apiUrl:
          'https://api.touchlineclub.com:7500/6B04E1E8-E97A-F586-FF06-64D80C519D00/D5E4193A-D1DB-4A18-957B-B45A0CAEFC78/services/clubCMS/removeLike',
      callType: ApiCallType.POST,
      headers: {},
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

class GetClubPoliciesCall {
  static Future<ApiCallResponse> call({
    String? bLappId,
    String? bLRestApiKey,
  }) async {
    bLappId ??= FFLibraryValues().BLProjectId;
    bLRestApiKey ??= FFLibraryValues().BLRestAPIKey;

    return ApiManager.instance.makeApiCall(
      callName: 'Get Club Policies',
      apiUrl:
          'https://api.touchlineclub.com:7500/${bLappId}/${bLRestApiKey}/data/policies?pageSize=20&sortBy=%60sortOrder%60%20asc',
      callType: ApiCallType.GET,
      headers: {},
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

class CalendarStatusCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Calendar status',
      apiUrl:
          'https://api.touchlineclub.com:7500/6B04E1E8-E97A-F586-FF06-64D80C519D00/D5E4193A-D1DB-4A18-957B-B45A0CAEFC78/hive/calendars/map/status',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? apple(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.apple''',
      ));
  static bool? ics(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.ics''',
      ));
  static bool? google(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.google''',
      ));
  static bool? outlook(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.outlook''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
