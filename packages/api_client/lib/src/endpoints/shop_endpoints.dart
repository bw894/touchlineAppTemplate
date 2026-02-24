// ignore_for_file: non_constant_identifier_names

import '../api_manager.dart';
import 'endpoint_utils.dart';

export '../api_manager.dart' show ApiCallResponse;

class ShopGroup {
  static String getBaseUrl({
    String? bLappId,
    String? bLRestApiKey,
  }) {
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

