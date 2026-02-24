/// Touchline API client — pure Dart, no Flutter dependency.
///
/// Provides:
/// - [ApiManager]: HTTP client for all Touchline REST endpoints
/// - All endpoint call classes (grouped by API group)
/// - All data models (75 structs)
library api_client;

// Core
export 'src/api_manager.dart';

// Models
export 'src/models/index.dart';

// Endpoints
export 'src/endpoints/index.dart';
