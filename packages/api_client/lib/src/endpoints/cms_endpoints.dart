// ignore_for_file: non_constant_identifier_names

import '../api_manager.dart';
import '../schema_util.dart';
import 'endpoint_utils.dart';

export '../api_manager.dart' show ApiCallResponse;

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

