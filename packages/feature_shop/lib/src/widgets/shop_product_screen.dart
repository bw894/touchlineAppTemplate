import 'dart:async';
import 'dart:math' show max, min;

import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:expandable/expandable.dart';
import 'package:feature_shop/src/providers.dart';
import 'package:feature_shop/src/widgets/cart_summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:theming/theming.dart';

/// Full-screen product detail page.
///
/// Fetches a single shop item by [objectId] and renders:
///  - An image carousel with SmoothPageIndicator
///  - Brand / sale badge row
///  - Product name and price (with sale price if on sale)
///  - Short description
///  - Option / size selector (shown only when the item has > 1 size)
///  - "ADD TO BAG" button → adds to [cartNotifierProvider] → bottom sheet
///  - "ADD TO WISHLIST" button (no-op — wishlist not yet implemented)
///  - Expandable: Product Description, Shipping, Returns Policy
///  - Expandable: Reviews (list + submit form)
class ShopProductScreen extends ConsumerStatefulWidget {
  const ShopProductScreen({
    super.key,
    required this.objectId,
    required this.projectId,
    required this.restApiKey,
    this.userObjectId = '',
  });

  final String objectId;
  final String projectId;
  final String restApiKey;
  final String userObjectId;

  @override
  ConsumerState<ShopProductScreen> createState() => _ShopProductScreenState();
}

class _ShopProductScreenState extends ConsumerState<ShopProductScreen> {
  int _selectedIndex = 0;
  PageController? _pageController;

  // Reviews
  int _reviewsOffset = 0;
  int? _newReviewStars;
  final _reviewCommentController = TextEditingController();
  bool _submittingReview = false;

  // Expandable controllers
  final _descExpandable =
      ExpandableController(initialExpanded: false);
  final _shippingExpandable =
      ExpandableController(initialExpanded: false);
  final _returnsExpandable =
      ExpandableController(initialExpanded: false);
  final _reviewsExpandable =
      ExpandableController(initialExpanded: false);

  @override
  void dispose() {
    _pageController?.dispose();
    _reviewCommentController.dispose();
    _descExpandable.dispose();
    _shippingExpandable.dispose();
    _returnsExpandable.dispose();
    _reviewsExpandable.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  String _formatPrice(double? v) =>
      v != null ? v.toStringAsFixed(2) : '0.00';

  /// Format reviewer display name: "John S." from "John Smith".
  String _reviewNameFormat(String name) {
    if (name.isEmpty || name == 'null') return 'Anonymous';
    final parts = name.trim().split(' ');
    if (parts.length == 1) return parts.first;
    return '${parts.first} ${parts.last[0]}.';
  }

  // ---------------------------------------------------------------------------
  // Add to bag
  // ---------------------------------------------------------------------------

  void _addToBag(ShopItemStruct item) {
    final size = item.sizes.elementAtOrNull(_selectedIndex);
    if (size == null) return;

    final onSale = size.onSale;
    final price = onSale ? size.salePriceIncVat : size.priceIncVat;
    final tax = onSale
        ? size.salePriceIncVat - size.salePriceExVat
        : size.priceIncVat - size.priceExVat;

    ref.read(cartNotifierProvider.notifier).addItem(
          CartLinesStruct(
            qty: 1,
            title: item.name.isNotEmpty ? item.name : 'Product',
            type: 'SHOP',
            productId: widget.objectId,
            itemTotal: price,
            lineTotal: price,
            lineTax: tax,
            itemTax: tax,
            productImage: item.mainImage,
            onSale: onSale,
            regularItemPrice: size.priceIncVat,
            sizeObjectId: size.objectId,
            sizeTitle: size.name,
          ),
        );

    showModalBottomSheet<void>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) => GestureDetector(
        onTap: () {
          FocusScope.of(ctx).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
          padding: MediaQuery.viewInsetsOf(ctx),
          child: SizedBox(
            height: MediaQuery.sizeOf(ctx).height * 0.9,
            child: CartSummaryWidget(popup: true),
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Submit review
  // ---------------------------------------------------------------------------

  Future<void> _submitReview() async {
    if (_newReviewStars == null || _newReviewStars! < 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Please select rating',
            style: TextStyle(color: Colors.white),
          ),
          duration: const Duration(milliseconds: 1650),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
      return;
    }

    setState(() => _submittingReview = true);

    // Capture context-sensitive refs before await
    final messenger = ScaffoldMessenger.of(context);
    final theme = Theme.of(context);

    final r1 = await ShopGroup.postNewReviewContentCall.call(
      stars: _newReviewStars,
      comment: _reviewCommentController.text,
      bLappId: widget.projectId,
      bLRestApiKey: widget.restApiKey,
    );

    if (!mounted) return;

    if (r1.succeeded) {
      final reviewId =
          ShopReviewsStruct.maybeFromMap(r1.jsonBody)?.objectId ?? '';

      final r2 = await ShopGroup.addReviewToShopItemCall.call(
        shopItemObjectId: widget.objectId,
        reviewObjectId: reviewId,
        bLappId: widget.projectId,
        bLRestApiKey: widget.restApiKey,
      );

      if (!mounted) return;

      if (!r2.succeeded) {
        showDialog<void>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Failed to post review'),
            content: Text(r2.bodyText),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Ok'),
              ),
            ],
          ),
        );
      } else {
        // Fire-and-forget author linkage
        unawaited(
          ShopGroup.addAuthorToReviewCall.call(
            reviewObjectId: reviewId,
            userObjectId: widget.userObjectId,
            bLappId: widget.projectId,
            bLRestApiKey: widget.restApiKey,
          ),
        );

        messenger.showSnackBar(
          SnackBar(
            content: Text(
              'Review added!',
              style: TextStyle(color: theme.colorScheme.onSurface),
            ),
            duration: const Duration(milliseconds: 1250),
            backgroundColor: theme.colorScheme.secondary,
          ),
        );

        setState(() {
          _newReviewStars = null;
          _reviewCommentController.clear();
        });
      }
    } else {
      if (!mounted) return;
      showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Failed to post review'),
          content: Text(r1.bodyText),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }

    if (mounted) setState(() => _submittingReview = false);
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<TouchlineColors>();

    final args = (
      objectId: widget.objectId,
      projectId: widget.projectId,
      restApiKey: widget.restApiKey,
    );
    final shopItem = ref.watch(shopItemProvider(args));
    final reviewArgs = (
      objectId: widget.objectId,
      offset: _reviewsOffset,
      projectId: widget.projectId,
      restApiKey: widget.restApiKey,
    );
    final countArgs = (
      objectId: widget.objectId,
      projectId: widget.projectId,
      restApiKey: widget.restApiKey,
    );
    final reviews = ref.watch(shopReviewsProvider(reviewArgs));
    final reviewCount = ref.watch(shopReviewCountProvider(countArgs));

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        floatingActionButton: Align(
          alignment: const AlignmentDirectional(-0.85, -0.8),
          child: FloatingActionButton(
            onPressed: () => Navigator.of(context).maybePop(),
            backgroundColor: theme.colorScheme.primary,
            elevation: 2.0,
            child: Icon(Icons.west, color: theme.colorScheme.onPrimary),
          ),
        ),
        body: shopItem.when(
          loading: () => Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitWanderingCubes(
                color: theme.colorScheme.primary,
                size: 50.0,
              ),
            ),
          ),
          error: (_, __) => const Center(child: Text('Failed to load product')),
          data: (item) {
            if (item == null) {
              return const Center(child: Text('Product not found'));
            }
            return _buildContent(context, theme, colors, item, reviews, reviewCount);
          },
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ThemeData theme,
    TouchlineColors? colors,
    ShopItemStruct item,
    AsyncValue<List<ShopReviewsStruct>> reviews,
    AsyncValue<int> reviewCount,
  ) {
    final selectedSize = item.sizes.elementAtOrNull(_selectedIndex);
    final images = selectedSize?.imagesJSON.toList() ?? [];

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // -------------------------------------------------------------------
          // Image carousel
          // -------------------------------------------------------------------
          SizedBox(
            width: double.infinity,
            height: 350.0,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController ??= PageController(
                    initialPage: max(0, min(0, images.length - 1)),
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, i) => ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.network(
                      images[i],
                      width: double.infinity,
                      height: 350.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (images.isNotEmpty)
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: smooth_page_indicator.SmoothPageIndicator(
                        controller: _pageController ??= PageController(
                          initialPage:
                              max(0, min(0, images.length - 1)),
                        ),
                        count: images.length,
                        axisDirection: Axis.horizontal,
                        onDotClicked: (i) async {
                          await _pageController?.animateToPage(
                            i,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                          setState(() {});
                        },
                        effect:
                            smooth_page_indicator.SlideEffect(
                          spacing: 8.0,
                          radius: 8.0,
                          dotWidth: 8.0,
                          dotHeight: 8.0,
                          dotColor: theme.colorScheme.surface,
                          activeDotColor: theme.colorScheme.primary,
                          paintStyle: PaintingStyle.stroke,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: colors?.shopBorder ?? theme.dividerColor,
          ),
          // -------------------------------------------------------------------
          // Product details
          // -------------------------------------------------------------------
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  20.0, 10.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand row + sale badge
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 3.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_hasBrandInfo(item))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 6.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (_hasBrandName(item))
                                  Text(
                                    item.brandName,
                                    style: theme.textTheme.bodyMedium
                                        ?.copyWith(fontSize: 12.0),
                                  ),
                                if (_hasBrandImage(item))
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      item.brandImage,
                                      width: 28.0,
                                      height: 28.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              ].divide(const SizedBox(width: 5.0)),
                            ),
                          ),
                        if (_hasSaleText(item))
                          Container(
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 6.0, 10.0, 6.0),
                              child: Text(
                                item.saleText,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.surface,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  // Product name
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 6.0),
                    child: Text(
                      item.name.isNotEmpty ? item.name : 'Product Name',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 23.0,
                      ),
                    ),
                  ),
                  // Price row
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (selectedSize != null && !selectedSize.onSale)
                          Text(
                            '£${_formatPrice(selectedSize.priceIncVat)}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0,
                            ),
                          ),
                        if (selectedSize != null && selectedSize.onSale) ...[
                          Text(
                            '£${_formatPrice(selectedSize.priceIncVat)}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 23.0,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            '£${_formatPrice(selectedSize.salePriceIncVat)}',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                              fontSize: 23.0,
                            ),
                          ),
                        ],
                      ].divide(const SizedBox(width: 6.0)),
                    ),
                  ),
                  // Short description
                  if (_hasShortDescription(item))
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 18.0),
                      child: Text(
                        item.shortDescription,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  // Size / option selector
                  if (item.sizes.length > 1)
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Text(
                                'Choose Option',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.0,
                                ),
                              ),
                            ),
                          ),
                          Wrap(
                            spacing: 15.0,
                            runSpacing: 12.0,
                            alignment: WrapAlignment.start,
                            children: List.generate(
                              item.sizes.length,
                              (i) {
                                final sz = item.sizes[i];
                                final selected = _selectedIndex == i;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = i;
                                      _pageController?.jumpToPage(0);
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration:
                                        const Duration(milliseconds: 230),
                                    curve: Curves.easeInOut,
                                    width: 75.0,
                                    height: 33.0,
                                    decoration: BoxDecoration(
                                      color: selected
                                          ? (colors?.shopDark ??
                                              theme.colorScheme.onSurface)
                                          : theme.colorScheme.surface,
                                      borderRadius:
                                          BorderRadius.circular(4.0),
                                      border: Border.all(
                                        color: selected
                                            ? (colors?.shopDark ??
                                                theme.colorScheme.onSurface)
                                            : (colors?.shopBorder ??
                                                theme.dividerColor),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: AnimatedDefaultTextStyle(
                                        style: (theme.textTheme.bodyMedium ??
                                                const TextStyle())
                                            .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: selected
                                              ? theme.colorScheme.surface
                                              : (colors?.shopDark ??
                                                  theme
                                                      .colorScheme.onSurface),
                                          fontSize: 12.0,
                                        ),
                                        duration: const Duration(
                                            milliseconds: 405),
                                        curve: Curves.easeIn,
                                        child: Text(
                                          sz.shortName.isNotEmpty
                                              ? sz.shortName
                                              : sz.name,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  // Add to Bag button
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: ElevatedButton(
                        onPressed: () => _addToBag(item),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: Colors.white,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          textStyle: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                        child: const Text('ADD TO BAG'),
                      ),
                    ),
                  ),
                  // Add to Wishlist button (no-op)
                  SizedBox(
                    width: double.infinity,
                    height: 40.0,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border, size: 15.0),
                      label: const Text('ADD TO WISHLIST'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: theme.colorScheme.onSurface,
                        side: const BorderSide(color: Color(0xFFD9D9D9)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        elevation: 0.0,
                        textStyle: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                  // -----------------------------------------------------------
                  // Expandable sections
                  // -----------------------------------------------------------
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 12.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_hasDescription(item))
                          _buildExpandable(
                            controller: _descExpandable,
                            header: 'Product Description',
                            theme: theme,
                            content: Text(
                              item.description,
                              overflow: TextOverflow.clip,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                        _buildExpandable(
                          controller: _shippingExpandable,
                          header: 'Shipping',
                          theme: theme,
                          content: _buildShippingContent(theme, colors),
                        ),
                        _buildExpandable(
                          controller: _returnsExpandable,
                          header: 'Returns Policy',
                          theme: theme,
                          content: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                            'sed do eiusmod tempor incididunt ut labore et dolore '
                            'magna aliqua.',
                            overflow: TextOverflow.clip,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        // Reviews expandable
                        _buildReviewsExpandable(
                            item, reviews, reviewCount, theme),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Expandable builder helpers
  // ---------------------------------------------------------------------------

  Widget _buildExpandable({
    required ExpandableController controller,
    required String header,
    required ThemeData theme,
    required Widget content,
  }) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: ExpandableNotifier(
        controller: controller,
        child: ExpandablePanel(
          header: Text(
            header,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
          collapsed: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(height: 4.0, thickness: 2.0, color: Color(0xFFD9D9D9)),
              const SizedBox(height: 15.0),
            ],
          ),
          expanded: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              content,
              const Divider(height: 4.0, thickness: 2.0, color: Color(0xFFD9D9D9)),
              const SizedBox(height: 15.0),
            ],
          ),
          theme: const ExpandableThemeData(
            tapHeaderToExpand: true,
            tapBodyToExpand: false,
            tapBodyToCollapse: false,
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            hasIcon: true,
          ),
        ),
      ),
    );
  }

  Widget _buildShippingContent(ThemeData theme, TouchlineColors? colors) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            height: 90.0,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8.0),
              border: const Border.fromBorderSide(
                BorderSide(color: Color(0xFFD9D9D9)),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.store_outlined,
                      color: theme.colorScheme.onSurface,
                      size: 18.0,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      'Click & Collect',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  'In Stock',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colors?.predictorGreen ??
                        theme.colorScheme.secondary,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Opening Hours',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsExpandable(
    ShopItemStruct item,
    AsyncValue<List<ShopReviewsStruct>> reviews,
    AsyncValue<int> reviewCount,
    ThemeData theme,
  ) {
    final count = reviewCount.valueOrNull ?? 0;
    final avgRating = item.avgRating;

    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: ExpandableNotifier(
        controller: _reviewsExpandable,
        child: ExpandablePanel(
          header: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Reviews',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  Icon(Icons.star_rounded,
                      color: theme.colorScheme.primary, size: 20.0),
                  const SizedBox(width: 1.0),
                  Text(
                    avgRating < 1.0
                        ? '--'
                        : avgRating.toStringAsFixed(1),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
              Text(
                '($count Reviews)',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          collapsed: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(height: 4.0, thickness: 2.0, color: Color(0xFFD9D9D9)),
              SizedBox(height: 15.0),
            ],
          ),
          expanded: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 15.0),
              // Verified-purchaser note
              Text(
                'Reviews are exclusively from verified purchasers.',
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: 13.0,
                ),
              ),
              const SizedBox(height: 8.0),
              // Submit review form
              _buildReviewForm(theme),
              const SizedBox(height: 8.0),
              // Review list
              reviews.when(
                loading: () => Center(
                  child: SpinKitWanderingCubes(
                    color: theme.colorScheme.primary,
                    size: 30.0,
                  ),
                ),
                error: (_, __) =>
                    const Text('Failed to load reviews'),
                data: (reviewList) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: reviewList
                      .map((r) => _buildReviewItem(r, theme))
                      .toList(),
                ),
              ),
              const Divider(height: 4.0, thickness: 2.0, color: Color(0xFFD9D9D9)),
              const SizedBox(height: 15.0),
            ],
          ),
          theme: const ExpandableThemeData(
            tapHeaderToExpand: true,
            tapBodyToExpand: false,
            tapBodyToCollapse: false,
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            hasIcon: true,
          ),
        ),
      ),
    );
  }

  Widget _buildReviewForm(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: const Border.fromBorderSide(
          BorderSide(color: Color(0xFFD9D9D9)),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15.0),
            // Star rating row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                final starNum = i + 1;
                final filled = _newReviewStars != null &&
                    _newReviewStars! >= starNum;
                return GestureDetector(
                  onTap: () => setState(() => _newReviewStars = starNum),
                  child: Icon(
                    filled
                        ? Icons.star_rate_rounded
                        : Icons.star_border_rounded,
                    color: theme.colorScheme.primary,
                    size: 30.0,
                  ),
                );
              }),
            ),
            const SizedBox(height: 8.0),
            // Comment field
            TextFormField(
              controller: _reviewCommentController,
              autofocus: false,
              obscureText: false,
              maxLines: null,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Comment (optional)',
                hintStyle: theme.textTheme.labelMedium,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                filled: true,
                fillColor: theme.colorScheme.surface,
                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                    0.0, 15.0, 0.0, 20.0),
              ),
              style: theme.textTheme.bodyMedium,
              cursorColor: theme.colorScheme.onSurface,
            ),
            const SizedBox(height: 8.0),
            // Post Review button
            SizedBox(
              width: double.infinity,
              height: 40.0,
              child: ElevatedButton(
                onPressed: _submittingReview ? null : _submitReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  textStyle: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                child: _submittingReview
                    ? SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.0,
                        ),
                      )
                    : const Text('POST REVIEW'),
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewItem(ShopReviewsStruct review, ThemeData theme) {
    final name = () {
      final n = review.author.name;
      if (n.isEmpty || n == 'null') return 'Anonymous';
      if (review.author.publicName) return _reviewNameFormat(n);
      return 'Anonymous';
    }();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding:
              const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stars
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (i) {
                  if (review.stars >= i + 1) {
                    return Icon(Icons.star_rate_rounded,
                        color: theme.colorScheme.primary, size: 18.0);
                  }
                  return const SizedBox.shrink();
                }),
              ),
              // Author name
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    2.0, 0.0, 0.0, 0.0),
                child: Text(
                  name,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
              ),
              // Comment
              if (review.comment.isNotEmpty)
                Text(
                  review.comment,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    fontSize: 13.0,
                  ),
                  overflow: TextOverflow.clip,
                ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Guard helpers (preserve original null-check logic)
  // ---------------------------------------------------------------------------

  bool _hasBrandInfo(ShopItemStruct item) =>
      _hasBrandName(item) || _hasBrandImage(item);

  bool _hasBrandName(ShopItemStruct item) =>
      item.brandName.isNotEmpty && item.brandName != 'null';

  bool _hasBrandImage(ShopItemStruct item) =>
      item.brandImage.isNotEmpty && item.brandImage != 'null';

  bool _hasSaleText(ShopItemStruct item) =>
      item.saleText.isNotEmpty && item.saleText != 'null';

  bool _hasShortDescription(ShopItemStruct item) =>
      item.shortDescription.isNotEmpty &&
      item.shortDescription != 'null';

  bool _hasDescription(ShopItemStruct item) =>
      item.description.isNotEmpty && item.description != 'null';
}
