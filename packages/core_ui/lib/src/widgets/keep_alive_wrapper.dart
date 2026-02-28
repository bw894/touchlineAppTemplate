import 'package:flutter/material.dart';

/// Preserves a widget's state when it scrolls off-screen inside a
/// [PageView] or [TabBarView].
///
/// Moved unchanged from [keep_alive_wrapper.dart] in [lib/flutter_flow/].
class KeepAliveWidgetWrapper extends StatefulWidget {
  const KeepAliveWidgetWrapper({
    super.key,
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  State<KeepAliveWidgetWrapper> createState() =>
      _KeepAliveWidgetWrapperState();
}

class _KeepAliveWidgetWrapperState extends State<KeepAliveWidgetWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.builder(context);
  }
}
