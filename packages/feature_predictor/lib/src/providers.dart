import 'dart:async' show unawaited;

import 'package:api_client/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ---------------------------------------------------------------------------
// Record typedefs (Dart 3) — auto-provides == / hashCode for family keys
// ---------------------------------------------------------------------------

typedef _PredictorArgs = ({
  String projectId,
  String restApiKey,
  String teamObjectId,
  int time,
});

typedef _PredictorCheckArgs = ({
  String projectId,
  String restApiKey,
  String matchObjectId,
  String uid,
});

typedef _PredictorHistArgs = ({
  String projectId,
  String restApiKey,
  String uid,
});

typedef _PollArgs = ({
  String projectId,
  String restApiKey,
  String pollObjectId,
});

typedef _PollCheckArgs = ({
  String projectId,
  String restApiKey,
  String pollObjectId,
  String userEmail,
});

typedef _LineupsPlayersArgs = ({
  String projectId,
  String restApiKey,
  String teamObjectId,
});

typedef _LineupsEntryArgs = ({
  String projectId,
  String restApiKey,
  String objectId,
});

// ---------------------------------------------------------------------------
// Predictor providers
// ---------------------------------------------------------------------------

/// Next fixture eligible for the predictor game.
final predictorNextGameProvider = FutureProvider.autoDispose
    .family<List<BLESSfixtureStruct>, _PredictorArgs>((ref, args) async {
  final response =
      await BackendlessDatabaseGroup.predictorNextGameCall.call(
    time: args.time,
    teamObjectId: args.teamObjectId,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  return ((response.jsonBody as List?)
              ?.map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
              .toList() ??
          <BLESSfixtureStruct?>[])
      .whereType<BLESSfixtureStruct>()
      .toList();
});

/// Players shown in the predictor scorer dropdown.
final predictorPlayersProvider = FutureProvider.autoDispose
    .family<List<PlayerStruct>, ({String projectId, String restApiKey})>(
        (ref, args) async {
  final response =
      await BackendlessDatabaseGroup.playerNewPredictorCall.call(
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  return ((response.jsonBody as List?)
              ?.map<PlayerStruct?>(PlayerStruct.maybeFromMap)
              .toList() ??
          <PlayerStruct?>[])
      .whereType<PlayerStruct>()
      .toList();
});

/// Checks whether this user has already submitted a predictor entry for
/// the given match.  Returns an empty list when not played, non-empty if played.
final predictorCheckPlayedProvider = FutureProvider.autoDispose
    .family<List<ObjectIdOnlyStruct>, _PredictorCheckArgs>((ref, args) async {
  if (args.matchObjectId.isEmpty || args.uid.isEmpty) return [];
  final response = await BackendlessDatabaseGroup
      .checkIfTheyvePlayedPredictorThisWeekCall
      .call(
    matchObjectId: args.matchObjectId,
    uid: args.uid,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  return ((response.jsonBody as List?)
              ?.map<ObjectIdOnlyStruct?>(ObjectIdOnlyStruct.maybeFromMap)
              .toList() ??
          <ObjectIdOnlyStruct?>[])
      .whereType<ObjectIdOnlyStruct>()
      .toList();
});

/// Full predictor history for a user.
final predictorHistoryProvider = FutureProvider.autoDispose
    .family<List<PredictorItemHistStruct>, _PredictorHistArgs>((ref, args) async {
  final response = await BackendlessDatabaseGroup.predictorHistoryCall.call(
    uid: args.uid,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  return ((response.jsonBody as List?)
              ?.map<PredictorItemHistStruct?>(
                  PredictorItemHistStruct.maybeFromMap)
              .toList() ??
          <PredictorItemHistStruct?>[])
      .whereType<PredictorItemHistStruct>()
      .toList();
});

// ---------------------------------------------------------------------------
// Poll providers
// ---------------------------------------------------------------------------

/// Full poll data (title, options, related match).
final pollProvider = FutureProvider.autoDispose
    .family<PollStruct?, _PollArgs>((ref, args) async {
  final response = await BackendlessDatabaseGroup.getSpecificPollCall.call(
    pollObjectId: args.pollObjectId,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  return PollStruct.maybeFromMap(response.jsonBody);
});

/// Returns non-empty list if the user has already voted on this poll.
final pollCheckVotedProvider = FutureProvider.autoDispose
    .family<List<PollStruct>, _PollCheckArgs>((ref, args) async {
  final response = await BackendlessDatabaseGroup.checkIfUserHasVotedCall.call(
    userEmail: args.userEmail,
    pollObjectId: args.pollObjectId,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  return ((response.jsonBody as List?)
              ?.map<PollStruct?>(PollStruct.maybeFromMap)
              .toList() ??
          <PollStruct?>[])
      .whereType<PollStruct>()
      .toList();
});

// ---------------------------------------------------------------------------
// Lineup builder providers
// ---------------------------------------------------------------------------

/// Players available for lineup builder selection (checks cache first, falls
/// back to a direct API call, and updates the cache on a miss).
final lineupsBuilderPlayersProvider = FutureProvider.autoDispose
    .family<List<PlayerStruct>, _LineupsPlayersArgs>((ref, args) async {
  // Try cache.
  final cacheResponse =
      await BackendlessDatabaseGroup.lineupsBuilderCacheCall.call(
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  if (cacheResponse.succeeded) {
    final body = cacheResponse.jsonBody;
    if (body != null && body is List && body.isNotEmpty) {
      return (body.map<PlayerStruct?>(PlayerStruct.maybeFromMap).toList())
          .whereType<PlayerStruct>()
          .toList();
    }
  }
  // Cache miss — fetch from API.
  final apiResponse =
      await BackendlessDatabaseGroup.playersForLineupsBuilderCall.call(
    teamObjectId: args.teamObjectId,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  final players = ((apiResponse.jsonBody as List?)
              ?.map<PlayerStruct?>(PlayerStruct.maybeFromMap)
              .toList() ??
          <PlayerStruct?>[])
      .whereType<PlayerStruct>()
      .toList();
  // Populate cache (fire-and-forget).
  unawaited(BackendlessDatabaseGroup.setLineupsBuilderCacheCall.call(
    valueeJson: players.map((p) => p.toMap()).toList(),
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  ));
  return players;
});

/// A specific lineup builder entry by its objectId.
final lineupsBuilderEntryProvider = FutureProvider.autoDispose
    .family<PublicLineupsBuilderStruct?, _LineupsEntryArgs>((ref, args) async {
  final response =
      await BackendlessDatabaseGroup.getLineupsBuilderEntryByIDCall.call(
    objectId: args.objectId,
    bLProjectId: args.projectId,
    bLRestAPIKey: args.restApiKey,
  );
  return PublicLineupsBuilderStruct.maybeFromMap(response.jsonBody);
});

// ---------------------------------------------------------------------------
// Lineup builder state notifier (replaces FFAppState.selectedPlayersLineupBuilder)
// ---------------------------------------------------------------------------

/// Mutable state for the 11 selected player slots in the lineup builder.
class LineupBuilderNotifier
    extends StateNotifier<List<LineupBuilderPlayersStruct>> {
  LineupBuilderNotifier() : super(const []);

  /// Ensures 11 empty slots exist (call once on widget init).
  void initSlots() {
    if (state.length < 11) {
      state = List.generate(
        11,
        (i) => LineupBuilderPlayersStruct(added: false, index: i),
      );
    }
  }

  /// Replaces the slot at [slotIndex] with the given player data.
  void selectPlayer({
    required int slotIndex,
    required String name,
    required int number,
    required String image,
    required String objectId,
  }) {
    final updated = List<LineupBuilderPlayersStruct>.from(state);
    updated[slotIndex] = LineupBuilderPlayersStruct(
      added: true,
      index: slotIndex,
      name: name,
      number: number,
      image: image,
      objectId: objectId,
    );
    state = updated;
  }

  /// Clears (un-selects) the slot at [slotIndex].
  void clearSlot(int slotIndex) {
    final updated = List<LineupBuilderPlayersStruct>.from(state);
    updated[slotIndex] =
        LineupBuilderPlayersStruct(added: false, index: slotIndex);
    state = updated;
  }

  /// Resets all 11 slots to empty.
  void clearAll() {
    state = List.generate(
      11,
      (i) => LineupBuilderPlayersStruct(added: false, index: i),
    );
  }
}

/// Global lineup builder slot state.
final lineupBuilderNotifierProvider =
    StateNotifierProvider<LineupBuilderNotifier, List<LineupBuilderPlayersStruct>>(
  (ref) => LineupBuilderNotifier(),
);
