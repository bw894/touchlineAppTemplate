import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import '/flutter_flow/request_manager.dart';

import 'top_bit_v3_home_widget.dart' show TopBitV3HomeWidget;
import 'package:flutter/material.dart';

class TopBitV3HomeModel extends FlutterFlowModel<TopBitV3HomeWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (UpcomingOneFixtures)] action in TopBitV3Home widget.
  ApiCallResponse? fixt;
  InstantTimer? refreshStats;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (UpcomingOneFixtures)] action in GetObjectId widget.
  ApiCallResponse? apiResultv7z;
  // Stores action output result for [Backend Call - API (UpcomingOneFixtures)] action in liveMatchCentre widget.
  ApiCallResponse? apiResultv7zCopy;

  /// Query cache managers for this widget.

  final _topBitHomeManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> topBitHome({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _topBitHomeManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTopBitHomeCache() => _topBitHomeManager.clear();
  void clearTopBitHomeCacheKey(String? uniqueKey) =>
      _topBitHomeManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    refreshStats?.cancel();

    /// Dispose query cache managers for this widget.

    clearTopBitHomeCache();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
