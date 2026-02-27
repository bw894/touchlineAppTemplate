import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

/// A tab bar paired with an adaptive-height [PageView].
///
/// Replaces [CustomTabsWidget] from [lib/custom_code/widgets/].
/// [tabs] are the button labels; [builder] returns the content widget for each
/// tab index. The [PageView] height adapts to its content (no fixed height).
///
/// Uses a [StateProvider] internally so the selected tab index is accessible
/// from outside via [tabIndexProvider].
final tabIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

class AppCustomTabs extends ConsumerStatefulWidget {
  const AppCustomTabs({
    super.key,
    required this.tabs,
    required this.builder,
    this.initialIndex = 0,
  });

  final List<String> tabs;
  final Widget Function(int tabIndex) builder;
  final int initialIndex;

  @override
  ConsumerState<AppCustomTabs> createState() => _AppCustomTabsState();
}

class _AppCustomTabsState extends ConsumerState<AppCustomTabs> {
  late final PageController _pageController;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _goToPage(int index) async {
    await _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() => _selectedIndex = index);
    ref.read(tabIndexProvider.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
          child: Row(
            children: List.generate(widget.tabs.length, (i) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => _goToPage(i),
                  child: _TabItem(
                    label: widget.tabs[i],
                    isSelected: i == _selectedIndex,
                  ),
                ),
              );
            }),
          ),
        ),
        // Adaptive-height page view — uses IntrinsicHeight on each page
        PageView.builder(
          controller: _pageController,
          itemCount: widget.tabs.length,
          onPageChanged: (i) {
            setState(() => _selectedIndex = i);
            ref.read(tabIndexProvider.notifier).state = i;
          },
          itemBuilder: (context, i) => IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: widget.builder(i),
            ),
          ),
        ),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({required this.label, required this.isSelected});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isSelected ? cs.primary : cs.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(
            color: isSelected ? cs.onPrimary : cs.onSurface,
            letterSpacing: 0.0,
          ),
        ),
      ),
    );
  }
}
