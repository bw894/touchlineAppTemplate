import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:api_client/api_client.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theming/theming.dart';

import 'package:feature_match_centre/src/providers.dart';
import 'package:feature_match_centre/src/widgets/sync_fixtures_widget.dart';

/// Tabbed fixtures & results page.
///
/// - [GamesPageVariant.standard] — Results tab + Fixtures tab.
/// - [GamesPageVariant.withEvents] — adds a third Events tab.
///
/// All actions are callbacks so routing decisions stay in the app layer.
class GamesPageWidget extends ConsumerStatefulWidget {
  const GamesPageWidget({
    super.key,
    required this.projectId,
    required this.restApiKey,
    required this.focusTeamId,
    required this.clubAbbreviation,
    required this.syncFixturesLink,
    this.userToken = '',
    this.variant = GamesPageVariant.standard,
    this.resultAction,
    this.fixtureAction,
    this.ticketingAction,
    this.predictorAction,
    this.eventTapAction,
  });

  final String projectId;
  final String restApiKey;
  final String focusTeamId;
  final String clubAbbreviation;
  final String? syncFixturesLink;
  final String userToken;
  final GamesPageVariant variant;

  final Future<void> Function(String matchObjectId)? resultAction;
  final Future<void> Function(String matchObjectId)? fixtureAction;
  final Future<void> Function()? ticketingAction;
  final Future<void> Function()? predictorAction;
  final Future<void> Function(String objectId)? eventTapAction;

  @override
  ConsumerState<GamesPageWidget> createState() => _GamesPageWidgetState();
}

class _GamesPageWidgetState extends ConsumerState<GamesPageWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late FormFieldController<int> _seasonController;
  int _season = kDefaultSeason;

  @override
  void initState() {
    super.initState();
    final tabCount = widget.variant == GamesPageVariant.withEvents ? 3 : 2;
    _tabController = TabController(
      vsync: this,
      length: tabCount,
      initialIndex: 1,
    );
    _seasonController = FormFieldController<int>(_season);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  get _gamesArgs => (
        projectId: widget.projectId,
        restApiKey: widget.restApiKey,
        focusTeamId: widget.focusTeamId,
        userToken: widget.userToken,
        season: _season,
      );

  get _eventsArgs => (
        projectId: widget.projectId,
        restApiKey: widget.restApiKey,
      );

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final colors = Theme.of(context).extension<TouchlineColors>()!;
    final cfg = ref.watch(appConfigProvider);

    final resultsAsync = ref.watch(gamesResultsProvider(_gamesArgs));
    final fixturesAsync = ref.watch(gamesFixturesProvider(_gamesArgs));

    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 45, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // --- Toolbar: calendar sync + season dropdown ---
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AlignedTooltip(
                          content: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              'Click here to sync fixtures with your phone calendar!',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          offset: 4,
                          preferredDirection: AxisDirection.down,
                          borderRadius: BorderRadius.circular(8),
                          backgroundColor: colors.secondaryBackground,
                          elevation: 4,
                          tailBaseWidth: 24,
                          tailLength: 12,
                          waitDuration: const Duration(milliseconds: 100),
                          showDuration: const Duration(milliseconds: 1500),
                          triggerMode: TooltipTriggerMode.longPress,
                          child: AppIconButton(
                            borderRadius: cfg.cardBorderRadius.topLeft.x,
                            buttonSize: 40,
                            fillColor: colors.secondaryBackground,
                            icon: Icon(
                              Icons.calendar_month,
                              color: primary,
                              size: 24,
                            ),
                            onPressed: widget.syncFixturesLink != null
                                ? () => showDialog(
                                      context: context,
                                      builder: (_) => Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment: Alignment.center,
                                        child: SyncFixturesDialogContent(
                                          fixturesLink:
                                              widget.syncFixturesLink!,
                                        ),
                                      ),
                                    )
                                : null,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: AppDropdown<int>(
                            controller: _seasonController,
                            options: const [20245, 20256],
                            optionLabels: const ['2024/25', '2025/26'],
                            onChanged: (val) {
                              if (val == null) return;
                              setState(() => _season = val);
                              ref.invalidate(gamesResultsProvider(_gamesArgs));
                              ref.invalidate(
                                  gamesFixturesProvider(_gamesArgs));
                            },
                            width: 120,
                            height: 40,
                            textStyle: Theme.of(context).textTheme.bodyMedium!,
                            elevation: 2,
                            borderWidth: 0,
                            borderRadius:
                                cfg.cardBorderRadius.topLeft.x,
                            borderColor: Colors.transparent,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                12, 0, 12, 0),
                            fillColor: colors.secondaryBackground,
                            hidesUnderline: true,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: primary,
                              size: 24,
                            ),
                            hintText: 'Select season...',
                          ),
                        ),
                      ],
                    ),
                  ),

                  // --- Tab bar + views ---
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: TabBar(
                            controller: _tabController,
                            labelColor:
                                Theme.of(context).colorScheme.onSurface,
                            unselectedLabelColor: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                            labelStyle:
                                Theme.of(context).textTheme.titleMedium,
                            unselectedLabelStyle: const TextStyle(),
                            indicatorColor: primary,
                            padding: const EdgeInsets.all(4),
                            tabs: [
                              const Tab(text: 'Results'),
                              const Tab(text: 'Fixtures'),
                              if (widget.variant ==
                                  GamesPageVariant.withEvents)
                                const Tab(text: 'Events'),
                            ],
                            onTap: (_) {},
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              // --- Results ---
                              _buildResultsTab(
                                  context, resultsAsync, primary, colors),

                              // --- Fixtures ---
                              _buildFixturesTab(
                                  context, fixturesAsync, primary, colors, cfg),

                              // --- Events (V2 only) ---
                              if (widget.variant ==
                                  GamesPageVariant.withEvents)
                                _buildEventsTab(context, primary, colors),
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
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Results tab
  // ---------------------------------------------------------------------------

  Widget _buildResultsTab(
    BuildContext context,
    AsyncValue<List<BLESSfixtureStruct>> resultsAsync,
    Color primary,
    TouchlineColors colors,
  ) {
    return resultsAsync.when(
      loading: () => Center(child: AppLoader(color: primary, size: 50)),
      error: (_, __) => const SizedBox.shrink(),
      data: (results) {
        if (results.isEmpty) {
          return _EmptyTab(
            title: 'NO RESULTS',
            body: 'Check back soon',
            icon: Icon(Icons.list, color: primary, size: 50),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: results.length,
          itemBuilder: (context, i) {
            final item = results[i];
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration:
                    BoxDecoration(color: colors.secondaryBackground),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () =>
                      widget.resultAction?.call(item.objectId),
                  child: _ResultCard(
                    item: item,
                    onResultAction: widget.resultAction,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Fixtures tab
  // ---------------------------------------------------------------------------

  Widget _buildFixturesTab(
    BuildContext context,
    AsyncValue<List<BLESSfixtureStruct>> fixturesAsync,
    Color primary,
    TouchlineColors colors,
    AppConfig cfg,
  ) {
    return fixturesAsync.when(
      loading: () => Center(child: AppLoader(color: primary, size: 50)),
      error: (_, __) => const SizedBox.shrink(),
      data: (fixtures) {
        if (fixtures.isEmpty) {
          return _EmptyTab(
            title: 'NO FIXTURES',
            body: 'Check back soon',
            icon: Icon(Icons.list, color: primary, size: 50),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: fixtures.length,
          itemBuilder: (context, i) {
            final item = fixtures[i];
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration:
                    BoxDecoration(color: colors.secondaryBackground),
                child: _FixtureCard(
                  item: item,
                  fixtureIndex: i,
                  clubAbbreviation: widget.clubAbbreviation,
                  fixtureAction: widget.fixtureAction,
                  ticketingAction: widget.ticketingAction,
                  predictorAction: widget.predictorAction,
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Events tab (V2 only)
  // ---------------------------------------------------------------------------

  Widget _buildEventsTab(
    BuildContext context,
    Color primary,
    TouchlineColors colors,
  ) {
    final eventsAsync = ref.watch(commercialEventsProvider(_eventsArgs));

    return eventsAsync.when(
      loading: () => Center(child: AppLoader(color: primary, size: 50)),
      error: (_, __) => const SizedBox.shrink(),
      data: (events) {
        if (events.isEmpty) {
          return _EmptyTab(
            title: 'NO EVENTS',
            body: 'Check back soon',
            icon: Icon(Icons.event, color: primary, size: 50),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: events.length,
          itemBuilder: (context, i) {
            final event = events[i];
            return Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration:
                    BoxDecoration(color: colors.secondaryBackground),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => widget.eventTapAction?.call(event.objectId),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0, 10, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          dateTimeFormat(
                            'E d MMM y',
                            DateTime.fromMillisecondsSinceEpoch(
                                event.startDatetime),
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontSize: 19,
                                letterSpacing: 1.25,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Text(
                          event.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: const Color(0xBC57636C),
                                fontSize: 14,
                              ),
                        ),
                        const Divider(
                            thickness: 1, color: Color(0x94E0E3E7)),
                      ].divide(const SizedBox(height: 4)),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Private card widgets
// ---------------------------------------------------------------------------

class _ResultCard extends StatelessWidget {
  const _ResultCard({
    required this.item,
    this.onResultAction,
  });

  final BLESSfixtureStruct item;
  final Future<void> Function(String)? onResultAction;

  String _teamName(String? name, String fallback) {
    if (name == 'Kidderminster Harriers') return 'Harriers';
    return name ?? fallback;
  }

  @override
  Widget build(BuildContext context) {
    final secondary = Theme.of(context).colorScheme.secondary;
    final primary = Theme.of(context).colorScheme.primary;
    final colors = Theme.of(context).extension<TouchlineColors>()!;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          dateTimeFormat(
            'E d MMM y',
            DateTime.fromMillisecondsSinceEpoch(item.start),
          ),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 19,
                letterSpacing: 1.25,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          item.comp.isNotEmpty ? item.comp : 'Competition',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: const Color(0xBC57636C),
                fontSize: 14,
              ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home team name
              Container(
                width: MediaQuery.sizeOf(context).width * 0.18,
                decoration: const BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AutoSizeText(
                    _teamName(item.homeTeamName, 'Home'),
                    textAlign: TextAlign.end,
                    minFontSize: 12,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 12),
                  ),
                ),
              ),
              // Home badge
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(item.homeBadge,
                    width: 40, height: 40, fit: BoxFit.contain),
              ),
              // Score box
              Container(
                decoration: BoxDecoration(
                  color: colors.secondaryBackground,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.transparent),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (!item.isPostponed)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12, 4, 5, 4),
                            child: Text(
                              item.homeGoals.toString(),
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
                                0, 4, 0, 4),
                            child: Text(
                              '-',
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
                                5, 4, 12, 4),
                            child: Text(
                              item.awayGoals.toString(),
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
                    if (item.isPostponed)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12, 4, 5, 4),
                            child: Text(
                              'P',
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
                                0, 4, 0, 4),
                            child: Text(
                              '-',
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
                                5, 4, 12, 4),
                            child: Text(
                              'P',
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
                    Container(
                      width: 75,
                      decoration: const BoxDecoration(),
                      child: Visibility(
                        visible: item.isPostponed,
                        child: Text(
                          item.postponedText,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Away badge
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(item.awayBadge,
                    width: 40, height: 40, fit: BoxFit.contain),
              ),
              // Away team name
              Container(
                width: MediaQuery.sizeOf(context).width * 0.18,
                decoration: const BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: AutoSizeText(
                    _teamName(item.awayTeamName, 'Away'),
                    textAlign: TextAlign.start,
                    minFontSize: 12,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 12),
                  ),
                ),
              ),
            ].divide(const SizedBox(width: 8)),
          ),
        ),
        // Buttons
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 8, 30, 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (item.highlights.isNotEmpty || item.interview.isNotEmpty)
                Expanded(
                  child: AppButton(
                    text: 'Watch',
                    icon: const Icon(Icons.video_collection, size: 16),
                    onPressed: () => onResultAction?.call(item.objectId),
                    options: AppButtonOptions(
                      width: MediaQuery.sizeOf(context).width,
                      height: 35,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24, 0, 24, 0),
                      color: const Color(0x00FF1D3B),
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                              color: primary, fontSize: 14),
                      elevation: 0,
                      borderSide:
                          BorderSide(color: primary, width: 0),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              if (item.report.isNotEmpty)
                Expanded(
                  child: AppButton(
                    text: 'Report',
                    icon:
                        const Icon(Icons.newspaper_rounded, size: 16),
                    onPressed: () => onResultAction?.call(item.objectId),
                    options: AppButtonOptions(
                      width: MediaQuery.sizeOf(context).width,
                      height: 35,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24, 0, 24, 0),
                      color: primary,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                              color: Colors.white, fontSize: 14),
                      elevation: 2,
                      borderSide: BorderSide(color: primary, width: 0),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
            ].divide(const SizedBox(width: 10)),
          ),
        ),
        const Divider(thickness: 1, color: Color(0x94E0E3E7)),
      ].divide(const SizedBox(height: 4)),
    );
  }
}

class _FixtureCard extends StatelessWidget {
  const _FixtureCard({
    required this.item,
    required this.fixtureIndex,
    required this.clubAbbreviation,
    this.fixtureAction,
    this.ticketingAction,
    this.predictorAction,
  });

  final BLESSfixtureStruct item;
  final int fixtureIndex;
  final String clubAbbreviation;
  final Future<void> Function(String)? fixtureAction;
  final Future<void> Function()? ticketingAction;
  final Future<void> Function()? predictorAction;

  String _teamName(String? name, String fallback) {
    if (name == 'Kidderminster Harriers') return 'Harriers';
    return name ?? fallback;
  }

  @override
  Widget build(BuildContext context) {
    final secondary = Theme.of(context).colorScheme.secondary;
    final primary = Theme.of(context).colorScheme.primary;
    final colors = Theme.of(context).extension<TouchlineColors>()!;

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => fixtureAction?.call(item.objectId),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            dateTimeFormat(
              'E d MMM y',
              DateTime.fromMillisecondsSinceEpoch(item.start),
            ),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 19,
                  letterSpacing: 1.25,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Text(
            item.comp.isNotEmpty ? item.comp : 'Competition',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(0xBC57636C),
                  fontSize: 14,
                ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.18,
                  decoration: const BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: AutoSizeText(
                      _teamName(item.homeTeamName, 'Home'),
                      textAlign: TextAlign.end,
                      minFontSize: 12,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(item.homeBadge,
                      width: 40, height: 40, fit: BoxFit.contain),
                ),
                // KO time or P
                Container(
                  decoration: BoxDecoration(
                    color: colors.secondaryBackground,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (!item.isPostponed)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12, 4, 12, 4),
                          child: Text(
                            dateTimeFormat(
                              'Hm',
                              convertFromMills(item.start),
                            ),
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: secondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      if (item.isPostponed)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12, 4, 12, 4),
                          child: Text(
                            'P',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: secondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(item.awayBadge,
                      width: 40, height: 40, fit: BoxFit.contain),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.18,
                  decoration: const BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: AutoSizeText(
                      _teamName(item.awayTeamName, 'Away'),
                      textAlign: TextAlign.start,
                      minFontSize: 12,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                ),
              ].divide(const SizedBox(width: 8)),
            ),
          ),
          // Buttons
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(30, 8, 30, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (fixtureIndex == 0 && item.predictor)
                  Expanded(
                    child: AppButton(
                      text: 'Predictor',
                      onPressed: predictorAction,
                      options: AppButtonOptions(
                        width: MediaQuery.sizeOf(context).width,
                        height: 35,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24, 0, 24, 0),
                        color: primary,
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white, fontSize: 14),
                        elevation: 2,
                        borderSide:
                            BorderSide(color: primary, width: 0),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                if (item.homeAbr == clubAbbreviation && item.tickets)
                  Expanded(
                    child: AppButton(
                      text: 'Get Tickets',
                      iconData: FontAwesomeIcons.ticket,
                      onPressed: ticketingAction,
                      options: AppButtonOptions(
                        width: MediaQuery.sizeOf(context).width,
                        height: 35,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24, 0, 24, 0),
                        iconSize: 16,
                        iconColor: Colors.white,
                        color: primary,
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white, fontSize: 14),
                        elevation: 2,
                        borderSide:
                            BorderSide(color: primary, width: 0),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
              ].divide(const SizedBox(width: 10)),
            ),
          ),
          const Divider(thickness: 1, color: Color(0x94E0E3E7)),
        ].divide(const SizedBox(height: 4)),
      ),
    );
  }
}

/// An inline widget showing the sync-fixtures options inside a dialog.
///
/// The original showed [AndroidTutorialWidget] (now [SyncFixturesWidget])
/// directly inside a dialog — extracted here so the dialog builder is clean.
class SyncFixturesDialogContent extends ConsumerWidget {
  const SyncFixturesDialogContent({super.key, required this.fixturesLink});

  final String fixturesLink;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SyncFixturesWidget(fixturesLink: fixturesLink);
  }
}

// ---------------------------------------------------------------------------
// Private helpers
// ---------------------------------------------------------------------------

class _EmptyTab extends StatelessWidget {
  const _EmptyTab({
    required this.title,
    required this.body,
    required this.icon,
  });

  final String title;
  final String body;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, -1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 32)),
          Text(body, style: Theme.of(context).textTheme.bodyMedium),
        ].divide(const SizedBox(height: 6)),
      ),
    );
  }
}
