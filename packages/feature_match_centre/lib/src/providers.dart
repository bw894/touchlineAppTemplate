import 'package:api_client/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ---------------------------------------------------------------------------
// Type aliases for family args — records need == / hashCode which Dart 3
// records provide automatically for value-comparable fields.
// ---------------------------------------------------------------------------

typedef _SliderArgs = ({
  String projectId,
  String restApiKey,
  String focusTeamId,
  String userToken,
});

typedef _MatchArgs = ({
  String projectId,
  String restApiKey,
  String matchObjectId,
});

typedef _GamesArgs = ({
  String projectId,
  String restApiKey,
  String focusTeamId,
  String userToken,
  int season,
});

typedef _EventsArgs = ({
  String projectId,
  String restApiKey,
});

// ---------------------------------------------------------------------------
// Providers
// ---------------------------------------------------------------------------

/// Upcoming fixture slider data (up to 6 fixtures).
final nextFixtureSliderProvider = FutureProvider.autoDispose
    .family<List<BLESSfixtureStruct>, _SliderArgs>((ref, args) async {
  final response =
      await BackendlessDatabaseGroup.nextFixtureSliderDetailsCall.call(
    time: DateTime.now().millisecondsSinceEpoch,
    teamObjectId: args.focusTeamId,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
    userToken: args.userToken,
  );
  return ((response.jsonBody as List)
          .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
          .toList() as Iterable<BLESSfixtureStruct?>)
      .withoutNulls
      .take(6)
      .toList();
});

/// Live text items for a specific match.
final liveTextProvider = FutureProvider.autoDispose
    .family<List<LiveTextStruct>, _MatchArgs>((ref, args) async {
  final response =
      await BackendlessDatabaseGroup.getLiveTextItemsForRelatedMatchCall.call(
    matchObjectId: args.matchObjectId,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
    currentTime: DateTime.now().millisecondsSinceEpoch,
  );
  return ((response.jsonBody as List)
          .map<LiveTextStruct?>(LiveTextStruct.maybeFromMap)
          .toList() as Iterable<LiveTextStruct?>)
      .withoutNulls
      .where((e) =>
          !(((e.description == 'null') || (e.description == '')) &&
              ((e.heading == 'null') || (e.heading == ''))))
      .toList();
});

/// All results for a given season (GamesPage results tab).
final gamesResultsProvider = FutureProvider.autoDispose
    .family<List<BLESSfixtureStruct>, _GamesArgs>((ref, args) async {
  final response = await BackendlessDatabaseGroup.allResultsCall.call(
    time: DateTime.now().millisecondsSinceEpoch,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
    season: args.season,
    userToken: args.userToken,
  );
  return ((response.jsonBody as List)
          .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
          .toList() as Iterable<BLESSfixtureStruct?>)
      .withoutNulls
      .toList();
});

/// All fixtures for a given season (GamesPage fixtures tab).
final gamesFixturesProvider = FutureProvider.autoDispose
    .family<List<BLESSfixtureStruct>, _GamesArgs>((ref, args) async {
  final response = await BackendlessDatabaseGroup.allFixturesCall.call(
    time: DateTime.now().millisecondsSinceEpoch,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
    season: args.season,
    teamObjectId: args.focusTeamId,
    userToken: args.userToken,
  );
  return ((response.jsonBody as List)
          .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
          .toList() as Iterable<BLESSfixtureStruct?>)
      .withoutNulls
      .toList();
});

/// Upcoming commercial events (GamesPage V2 events tab).
final commercialEventsProvider = FutureProvider.autoDispose
    .family<List<CommercialEventStruct>, _EventsArgs>((ref, args) async {
  final response =
      await BackendlessDatabaseGroup.getUpcomingCommercialEventsCall.call(
    currentTime: DateTime.now().millisecondsSinceEpoch,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  return ((response.jsonBody as List)
          .map<CommercialEventStruct?>(CommercialEventStruct.maybeFromMap)
          .toList() as Iterable<CommercialEventStruct?>)
      .withoutNulls
      .toList();
});

/// Single fixture detail, keyed by matchObjectId.
///
/// Used by [FixtureDetailScreen] to load the fixture before composing
/// stats, lineups, live text, and league table sections.
final fixtureDetailProvider = FutureProvider.autoDispose
    .family<BLESSfixtureStruct?, _MatchArgs>((ref, args) async {
  final response =
      await BackendlessDatabaseGroup.getSpecificFixtureCall.call(
    objectId: args.matchObjectId,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  return BLESSfixtureStruct.maybeFromMap(response.jsonBody);
});
