import '/flutter_flow/flutter_flow_util.dart';
import "package:touchline_template_puum0i/backend/schema/structs/index.dart"
    as touchline_template_puum0i_data_schema;
import 'package:touchline_template_puum0i/app_bar/app_bar_v1/app_bar_v1_widget.dart'
    as touchline_template_puum0i;
import 'package:touchline_template_puum0i/backend/api_requests/api_calls.dart'
    as touchline_template_puum0i_api_calls_util;
import 'package:touchline_template_puum0i/custom_code/widgets/index.dart'
    as touchline_template_puum0i_custom_widgets;
import 'package:touchline_template_puum0i/flutter_flow/flutter_flow_util.dart'
    as touchline_template_puum0i_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_club_page_model.dart';
export 'my_club_page_model.dart';

class MyClubPageWidget extends StatefulWidget {
  const MyClubPageWidget({
    super.key,
    required this.objectId,
  });

  final String? objectId;

  static String routeName = 'myClubPage';
  static String routePath = '/myClubPage';

  @override
  State<MyClubPageWidget> createState() => _MyClubPageWidgetState();
}

class _MyClubPageWidgetState extends State<MyClubPageWidget> {
  late MyClubPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyClubPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'myClubPage'});
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
          .BackendlessDatabaseGroup.getStaticPageContentByIDCall
          .call(
        pageObjectId: widget.objectId,
        bLProjectId: FFAppConstants.BLProjectId,
        bLRestAPIKey: FFAppConstants.BLRestAPIKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        final myClubPageGetStaticPageContentByIDResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
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
                          iconColour:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          backButtonReq: true,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (touchline_template_puum0i_data_schema
                                                  .StaticPageStruct
                                              .maybeFromMap(
                                                  myClubPageGetStaticPageContentByIDResponse
                                                      .jsonBody)
                                          ?.featuredImage !=
                                      null &&
                                  touchline_template_puum0i_data_schema
                                                  .StaticPageStruct
                                              .maybeFromMap(
                                                  myClubPageGetStaticPageContentByIDResponse
                                                      .jsonBody)
                                          ?.featuredImage !=
                                      '')
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      touchline_template_puum0i_data_schema
                                                  .StaticPageStruct
                                              .maybeFromMap(
                                                  myClubPageGetStaticPageContentByIDResponse
                                                      .jsonBody)
                                          ?.featuredImage,
                                      'https://harriers.co.uk/wp-content/uploads/04-2.jpg',
                                    ),
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 250.0,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.png',
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 250.0,
                                      fit: BoxFit.cover,
                                    ),
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
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            valueOrDefault<String>(
                                              touchline_template_puum0i_data_schema
                                                          .StaticPageStruct
                                                      .maybeFromMap(
                                                          myClubPageGetStaticPageContentByIDResponse
                                                              .jsonBody)
                                                  ?.title,
                                              'Title',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(),
                                              child:
                                                  touchline_template_puum0i_custom_widgets
                                                      .ResponsiveHtmlViewer3(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 400.0,
                                                htmlContent:
                                                    touchline_template_puum0i_data_schema
                                                                .StaticPageStruct
                                                            .maybeFromMap(
                                                                myClubPageGetStaticPageContentByIDResponse
                                                                    .jsonBody)!
                                                        .fullBody,
                                              ),
                                            ),
                                          ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
