import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'c_m_s_post_page_v1_widget.dart' show CMSPostPageV1Widget;
import 'package:flutter/material.dart';

class CMSPostPageV1Model extends FlutterFlowModel<CMSPostPageV1Widget> {
  /// Query cache managers for this widget.

  final _cmsPostManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> cmsPost({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _cmsPostManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCmsPostCache() => _cmsPostManager.clear();
  void clearCmsPostCacheKey(String? uniqueKey) =>
      _cmsPostManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearCmsPostCache();
  }
}
