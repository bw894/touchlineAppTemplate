import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/cart_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'shop_individual_product_model.dart';
export 'shop_individual_product_model.dart';

class ShopIndividualProductWidget extends StatefulWidget {
  const ShopIndividualProductWidget({
    super.key,
    this.objectId,
  });

  final String? objectId;

  static String routeName = 'shopIndividualProduct';
  static String routePath = '/shopIndividualProduct';

  @override
  State<ShopIndividualProductWidget> createState() =>
      _ShopIndividualProductWidgetState();
}

class _ShopIndividualProductWidgetState
    extends State<ShopIndividualProductWidget> {
  late ShopIndividualProductModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShopIndividualProductModel());

    _model.productDescriptionExpandableController =
        ExpandableController(initialExpanded: false);
    _model.shippingExpandableController =
        ExpandableController(initialExpanded: false);
    _model.returnsPolicyExpandableController =
        ExpandableController(initialExpanded: false);
    _model.reviewsExpandableController =
        ExpandableController(initialExpanded: false);
    _model.reviewCommentTextController ??= TextEditingController();
    _model.reviewCommentFocusNode ??= FocusNode();

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

    return FutureBuilder<ApiCallResponse>(
      future: ShopGroup.getSingleShopItemCall.call(
        shopItemObjectId: widget.objectId,
        bLappId: FFLibraryValues().BLProjectId,
        bLRestApiKey: FFLibraryValues().BLRestAPIKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitWanderingCubes(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final shopIndividualProductGetSingleShopItemResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            floatingActionButton: Align(
              alignment: AlignmentDirectional(-0.85, -0.8),
              child: FloatingActionButton(
                onPressed: () async {
                  context.safePop();
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                elevation: 2.0,
                child: Icon(
                  Icons.west,
                  color: FlutterFlowTheme.of(context).info,
                  size: 24.0,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Builder(
                    builder: (context) {
                      final image = (ShopItemStruct.maybeFromMap(
                                      shopIndividualProductGetSingleShopItemResponse
                                          .jsonBody)
                                  ?.sizes
                                  .elementAtOrNull(_model.selectedIndex))
                              ?.imagesJSON
                              .toList() ??
                          [];

                      return Container(
                        width: double.infinity,
                        height: 350.0,
                        child: Stack(
                          children: [
                            PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage:
                                          max(0, min(0, image.length - 1))),
                              scrollDirection: Axis.horizontal,
                              itemCount: image.length,
                              itemBuilder: (context, imageIndex) {
                                final imageItem = image[imageIndex];
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Image.network(
                                    imageItem,
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage:
                                              max(0, min(0, image.length - 1))),
                                  count: image.length,
                                  axisDirection: Axis.horizontal,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController!
                                        .animateToPage(
                                      i,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                    safeSetState(() {});
                                  },
                                  effect: smooth_page_indicator.SlideEffect(
                                    spacing: 8.0,
                                    radius: 8.0,
                                    dotWidth: 8.0,
                                    dotHeight: 8.0,
                                    dotColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    activeDotColor:
                                        FlutterFlowTheme.of(context).primary,
                                    paintStyle: PaintingStyle.stroke,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Divider(
                    height: 1.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).shopBorder,
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 3.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (((ShopItemStruct.maybeFromMap(shopIndividualProductGetSingleShopItemResponse.jsonBody)?.brandName !=
                                                null &&
                                            ShopItemStruct.maybeFromMap(shopIndividualProductGetSingleShopItemResponse.jsonBody)
                                                    ?.brandName !=
                                                '') &&
                                        (ShopItemStruct.maybeFromMap(
                                                    shopIndividualProductGetSingleShopItemResponse
                                                        .jsonBody)
                                                ?.brandName !=
                                            'null')) ||
                                    ((ShopItemStruct.maybeFromMap(shopIndividualProductGetSingleShopItemResponse.jsonBody)
                                                    ?.brandImage !=
                                                null &&
                                            ShopItemStruct.maybeFromMap(
                                                        shopIndividualProductGetSingleShopItemResponse
                                                            .jsonBody)
                                                    ?.brandImage !=
                                                '') &&
                                        (ShopItemStruct.maybeFromMap(
                                                    shopIndividualProductGetSingleShopItemResponse.jsonBody)
                                                ?.brandImage !=
                                            'null')))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 6.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((ShopItemStruct.maybeFromMap(
                                                            shopIndividualProductGetSingleShopItemResponse
                                                                .jsonBody)
                                                        ?.brandName !=
                                                    null &&
                                                ShopItemStruct.maybeFromMap(
                                                            shopIndividualProductGetSingleShopItemResponse
                                                                .jsonBody)
                                                        ?.brandName !=
                                                    '') &&
                                            (ShopItemStruct.maybeFromMap(
                                                        shopIndividualProductGetSingleShopItemResponse
                                                            .jsonBody)
                                                    ?.brandName !=
                                                'null'))
                                          Text(
                                            valueOrDefault<String>(
                                              ShopItemStruct.maybeFromMap(
                                                      shopIndividualProductGetSingleShopItemResponse
                                                          .jsonBody)
                                                  ?.brandName,
                                              'Brand Name',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        if ((ShopItemStruct.maybeFromMap(
                                                            shopIndividualProductGetSingleShopItemResponse
                                                                .jsonBody)
                                                        ?.brandImage !=
                                                    null &&
                                                ShopItemStruct.maybeFromMap(
                                                            shopIndividualProductGetSingleShopItemResponse
                                                                .jsonBody)
                                                        ?.brandImage !=
                                                    '') &&
                                            (ShopItemStruct.maybeFromMap(
                                                        shopIndividualProductGetSingleShopItemResponse
                                                            .jsonBody)
                                                    ?.brandImage !=
                                                'null'))
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: Image.network(
                                              ShopItemStruct.maybeFromMap(
                                                      shopIndividualProductGetSingleShopItemResponse
                                                          .jsonBody)!
                                                  .brandImage,
                                              width: 28.0,
                                              height: 28.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                  ),
                                if ((ShopItemStruct.maybeFromMap(
                                                    shopIndividualProductGetSingleShopItemResponse
                                                        .jsonBody)
                                                ?.saleText !=
                                            null &&
                                        ShopItemStruct.maybeFromMap(
                                                    shopIndividualProductGetSingleShopItemResponse
                                                        .jsonBody)
                                                ?.saleText !=
                                            '') &&
                                    (ShopItemStruct.maybeFromMap(
                                                shopIndividualProductGetSingleShopItemResponse
                                                    .jsonBody)
                                            ?.saleText !=
                                        'null'))
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 6.0, 10.0, 6.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          ShopItemStruct.maybeFromMap(
                                                  shopIndividualProductGetSingleShopItemResponse
                                                      .jsonBody)
                                              ?.saleText,
                                          'Sale!',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 6.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    valueOrDefault<String>(
                                      ShopItemStruct.maybeFromMap(
                                              shopIndividualProductGetSingleShopItemResponse
                                                  .jsonBody)
                                          ?.name,
                                      'Product Name',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 23.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (!ShopItemStruct.maybeFromMap(
                                        shopIndividualProductGetSingleShopItemResponse
                                            .jsonBody)!
                                    .sizes
                                    .elementAtOrNull(_model.selectedIndex)!
                                    .onSale)
                                  Text(
                                    '£${valueOrDefault<String>(
                                      formatNumber(
                                        (ShopItemStruct.maybeFromMap(
                                                    shopIndividualProductGetSingleShopItemResponse
                                                        .jsonBody)
                                                ?.sizes
                                                .elementAtOrNull(
                                                    _model.selectedIndex))
                                            ?.priceIncVat,
                                        formatType: FormatType.custom,
                                        format: '###0.00',
                                        locale: 'en_GB',
                                      ),
                                      '0.00',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 23.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                if ((ShopItemStruct.maybeFromMap(
                                                shopIndividualProductGetSingleShopItemResponse
                                                    .jsonBody)
                                            ?.sizes
                                            .elementAtOrNull(
                                                _model.selectedIndex))
                                        ?.onSale ??
                                    true)
                                  Text(
                                    '£${valueOrDefault<String>(
                                      formatNumber(
                                        (ShopItemStruct.maybeFromMap(
                                                    shopIndividualProductGetSingleShopItemResponse
                                                        .jsonBody)
                                                ?.sizes
                                                .elementAtOrNull(
                                                    _model.selectedIndex))
                                            ?.priceIncVat,
                                        formatType: FormatType.custom,
                                        format: '###0.00',
                                        locale: 'en_GB',
                                      ),
                                      '0.00',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 23.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                  ),
                                if ((ShopItemStruct.maybeFromMap(
                                                shopIndividualProductGetSingleShopItemResponse
                                                    .jsonBody)
                                            ?.sizes
                                            .elementAtOrNull(
                                                _model.selectedIndex))
                                        ?.onSale ??
                                    true)
                                  Text(
                                    '£${valueOrDefault<String>(
                                      formatNumber(
                                        (ShopItemStruct.maybeFromMap(
                                                    shopIndividualProductGetSingleShopItemResponse
                                                        .jsonBody)
                                                ?.sizes
                                                .elementAtOrNull(
                                                    _model.selectedIndex))
                                            ?.salePriceIncVat,
                                        formatType: FormatType.custom,
                                        format: '###0.00',
                                        locale: 'en_GB',
                                      ),
                                      '0.00',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 23.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                              ].divide(SizedBox(width: 6.0)),
                            ),
                          ),
                          if ((ShopItemStruct.maybeFromMap(
                                              shopIndividualProductGetSingleShopItemResponse
                                                  .jsonBody)
                                          ?.shortDescription !=
                                      null &&
                                  ShopItemStruct.maybeFromMap(
                                              shopIndividualProductGetSingleShopItemResponse
                                                  .jsonBody)
                                          ?.shortDescription !=
                                      '') &&
                              (ShopItemStruct.maybeFromMap(
                                          shopIndividualProductGetSingleShopItemResponse
                                              .jsonBody)
                                      ?.shortDescription !=
                                  'null'))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 18.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      valueOrDefault<String>(
                                        ShopItemStruct.maybeFromMap(
                                                shopIndividualProductGetSingleShopItemResponse
                                                    .jsonBody)
                                            ?.shortDescription,
                                        'short description goes here',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (ShopItemStruct.maybeFromMap(
                                      shopIndividualProductGetSingleShopItemResponse
                                          .jsonBody)!
                                  .sizes
                                  .length >
                              1)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        'Choose Option',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final size = ShopItemStruct.maybeFromMap(
                                                  shopIndividualProductGetSingleShopItemResponse
                                                      .jsonBody)
                                              ?.sizes
                                              .sortedList(
                                                  keyOf: (e) => e.sortOrder,
                                                  desc: false)
                                              .toList() ??
                                          [];

                                      return Wrap(
                                        spacing: 15.0,
                                        runSpacing: 12.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: List.generate(size.length,
                                            (sizeIndex) {
                                          final sizeItem = size[sizeIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.selectedIndex = sizeIndex;
                                              safeSetState(() {});
                                            },
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 230),
                                              curve: Curves.easeInOut,
                                              width: 75.0,
                                              height: 33.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  _model.selectedIndex ==
                                                          sizeIndex
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .shopDark
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    _model.selectedIndex ==
                                                            sizeIndex
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .shopDark
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .shopBorder,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AnimatedDefaultTextStyle(
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.selectedIndex ==
                                                                  sizeIndex
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryBackground
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .shopDark,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                        ),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  duration: Duration(
                                                      milliseconds: 405),
                                                  curve: Curves.easeIn,
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      sizeItem.shortName,
                                                      'S',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().updateCheckoutStruct(
                                        (e) => e
                                          ..updateCartLines(
                                            (e) => e.add(CartLinesStruct(
                                              qty: 1,
                                              title: valueOrDefault<String>(
                                                ShopItemStruct.maybeFromMap(
                                                        shopIndividualProductGetSingleShopItemResponse
                                                            .jsonBody)
                                                    ?.name,
                                                'Product Name',
                                              ),
                                              type: 'SHOP',
                                              productId: widget.objectId,
                                              itemTotal: ShopItemStruct
                                                          .maybeFromMap(
                                                              shopIndividualProductGetSingleShopItemResponse
                                                                  .jsonBody)!
                                                      .sizes
                                                      .elementAtOrNull(
                                                          _model.selectedIndex)!
                                                      .onSale
                                                  ? (ShopItemStruct.maybeFromMap(
                                                              shopIndividualProductGetSingleShopItemResponse
                                                                  .jsonBody)
                                                          ?.sizes
                                                          .elementAtOrNull(_model
                                                              .selectedIndex))
                                                      ?.salePriceIncVat
                                                  : (ShopItemStruct.maybeFromMap(
                                                              shopIndividualProductGetSingleShopItemResponse
                                                                  .jsonBody)
                                                          ?.sizes
                                                          .elementAtOrNull(_model
                                                              .selectedIndex))
                                                      ?.priceIncVat,
                                              lineTotal: ShopItemStruct
                                                          .maybeFromMap(
                                                              shopIndividualProductGetSingleShopItemResponse
                                                                  .jsonBody)!
                                                      .sizes
                                                      .elementAtOrNull(
                                                          _model.selectedIndex)!
                                                      .onSale
                                                  ? (ShopItemStruct.maybeFromMap(
                                                              shopIndividualProductGetSingleShopItemResponse
                                                                  .jsonBody)
                                                          ?.sizes
                                                          .elementAtOrNull(_model
                                                              .selectedIndex))
                                                      ?.salePriceIncVat
                                                  : (ShopItemStruct.maybeFromMap(
                                                              shopIndividualProductGetSingleShopItemResponse
                                                                  .jsonBody)
                                                          ?.sizes
                                                          .elementAtOrNull(_model
                                                              .selectedIndex))
                                                      ?.priceIncVat,
                                              lineTax: ShopItemStruct.maybeFromMap(shopIndividualProductGetSingleShopItemResponse.jsonBody)!
                                                      .sizes
                                                      .elementAtOrNull(
                                                          _model.selectedIndex)!
                                                      .onSale
                                                  ? (ShopItemStruct.maybeFromMap(shopIndividualProductGetSingleShopItemResponse.jsonBody)!
                                                          .sizes
                                                          .elementAtOrNull(_model
                                                              .selectedIndex)!
                                                          .salePriceIncVat -
                                                      ShopItemStruct.maybeFromMap(shopIndividualProductGetSingleShopItemResponse.jsonBody)!
                                                          .sizes
                                                          .elementAtOrNull(_model
                                                              .selectedIndex)!
                                                          .salePriceExVat)
                                                  : (ShopItemStruct.maybeFromMap(shopIndividualProductGetSingleShopItemResponse.jsonBody)!
                                                          .sizes
                                                          .elementAtOrNull(_model
                                                              .selectedIndex)!
                                                          .priceIncVat -
                                                      ShopItemStruct.maybeFromMap(
                                                              shopIndividualProductGetSingleShopItemResponse.jsonBody)!
                                                          .sizes
                                                          .elementAtOrNull(_model.selectedIndex)!
                                                          .priceExVat),
                                              itemTax: ShopItemStruct.maybeFromMap(shopIndividualProductGetSingleShopItemResponse.jsonBody)!
                                                      .sizes
                                                      .elementAtOrNull(
                                                          _model.selectedIndex)!
                                                      .onSale
                                                  ? (ShopItemStruct.maybeFromMap(shopIndividualProductGetSingleShopItemResponse.jsonBody)!
                                                          .sizes
                                                          .elementAtOrNull(_model
                                                              .selectedIndex)!
                                                          .salePriceIncVat -
                                                      ShopItemStruct.maybeFromMap(shopIndividualProductGetSingleShopItemResponse.jsonBody)!
                                                          .sizes
                                                          .elementAtOrNull(_model
                                                              .selectedIndex)!
                                                          .salePriceExVat)
                                                  : (ShopItemStruct.maybeFromMap(shopIndividualProductGetSingleShopItemResponse.jsonBody)!
                                                          .sizes
                                                          .elementAtOrNull(_model
                                                              .selectedIndex)!
                                                          .priceIncVat -
                                                      ShopItemStruct.maybeFromMap(
                                                              shopIndividualProductGetSingleShopItemResponse.jsonBody)!
                                                          .sizes
                                                          .elementAtOrNull(_model.selectedIndex)!
                                                          .priceExVat),
                                              productImage:
                                                  ShopItemStruct.maybeFromMap(
                                                          shopIndividualProductGetSingleShopItemResponse
                                                              .jsonBody)
                                                      ?.mainImage,
                                              onSale: (ShopItemStruct.maybeFromMap(
                                                          shopIndividualProductGetSingleShopItemResponse
                                                              .jsonBody)
                                                      ?.sizes
                                                      .elementAtOrNull(
                                                          _model.selectedIndex))
                                                  ?.onSale,
                                              regularItemPrice: (ShopItemStruct
                                                          .maybeFromMap(
                                                              shopIndividualProductGetSingleShopItemResponse
                                                                  .jsonBody)
                                                      ?.sizes
                                                      .elementAtOrNull(
                                                          _model.selectedIndex))
                                                  ?.priceIncVat,
                                              sizeObjectId: (ShopItemStruct
                                                          .maybeFromMap(
                                                              shopIndividualProductGetSingleShopItemResponse
                                                                  .jsonBody)
                                                      ?.sizes
                                                      .elementAtOrNull(
                                                          _model.selectedIndex))
                                                  ?.objectId,
                                              sizeTitle: (ShopItemStruct
                                                          .maybeFromMap(
                                                              shopIndividualProductGetSingleShopItemResponse
                                                                  .jsonBody)
                                                      ?.sizes
                                                      .elementAtOrNull(
                                                          _model.selectedIndex))
                                                  ?.name,
                                            )),
                                          ),
                                      );
                                      FFAppState().update(() {});
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.9,
                                                  child: CartComponentWidget(
                                                    popup: true,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    text: 'ADD TO BAG',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: 'ADD TO WISHLIST',
                                  icon: Icon(
                                    Icons.favorite_border,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0x00D5242D),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Color(0xFFD9D9D9),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if ((ShopItemStruct.maybeFromMap(
                                                    shopIndividualProductGetSingleShopItemResponse
                                                        .jsonBody)
                                                ?.description !=
                                            null &&
                                        ShopItemStruct.maybeFromMap(
                                                    shopIndividualProductGetSingleShopItemResponse
                                                        .jsonBody)
                                                ?.description !=
                                            '') &&
                                    (ShopItemStruct.maybeFromMap(
                                                shopIndividualProductGetSingleShopItemResponse
                                                    .jsonBody)
                                            ?.description !=
                                        'null'))
                                  Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      controller: _model
                                          .productDescriptionExpandableController,
                                      child: ExpandablePanel(
                                        header: Text(
                                          'Product Description',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        collapsed: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              height: 4.0,
                                              thickness: 2.0,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ].addToEnd(SizedBox(height: 15.0)),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      ShopItemStruct.maybeFromMap(
                                                              shopIndividualProductGetSingleShopItemResponse
                                                                  .jsonBody)
                                                          ?.description,
                                                      'description goes here',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              height: 4.0,
                                              thickness: 2.0,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 20.0))
                                              .addToEnd(SizedBox(height: 15.0)),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      controller:
                                          _model.shippingExpandableController,
                                      child: ExpandablePanel(
                                        header: Text(
                                          'Shipping',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        collapsed: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              height: 4.0,
                                              thickness: 2.0,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ].addToEnd(SizedBox(height: 15.0)),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 90.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFD9D9D9),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .store_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 18.0,
                                                            ),
                                                            Text(
                                                              'Click & Collect',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                        Text(
                                                          'In Stock',
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .predictorGreen,
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
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Opening Hours',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .chevron_right_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 13.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 4.0))
                                                          .addToStart(SizedBox(
                                                              height: 8.0))
                                                          .addToEnd(SizedBox(
                                                              height: 8.0)),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 90.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFD9D9D9),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              FFIcons
                                                                  .kuntitledDesign28,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 18.0,
                                                            ),
                                                            Text(
                                                              'Home Delivery',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                        Text(
                                                          '22nd-24th May',
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
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
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Estimated Delivery Date',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 4.0))
                                                          .addToStart(SizedBox(
                                                              height: 8.0))
                                                          .addToEnd(SizedBox(
                                                              height: 8.0)),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                            Divider(
                                              height: 4.0,
                                              thickness: 2.0,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 20.0))
                                              .addToEnd(SizedBox(height: 15.0)),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    color: Color(0x00000000),
                                    child: ExpandableNotifier(
                                      controller: _model
                                          .returnsPolicyExpandableController,
                                      child: ExpandablePanel(
                                        header: Text(
                                          'Returns Policy',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                                color: Colors.black,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        collapsed: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              height: 4.0,
                                              thickness: 2.0,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ].addToEnd(SizedBox(height: 15.0)),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore\nmagna aliqua. Ut enim ad minim veniam, quis nostrud\nexercitation ullamco laboris nisi ut aliquip ex ea\ncommodo consequat. Duis aute irure dolor in\nreprehenderit in voluptate velit esse cillum dolore eu\nfugiat nulla pariatur. Excepteur sint occaecat cupidatat\nnon proident, sunt in culpa qui officia deserunt mollit\nanim id est laborum.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              height: 4.0,
                                              thickness: 2.0,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 20.0))
                                              .addToEnd(SizedBox(height: 15.0)),
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse>(
                                  future:
                                      ShopGroup.getReviewsForAShopItemCall.call(
                                    shopItemObjectId: widget.objectId,
                                    offset: _model.reviewsOffset,
                                    bLappId: FFLibraryValues().BLProjectId,
                                    bLRestApiKey:
                                        FFLibraryValues().BLRestAPIKey,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitWanderingCubes(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    final containerGetReviewsForAShopItemResponse =
                                        snapshot.data!;

                                    return Container(
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: ShopGroup
                                            .getNumberOfReviewsForASingleProductCall
                                            .call(
                                          shopItemObjectId: widget.objectId,
                                          bLappId:
                                              FFLibraryValues().BLProjectId,
                                          bLRestApiKey:
                                              FFLibraryValues().BLRestAPIKey,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitWanderingCubes(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final reviewsGetNumberOfReviewsForASingleProductResponse =
                                              snapshot.data!;

                                          return Container(
                                            width: double.infinity,
                                            color: Color(0x00000000),
                                            child: ExpandableNotifier(
                                              controller: _model
                                                  .reviewsExpandableController,
                                              child: ExpandablePanel(
                                                header: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          'Reviews',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.star_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            ShopItemStruct.maybeFromMap(
                                                                            shopIndividualProductGetSingleShopItemResponse.jsonBody)!
                                                                        .avgRating <
                                                                    1.0
                                                                ? '--'
                                                                : formatNumber(
                                                                    ShopItemStruct.maybeFromMap(
                                                                            shopIndividualProductGetSingleShopItemResponse.jsonBody)
                                                                        ?.avgRating,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format:
                                                                        '0.0',
                                                                    locale: '',
                                                                  ),
                                                            '--',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 1.0)),
                                                    ),
                                                    Text(
                                                      '(${reviewsGetNumberOfReviewsForASingleProductResponse.bodyText} Reviews)',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                collapsed: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      height: 4.0,
                                                      thickness: 2.0,
                                                      color: Color(0xFFD9D9D9),
                                                    ),
                                                  ].addToEnd(
                                                      SizedBox(height: 15.0)),
                                                ),
                                                expanded: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            'Reviews are exclusively from verified purchasers.',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFD9D9D9),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    15.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    'How was Home Shirt 25/26?',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if ((_model.newReviewStarsSelected !=
                                                                        null) &&
                                                                    (_model.newReviewStarsSelected! >=
                                                                        1))
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.newReviewStarsSelected =
                                                                          1;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_rate_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                if ((_model.newReviewStarsSelected !=
                                                                        null) &&
                                                                    (_model.newReviewStarsSelected! >=
                                                                        2))
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.newReviewStarsSelected =
                                                                          2;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_rate_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                if ((_model.newReviewStarsSelected !=
                                                                        null) &&
                                                                    (_model.newReviewStarsSelected! >=
                                                                        3))
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.newReviewStarsSelected =
                                                                          3;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_rate_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                if ((_model.newReviewStarsSelected !=
                                                                        null) &&
                                                                    (_model.newReviewStarsSelected! >=
                                                                        4))
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.newReviewStarsSelected =
                                                                          4;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_rate_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                if ((_model.newReviewStarsSelected !=
                                                                        null) &&
                                                                    (_model.newReviewStarsSelected! >=
                                                                        5))
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.newReviewStarsSelected =
                                                                          5;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_rate_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                if (_model
                                                                        .newReviewStarsSelected ==
                                                                    null)
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.newReviewStarsSelected =
                                                                          1;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_border_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                if ((_model.newReviewStarsSelected ==
                                                                        null) ||
                                                                    (_model.newReviewStarsSelected! <=
                                                                        1))
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.newReviewStarsSelected =
                                                                          2;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_border_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                if ((_model.newReviewStarsSelected ==
                                                                        null) ||
                                                                    (_model.newReviewStarsSelected! <=
                                                                        2))
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.newReviewStarsSelected =
                                                                          3;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_border_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                if ((_model.newReviewStarsSelected ==
                                                                        null) ||
                                                                    (_model.newReviewStarsSelected! <=
                                                                        3))
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.newReviewStarsSelected =
                                                                          4;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_border_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                if ((_model.newReviewStarsSelected ==
                                                                        null) ||
                                                                    (_model.newReviewStarsSelected! <=
                                                                        4))
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.newReviewStarsSelected =
                                                                          5;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .star_border_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .reviewCommentTextController,
                                                                  focusNode: _model
                                                                      .reviewCommentFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  enabled: true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    isDense:
                                                                        true,
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText:
                                                                        'Comment (optional)',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    enabledBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    focusedBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    errorBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    focusedErrorBorder:
                                                                        InputBorder
                                                                            .none,
                                                                    filled:
                                                                        true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            20.0),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  maxLines:
                                                                      null,
                                                                  minLines: 1,
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .multiline,
                                                                  cursorColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  enableInteractiveSelection:
                                                                      true,
                                                                  validator: _model
                                                                      .reviewCommentTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      var _shouldSetState =
                                                                          false;
                                                                      if ((_model.newReviewStarsSelected ==
                                                                              null) ||
                                                                          (_model.newReviewStarsSelected! <
                                                                              1)) {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Please select rating',
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 1650),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).error,
                                                                          ),
                                                                        );
                                                                        if (_shouldSetState)
                                                                          safeSetState(
                                                                              () {});
                                                                        return;
                                                                      } else {
                                                                        _model.apiResultgg0 = await ShopGroup
                                                                            .postNewReviewContentCall
                                                                            .call(
                                                                          stars:
                                                                              _model.newReviewStarsSelected,
                                                                          comment: _model
                                                                              .reviewCommentTextController
                                                                              .text,
                                                                          bLappId:
                                                                              FFLibraryValues().BLProjectId,
                                                                          bLRestApiKey:
                                                                              FFLibraryValues().BLRestAPIKey,
                                                                        );

                                                                        _shouldSetState =
                                                                            true;
                                                                        if ((_model.apiResultgg0?.succeeded ??
                                                                            true)) {
                                                                          _model.apiResultyve = await ShopGroup
                                                                              .addReviewToShopItemCall
                                                                              .call(
                                                                            shopItemObjectId:
                                                                                widget.objectId,
                                                                            reviewObjectId:
                                                                                ShopReviewsStruct.maybeFromMap((_model.apiResultgg0?.jsonBody ?? ''))?.objectId,
                                                                            bLappId:
                                                                                FFLibraryValues().BLProjectId,
                                                                            bLRestApiKey:
                                                                                FFLibraryValues().BLRestAPIKey,
                                                                          );

                                                                          _shouldSetState =
                                                                              true;
                                                                          if (!(_model.apiResultyve?.succeeded ??
                                                                              true)) {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    title: Text('Failed to post review 2'),
                                                                                    content: Text((_model.apiResultyve?.bodyText ?? '')),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          }
                                                                          unawaited(
                                                                            () async {
                                                                              _model.apiResultqnm = await ShopGroup.addAuthorToReviewCall.call(
                                                                                reviewObjectId: ShopReviewsStruct.maybeFromMap((_model.apiResultgg0?.jsonBody ?? ''))?.objectId,
                                                                                userObjectId: FFAppState().currentUserObjectId,
                                                                                bLappId: FFLibraryValues().BLProjectId,
                                                                                bLRestApiKey: FFLibraryValues().BLRestAPIKey,
                                                                              );
                                                                            }(),
                                                                          );
                                                                          _shouldSetState =
                                                                              true;
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Review added!',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 1250),
                                                                              backgroundColor: FlutterFlowTheme.of(context).success,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  title: Text('Failed to post review 1'),
                                                                                  content: Text((_model.apiResultgg0?.bodyText ?? '')),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_shouldSetState)
                                                                            safeSetState(() {});
                                                                          return;
                                                                        }
                                                                      }

                                                                      if (_shouldSetState)
                                                                        safeSetState(
                                                                            () {});
                                                                    },
                                                                    text:
                                                                        'POST REVIEW',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  height: 8.0))
                                                              .addToStart(
                                                                  SizedBox(
                                                                      height:
                                                                          15.0))
                                                              .addToEnd(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final review = (containerGetReviewsForAShopItemResponse
                                                                        .jsonBody
                                                                        .toList()
                                                                        .map<ShopReviewsStruct?>(ShopReviewsStruct
                                                                            .maybeFromMap)
                                                                        .toList()
                                                                    as Iterable<
                                                                        ShopReviewsStruct?>)
                                                                .withoutNulls
                                                                .toList() ??
                                                            [];

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children:
                                                              List.generate(
                                                                  review.length,
                                                                  (reviewIndex) {
                                                            final reviewItem =
                                                                review[
                                                                    reviewIndex];
                                                            return Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        if (reviewItem.stars >=
                                                                            1)
                                                                          Icon(
                                                                            Icons.star_rate_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                        if (reviewItem.stars >=
                                                                            2)
                                                                          Icon(
                                                                            Icons.star_rate_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                        if (reviewItem.stars >=
                                                                            3)
                                                                          Icon(
                                                                            Icons.star_rate_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                        if (reviewItem.stars >=
                                                                            4)
                                                                          Icon(
                                                                            Icons.star_rate_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                        if (reviewItem.stars >=
                                                                            5)
                                                                          Icon(
                                                                            Icons.star_rate_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              () {
                                                                                if ((reviewItem.author.name == 'null') || (reviewItem.author.name == '')) {
                                                                                  return 'Anonymous';
                                                                                } else if (reviewItem.author.publicName) {
                                                                                  return functions.reviewNameFormat(reviewItem.author.name);
                                                                                } else {
                                                                                  return 'Anonymous';
                                                                                }
                                                                              }(),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                    ),
                                                                                    color: Colors.black,
                                                                                    fontSize: 15.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if ((reviewItem.comment !=
                                                                                '') &&
                                                                        (reviewItem.comment !=
                                                                            'null'))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  reviewItem.comment,
                                                                                  'Comment goes here',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                  ]
                                                                      .divide(SizedBox(
                                                                          height:
                                                                              3.0))
                                                                      .addToStart(SizedBox(
                                                                          height:
                                                                              15.0))
                                                                      .addToEnd(SizedBox(
                                                                          height:
                                                                              10.0)),
                                                                ),
                                                              ),
                                                            );
                                                          }).divide(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                        );
                                                      },
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Opacity(
                                                          opacity:
                                                              _model.reviewsOffset <
                                                                      10
                                                                  ? 0.0
                                                                  : 1.0,
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (_model
                                                                      .reviewsOffset <
                                                                  10) {
                                                                return;
                                                              }

                                                              _model.reviewsOffset =
                                                                  _model.reviewsOffset +
                                                                      -10;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Icon(
                                                                Icons.west,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Builder(
                                                          builder: (context) {
                                                            final page = functions
                                                                .getPageNumbers(
                                                                    reviewsGetNumberOfReviewsForASingleProductResponse
                                                                        .jsonBody)
                                                                .toList();

                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List
                                                                  .generate(
                                                                      page.length,
                                                                      (pageIndex) {
                                                                final pageItem =
                                                                    page[
                                                                        pageIndex];
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (pageItem ==
                                                                        (((_model.reviewsOffset + 10) /
                                                                                10)
                                                                            .round())) {
                                                                      return;
                                                                    }
                                                                    _model.reviewsOffset =
                                                                        (pageItem -
                                                                                1) *
                                                                            10;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            230),
                                                                    curve: Curves
                                                                        .easeInOut,
                                                                    width: 48.0,
                                                                    height:
                                                                        48.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: pageItem ==
                                                                              (((_model.reviewsOffset + 10) / 10)
                                                                                  .round())
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .shopDark
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          AnimatedDefaultTextStyle(
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: pageItem == (((_model.reviewsOffset + 10) / 10).round()) ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 17.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                        duration:
                                                                            Duration(milliseconds: 405),
                                                                        curve: Curves
                                                                            .easeIn,
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            pageItem.toString(),
                                                                            '1',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }).divide(
                                                                  SizedBox(
                                                                      width:
                                                                          8.0)),
                                                            );
                                                          },
                                                        ),
                                                        Opacity(
                                                          opacity: (((_model.reviewsOffset +
                                                                              10) /
                                                                          10)
                                                                      .round()) ==
                                                                  functions
                                                                      .getPageNumbers(
                                                                          reviewsGetNumberOfReviewsForASingleProductResponse
                                                                              .jsonBody)
                                                                      .lastOrNull
                                                              ? 0.0
                                                              : 1.0,
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if ((((_model.reviewsOffset +
                                                                              10) /
                                                                          10)
                                                                      .round()) ==
                                                                  functions
                                                                      .getPageNumbers(
                                                                          reviewsGetNumberOfReviewsForASingleProductResponse
                                                                              .jsonBody)
                                                                      .lastOrNull) {
                                                                return;
                                                              }

                                                              _model.reviewsOffset =
                                                                  _model.reviewsOffset +
                                                                      10;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              width: 48.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Icon(
                                                                Icons.east,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                    Divider(
                                                      height: 4.0,
                                                      thickness: 2.0,
                                                      color: Color(0xFFD9D9D9),
                                                    ),
                                                  ]
                                                      .divide(SizedBox(
                                                          height: 20.0))
                                                      .addToEnd(SizedBox(
                                                          height: 15.0)),
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: true,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
