import 'package:api_client/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ---------------------------------------------------------------------------
// Type aliases for family args.
// ---------------------------------------------------------------------------

typedef _MiniArgs = ({
  String projectId,
  String restApiKey,
});

typedef _FullArgs = ({
  String projectId,
  String restApiKey,
  String sort,
  String sortDir,
  String gDterm,
});

// ---------------------------------------------------------------------------
// Providers
// ---------------------------------------------------------------------------

/// League table rows for the compact mini/compact snippet view.
///
/// Uses [NewLeagueTableDetailsOnlyCall] which returns rank, name, imageURL,
/// played, goalDiff and points only.
final leagueMiniProvider = FutureProvider.autoDispose
    .family<List<LeagueTableItemStruct>, _MiniArgs>((ref, args) async {
  final response =
      await BackendlessDatabaseGroup.newLeagueTableDetailsOnlyCall.call(
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  return ((response.jsonBody as List)
          .map<LeagueTableItemStruct?>(LeagueTableItemStruct.maybeFromMap)
          .toList() as Iterable<LeagueTableItemStruct?>)
      .withoutNulls
      .toList();
});

/// League table rows for the full table view.
///
/// Uses [NewLeagueTableCall] which returns all stat fields including trend,
/// home/away splits and goal differences. Pass [sort], [sortDir] and [gDterm]
/// to control ordering (OVERALL / HOME / AWAY tabs).
final leagueFullProvider = FutureProvider.autoDispose
    .family<List<LeagueTableItemStruct>, _FullArgs>((ref, args) async {
  final response = await BackendlessDatabaseGroup.newLeagueTableCall.call(
    sort: args.sort,
    sortDir: args.sortDir,
    gDterm: args.gDterm,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  return ((response.jsonBody as List)
          .map<LeagueTableItemStruct?>(LeagueTableItemStruct.maybeFromMap)
          .toList() as Iterable<LeagueTableItemStruct?>)
      .withoutNulls
      .toList();
});
