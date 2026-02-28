import 'package:api_client/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ---------------------------------------------------------------------------
// Type aliases for family args — Dart 3 records provide automatic == / hashCode
// for value-comparable fields.
// ---------------------------------------------------------------------------

typedef _SquadArgs = ({
  String projectId,
  String restApiKey,
  String sort,
});

typedef _PlayerArgs = ({
  String projectId,
  String restApiKey,
  String playerObjectId,
});

// ---------------------------------------------------------------------------
// Providers
// ---------------------------------------------------------------------------

/// All squad-hub players, sorted by [sort] field (default: 'number').
final squadHubProvider = FutureProvider.autoDispose
    .family<List<PlayerStruct>, _SquadArgs>((ref, args) async {
  final response = await BackendlessDatabaseGroup.playerNewSquadHubCall.call(
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
    sort: args.sort,
  );
  return ((response.jsonBody as List)
          .map<PlayerStruct?>(PlayerStruct.maybeFromMap)
          .toList() as Iterable<PlayerStruct?>)
      .withoutNulls
      .toList();
});

/// Single player by [playerObjectId], with sponsorship relation loaded.
final specificPlayerProvider = FutureProvider.autoDispose
    .family<PlayerStruct?, _PlayerArgs>((ref, args) async {
  final response = await BackendlessDatabaseGroup.getSpecificPlayerCall.call(
    playerObjectId: args.playerObjectId,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  return PlayerStruct.maybeFromMap(response.jsonBody);
});
