import '/flutter_flow/flutter_flow_util.dart';
import "package:touchline_template_puum0i/backend/schema/structs/index.dart"
    as touchline_template_puum0i_data_schema;
import '/index.dart';
import 'package:touchline_template_puum0i/app_bar/app_bar_v1/app_bar_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/backend/api_requests/api_calls.dart'
    as touchline_template_puum0i_api_calls_util;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_club_folder_model.dart';
export 'my_club_folder_model.dart';

class MyClubFolderWidget extends StatefulWidget {
  const MyClubFolderWidget({
    super.key,
    required this.rootKey,
  });

  final String? rootKey;

  static String routeName = 'myClubFolder';
  static String routePath = '/myClubFolder';

  @override
  State<MyClubFolderWidget> createState() => _MyClubFolderWidgetState();
}

class _MyClubFolderWidgetState extends State<MyClubFolderWidget> {
  late MyClubFolderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyClubFolderModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'myClubFolder'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<
        touchline_template_puum0i_api_calls_util.ApiCallResponse>(
      future: touchline_template_puum0i_api_calls_util
          .BackendlessDatabaseGroup.getPagesWhereContainedEqualsTermCall
          .call(
        pageKey: widget.rootKey,
        bLProjectId: FFAppConstants.BLProjectId,
        bLRestAPIKey: FFAppConstants.BLRestAPIKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 45.0,
                height: 45.0,
                child: SpinKitFoldingCube(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 45.0,
                ),
              ),
            ),
          );
        }
        final myClubFolderGetPagesWhereContainedEqualsTermResponse =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/bg3-min.png',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        touchline_template_puum0i_util.wrapWithModel(
                          model: _model.appBarV1Model,
                          updateCallback: () => safeSetState(() {}),
                          child: touchline_template_puum0i.AppBarV1Widget(
                            backgroundColour:
                                FlutterFlowTheme.of(context).primary,
                            badgeURL: FFAppConstants.clubBadgeOnPrimary,
                            iconColour: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            backButtonReq: true,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.rootKey == 'root'
                                            ? 'My Club'
                                            : widget.rootKey,
                                        'My Club',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final contPage = (myClubFolderGetPagesWhereContainedEqualsTermResponse
                                                      .jsonBody
                                                      .toList()
                                                      .map<
                                                              touchline_template_puum0i_data_schema
                                                              .StaticPageStruct?>(
                                                          touchline_template_puum0i_data_schema
                                                              .StaticPageStruct
                                                              .maybeFromMap)
                                                      .toList()
                                                  as Iterable<
                                                      touchline_template_puum0i_data_schema
                                                      .StaticPageStruct?>)
                                              .withoutNulls
                                              .toList() ??
                                          [];

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: contPage.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 15.0),
                                        itemBuilder: (context, contPageIndex) {
                                          final contPageItem =
                                              contPage[contPageIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'MY_CLUB_FOLDER_Container_d56ypl1c_ON_TAP');
                                              if (contPageItem.type ==
                                                  'FOLDER') {
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  MyClubFolderWidget.routeName,
                                                  queryParameters: {
                                                    'rootKey': serializeParam(
                                                      contPageItem.title,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                    ),
                                                  },
                                                );
                                              } else {
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  MyClubPageWidget.routeName,
                                                  queryParameters: {
                                                    'objectId': serializeParam(
                                                      contPageItem.objectId,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                    ),
                                                  },
                                                );
                                              }
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 3.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 250.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.network(
                                                          contPageItem
                                                              .featuredImage,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Text(
                                                                  contPageItem
                                                                      .title,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ].divide(SizedBox(height: 14.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
