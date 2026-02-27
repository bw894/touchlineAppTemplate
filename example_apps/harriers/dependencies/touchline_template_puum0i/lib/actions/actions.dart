import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/campaign_v1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future createUserCRM(
  BuildContext context, {
  required String? userEmail,
}) async {
  ApiCallResponse? apiResultu5e;

  apiResultu5e = await CrmGroup.queryEmailCall.call(
    bLappId: FFLibraryValues().BLProjectId,
    bLRestApiKey: FFLibraryValues().BLRestAPIKey,
    email: userEmail,
  );
}

Future refreshUserData(BuildContext context) async {
  ApiCallResponse? apiResultq0l;

  apiResultq0l = await AuthGroup.getUserObjectCall.call(
    userObjectId: FFAppState().currentUser.objectId,
    bLappId: FFLibraryValues().BLProjectId,
    bLRestApiKey: FFLibraryValues().BLRestAPIKey,
    userToken: FFAppState().userToken,
  );

  if ((apiResultq0l?.succeeded ?? true)) {
    FFAppState().currentUser =
        UserStruct.maybeFromMap((apiResultq0l?.jsonBody ?? ''))!;
    FFAppState().update(() {});
  }
}

Future<String?> initalRoute(
  BuildContext context, {
  /// Email fro mthe Authenticated user block
  String? authEmail,
  String? authUserToken,
  String? uid,
}) async {
  ApiCallResponse? tokenValid;
  ApiCallResponse? apiResultlkv;
  ApiCallResponse? apiResult5vh;
  ApiCallResponse? apiResult34a;
  ApiCallResponse? apiResultmd8;
  ApiCallResponse? apiResult0yi;
  ApiCallResponse? guestNoToken;

  FFAppState().userToken = authUserToken!;
  FFAppState().updateCurrentUserStruct(
    (e) => e..email = authEmail,
  );
  if (FFAppState().userToken != null && FFAppState().userToken != '') {
    tokenValid = await AuthGroup.isMyUserTokenValidCall.call(
      userToken: FFAppState().userToken,
      bLappId: FFLibraryValues().BLProjectId,
      bLRestApiKey: FFLibraryValues().BLRestAPIKey,
    );

    if ((tokenValid?.bodyText ?? '') == 'true') {
      if (FFAppState().currentUser.objectId != null &&
          FFAppState().currentUser.objectId != '') {
        return null;
      }

      apiResultlkv = await AuthGroup.getUserObjectIdByEmailCall.call(
        email: authEmail,
        bLappId: FFLibraryValues().BLProjectId,
        bLRestApiKey: FFLibraryValues().BLRestAPIKey,
      );

      if ((apiResultlkv?.succeeded ?? true)) {
        FFAppState().updateCurrentUserStruct(
          (e) => e
            ..objectId = AuthGroup.getUserObjectIdByEmailCall.objectId(
              (apiResultlkv?.jsonBody ?? ''),
            ),
        );
        FFAppState().update(() {});
      }
    } else {
      if (FFAppState().currentUser.email != null &&
          FFAppState().currentUser.email != '') {
        apiResult5vh = await AuthGroup.emailLoginTokenExchangeCall.call(
          email: FFAppState().currentUser.email,
          bLappId: FFLibraryValues().BLProjectId,
          bLRestApiKey: FFLibraryValues().BLRestAPIKey,
        );

        if ((apiResult5vh?.succeeded ?? true)) {
          FFAppState().userToken =
              GuestLoginStruct.maybeFromMap((apiResult5vh?.jsonBody ?? ''))!
                  .userToken;
          FFAppState().updateCurrentUserStruct(
            (e) => e
              ..objectId =
                  GuestLoginStruct.maybeFromMap((apiResult5vh?.jsonBody ?? ''))
                      ?.objectId,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Failed to login without email specified',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              duration: Duration(milliseconds: 1650),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
          return 'failed';
        }
      } else {
        apiResult34a = await AuthGroup.guestLoginTokenExchangeCall.call(
          bLappId: FFLibraryValues().BLProjectId,
          bLRestApiKey: FFLibraryValues().BLRestAPIKey,
        );

        if ((apiResult34a?.succeeded ?? true)) {
          FFAppState().userToken =
              GuestLoginStruct.maybeFromMap((apiResult34a?.jsonBody ?? ''))!
                  .userToken;
          FFAppState().updateCurrentUserStruct(
            (e) => e
              ..objectId =
                  GuestLoginStruct.maybeFromMap((apiResult34a?.jsonBody ?? ''))
                      ?.objectId,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Failed to register guest user',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              duration: Duration(milliseconds: 1650),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
          return 'failed';
        }
      }
    }
  } else {
    if (FFAppState().currentUser.email != null &&
        FFAppState().currentUser.email != '') {
      apiResultmd8 = await AuthGroup.registerNewUserCall.call(
        email: FFAppState().currentUser.email,
        bLappId: FFLibraryValues().BLProjectId,
        bLRestApiKey: FFLibraryValues().BLRestAPIKey,
        uid: uid,
      );

      apiResult0yi = await AuthGroup.emailLoginTokenExchangeCall.call(
        email: FFAppState().currentUser.email,
        bLappId: FFLibraryValues().BLProjectId,
        bLRestApiKey: FFLibraryValues().BLRestAPIKey,
      );

      if ((apiResult0yi?.succeeded ?? true)) {
        FFAppState().userToken =
            GuestLoginStruct.maybeFromMap((apiResult0yi?.jsonBody ?? ''))!
                .userToken;
        FFAppState().updateCurrentUserStruct(
          (e) => e
            ..objectId =
                GuestLoginStruct.maybeFromMap((apiResult0yi?.jsonBody ?? ''))
                    ?.objectId,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to login without email specified',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 1650),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        return 'failed';
      }
    } else {
      guestNoToken = await AuthGroup.guestLoginTokenExchangeCall.call(
        bLappId: FFLibraryValues().BLProjectId,
        bLRestApiKey: FFLibraryValues().BLRestAPIKey,
      );

      if ((guestNoToken?.succeeded ?? true)) {
        FFAppState().userToken =
            GuestLoginStruct.maybeFromMap((guestNoToken?.jsonBody ?? ''))!
                .userToken;
        FFAppState().updateCurrentUserStruct(
          (e) => e
            ..objectId =
                GuestLoginStruct.maybeFromMap((guestNoToken?.jsonBody ?? ''))
                    ?.objectId,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to register guest user',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 1650),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        return 'failed';
      }
    }
  }

  await action_blocks.refreshUserData(context);
  return FFAppState().userToken;
}

Future launchCampaigns(BuildContext context) async {
  ApiCallResponse? apiResult4vr;

  if (FFAppState().seenAds) {
    return;
  }
  apiResult4vr = await CmsGroup.getRequiredCampaignsCall.call(
    currentTime: getCurrentTimestamp.millisecondsSinceEpoch,
    bLappId: FFLibraryValues().BLProjectId,
    bLRestApiKey: FFLibraryValues().BLRestAPIKey,
  );

  if ((apiResult4vr?.succeeded ?? true) &&
      (((apiResult4vr?.jsonBody ?? '')
                  .toList()
                  .map<CampaignStruct?>(CampaignStruct.maybeFromMap)
                  .toList() as Iterable<CampaignStruct?>)
              .withoutNulls
              .length >
          0)) {
    for (int loop1Index = 0;
        loop1Index <
            ((apiResult4vr?.jsonBody ?? '')
                    .toList()
                    .map<CampaignStruct?>(CampaignStruct.maybeFromMap)
                    .toList() as Iterable<CampaignStruct?>)
                .withoutNulls
                .sortedList(keyOf: (e) => e.sortOrder, desc: false)
                .length;
        loop1Index++) {
      final currentLoop1Item = ((apiResult4vr?.jsonBody ?? '')
              .toList()
              .map<CampaignStruct?>(CampaignStruct.maybeFromMap)
              .toList() as Iterable<CampaignStruct?>)
          .withoutNulls
          .sortedList(keyOf: (e) => e.sortOrder, desc: false)[loop1Index];
      if (!(FFAppState()
              .campaignObjectIds
              .contains(currentLoop1Item.objectId) ||
          FFAppState().seenAds)) {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: WebViewAware(
                child: CampaignV1Widget(
                  campaign: currentLoop1Item,
                ),
              ),
            );
          },
        );

        FFAppState().seenAds = true;
        FFAppState().update(() {});
        return;
      }
    }
  } else {
    if (((apiResult4vr?.jsonBody ?? '')
                .toList()
                .map<CampaignStruct?>(CampaignStruct.maybeFromMap)
                .toList() as Iterable<CampaignStruct?>)
            .withoutNulls
            ?.length ==
        0) {
      FFAppState().deleteCampaignObjectIds();
      FFAppState().campaignObjectIds = [];
    }
  }
}
