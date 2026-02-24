import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO(Phase 6): Import and wire when core_ui is populated
// import 'package:core_ui/core_ui.dart';
// import 'app_config.dart';
// import 'app.dart';

/// Club App 1 entry point.
///
/// Phase 6 implementation:
/// - Replace [appConfigProvider] override with the real [ClubApp1Config]
/// - Replace the placeholder [MaterialApp] with [TouchlineApp]
///
/// See: docs/migration/MIGRATION_PLAN.md — Phase 6
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      // TODO(Phase 6): Override appConfigProvider with ClubApp1Config
      // overrides: [
      //   appConfigProvider.overrideWithValue(const ClubApp1Config()),
      // ],
      child: _PlaceholderApp(),
    ),
  );
}

/// Temporary placeholder — replaced in Phase 6.
class _PlaceholderApp extends StatelessWidget {
  const _PlaceholderApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Club App 1',
      home: Scaffold(
        body: Center(
          child: Text('Club App 1 — Phase 6 pending'),
        ),
      ),
    );
  }
}
