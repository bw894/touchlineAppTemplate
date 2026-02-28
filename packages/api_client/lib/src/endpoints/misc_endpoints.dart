// ignore_for_file: non_constant_identifier_names

import '../api_manager.dart';
import '../schema_util.dart';
import 'endpoint_utils.dart';

export '../api_manager.dart' show ApiCallResponse;

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

