import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'dart:async';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'team_select_model.dart';
export 'team_select_model.dart';

/// Select from the available teams at the club
class TeamSelectWidget extends StatefulWidget {
  const TeamSelectWidget({super.key});

  static String routeName = 'TeamSelect';
  static String routePath = '/teamSelect';
  static void maybeSetRouteName(String? updatedRouteName) =>
      routeName = updatedRouteName ?? routeName;
  static void maybeSetRoutePath(String? updatedRoutePath) =>
      routePath = updatedRoutePath ?? routePath;

  @override
  State<TeamSelectWidget> createState() => _TeamSelectWidgetState();
}

class _TeamSelectWidgetState extends State<TeamSelectWidget> {
  late TeamSelectModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamSelectModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(),
          child: FutureBuilder<ApiCallResponse>(
            future:
                (_model.apiRequestCompleter1 ??= Completer<ApiCallResponse>()
                      ..complete(TeamsGroup.getTeamRequestsCall.call(
                        userObjectId: FFAppState().currentUser.objectId,
                        userToken: FFAppState().userToken,
                        bLappId: FFLibraryValues().BLProjectId,
                        bLRestApiKey: FFLibraryValues().BLRestAPIKey,
                      )))
                    .future,
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitWanderingCubes(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                );
              }
              final pageContainerGetTeamRequestsResponse = snapshot.data!;

              return Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 270.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 22.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 23.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.network(
                                  FFLibraryValues().ClubBadgeOnPrimary !=
                                              null &&
                                          FFLibraryValues()
                                                  .ClubBadgeOnPrimary !=
                                              ''
                                      ? FFLibraryValues().ClubBadgeOnPrimary!
                                      : FFLibraryValues().ClubBadge!,
                                  width: 79.0,
                                  height: 79.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: Text(
                                'TEAM SELECT',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      lineHeight: 1.4,
                                    ),
                              ),
                            ),
                            FlutterFlowChoiceChips(
                              options: [
                                ChipData('ALL'),
                                ChipData('MENS'),
                                ChipData('WOMENS'),
                                ChipData('ACADEMY')
                              ],
                              onChanged: (val) async {
                                safeSetState(() =>
                                    _model.choiceChipsValue = val?.firstOrNull);
                                safeSetState(
                                    () => _model.apiRequestCompleter2 = null);
                                await _model.waitForApiRequestCompleted2();
                              },
                              selectedChipStyle: ChipStyle(
                                backgroundColor: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                iconColor: FlutterFlowTheme.of(context).primary,
                                iconSize: 11.0,
                                elevation: 0.0,
                                borderColor: Colors.white,
                                borderWidth: 1.0,
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRBottomLeft?.toDouble(),
                                    0.0,
                                  )),
                                  bottomRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRBottomRight?.toDouble(),
                                    0.0,
                                  )),
                                  topLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRTopLeft?.toDouble(),
                                    0.0,
                                  )),
                                  topRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRTopRight?.toDouble(),
                                    0.0,
                                  )),
                                ),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Color(0x00FFFFFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                iconSize: 11.0,
                                elevation: 0.0,
                                borderColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderWidth: 0.0,
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRBottomLeft?.toDouble(),
                                    0.0,
                                  )),
                                  bottomRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRBottomRight?.toDouble(),
                                    0.0,
                                  )),
                                  topLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRTopLeft?.toDouble(),
                                    0.0,
                                  )),
                                  topRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFLibraryValues().BRTopRight?.toDouble(),
                                    0.0,
                                  )),
                                ),
                              ),
                              chipSpacing: 10.0,
                              rowSpacing: 8.0,
                              multiselect: false,
                              initialized: _model.choiceChipsValue != null,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                ['ALL'],
                              ),
                              wrapped: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 22.0, 20.0, 22.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: (_model.apiRequestCompleter2 ??=
                                  Completer<ApiCallResponse>()
                                    ..complete(TeamsGroup.getTeamsCall.call(
                                      whereClause: _model.choiceChipsValue ==
                                              'ALL'
                                          ? 'category%20IS%20NOT%20NULL'
                                          : '%60category%60%20%3D%20\'${_model.choiceChipsValue}\'',
                                      userToken: FFAppState().userToken,
                                      bLappId: FFLibraryValues().BLProjectId,
                                      bLRestApiKey:
                                          FFLibraryValues().BLRestAPIKey,
                                    )))
                              .future,
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitWanderingCubes(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            final listViewGetTeamsResponse = snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final team = (listViewGetTeamsResponse.jsonBody
                                            .toList()
                                            .map<TeamStruct?>(
                                                TeamStruct.maybeFromMap)
                                            .toList() as Iterable<TeamStruct?>)
                                        .withoutNulls
                                        ?.sortedList(
                                            keyOf: (e) => e.sortOrder,
                                            desc: false)
                                        ?.where((e) => e.category == 'ALL'
                                            ? (e.objectId != null &&
                                                e.objectId != '')
                                            : (e.category ==
                                                _model.choiceChipsValue))
                                        .toList()
                                        ?.toList() ??
                                    [];

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: team.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 17.0),
                                  itemBuilder: (context, teamIndex) {
                                    final teamItem = team[teamIndex];
                                    return Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              valueOrDefault<double>(
                                            FFLibraryValues()
                                                .BRBottomLeft
                                                ?.toDouble(),
                                            0.0,
                                          )),
                                          bottomRight: Radius.circular(
                                              valueOrDefault<double>(
                                            FFLibraryValues()
                                                .BRBottomRight
                                                ?.toDouble(),
                                            0.0,
                                          )),
                                          topLeft: Radius.circular(
                                              valueOrDefault<double>(
                                            FFLibraryValues()
                                                .BRTopLeft
                                                ?.toDouble(),
                                            0.0,
                                          )),
                                          topRight: Radius.circular(
                                              valueOrDefault<double>(
                                            FFLibraryValues()
                                                .BRTopRight
                                                ?.toDouble(),
                                            0.0,
                                          )),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Divider(
                                            height: 4.0,
                                            thickness: 4.0,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 14.0, 8.0, 14.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    FFLibraryValues()
                                                        .ClubBadge!,
                                                    width: 58.0,
                                                    height: 58.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            teamItem.name,
                                                            'team name',
                                                          ).toUpperCase(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          'Coaches: ${teamItem.coaches}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ),
                                                ),
                                                if (valueOrDefault<bool>(
                                                  teamItem.securityPolicy ==
                                                      'PUBLIC',
                                                  false,
                                                ))
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (!valueOrDefault<
                                                            bool>(
                                                          FFAppState()
                                                              .currentUser
                                                              .teams
                                                              .contains(
                                                                  teamItem),
                                                          false,
                                                        ))
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              _model.apiResultevu =
                                                                  await TeamsGroup
                                                                      .followPublicTeamCall
                                                                      .call(
                                                                teamObjectId:
                                                                    teamItem
                                                                        .objectId,
                                                                userObjectId:
                                                                    FFAppState()
                                                                        .currentUser
                                                                        .objectId,
                                                                userToken:
                                                                    FFAppState()
                                                                        .userToken,
                                                                bLappId:
                                                                    FFLibraryValues()
                                                                        .BLProjectId,
                                                                bLRestApiKey:
                                                                    FFLibraryValues()
                                                                        .BLRestAPIKey,
                                                              );

                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model
                                                                      .apiResultevu
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                await action_blocks
                                                                    .refreshUserData(
                                                                        context);
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(() =>
                                                                    _model.apiRequestCompleter2 =
                                                                        null);
                                                                await _model
                                                                    .waitForApiRequestCompleted2();
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'That failed - contact support',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1600),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                            text: 'FOLLOW',
                                                            options:
                                                                FFButtonOptions(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          19.0,
                                                                          8.0,
                                                                          19.0,
                                                                          8.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            9.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRBottomLeft
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRBottomRight
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRTopLeft
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                topRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRTopRight
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                              ),
                                                            ),
                                                          ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          FFAppState()
                                                              .currentUser
                                                              .teams
                                                              .contains(
                                                                  teamItem),
                                                          false,
                                                        ))
                                                          FlutterFlowIconButton(
                                                            borderRadius: 80.0,
                                                            buttonSize: 30.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            icon: Icon(
                                                              Icons.check_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 14.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              if (teamItem
                                                                      .objectId !=
                                                                  FFLibraryValues()
                                                                      .focusTeamObjectId) {
                                                                var confirmDialogResponse =
                                                                    await showDialog<
                                                                            bool>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return WebViewAware(
                                                                              child: AlertDialog(
                                                                                title: Text('Unfollow ${teamItem.name}?'),
                                                                                content: Text('Are you sure?'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancel'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Confirm'),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          },
                                                                        ) ??
                                                                        false;
                                                                if (confirmDialogResponse) {
                                                                  _model.apiResultxwo =
                                                                      await TeamsGroup
                                                                          .unfollowTeamCall
                                                                          .call(
                                                                    userObjectId:
                                                                        FFAppState()
                                                                            .currentUser
                                                                            .objectId,
                                                                    teamObjectId:
                                                                        teamItem
                                                                            .objectId,
                                                                    userToken:
                                                                        FFAppState()
                                                                            .userToken,
                                                                    bLappId:
                                                                        FFLibraryValues()
                                                                            .BLProjectId,
                                                                    bLRestApiKey:
                                                                        FFLibraryValues()
                                                                            .BLRestAPIKey,
                                                                  );

                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model
                                                                          .apiResultxwo
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Team Unfollowed',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 1600),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).success,
                                                                      ),
                                                                    );
                                                                    await action_blocks
                                                                        .refreshUserData(
                                                                            context);
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'That failed',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 1600),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).error,
                                                                      ),
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                } else {
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              } else {
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                if (valueOrDefault<bool>(
                                                  teamItem.securityPolicy ==
                                                      'PRIVATE',
                                                  true,
                                                ))
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if ((pageContainerGetTeamRequestsResponse
                                                                        .jsonBody
                                                                        .toList()
                                                                        .map<TeamRequestStruct?>(TeamRequestStruct
                                                                            .maybeFromMap)
                                                                        .toList()
                                                                    as Iterable<
                                                                        TeamRequestStruct?>)
                                                                .withoutNulls
                                                                ?.where((e) =>
                                                                    e.team
                                                                        .objectId ==
                                                                    teamItem
                                                                        .objectId)
                                                                .toList()
                                                                ?.length ==
                                                            0)
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              _model.apiResultq8a =
                                                                  await TeamsGroup
                                                                      .requestAPrivateTeamCall
                                                                      .call(
                                                                note:
                                                                    'I would like to follow your team',
                                                                userToken:
                                                                    FFAppState()
                                                                        .userToken,
                                                                bLappId:
                                                                    FFLibraryValues()
                                                                        .BLProjectId,
                                                                bLRestApiKey:
                                                                    FFLibraryValues()
                                                                        .BLRestAPIKey,
                                                              );

                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model
                                                                      .apiResultq8a
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                _model.apiResultsa6 =
                                                                    await TeamsGroup
                                                                        .addTeamToPrivateTeamRequestCall
                                                                        .call(
                                                                  requestObjectId:
                                                                      TeamRequestStruct.maybeFromMap((_model.apiResultq8a?.jsonBody ??
                                                                              ''))
                                                                          ?.objectId,
                                                                  teamObjectId:
                                                                      teamItem
                                                                          .objectId,
                                                                  userToken:
                                                                      FFAppState()
                                                                          .userToken,
                                                                  bLappId:
                                                                      FFLibraryValues()
                                                                          .BLProjectId,
                                                                  bLRestApiKey:
                                                                      FFLibraryValues()
                                                                          .BLRestAPIKey,
                                                                );

                                                                _shouldSetState =
                                                                    true;
                                                                if ((_model
                                                                        .apiResultsa6
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  _model.apiResultcrl =
                                                                      await TeamsGroup
                                                                          .addUserToPrivateTeamRequestCall
                                                                          .call(
                                                                    requestObjectId:
                                                                        TeamRequestStruct.maybeFromMap((_model.apiResultq8a?.jsonBody ??
                                                                                ''))
                                                                            ?.objectId,
                                                                    userObjectId:
                                                                        FFAppState()
                                                                            .currentUser
                                                                            .objectId,
                                                                    userToken:
                                                                        FFAppState()
                                                                            .userToken,
                                                                    bLappId:
                                                                        FFLibraryValues()
                                                                            .BLProjectId,
                                                                    bLRestApiKey:
                                                                        FFLibraryValues()
                                                                            .BLRestAPIKey,
                                                                  );

                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model
                                                                          .apiResultcrl
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Request Sent',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 1350),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).success,
                                                                      ),
                                                                    );
                                                                    safeSetState(() =>
                                                                        _model.apiRequestCompleter1 =
                                                                            null);
                                                                    await _model
                                                                        .waitForApiRequestCompleted1();
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Failed to add user to request',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 1350),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).error,
                                                                      ),
                                                                    );
                                                                  }
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Failed to add team to request',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              1350),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .error,
                                                                    ),
                                                                  );
                                                                }

                                                                _model.apiResultt77 =
                                                                    await TeamsGroup
                                                                        .deleteRequestForPrivateTeamCall
                                                                        .call(
                                                                  requestObjectId:
                                                                      TeamRequestStruct.maybeFromMap((_model.apiResultq8a?.jsonBody ??
                                                                              ''))
                                                                          ?.objectId,
                                                                  userToken:
                                                                      FFAppState()
                                                                          .userToken,
                                                                  bLappId:
                                                                      FFLibraryValues()
                                                                          .BLProjectId,
                                                                  bLRestApiKey:
                                                                      FFLibraryValues()
                                                                          .BLRestAPIKey,
                                                                );

                                                                _shouldSetState =
                                                                    true;
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Failed to create request',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1350),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                            text: 'REQUEST',
                                                            options:
                                                                FFButtonOptions(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          19.0,
                                                                          8.0,
                                                                          19.0,
                                                                          8.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            9.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRBottomLeft
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRBottomRight
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRTopLeft
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                topRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRTopRight
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                              ),
                                                            ),
                                                          ),
                                                        if ((pageContainerGetTeamRequestsResponse
                                                                        .jsonBody
                                                                        .toList()
                                                                        .map<TeamRequestStruct?>(TeamRequestStruct
                                                                            .maybeFromMap)
                                                                        .toList()
                                                                    as Iterable<
                                                                        TeamRequestStruct?>)
                                                                .withoutNulls
                                                                ?.where((e) =>
                                                                    e.team
                                                                        .objectId ==
                                                                    teamItem
                                                                        .objectId)
                                                                .toList()
                                                                ?.length !=
                                                            0)
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
                                                                              title: Text('Cancel Request'),
                                                                              content: Text('Are you sure?'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: Text('No'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: Text('Yes'),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      ) ??
                                                                      false;
                                                              if (confirmDialogResponse) {
                                                                _model.apiResulto7q =
                                                                    await TeamsGroup
                                                                        .deleteRequestForPrivateTeamCall
                                                                        .call(
                                                                  requestObjectId: (pageContainerGetTeamRequestsResponse
                                                                              .jsonBody
                                                                              .toList()
                                                                              .map<TeamRequestStruct?>(TeamRequestStruct
                                                                                  .maybeFromMap)
                                                                              .toList()
                                                                          as Iterable<
                                                                              TeamRequestStruct?>)
                                                                      .withoutNulls
                                                                      ?.where((e) =>
                                                                          e.team
                                                                              .objectId ==
                                                                          teamItem
                                                                              .objectId)
                                                                      .toList()
                                                                      ?.firstOrNull
                                                                      ?.objectId,
                                                                  userToken:
                                                                      FFAppState()
                                                                          .userToken,
                                                                  bLappId:
                                                                      FFLibraryValues()
                                                                          .BLProjectId,
                                                                  bLRestApiKey:
                                                                      FFLibraryValues()
                                                                          .BLRestAPIKey,
                                                                );

                                                                _shouldSetState =
                                                                    true;
                                                                if ((_model
                                                                        .apiResulto7q
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Request Cancelled',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              1700),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .success,
                                                                    ),
                                                                  );
                                                                  safeSetState(() =>
                                                                      _model.apiRequestCompleter1 =
                                                                          null);
                                                                  await _model
                                                                      .waitForApiRequestCompleted1();
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'That Failed',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              1700),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .error,
                                                                    ),
                                                                  );
                                                                }
                                                              } else {
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                            text: 'REQUESTED',
                                                            options:
                                                                FFButtonOptions(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          19.0,
                                                                          8.0,
                                                                          19.0,
                                                                          8.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: Color(
                                                                  0xFFD9D9D9),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            9.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRBottomLeft
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRBottomRight
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRTopLeft
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                                topRight: Radius
                                                                    .circular(
                                                                        valueOrDefault<
                                                                            double>(
                                                                  FFLibraryValues()
                                                                      .BRTopRight
                                                                      ?.toDouble(),
                                                                  0.0,
                                                                )),
                                                              ),
                                                            ),
                                                          ),
                                                        if (valueOrDefault<
                                                            bool>(
                                                          FFAppState()
                                                              .currentUser
                                                              .teams
                                                              .contains(
                                                                  teamItem),
                                                          false,
                                                        ))
                                                          FlutterFlowIconButton(
                                                            borderRadius: 80.0,
                                                            buttonSize: 30.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            icon: Icon(
                                                              Icons.check_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 14.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              if (teamItem
                                                                      .objectId ==
                                                                  FFLibraryValues()
                                                                      .focusTeamObjectId) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'You cannot unfollow the main team.',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1950),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                              var confirmDialogResponse =
                                                                  await showDialog<
                                                                          bool>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
                                                                              title: Text('Unfollow ${teamItem.name}?'),
                                                                              content: Text('Are you sure?'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: Text('Cancel'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: Text('Confirm'),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        },
                                                                      ) ??
                                                                      false;
                                                              if (confirmDialogResponse) {
                                                                _model.apiResultxwoCopy =
                                                                    await TeamsGroup
                                                                        .unfollowTeamCall
                                                                        .call(
                                                                  userObjectId:
                                                                      FFAppState()
                                                                          .currentUser
                                                                          .objectId,
                                                                  teamObjectId:
                                                                      teamItem
                                                                          .objectId,
                                                                  userToken:
                                                                      FFAppState()
                                                                          .userToken,
                                                                  bLappId:
                                                                      FFLibraryValues()
                                                                          .BLProjectId,
                                                                  bLRestApiKey:
                                                                      FFLibraryValues()
                                                                          .BLRestAPIKey,
                                                                );

                                                                _shouldSetState =
                                                                    true;
                                                                if ((_model
                                                                        .apiResultxwoCopy
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'Team Unfollowed',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              1600),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .success,
                                                                    ),
                                                                  );
                                                                  await action_blocks
                                                                      .refreshUserData(
                                                                          context);
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                          Text(
                                                                        'That failed',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              1600),
                                                                      backgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .error,
                                                                    ),
                                                                  );
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              } else {
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                              ].divide(SizedBox(width: 12.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
