// ignore_for_file: non_constant_identifier_names

import '../api_manager.dart';
import '../schema_util.dart';
import 'endpoint_utils.dart';

export '../api_manager.dart' show ApiCallResponse;

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

