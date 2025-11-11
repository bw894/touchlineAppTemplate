// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class TouchlineChoiceChips extends StatefulWidget {
  const TouchlineChoiceChips({
    super.key,
    this.width,
    this.height,
    required this.primaryColour,
    required this.secondaryColour,
    required this.options,
    required this.initialIndex,
    required this.onChanged,
    required this.bgColor,
  });

  final double? width;
  final double? height;
  final Color primaryColour;
  final Color secondaryColour;
  final List<String> options;
  final int initialIndex;
  final Future Function(int? tab) onChanged;
  final Color bgColor;

  @override
  State<TouchlineChoiceChips> createState() => _TouchlineChoiceChipsState();
}

class _TouchlineChoiceChipsState extends State<TouchlineChoiceChips> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  void _onTap(int index) async {
    if (selectedIndex == index) return;
    setState(() {
      selectedIndex = index;
    });
    await widget.onChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.bgColor,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.options.length, (index) {
            final isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () => _onTap(index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                margin: EdgeInsets.symmetric(horizontal: 6),
                height: 40,
                width: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Slide-up background
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      bottom: isSelected ? 0 : -40,
                      curve: Curves.easeOut,
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: widget.primaryColour,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    // Text
                    AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      style: TextStyle(
                        color: isSelected
                            ? widget.secondaryColour
                            : widget.primaryColour,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text(widget.options[index]),
                    ),
                    // Underline
                    // Underline (always on top)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: isSelected ? 0 : 4,
                        width: 60,
                        margin: EdgeInsets.only(
                          top: 38,
                        ), // push it to the bottom of 40 height chip
                        decoration: BoxDecoration(
                          color: widget.primaryColour.withValues(alpha: 1.0),
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
