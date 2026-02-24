// ignore_for_file: non_constant_identifier_names

import '../api_manager.dart';
import 'endpoint_utils.dart';

export '../api_manager.dart' show ApiCallResponse;

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

