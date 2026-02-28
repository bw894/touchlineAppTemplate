import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Bottom-sheet widget that embeds the Avalon Pay parking payment page.
///
/// Displayed via [showModalBottomSheet] from the parent — this widget is the
/// sheet content (90% of screen height, rounded top corners).
class PayForParkingWidget extends StatefulWidget {
  const PayForParkingWidget({super.key});

  @override
  State<PayForParkingWidget> createState() => _PayForParkingWidgetState();
}

class _PayForParkingWidgetState extends State<PayForParkingWidget> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://avalonpay.net/2004'));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.9,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x3B1D2429),
              offset: Offset(0.0, -3.0),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.horizontal_rule_sharp,
              color: theme.colorScheme.onSurfaceVariant,
              size: 35.0,
            ),
            Expanded(
              child: WebViewWidget(controller: _controller),
            ),
          ],
        ),
      ),
    );
  }
}
