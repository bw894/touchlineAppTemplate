import 'package:collection/collection.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:core_ui/src/utils/form_field_controller.dart';

/// A configurable dropdown supporting single-select, multi-select,
/// searchable, and over-button positioning modes.
///
/// Ported from [FlutterFlowDropDown] in [flutter_flow_drop_down.dart].
class AppDropdown<T> extends StatefulWidget {
  const AppDropdown({
    super.key,
    this.controller,
    this.multiSelectController,
    this.hintText,
    this.searchHintText,
    required this.options,
    this.optionLabels,
    this.onChanged,
    this.onMultiSelectChanged,
    this.icon,
    this.width,
    this.height,
    this.maxHeight,
    this.fillColor,
    this.searchHintTextStyle,
    this.searchTextStyle,
    this.searchCursorColor,
    required this.textStyle,
    required this.elevation,
    required this.borderWidth,
    required this.borderRadius,
    required this.borderColor,
    required this.margin,
    this.hidesUnderline = false,
    this.disabled = false,
    this.isOverButton = false,
    this.menuOffset,
    this.isSearchable = false,
    this.isMultiSelect = false,
    this.labelText,
    this.labelTextStyle,
    this.optionsHasValueKeys = false,
  }) : assert(
          isMultiSelect
              ? (controller == null &&
                  onChanged == null &&
                  multiSelectController != null &&
                  onMultiSelectChanged != null)
              : (controller != null &&
                  onChanged != null &&
                  multiSelectController == null &&
                  onMultiSelectChanged == null),
        );

  final FormFieldController<T?>? controller;
  final FormFieldController<List<T>?>? multiSelectController;
  final String? hintText;
  final String? searchHintText;
  final List<T> options;
  final List<String>? optionLabels;
  final Function(T?)? onChanged;
  final Function(List<T>?)? onMultiSelectChanged;
  final Widget? icon;
  final double? width;
  final double? height;
  final double? maxHeight;
  final Color? fillColor;
  final TextStyle? searchHintTextStyle;
  final TextStyle? searchTextStyle;
  final Color? searchCursorColor;
  final TextStyle textStyle;
  final double elevation;
  final double borderWidth;
  final double borderRadius;
  final Color borderColor;
  final EdgeInsetsGeometry margin;
  final bool hidesUnderline;
  final bool disabled;
  final bool isOverButton;
  final Offset? menuOffset;
  final bool isSearchable;
  final bool isMultiSelect;
  final String? labelText;
  final TextStyle? labelTextStyle;
  final bool optionsHasValueKeys;

  @override
  State<AppDropdown<T>> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
  bool get _isMulti => widget.isMultiSelect;
  FormFieldController<T?> get _ctrl => widget.controller!;
  FormFieldController<List<T>?> get _multiCtrl => widget.multiSelectController!;

  T? get _current {
    final value = _isMulti ? _multiCtrl.value?.firstOrNull : _ctrl.value;
    return widget.options.contains(value) ? value : null;
  }

  Set<T> get _currentValues {
    if (!_isMulti || _multiCtrl.value == null) return {};
    return widget.options.toSet().intersection(_multiCtrl.value!.toSet());
  }

  Map<T, String> get _labels => Map.fromEntries(
        widget.options.asMap().entries.map(
              (e) => MapEntry(
                e.value,
                widget.optionLabels == null ||
                        widget.optionLabels!.length < e.key + 1
                    ? e.value.toString()
                    : widget.optionLabels![e.key],
              ),
            ),
      );

  EdgeInsetsGeometry get _hMargin => widget.margin.clamp(
        EdgeInsetsDirectional.zero,
        const EdgeInsetsDirectional.symmetric(horizontal: double.infinity),
      );

  late void Function() _listener;
  final _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (_isMulti) {
      _listener = () => widget.onMultiSelectChanged!(_multiCtrl.value);
      _multiCtrl.addListener(_listener);
    } else {
      _listener = () => widget.onChanged!(_ctrl.value);
      _ctrl.addListener(_listener);
    }
  }

  @override
  void dispose() {
    if (_isMulti) {
      _multiCtrl.removeListener(_listener);
    } else {
      _ctrl.removeListener(_listener);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dropdown = _useDropdown2() ? _buildDropdown2() : _buildLegacy();
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(
              color: widget.borderColor, width: widget.borderWidth),
          color: widget.fillColor,
        ),
        child: Padding(
          padding: _useDropdown2() ? EdgeInsets.zero : widget.margin,
          child: widget.hidesUnderline
              ? DropdownButtonHideUnderline(child: dropdown)
              : dropdown,
        ),
      ),
    );
  }

  bool _useDropdown2() =>
      _isMulti ||
      widget.isSearchable ||
      !widget.isOverButton ||
      widget.maxHeight != null;

  Widget _buildLegacy() => DropdownButtonFormField<T>(
        initialValue: _current,
        hint: _hint(),
        items: _menuItems(),
        elevation: widget.elevation.toInt(),
        onChanged:
            widget.disabled ? null : (value) => _ctrl.value = value,
        icon: widget.icon,
        isExpanded: true,
        dropdownColor: widget.fillColor,
        focusColor: Colors.transparent,
        decoration: InputDecoration(
          labelText:
              widget.labelText == null || widget.labelText!.isEmpty
                  ? null
                  : widget.labelText,
          labelStyle: widget.labelTextStyle,
          border: widget.hidesUnderline
              ? InputBorder.none
              : const UnderlineInputBorder(),
        ),
      );

  Text? _hint() =>
      widget.hintText != null
          ? Text(widget.hintText!, style: widget.textStyle)
          : null;

  ValueKey _itemKey(T option) {
    final widgetKey = (widget.key as ValueKey).value;
    return ValueKey('$widgetKey ${widget.options.indexOf(option)}');
  }

  List<DropdownMenuItem<T>> _menuItems() => widget.options
      .map(
        (option) => DropdownMenuItem<T>(
          key: widget.optionsHasValueKeys ? _itemKey(option) : null,
          value: option,
          child: Padding(
            padding: _useDropdown2() ? _hMargin : EdgeInsets.zero,
            child: Text(_labels[option] ?? '', style: widget.textStyle),
          ),
        ),
      )
      .toList();

  List<DropdownMenuItem<T>> _multiItems() => widget.options
      .map(
        (item) => DropdownMenuItem<T>(
          key: widget.optionsHasValueKeys ? _itemKey(item) : null,
          value: item,
          enabled: false,
          child: StatefulBuilder(
            builder: (context, menuSetState) {
              final isSelected =
                  _multiCtrl.value?.contains(item) ?? false;
              return InkWell(
                onTap: () {
                  _multiCtrl.value ??= [];
                  isSelected
                      ? _multiCtrl.value!.remove(item)
                      : _multiCtrl.value!.add(item);
                  _multiCtrl.update();
                  setState(() {});
                  menuSetState(() {});
                },
                child: Container(
                  height: double.infinity,
                  padding: _hMargin,
                  child: Row(
                    children: [
                      isSelected
                          ? const Icon(Icons.check_box_outlined)
                          : const Icon(Icons.check_box_outline_blank),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          _labels[item]!,
                          style: widget.textStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      )
      .toList();

  Widget _buildDropdown2() {
    final overlayColor = WidgetStateProperty.resolveWith<Color?>(
      (states) =>
          states.contains(WidgetState.focused) ? Colors.transparent : null,
    );
    final iconData = widget.icon != null
        ? IconStyleData(icon: widget.icon!)
        : const IconStyleData();
    return DropdownButton2<T>(
      value: _current,
      hint: _hint(),
      items: _isMulti ? _multiItems() : _menuItems(),
      iconStyleData: iconData,
      buttonStyleData: ButtonStyleData(
        elevation: widget.elevation.toInt(),
        overlayColor: overlayColor,
        padding: widget.margin,
      ),
      menuItemStyleData: MenuItemStyleData(
        overlayColor: overlayColor,
        padding: EdgeInsets.zero,
      ),
      dropdownStyleData: DropdownStyleData(
        elevation: widget.elevation.toInt(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: widget.fillColor,
        ),
        isOverButton: widget.isOverButton,
        offset: widget.menuOffset ?? Offset.zero,
        maxHeight: widget.maxHeight,
        padding: EdgeInsets.zero,
      ),
      onChanged: widget.disabled
          ? null
          : (_isMulti ? (_) {} : (val) => widget.controller!.value = val),
      isExpanded: true,
      selectedItemBuilder: (context) => widget.options
          .map(
            (item) => Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                _isMulti
                    ? _currentValues
                        .where((v) => _labels.containsKey(v))
                        .map((v) => _labels[v])
                        .join(', ')
                    : _labels[item]!,
                style: widget.textStyle,
                maxLines: 1,
              ),
            ),
          )
          .toList(),
      dropdownSearchData: widget.isSearchable
          ? DropdownSearchData<T>(
              searchController: _searchCtrl,
              searchInnerWidgetHeight: 50,
              searchInnerWidget: Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                child: TextFormField(
                  expands: true,
                  maxLines: null,
                  controller: _searchCtrl,
                  cursorColor: widget.searchCursorColor,
                  style: widget.searchTextStyle,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    hintText: widget.searchHintText,
                    hintStyle: widget.searchHintTextStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              searchMatchFn: (item, searchValue) =>
                  (_labels[item.value] ?? '')
                      .toLowerCase()
                      .contains(searchValue.toLowerCase()),
            )
          : null,
      onMenuStateChange: widget.isSearchable
          ? (isOpen) {
              if (!isOpen) _searchCtrl.clear();
            }
          : null,
    );
  }
}
