import 'package:flutter/material.dart';

/// Returns the safe-area bottom padding (home indicator / nav bar height).
///
/// Ported from [setNavBarPadding] in [lib/custom_code/actions/].
double navBarPadding(BuildContext context) =>
    MediaQuery.of(context).padding.bottom;
