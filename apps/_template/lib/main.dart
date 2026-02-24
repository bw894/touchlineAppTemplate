import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:core_ui/core_ui.dart';
// import 'app_config.dart';
// import 'app.dart';

/// New club app entry point template.
///
/// Steps to create a new club app:
/// 1. Copy apps/_template/ to apps/club_app_N/
/// 2. Rename package in pubspec.yaml
/// 3. Implement AppConfig in app_config.dart with club values
/// 4. Set variant selections in AppConfig
/// 5. Add club-specific assets to assets/
/// 6. Update launcher icons
///
/// See: docs/migration/MIGRATION_PLAN.md — Phase 8
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      // overrides: [
      //   appConfigProvider.overrideWithValue(const NewClubConfig()),
      // ],
      child: _PlaceholderApp(),
    ),
  );
}

class _PlaceholderApp extends StatelessWidget {
  const _PlaceholderApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'New Club App',
      home: Scaffold(
        body: Center(child: Text('Configure AppConfig in app_config.dart')),
      ),
    );
  }
}
