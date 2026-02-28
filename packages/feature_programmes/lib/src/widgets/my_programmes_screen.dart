import 'package:api_client/api_client.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

/// Screen listing all fixtures that have a digital programme available.
///
/// Ported from [MyProgrammesWidget] in `lib/programmes/my_programmes/`.
class MyProgrammesScreen extends ConsumerWidget {
  const MyProgrammesScreen({
    super.key,
    required this.projectId,
    required this.restApiKey,
    required this.userToken,
  });

  final String projectId;
  final String restApiKey;
  final String userToken;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cfg = ref.watch(appConfigProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------------------------------------------------------
            // Header bar
            // ---------------------------------------------------------------
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    12.0, 45.0, 12.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 8.0, 0.0, 8.0),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).maybePop(),
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: theme.colorScheme.secondary,
                              width: 1.0,
                            ),
                          ),
                          child: Icon(
                            Icons.chevron_left,
                            color: theme.colorScheme.secondary,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    // Title
                    Text(
                      'My Digital Programmes',
                      style: theme.textTheme.headlineMedium,
                    ),
                    // Placeholder icon (no-op)
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 8.0, 0.0, 8.0),
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: theme.colorScheme.primary,
                            width: 1.0,
                          ),
                        ),
                        child: Icon(
                          Icons.menu_book_sharp,
                          color: theme.colorScheme.primary,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1.0, thickness: 1.0),

            // ---------------------------------------------------------------
            // Programme list
            // ---------------------------------------------------------------
            Expanded(
              child: FutureBuilder<ApiCallResponse>(
                future:
                    BackendlessDatabaseGroup.getAllFixturesWithAProgrammeCall
                        .call(
                  bLProjectId: projectId,
                  bLRestAPIKey: restApiKey,
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: SpinKitWanderingCubes(
                        color: theme.colorScheme.primary,
                        size: 50.0,
                      ),
                    );
                  }

                  final fixtures = (snapshot.data!.jsonBody
                              .toList()
                              .map<BLESSfixtureStruct?>(
                                  BLESSfixtureStruct.maybeFromMap)
                              .toList()
                          as Iterable<BLESSfixtureStruct?>)
                      .withoutNulls
                      .toList();

                  if (fixtures.isEmpty) {
                    return const Center(child: Text('No programmes available'));
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 44.0),
                    itemCount: fixtures.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: 12.0),
                    itemBuilder: (context, i) {
                      final item = fixtures[i];
                      final dateStr = DateFormat('MMMMEEEEd').format(
                          DateTime.fromMillisecondsSinceEpoch(item.start));

                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(maxWidth: 800.0),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: cfg.cardBorderRadius,
                            border: Border.all(
                              color: theme.colorScheme.outline,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // Programme cover image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    item.programmeImageURL,
                                    width: double.infinity,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => Container(
                                      height: 200.0,
                                      color: theme
                                          .colorScheme.surfaceContainerHighest,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.summary,
                                              style: theme.textTheme.bodyLarge
                                                  ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                            const SizedBox(height: 4.0),
                                            Text(
                                              dateStr,
                                              style: theme.textTheme.bodyLarge
                                                  ?.copyWith(fontSize: 14.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
