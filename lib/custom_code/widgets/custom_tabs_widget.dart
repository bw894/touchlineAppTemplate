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

import 'package:expandable_page_view/expandable_page_view.dart';

class CustomTabsWidget extends StatefulWidget {
  const CustomTabsWidget({
    super.key,
    this.width,
    this.height,
    required this.tabs,
    required this.component,
  });

  final double? width;
  final double? height;
  final List<String> tabs;
  final Widget Function(int? tab) component;

  @override
  State<CustomTabsWidget> createState() => _CustomTabsWidgetState();
}

class _CustomTabsWidgetState extends State<CustomTabsWidget> {
  late PageController _pageController;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    // Initialize _selectedIndex from FlutterFlow state
    _selectedIndex = FFAppState().pageViewIndex;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToPage(int index) async {
    await _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    // Update the state index after animation completes if needed.
    setState(() {
      _selectedIndex = index;
      FFAppState().pageViewIndex = index; // Sync with FFAppState
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tab Bar
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
          child: Row(
            children: List.generate(widget.tabs.length, (tabIndex) {
              return Expanded(
                child: InkWell(
                  onTap: () => _animateToPage(tabIndex),
                  child: _TabItem(
                    label: widget.tabs[tabIndex],
                    isSelected: tabIndex == _selectedIndex,
                  ),
                ),
              );
            }),
          ),
        ),
        // Content Area using expandable_page_view package
        SizedBox(
          width: widget.width,
          // Optionally, you can wrap the ExpandablePageView with SizedBox for a fixed height, or let it adapt.
          child: ExpandablePageView.builder(
            controller: _pageController,
            itemCount: widget.tabs.length,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
                FFAppState().pageViewIndex =
                    index; // Update FF state as page changes
              });
            },
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(12),
              child: widget.component(index),
            ),
          ),
        ),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _TabItem({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isSelected
            ? FlutterFlowTheme.of(context).primary
            : FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Rubik',
                color: isSelected
                    ? FlutterFlowTheme.of(context).primaryBackground
                    : FlutterFlowTheme.of(context).primaryText,
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
