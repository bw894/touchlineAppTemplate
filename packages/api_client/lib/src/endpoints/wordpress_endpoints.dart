// ignore_for_file: non_constant_identifier_names

import '../api_manager.dart';

export '../api_manager.dart' show ApiCallResponse;

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

