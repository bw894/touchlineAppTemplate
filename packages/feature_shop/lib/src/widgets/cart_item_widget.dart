import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:feature_shop/src/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theming/theming.dart';

/// A single cart item row — image, title, extra fields, qty selector, price,
/// and a delete button.
///
/// Requires [index] (position in the cart list) so it can call
/// [CartNotifier.removeAt] and [CartNotifier.updateQtyAt].
class CartItemWidget extends ConsumerStatefulWidget {
  const CartItemWidget({
    super.key,
    required this.cartItem,
    required this.index,
  });

  final CartLinesStruct cartItem;
  final int index;

  @override
  ConsumerState<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends ConsumerState<CartItemWidget> {
  late String _selectedQty;

  @override
  void initState() {
    super.initState();
    _selectedQty = widget.cartItem.qty.clamp(1, 8).toString();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TouchlineColors>();
    final theme = Theme.of(context);

    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 115.0,
                  height: 115.0,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: colors?.shopBorder ?? theme.dividerColor,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.cartItem.productImage,
                      width: 115.0,
                      height: 115.0,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.image_not_supported_outlined,
                        size: 40.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.cartItem.title.isNotEmpty
                                        ? widget.cartItem.title
                                        : 'Item Name',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    ref
                                        .read(cartNotifierProvider.notifier)
                                        .removeAt(widget.index);
                                  },
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.surfaceVariant,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.delete_outlined,
                                      color: theme.colorScheme.onSurface,
                                      size: 22.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (widget.cartItem.extraFields.isNotEmpty)
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: widget.cartItem.extraFields.length,
                                  itemBuilder: (context, i) {
                                    final f = widget.cartItem.extraFields[i];
                                    return Text(
                                      '${f.fieldTitle}: ${f.responseValue}',
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12.0,
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InputDecorator(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: colors?.shopBorder ??
                                        theme.dividerColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                    color: colors?.shopBorder ??
                                        theme.dividerColor,
                                  ),
                                ),
                                filled: true,
                                fillColor: theme.colorScheme.surface,
                              ),
                              child: DropdownButton<String>(
                                value: _selectedQty,
                                isDense: true,
                                underline: const SizedBox.shrink(),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: theme.colorScheme.onSurfaceVariant,
                                  size: 18.0,
                                ),
                                items: ['1', '2', '3', '4', '5', '6', '7', '8']
                                    .map((v) => DropdownMenuItem<String>(
                                          value: v,
                                          child: Text(v,
                                              style: theme.textTheme.bodyMedium),
                                        ))
                                    .toList(),
                                onChanged: (val) {
                                  if (val == null) return;
                                  setState(() => _selectedQty = val);
                                  ref
                                      .read(cartNotifierProvider.notifier)
                                      .updateQtyAt(
                                          widget.index, int.parse(val));
                                },
                              ),
                            ),
                            Text(
                              '£${widget.cartItem.itemTotal.toStringAsFixed(2)}',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(const SizedBox(width: 16.0)),
            ),
          ),
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: theme.colorScheme.surfaceVariant,
          ),
        ],
      ),
    );
  }
}
