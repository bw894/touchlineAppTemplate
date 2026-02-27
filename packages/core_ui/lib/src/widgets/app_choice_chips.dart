import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:core_ui/src/utils/form_field_controller.dart';
import 'package:core_ui/src/utils/list_extensions.dart';

/// Data for a single chip in [AppChoiceChips].
class ChipData {
  const ChipData(this.label, [this.iconData]);
  final String label;
  final IconData? iconData;
}

/// Visual style for selected or unselected chips in [AppChoiceChips].
class ChipStyle {
  const ChipStyle({
    this.backgroundColor,
    this.textStyle,
    this.iconColor,
    this.iconSize,
    this.labelPadding,
    this.elevation,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
  });
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Color? iconColor;
  final double? iconSize;
  final EdgeInsetsGeometry? labelPadding;
  final double? elevation;
  final Color? borderColor;
  final double? borderWidth;
  final BorderRadius? borderRadius;
}

/// A wrapped or scrollable row of selectable chips.
///
/// Ported from [FlutterFlowChoiceChips] in [flutter_flow_choice_chips.dart].
class AppChoiceChips extends StatefulWidget {
  const AppChoiceChips({
    super.key,
    required this.options,
    required this.onChanged,
    required this.controller,
    required this.selectedChipStyle,
    required this.unselectedChipStyle,
    required this.chipSpacing,
    this.rowSpacing = 0.0,
    required this.multiselect,
    this.initialized = true,
    this.alignment = WrapAlignment.start,
    this.disabledColor,
    this.wrapped = true,
  });

  final List<ChipData> options;
  final void Function(List<String>?)? onChanged;
  final FormFieldController<List<String>> controller;
  final ChipStyle selectedChipStyle;
  final ChipStyle unselectedChipStyle;
  final double chipSpacing;
  final double rowSpacing;
  final bool multiselect;
  final bool initialized;
  final WrapAlignment alignment;
  final Color? disabledColor;
  final bool wrapped;

  @override
  State<AppChoiceChips> createState() => _AppChoiceChipsState();
}

class _AppChoiceChipsState extends State<AppChoiceChips> {
  late List<String> _values;
  List<String> get _selected => widget.controller.value ?? [];

  @override
  void initState() {
    super.initState();
    _values = List.from(_selected);
    if (!widget.initialized && _values.isNotEmpty) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        widget.onChanged?.call(_values);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final chips = widget.options.map<Widget>((option) {
      final selected = _selected.contains(option.label);
      final style =
          selected ? widget.selectedChipStyle : widget.unselectedChipStyle;
      return Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: ChoiceChip(
          selected: selected,
          onSelected: widget.onChanged != null
              ? (isSelected) {
                  _values = List.from(_selected);
                  if (isSelected) {
                    widget.multiselect
                        ? _values.add(option.label)
                        : _values = [option.label];
                    widget.controller.value = List.from(_values);
                    setState(() {});
                  } else if (widget.multiselect) {
                    _values.remove(option.label);
                    widget.controller.value = List.from(_values);
                    setState(() {});
                  }
                  widget.onChanged!(_values);
                }
              : null,
          label: Text(
            option.label,
            style: style.textStyle,
            overflow: TextOverflow.ellipsis,
          ),
          labelPadding: style.labelPadding,
          avatar: option.iconData != null
              ? FaIcon(
                  option.iconData,
                  size: style.iconSize,
                  color: style.iconColor,
                )
              : null,
          elevation: style.elevation,
          disabledColor: widget.disabledColor,
          selectedColor:
              selected ? widget.selectedChipStyle.backgroundColor : null,
          backgroundColor:
              selected ? null : widget.unselectedChipStyle.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: style.borderRadius ?? BorderRadius.circular(16),
            side: BorderSide(
              color: style.borderColor ?? Colors.transparent,
              width: style.borderWidth ?? 0,
            ),
          ),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      );
    }).toList();

    if (widget.wrapped) {
      return Wrap(
        spacing: widget.chipSpacing,
        runSpacing: widget.rowSpacing,
        alignment: widget.alignment,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: chips,
      );
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: chips.divide(SizedBox(width: widget.chipSpacing)),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// AppSlideChips — animated slide-up selection chips
// ---------------------------------------------------------------------------

/// Horizontally scrollable chip selector with a slide-up fill animation.
///
/// Ported from [TouchlineChoiceChips] in [lib/custom_code/widgets/].
/// Unlike [AppChoiceChips], this widget manages its own index state and calls
/// [onChanged] with the newly selected index.
class AppSlideChips extends StatefulWidget {
  const AppSlideChips({
    super.key,
    required this.options,
    required this.initialIndex,
    required this.onChanged,
    required this.primaryColour,
    required this.secondaryColour,
    required this.bgColor,
    this.width,
    this.height,
  });

  final List<String> options;
  final int initialIndex;
  final Future<void> Function(int index) onChanged;
  final Color primaryColour;
  final Color secondaryColour;
  final Color bgColor;
  final double? width;
  final double? height;

  @override
  State<AppSlideChips> createState() => _AppSlideChipsState();
}

class _AppSlideChipsState extends State<AppSlideChips> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  Future<void> _onTap(int index) async {
    if (_selectedIndex == index) return;
    setState(() => _selectedIndex = index);
    await widget.onChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.bgColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.options.length, (i) {
            final isSelected = i == _selectedIndex;
            return GestureDetector(
              onTap: () => _onTap(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                width: 100,
                height: 40,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Slide-up background fill
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      bottom: isSelected ? 0 : -40,
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: widget.primaryColour,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    // Label
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      style: TextStyle(
                        color: isSelected
                            ? widget.secondaryColour
                            : widget.primaryColour,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text(widget.options[i]),
                    ),
                    // Underline when not selected
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: isSelected ? 0 : 4,
                        width: 60,
                        margin: const EdgeInsets.only(top: 38),
                        decoration: BoxDecoration(
                          color:
                              widget.primaryColour.withValues(alpha: 1.0),
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
