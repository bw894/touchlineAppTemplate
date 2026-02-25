import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

/// Displays a live score row for each fixture in [otherGames].
///
/// Pure presentation — no API calls, no state. The parent is responsible for
/// loading and passing the list.
class TodaysGamesWidget extends StatelessWidget {
  const TodaysGamesWidget({
    super.key,
    required this.otherGames,
  });

  final List<SmFixtureStruct> otherGames;

  @override
  Widget build(BuildContext context) {
    final secondary = Theme.of(context).colorScheme.secondary;

    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(otherGames.length, (i) {
            final item = otherGames[i];
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.18,
                            decoration: const BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                item.participants
                                        .where(
                                            (e) => e.meta.location == 'home')
                                        .toList()
                                        .firstOrNull
                                        ?.name ??
                                    'Home',
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item.participants
                                      .where((e) => e.meta.location == 'home')
                                      .toList()
                                      .firstOrNull
                                      ?.imagePath ??
                                  '',
                              width: 25,
                              height: 25,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0x00FFFFFF),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.transparent,
                                width: 0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 8, 4),
                                  child: Text(
                                    item.scores
                                            .where((e) =>
                                                e.description == 'CURRENT' &&
                                                e.score.participant == 'home')
                                            .toList()
                                            .firstOrNull
                                            ?.score
                                            .goals
                                            .toString() ??
                                        '0',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: secondary,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8, 4, 4, 4),
                                  child: Text(
                                    item.scores
                                            .where((e) =>
                                                e.description == 'CURRENT' &&
                                                e.score.participant == 'away')
                                            .toList()
                                            .firstOrNull
                                            ?.score
                                            .goals
                                            .toString() ??
                                        '0',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: secondary,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item.participants
                                      .where((e) => e.meta.location == 'away')
                                      .toList()
                                      .firstOrNull
                                      ?.imagePath ??
                                  '',
                              width: 25,
                              height: 25,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ClipRRect(
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.18,
                            decoration: const BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Text(
                                item.participants
                                        .where((e) => e.meta.location == 'away')
                                        .toList()
                                        .firstOrNull
                                        ?.name ??
                                    'Away',
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 8)),
                  ),
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xF0C6C7C9),
                ),
              ].divide(const SizedBox(height: 4)),
            );
          })
              .divide(const SizedBox(height: 12))
              .addToStart(const SizedBox(height: 12))
              .addToEnd(const SizedBox(height: 12)),
        ),
      ),
    );
  }
}
