// ignore_for_file: non_constant_identifier_names

import '../api_manager.dart';
import '../schema_util.dart';
import 'endpoint_utils.dart';

export '../api_manager.dart' show ApiCallResponse;

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
          '${baseUrl}/data/Users/${userObjectId}?loadRelations=teams%2Cplayers.team',
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

