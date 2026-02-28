// ignore_for_file: non_constant_identifier_names

import '../api_manager.dart';
import 'endpoint_utils.dart';

export '../api_manager.dart' show ApiCallResponse;

class YouthManagementGroup {
  static String getBaseUrl({
    String? bLappId,
    String? bLRestApiKey,
  }) {
    return 'https://api.touchlineclub.com:7500/${bLappId}/${bLRestApiKey}';
  }

  static Map<String, String> headers = {};
  static GetTeamEventsForGivenTeamCall getTeamEventsForGivenTeamCall =
      GetTeamEventsForGivenTeamCall();
  static GetFinesForPlayerObjectIdCall getFinesForPlayerObjectIdCall =
      GetFinesForPlayerObjectIdCall();
  static GetEventRSVPCall getEventRSVPCall = GetEventRSVPCall();
  static GetAllRSVPsForAPlayerCall getAllRSVPsForAPlayerCall =
      GetAllRSVPsForAPlayerCall();
  static UpdateEventRSVPCall updateEventRSVPCall = UpdateEventRSVPCall();
  static AddNewEventRSVPCall addNewEventRSVPCall = AddNewEventRSVPCall();
}

class GetTeamEventsForGivenTeamCall {
  Future<ApiCallResponse> call({
    String? teamObjectId = '',
    String? bLappId,
    String? bLRestApiKey,
  }) async {
    final baseUrl = YouthManagementGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get team events for given team',
      apiUrl:
          '${baseUrl}/data/teamEvents?where=%60team%60.%60objectId%60%20%3D%20\'${teamObjectId}\'',
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

class GetFinesForPlayerObjectIdCall {
  Future<ApiCallResponse> call({
    String? playerObjectId = '',
    String? bLappId,
    String? bLRestApiKey,
  }) async {
    final baseUrl = YouthManagementGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get fines for player objectId',
      apiUrl:
          '${baseUrl}/data/playerFines?where=%60status%60%20%3D%20\'UNPAID\'%20AND%20%60player%60.%60objectId%60%20%3D%20\'${playerObjectId}\'',
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

class GetEventRSVPCall {
  Future<ApiCallResponse> call({
    String? eventObjectId = '',
    String? playerObjectId = '',
    String? bLappId,
    String? bLRestApiKey,
  }) async {
    final baseUrl = YouthManagementGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get event RSVP',
      apiUrl:
          '${baseUrl}/data/EventRSVP?where=%60eventObjectId%60%20%3D%20\'${eventObjectId}\'%20AND%20%60playerObjectId%60%20%3D%20\'${playerObjectId}\'',
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

class GetAllRSVPsForAPlayerCall {
  Future<ApiCallResponse> call({
    String? playerObjectId = '',
    String? bLappId,
    String? bLRestApiKey,
  }) async {
    final baseUrl = YouthManagementGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get all RSVPs for a player',
      apiUrl:
          '${baseUrl}/data/EventRSVP?pageSize=100&where=%60playerObjectId%60%20%3D%20\'${playerObjectId}\'&property=%60eventObjectId%60&property=%60status%60',
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

class UpdateEventRSVPCall {
  Future<ApiCallResponse> call({
    String? rsvpObjectId = '',
    String? status = '',
    String? bLappId,
    String? bLRestApiKey,
  }) async {
    final baseUrl = YouthManagementGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
{
  "status": "${escapeStringForJson(status)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Event RSVP',
      apiUrl: '${baseUrl}/data/EventRSVP/${rsvpObjectId}',
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

class AddNewEventRSVPCall {
  Future<ApiCallResponse> call({
    String? eventObjectId = '',
    String? playerObjectId = '',
    String? status = '',
    String? bLappId,
    String? bLRestApiKey,
  }) async {
    final baseUrl = YouthManagementGroup.getBaseUrl(
      bLappId: bLappId,
      bLRestApiKey: bLRestApiKey,
    );

    final ffApiRequestBody = '''
{
  "eventObjectId": "${escapeStringForJson(eventObjectId)}",
  "playerObjectId": "${escapeStringForJson(playerObjectId)}",
  "status": "${escapeStringForJson(status)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add New Event RSVP',
      apiUrl: '${baseUrl}/data/EventRSVP',
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

