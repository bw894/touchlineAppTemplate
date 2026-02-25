import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// A centrally-controlled loading indicator.
///
/// Wraps [SpinKitThreeBounce] so spinner style is defined in one place
/// and all screens/widgets get the same animation automatically.
class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.color,
    this.size = 24.0,
  });

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) => SpinKitThreeBounce(
        color: color ?? Theme.of(context).colorScheme.primary,
        size: size,
      );
}
