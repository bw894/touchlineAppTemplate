// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:async';
import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:core_ui/src/config/app_config.dart';
import 'package:core_ui/src/config/component_variants.dart';
import 'package:core_ui/src/utils/list_extensions.dart';

// ---------------------------------------------------------------------------
// Helper: format DateTime from milliseconds
// ---------------------------------------------------------------------------
String _dateTimeFormat(String format, DateTime dt) {
  switch (format) {
    case 'Hm':
      return DateFormat('HH:mm').format(dt);
    case 'MMMEd':
      return DateFormat('MMMEd').format(dt);
    default:
      return DateFormat(format).format(dt);
  }
}

// ---------------------------------------------------------------------------
// Helper: format a number with a fixed zero-padded format
// ---------------------------------------------------------------------------
String _formatNumber(num value, {String format = '00'}) {
  if (format == '00') {
    return value.abs().floor().toString().padLeft(2, '0');
  }
  return value.toStringAsFixed(0);
}

// ---------------------------------------------------------------------------
// IndivPenalty rendered inline (no model abstraction)
// ---------------------------------------------------------------------------
Widget _buildIndivPenalty(String inputLetter, BuildContext context) {
  return Align(
    alignment: AlignmentDirectional(0.0, 0.0),
    child: Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (inputLetter == 'Y')
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 18.0,
            ),
          if (inputLetter == 'N')
            Icon(
              Icons.cancel,
              color: Theme.of(context).colorScheme.error,
              size: 18.0,
            ),
          if (inputLetter == 'M')
            Icon(
              Icons.circle_outlined,
              color: Color(0xFF929292),
              size: 18.0,
            ),
        ],
      ),
    ),
  );
}

// ---------------------------------------------------------------------------
// Public widget
// ---------------------------------------------------------------------------

class TopBitWidget extends ConsumerStatefulWidget {
  const TopBitWidget({
    super.key,
    required this.variant,
    required this.bgImage,
    required this.onFixture,
    required this.onLive,
    required this.onTickets,
    required this.onPredictor,
    required this.onPoll,
    required this.teamObjectIds,
    this.teamAbr,
    this.matchObjectId,
    Color? onPrimary,
    this.altTimeColours,
  }) : onPrimary = onPrimary ?? Colors.white;

  final TopBitVariant variant;
  final String bgImage;
  final Future<void> Function(String matchObjectId) onFixture;
  final Future<void> Function(String matchObjectId) onLive;
  final Future<void> Function() onTickets;
  final Future<void> Function() onPredictor;
  final Future<void> Function(String pollObjectId) onPoll;
  final List<String> teamObjectIds;
  final String? teamAbr;
  final String? matchObjectId;
  final Color onPrimary;
  final Color? altTimeColours;

  @override
  ConsumerState<TopBitWidget> createState() => _TopBitWidgetState();
}

class _TopBitWidgetState extends ConsumerState<TopBitWidget>
    with TickerProviderStateMixin {
  // ---- Shared state ----
  Timer? _refreshTimer;
  ApiCallResponse? _fixt;

  // ---- Home variant state ----
  PageController? _pageController;
  int _pageViewIndex = 0;
  final Map<int, Future<ApiCallResponse>> _cache = {};
  Completer<void>? _requestCompleter;

  // ---- Specific variant state ----
  Completer<ApiCallResponse>? _specificRequestCompleter;

  // ---- Animation controllers (specific variant) ----
  late AnimationController _animCtrl1;
  late AnimationController _animCtrl2;
  late AnimationController _animCtrl3;
  late AnimationController _animCtrl4;
  late AnimationController _animCtrl5;
  late AnimationController _animCtrl6;
  late AnimationController _animCtrl7;
  late AnimationController _animCtrl8; // away column slide

  late Animation<double> _fadeAnim1;
  late Animation<Offset> _moveAnim1;
  late Animation<double> _fadeAnim2;
  late Animation<Offset> _moveAnim2;
  late Animation<double> _scaleAnim1;
  late Animation<double> _fadeBounce1;
  late Animation<double> _scaleAnim2;
  late Animation<double> _fadeBounce2;
  late Animation<double> _scaleAnim3;
  late Animation<double> _fadeBounce3;
  late Animation<double> _scaleAnim4;
  late Animation<double> _fadeBounce4;
  late Animation<double> _fadeAnim5;
  late Animation<double> _fadeAnim6;
  // away column fade (same animation as col3 slide)
  late Animation<double> _fadeAnim8;
  late Animation<Offset> _moveAnim3;

  @override
  void initState() {
    super.initState();
    _initAnimations();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final cfg = ref.read(appConfigProvider);

      _fixt = await BackendlessDatabaseGroup.upcomingOneFixturesCall.call(
        time: DateTime.now().millisecondsSinceEpoch,
        bLProjectId: cfg.projectId,
        bLRestAPIKey: cfg.restApiKey,
        teamObjectId: widget.variant == TopBitVariant.home
            ? widget.teamObjectIds.elementAtOrNull(_pageViewIndex)
            : cfg.focusTeamObjectId,
      );

      final fixtList = (_fixt?.jsonBody ?? '')
          .toList()
          .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
          .toList() as Iterable<BLESSfixtureStruct?>;
      final firstStart = fixtList.withoutNulls.firstOrNull?.start ?? 0;

      if (DateTime.now().millisecondsSinceEpoch > firstStart) {
        _refreshTimer = Timer.periodic(
          const Duration(milliseconds: 25000),
          (timer) async {
            if (mounted) {
              setState(() {
                if (widget.variant == TopBitVariant.home) {
                  _cache.remove(_pageViewIndex);
                  _requestCompleter = null;
                } else {
                  _specificRequestCompleter = null;
                }
              });
            }
          },
        );
      }
    });
  }

  void _initAnimations() {
    // col1: fade+move in from below (home inner column)
    _animCtrl1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 330));
    _fadeAnim1 = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animCtrl1, curve: Curves.easeInOut));
    _moveAnim1 = Tween<Offset>(
            begin: const Offset(0, 25 / 400), end: Offset.zero)
        .animate(CurvedAnimation(parent: _animCtrl1, curve: Curves.easeInOut));

    // col2: slide in from left
    _animCtrl2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 340));
    _moveAnim2 =
        Tween<Offset>(begin: const Offset(-64 / 400, 0), end: Offset.zero)
            .animate(
                CurvedAnimation(parent: _animCtrl2, curve: Curves.easeOut));
    _fadeAnim2 = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animCtrl2, curve: Curves.easeOut));

    // text1: scale bounce
    _animCtrl3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 630));
    _scaleAnim1 =
        Tween<double>(begin: 0.75, end: 1.0).animate(CurvedAnimation(
      parent: _animCtrl3,
      curve: Curves.bounceOut,
    ));
    _fadeBounce1 = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animCtrl3, curve: Curves.easeInOut));

    _animCtrl4 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 630));
    _scaleAnim2 =
        Tween<double>(begin: 0.75, end: 1.0).animate(CurvedAnimation(
      parent: _animCtrl4,
      curve: Curves.bounceOut,
    ));
    _fadeBounce2 = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animCtrl4, curve: Curves.easeInOut));

    _animCtrl5 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 630));
    _scaleAnim3 =
        Tween<double>(begin: 0.75, end: 1.0).animate(CurvedAnimation(
      parent: _animCtrl5,
      curve: Curves.bounceOut,
    ));
    _fadeBounce3 = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animCtrl5, curve: Curves.easeInOut));

    _animCtrl6 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 630));
    _scaleAnim4 =
        Tween<double>(begin: 0.75, end: 1.0).animate(CurvedAnimation(
      parent: _animCtrl6,
      curve: Curves.bounceOut,
    ));
    _fadeBounce4 = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animCtrl6, curve: Curves.easeInOut));

    // text5 / container: fade in (delay 760ms)
    _animCtrl7 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 340));
    _fadeAnim5 = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animCtrl7, curve: Curves.easeInOut));
    _fadeAnim6 = _fadeAnim5;

    // col3: slide from right + fade
    _animCtrl8 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 340));
    _moveAnim3 =
        Tween<Offset>(begin: const Offset(64 / 400, 0), end: Offset.zero)
            .animate(CurvedAnimation(parent: _animCtrl8, curve: Curves.easeOut));
    _fadeAnim8 = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animCtrl8, curve: Curves.easeOut));

    // Start all on load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _animCtrl1.forward();
        Future.delayed(const Duration(milliseconds: 200),
            () => mounted ? _animCtrl2.forward() : null);
        Future.delayed(const Duration(milliseconds: 290),
            () => mounted ? _animCtrl3.forward() : null);
        Future.delayed(const Duration(milliseconds: 290),
            () => mounted ? _animCtrl4.forward() : null);
        Future.delayed(const Duration(milliseconds: 290),
            () => mounted ? _animCtrl5.forward() : null);
        Future.delayed(const Duration(milliseconds: 290),
            () => mounted ? _animCtrl6.forward() : null);
        Future.delayed(const Duration(milliseconds: 760),
            () => mounted ? _animCtrl7.forward() : null);
        Future.delayed(const Duration(milliseconds: 200),
            () => mounted ? _animCtrl8.forward() : null);
      }
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    _pageController?.dispose();
    _animCtrl1.dispose();
    _animCtrl2.dispose();
    _animCtrl3.dispose();
    _animCtrl4.dispose();
    _animCtrl5.dispose();
    _animCtrl6.dispose();
    _animCtrl7.dispose();
    _animCtrl8.dispose();
    super.dispose();
  }

  // ---- Helpers ----

  Future<ApiCallResponse> _getHomeFixtureFuture(int index) {
    if (!_cache.containsKey(index)) {
      final cfg = ref.read(appConfigProvider);
      _cache[index] =
          BackendlessDatabaseGroup.topLevelFixtureDetailsCall.call(
        time: DateTime.now().millisecondsSinceEpoch,
        teamObjectId: cfg.focusTeamObjectId,
        bLProjectId: cfg.projectId,
        bLRestAPIKey: cfg.restApiKey,
        headerName: 'Content-Type',
        headerValue: 'application/json',
      );
    }
    return _cache[index]!;
  }

  void _clearHomeCache(int index) {
    _cache.remove(index);
  }

  Color _timeColour() =>
      widget.altTimeColours ?? Theme.of(context).colorScheme.primary;

  // ---- Shared snack helpers ----
  void _showErrorSnack(String message) {
    final messenger = ScaffoldMessenger.of(context);
    final surfaceColor = Theme.of(context).colorScheme.surface;
    final errorColor = Theme.of(context).colorScheme.error;
    messenger.showSnackBar(
      SnackBar(
        content: Text(message,
            style: TextStyle(color: surfaceColor)),
        duration: const Duration(milliseconds: 1850),
        backgroundColor: errorColor,
      ),
    );
  }

  // ---- Tap handler used in home page items ----
  Future<void> _handleHomeItemTap(ApiCallResponse getObjectIdResponse) async {
    final cfg = ref.read(appConfigProvider);
    final result =
        await BackendlessDatabaseGroup.upcomingOneFixturesCall.call(
      time: DateTime.now().millisecondsSinceEpoch,
      teamObjectId:
          widget.teamObjectIds.elementAtOrNull(_pageViewIndex),
      bLProjectId: cfg.projectId,
      bLRestAPIKey: cfg.restApiKey,
    );

    if (!mounted) return;

    if (result.succeeded) {
      final fixtures = (result.jsonBody ?? '')
          .toList()
          .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
          .toList() as Iterable<BLESSfixtureStruct?>;
      if (fixtures.withoutNulls.isNotEmpty) {
        final detailFixtures = (getObjectIdResponse.jsonBody ?? '')
            .toList()
            .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
            .toList() as Iterable<BLESSfixtureStruct?>;
        final objectId =
            detailFixtures.withoutNulls.firstOrNull!.objectId;
        final firstStart =
            fixtures.withoutNulls.firstOrNull!.start;
        if (firstStart > DateTime.now().millisecondsSinceEpoch) {
          await widget.onFixture(objectId);
        } else {
          await widget.onLive(objectId);
        }
      } else {
        if (!mounted) return;
        _showErrorSnack('No Fixture Found');
      }
    } else {
      if (!mounted) return;
      _showErrorSnack('Failed to fetch');
    }
  }

  // ---- Build entry ----

  @override
  Widget build(BuildContext context) {
    return widget.variant == TopBitVariant.home
        ? _buildHome()
        : _buildSpecific();
  }

  // ==========================================================================
  // HOME VARIANT
  // ==========================================================================

  Widget _buildHome() {
    final cfg = ref.read(appConfigProvider);
    final cardBr = cfg.cardBorderRadius;

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: cardBr.bottomLeft,
          bottomRight: cardBr.bottomRight,
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: FutureBuilder<ApiCallResponse>(
        future: BackendlessDatabaseGroup
            .upcomingOneFixturesObjectIdStartEventTimelineCall
            .call(
          time: DateTime.now().millisecondsSinceEpoch,
          teamObjectId: cfg.focusTeamObjectId,
          bLProjectId: cfg.projectId,
          bLRestAPIKey: cfg.restApiKey,
          headerName: 'Content-Type',
          headerValue: 'application/json',
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitWanderingCubes(
                  color: Theme.of(context).colorScheme.primary,
                  size: 50.0,
                ),
              ),
            );
          }
          final upcomingResponse = snapshot.data!;

          final upcomingFixtures = (upcomingResponse.jsonBody ?? '')
              .toList()
              .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
              .toList() as Iterable<BLESSfixtureStruct?>;

          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Visibility(
              visible: upcomingFixtures.withoutNulls.length > 0,
              child: FutureBuilder<ApiCallResponse>(
                future:
                    BackendlessDatabaseGroup.checkForPollsWithRelatedMatchesCall
                        .call(
                  currentTime: DateTime.now().millisecondsSinceEpoch,
                  matchObjectId:
                      upcomingFixtures.withoutNulls.firstOrNull?.objectId,
                  bLProjectId: cfg.projectId,
                  bLRestAPIKey: cfg.restApiKey,
                  headerName: 'Content-Type',
                  headerValue: 'application/json',
                ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitWanderingCubes(
                          color: Theme.of(context).colorScheme.primary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  final pollsResponse = snapshot.data!;

                  final firstFixture =
                      upcomingFixtures.withoutNulls.firstOrNull!;
                  final now = DateTime.now().millisecondsSinceEpoch;
                  final isLive = now > firstFixture.start;
                  final homeScorers = firstFixture.eventTimeline
                      .where((e) =>
                          e.typeId == 14 &&
                          e.participantId == firstFixture.homeTeamId)
                      .length;
                  final awayScorers = firstFixture.eventTimeline
                      .where((e) =>
                          e.typeId == 14 &&
                          e.participantId == firstFixture.awayTeamId)
                      .length;

                  double containerHeight;
                  if (!isLive) {
                    containerHeight = 420.0;
                  } else if (homeScorers == 0 && awayScorers == 0) {
                    containerHeight = 330.0;
                  } else {
                    final maxScorers =
                        homeScorers > awayScorers ? homeScorers : awayScorers;
                    containerHeight = maxScorers > 3
                        ? 400.0
                        : 330.0 + maxScorers * (70.0 / 4.0);
                  }

                  return Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: containerHeight,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  final teamFixture =
                                      widget.teamObjectIds.toList();
                                  _pageController ??= PageController(
                                    initialPage: 0,
                                  );

                                  return Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    child: Stack(
                                      children: [
                                        PageView.builder(
                                          controller: _pageController,
                                          onPageChanged: (idx) async {
                                            if (mounted) {
                                              setState(() {
                                                _clearHomeCache(_pageViewIndex);
                                                _pageViewIndex = idx;
                                                _requestCompleter = null;
                                              });
                                            }
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemCount: teamFixture.length,
                                          itemBuilder:
                                              (context, teamFixtureIndex) {
                                            return FutureBuilder<
                                                ApiCallResponse>(
                                              future: _getHomeFixtureFuture(
                                                  teamFixtureIndex),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          SpinKitWanderingCubes(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final getObjectIdResponse =
                                                    snapshot.data!;
                                                final pageFixtures = (getObjectIdResponse
                                                            .jsonBody ??
                                                        '')
                                                    .toList()
                                                    .map<BLESSfixtureStruct?>(
                                                        BLESSfixtureStruct
                                                            .maybeFromMap)
                                                    .toList()
                                                    as Iterable<
                                                        BLESSfixtureStruct?>;
                                                final pageFixture =
                                                    pageFixtures.withoutNulls
                                                        .firstOrNull;

                                                final bgUrl =
                                                    (pageFixture?.matchBackground !=
                                                                null &&
                                                            pageFixture
                                                                    ?.matchBackground !=
                                                                '')
                                                        ? pageFixture!
                                                            .matchBackground
                                                        : widget.bgImage;

                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await _handleHomeItemTap(
                                                        getObjectIdResponse);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.network(
                                                                bgUrl)
                                                            .image,
                                                      ),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            const LinearGradient(
                                                          colors: [
                                                            Color(0x1D000000),
                                                            Colors.black
                                                          ],
                                                          stops: [0.0, 0.9],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment:
                                                                            AlignmentDirectional(
                                                                                0.0,
                                                                                1.0),
                                                                        child:
                                                                            Container(
                                                                          width: MediaQuery.sizeOf(context)
                                                                                  .width *
                                                                              1.0,
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 1.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (!firstFixture.scoreOnlyFT)
                                                                                      Text(
                                                                                        (pageFixture?.team.name ?? 'MEN\'S TEAM').toUpperCase(),
                                                                                        textAlign: TextAlign.center,
                                                                                        style: GoogleFonts.inter(
                                                                                          color: Theme.of(context).colorScheme.surface,
                                                                                          letterSpacing: 2.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          shadows: [
                                                                                            const Shadow(
                                                                                              color: Color(0x6818191A),
                                                                                              offset: Offset(2.0, 2.0),
                                                                                              blurRadius: 5.0,
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    if (firstFixture.scoreOnlyFT)
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.info_outline,
                                                                                            color: Theme.of(context).colorScheme.surface,
                                                                                            size: 18.0,
                                                                                          ),
                                                                                          Text(
                                                                                            'SCORE ONLY SHOWN AT FT',
                                                                                            textAlign: TextAlign.center,
                                                                                            style: GoogleFonts.inter(
                                                                                              color: Theme.of(context).colorScheme.surface,
                                                                                              fontSize: 15.0,
                                                                                              letterSpacing: 1.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              shadows: [
                                                                                                const Shadow(
                                                                                                  color: Color(0x6818191A),
                                                                                                  offset: Offset(2.0, 2.0),
                                                                                                  blurRadius: 5.0,
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(const SizedBox(width: 5.0)),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Container(
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: MediaQuery.sizeOf(context).width * 0.31,
                                                                                        ),
                                                                                        decoration: const BoxDecoration(),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                child: Image.network(
                                                                                                  pageFixture?.homeBadge ?? '',
                                                                                                  width: 75.0,
                                                                                                  height: 90.0,
                                                                                                  fit: BoxFit.contain,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (now < (pageFixture?.start ?? 0))
                                                                                              Text(
                                                                                                pageFixture?.homeTeamName ?? 'Home',
                                                                                                textAlign: TextAlign.center,
                                                                                                style: GoogleFonts.inter(
                                                                                                  color: Theme.of(context).colorScheme.surface,
                                                                                                  fontSize: 13.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if ((pageFixture?.leagueBadgeUrl != null && pageFixture?.leagueBadgeUrl != ''))
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                                child: Image.network(
                                                                                                  pageFixture!.leagueBadgeUrl,
                                                                                                  height: 21.0,
                                                                                                  fit: BoxFit.contain,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (pageFixture?.isPostponed ?? false)
                                                                                            Text(
                                                                                              'P-P',
                                                                                              style: GoogleFonts.rubik(
                                                                                                color: Theme.of(context).colorScheme.surface,
                                                                                                fontSize: 26.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                height: 1.4,
                                                                                              ),
                                                                                            ),
                                                                                          if ((now > (pageFixture?.start ?? 0)) && !(pageFixture?.isPostponed ?? false) && !(pageFixture?.scoreOnlyFT ?? false))
                                                                                            Text(
                                                                                              '${pageFixture?.homeGoals.toString() ?? '0'} - ${pageFixture?.awayGoals.toString() ?? '0'}',
                                                                                              style: GoogleFonts.inter(
                                                                                                color: Theme.of(context).colorScheme.surface,
                                                                                                fontSize: 26.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                              ),
                                                                                            ),
                                                                                          if ((now > (pageFixture?.start ?? 0)) && !(pageFixture?.isPostponed ?? false) && (pageFixture?.penaltyShootout ?? false))
                                                                                            Text(
                                                                                              '(${pageFixture?.homePenalties.toString() ?? '0'}) - (${pageFixture?.awayPenalties.toString() ?? '0'})',
                                                                                              style: GoogleFonts.inter(
                                                                                                color: Theme.of(context).colorScheme.surface,
                                                                                                fontSize: 18.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                            ),
                                                                                          if (now < (pageFixture?.start ?? 0))
                                                                                            Text(
                                                                                              _dateTimeFormat('Hm', DateTime.fromMillisecondsSinceEpoch(pageFixture?.start ?? 0)),
                                                                                              style: GoogleFonts.inter(
                                                                                                color: Theme.of(context).colorScheme.surface,
                                                                                                fontSize: 26.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                height: 1.4,
                                                                                              ),
                                                                                            ),
                                                                                          if (now < (pageFixture?.start ?? 0))
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 46.0),
                                                                                              child: Text(
                                                                                                _dateTimeFormat('MMMEd', DateTime.fromMillisecondsSinceEpoch(pageFixture?.start ?? 0)),
                                                                                                style: GoogleFonts.inter(
                                                                                                  color: const Color(0xFFD9D9D9),
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  height: 1.4,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if ((now > (pageFixture?.start ?? 0)) && !(pageFixture?.isPostponed ?? false))
                                                                                            Padding(
                                                                                              padding: const EdgeInsets.all(8.0),
                                                                                              child: Container(
                                                                                                width: () {
                                                                                                  final s = pageFixture?.outputStatus ?? 'Not Started';
                                                                                                  if (s.length <= 2) return 25.0;
                                                                                                  if (s.length == 3) return 40.0;
                                                                                                  if (s.length <= 7) return 50.0;
                                                                                                  return 70.0;
                                                                                                }(),
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 6.0, 4.0, 0.0),
                                                                                                      child: Text(
                                                                                                        pageFixture?.outputStatus ?? 'Not Started',
                                                                                                        textAlign: TextAlign.center,
                                                                                                        style: GoogleFonts.inter(
                                                                                                          color: Theme.of(context).colorScheme.surface,
                                                                                                          fontSize: (pageFixture?.outputStatus?.length ?? 0) > 7 ? 11.0 : 15.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    if (now < (pageFixture?.end ?? 0))
                                                                                                      Lottie.asset(
                                                                                                        'assets/jsons/LiveAnimationWhite.json',
                                                                                                        width: 70.0,
                                                                                                        height: 2.0,
                                                                                                        fit: BoxFit.fitWidth,
                                                                                                        animate: true,
                                                                                                      ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 1,
                                                                                      child: Container(
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: MediaQuery.sizeOf(context).width * 0.31,
                                                                                        ),
                                                                                        decoration: const BoxDecoration(),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                                  child: Image.network(
                                                                                                    pageFixture?.awayBadge ?? '',
                                                                                                    width: 75.0,
                                                                                                    height: 90.0,
                                                                                                    fit: BoxFit.contain,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (now < (pageFixture?.start ?? 0))
                                                                                              Text(
                                                                                                pageFixture?.awayTeamName ?? 'Away',
                                                                                                textAlign: TextAlign.center,
                                                                                                style: GoogleFonts.inter(
                                                                                                  color: Theme.of(context).colorScheme.surface,
                                                                                                  fontSize: 13.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
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
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // Bottom section
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child: Container(
                                                              width: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: _buildHomeBottomSection(
                                                                context,
                                                                cfg,
                                                                pageFixture,
                                                                pollsResponse,
                                                                upcomingResponse,
                                                              ),
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
                                        // Page indicator
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 14.0),
                                            child: smooth_page_indicator
                                                .SmoothPageIndicator(
                                              controller: _pageController!,
                                              count: teamFixture.length,
                                              axisDirection: Axis.horizontal,
                                              onDotClicked: (i) async {
                                                await _pageController!
                                                    .animateToPage(
                                                  i,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                                if (mounted) setState(() {});
                                              },
                                              effect: smooth_page_indicator
                                                  .SlideEffect(
                                                spacing: 8.0,
                                                radius: 8.0,
                                                dotWidth: 15.0,
                                                dotHeight: 6.0,
                                                dotColor: widget.teamObjectIds
                                                            .length <=
                                                        1
                                                    ? Colors.black
                                                    : Theme.of(context)
                                                        .colorScheme
                                                        .surface,
                                                activeDotColor:
                                                    widget.teamObjectIds
                                                                .length <=
                                                            1
                                                        ? Colors.black
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                paintStyle: PaintingStyle.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        // LIVE / UP NEXT badge
                        if (!firstFixture.scoreOnlyFT)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 68.0, 0.0, 0.0),
                            child: Container(
                              width: 80.0,
                              height: 28.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: cardBr.bottomRight,
                                  topLeft: Radius.circular(0.0),
                                  topRight: cardBr.topRight,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 13.0, 4.0),
                                  child: Text(
                                    firstFixture.start <
                                            DateTime.now()
                                                .millisecondsSinceEpoch
                                        ? 'LIVE'
                                        : 'UP NEXT',
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.inter(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        // Poll banner
                        if (_hasPoll(pollsResponse))
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 5.0),
                              child: _buildPollBanner(context, pollsResponse,
                                  borderRadius: 8.0),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHomeBottomSection(
    BuildContext context,
    AppConfig cfg,
    BLESSfixtureStruct? pageFixture,
    ApiCallResponse pollsResponse,
    ApiCallResponse upcomingResponse,
  ) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final firstFixture = (upcomingResponse.jsonBody ?? '')
        .toList()
        .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
        .toList()
        .cast<BLESSfixtureStruct?>()
        .whereType<BLESSfixtureStruct>()
        .firstOrNull;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding:
              const EdgeInsetsDirectional.fromSTEB(56.0, 12.0, 56.0, 6.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCountdownDays(context, pageFixture?.start ?? 0),
              _buildCountdownSeparator(context),
              _buildCountdownHours(context, pageFixture?.start ?? 0),
              _buildCountdownSeparator(context),
              _buildCountdownMins(context, pageFixture?.start ?? 0),
            ].divide(const SizedBox(width: 12.0)),
          ),
        ),
        // Location (upcoming only)
        if (now < (pageFixture?.start ?? 0) &&
            (pageFixture?.location != null && pageFixture?.location != ''))
          Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
            child: Text(
              pageFixture?.location ?? 'Stadium Name',
              style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 12.0,
                letterSpacing: 0.5,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        // Predictor / Tickets row (upcoming)
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: const BoxDecoration(),
            child: Visibility(
              visible: now < (pageFixture?.start ?? 0) &&
                  !(pageFixture?.isPostponed ?? false),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (pageFixture?.predictor ?? true)
                      Expanded(
                        child: _buildPredictorButton(context, cfg),
                      ),
                    if ((pageFixture?.homeAbr == widget.teamAbr) &&
                        (pageFixture?.tickets ?? false))
                      Expanded(
                        child: _buildTicketsButton(context, cfg),
                      ),
                  ].divide(const SizedBox(width: 10.0)),
                ),
              ),
            ),
          ),
        ),
        // Live match centre row (post-kick-off, no poll)
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: const BoxDecoration(),
            child: Visibility(
              visible: now > (pageFixture?.start ?? 0) &&
                  !(pageFixture?.isPostponed ?? false) &&
                  !_hasPoll(pollsResponse),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 0.0),
                        child: _buildLiveMatchCentreButton(
                            context, cfg, pageFixture),
                      ),
                    ),
                  ].divide(const SizedBox(width: 10.0)),
                ),
              ),
            ),
          ),
        ),
        // Poll banner embedded in bottom section
        if (_hasPoll(pollsResponse))
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(22.0, 8.0, 22.0, 0.0),
              child: _buildPollBanner(context, pollsResponse,
                  borderRadius: 12.0),
            ),
          ),
      ].addToEnd(const SizedBox(height: 15.0)),
    );
  }

  // ==========================================================================
  // SPECIFIC VARIANT
  // ==========================================================================

  Widget _buildSpecific() {
    final cfg = ref.read(appConfigProvider);
    final userToken = ref.watch(userTokenProvider);
    final matchObjectId = widget.matchObjectId;

    _specificRequestCompleter ??= Completer<ApiCallResponse>()
      ..complete(
        BackendlessDatabaseGroup.getSpecificFixtureTopLevelDetailsCall.call(
          objectId: matchObjectId,
          bLProjectId: cfg.projectId,
          bLRestAPIKey: cfg.restApiKey,
          headerName: 'Content-Type',
          headerValue: 'application/json',
        ),
      );

    return FutureBuilder<ApiCallResponse>(
      future: _specificRequestCompleter!.future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitWanderingCubes(
                color: Theme.of(context).colorScheme.primary,
                size: 50.0,
              ),
            ),
          );
        }
        final masterResponse = snapshot.data!;
        final fixture =
            BLESSfixtureStruct.maybeFromMap(masterResponse.jsonBody);

        return Container(
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              if (matchObjectId != null && matchObjectId != '')
                FutureBuilder<ApiCallResponse>(
                  future: BackendlessDatabaseGroup
                      .checkForPollsWithRelatedMatchesCall
                      .call(
                    currentTime: DateTime.now().millisecondsSinceEpoch,
                    matchObjectId: matchObjectId,
                    bLProjectId: cfg.projectId,
                    bLRestAPIKey: cfg.restApiKey,
                    headerName:
                        userToken != '' ? 'user-token' : 'Content-Type',
                    headerValue:
                        userToken != '' ? userToken : 'application/json',
                  ),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitWanderingCubes(
                            color: Theme.of(context).colorScheme.primary,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    final pollsResponse = snapshot.data!;
                    final cardBr = cfg.cardBorderRadius;
                    final bgUrl =
                        (fixture?.matchBackground != null &&
                                fixture?.matchBackground != '')
                            ? fixture!.matchBackground
                            : widget.bgImage;

                    return ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: cardBr.bottomLeft,
                        bottomRight: cardBr.bottomRight,
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(bgUrl).image,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: cardBr.bottomLeft,
                            bottomRight: cardBr.bottomRight,
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0x3A1E1E1E),
                                Colors.black,
                                Colors.black
                              ],
                              stops: [0.0, 0.8, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: FadeTransition(
                            opacity: _fadeAnim1,
                            child: SlideTransition(
                              position: _moveAnim1,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: const BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Container(
                                                width: MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    1.0,
                                                decoration:
                                                    const BoxDecoration(),
                                                alignment:
                                                    AlignmentDirectional(
                                                        0.0, 1.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              0.0, 0.0, 0.0, 48.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          _buildSpecificStatusRow(
                                                              context, fixture),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              20.0, 0.0, 20.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          // Home team col
                                                          Expanded(
                                                            flex: 1,
                                                            child:
                                                                _buildSpecificHomeTeamCol(
                                                                    context,
                                                                    fixture),
                                                          ),
                                                          // Centre col
                                                          Expanded(
                                                            flex: 1,
                                                            child:
                                                                _buildSpecificCentreCol(
                                                                    context,
                                                                    fixture),
                                                          ),
                                                          // Away team col
                                                          Expanded(
                                                            flex: 1,
                                                            child:
                                                                _buildSpecificAwayTeamCol(
                                                                    context,
                                                                    fixture),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ].addToStart(
                                              const SizedBox(height: 65.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Bottom action section
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Container(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                              1.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.0, 1.0),
                                      child: _buildSpecificBottomSection(
                                        context,
                                        cfg,
                                        fixture,
                                        pollsResponse,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              // Back button
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      32.0, 45.0, 0.0, 0.0),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () {
                        GoRouter.of(context).pop();
                      },
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.west,
                          color: Colors.white,
                          size: 28.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSpecificStatusRow(
      BuildContext context, BLESSfixtureStruct? fixture) {
    final now = DateTime.now().millisecondsSinceEpoch;
    if (fixture == null) return const SizedBox.shrink();

    if (!fixture.scoreOnlyFT) {
      String statusText;
      if (now > fixture.end) {
        statusText = 'FULL TIME';
      } else if (now < fixture.start) {
        statusText = 'UPCOMING FIXTURE';
      } else {
        statusText = 'LIVE NOW';
      }
      return Text(
        statusText,
        style: GoogleFonts.inter(
          color: Theme.of(context).colorScheme.surface,
          letterSpacing: 2.0,
          fontWeight: FontWeight.normal,
          shadows: const [
            Shadow(
              color: Color(0x6818191A),
              offset: Offset(2.0, 2.0),
              blurRadius: 5.0,
            )
          ],
        ),
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
            child: Icon(
              Icons.info_outlined,
              color: Theme.of(context).colorScheme.surface,
              size: 17.0,
            ),
          ),
          Text(
            'SCORE ONLY AT FT',
            style: GoogleFonts.inter(
              color: Theme.of(context).colorScheme.surface,
              fontSize: 16.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.normal,
              shadows: const [
                Shadow(
                  color: Color(0x6818191A),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 5.0,
                )
              ],
            ),
          ),
        ].divide(const SizedBox(width: 5.0)),
      );
    }
  }

  Widget _buildSpecificHomeTeamCol(
      BuildContext context, BLESSfixtureStruct? fixture) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final homePenalty = ((fixture?.homePenaltyBreakdown ?? 'MMMMM').split(''));
    return FadeTransition(
      opacity: _fadeAnim2,
      child: SlideTransition(
        position: _moveAnim2,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.network(
                  fixture?.homeBadge ?? '',
                  width: 75.0,
                  height: 90.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
              child: Text(
                fixture?.homeTeamName ?? 'Home',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (fixture?.penaltyShootout ?? false)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(homePenalty.length, (idx) {
                  return _buildIndivPenalty(homePenalty[idx], context);
                }),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecificCentreCol(
      BuildContext context, BLESSfixtureStruct? fixture) {
    final now = DateTime.now().millisecondsSinceEpoch;
    if (fixture == null) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (fixture.leagueBadgeUrl != null && fixture.leagueBadgeUrl != '')
          Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.network(
                fixture.leagueBadgeUrl,
                height: 21.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
        if (fixture.isPostponed)
          ScaleTransition(
            scale: _scaleAnim1,
            child: FadeTransition(
              opacity: _fadeBounce1,
              child: Text(
                'P-P',
                style: GoogleFonts.rubik(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
            ),
          ),
        if (now > fixture.start && !fixture.isPostponed)
          ScaleTransition(
            scale: _scaleAnim2,
            child: FadeTransition(
              opacity: _fadeBounce2,
              child: Text(
                '${fixture.homeGoals} - ${fixture.awayGoals}',
                style: GoogleFonts.rubik(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        if (now > fixture.start &&
            !fixture.isPostponed &&
            (fixture.penaltyShootout))
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: ScaleTransition(
              scale: _scaleAnim3,
              child: FadeTransition(
                opacity: _fadeBounce3,
                child: Text(
                  '(${fixture.homePenalties}) - (${fixture.awayPenalties})',
                  style: GoogleFonts.rubik(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        if (now < fixture.start)
          ScaleTransition(
            scale: _scaleAnim4,
            child: FadeTransition(
              opacity: _fadeBounce4,
              child: Text(
                _dateTimeFormat('Hm',
                    DateTime.fromMillisecondsSinceEpoch(fixture.start)),
                style: GoogleFonts.rubik(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
            ),
          ),
        if (now < fixture.start)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 46.0),
            child: FadeTransition(
              opacity: _fadeAnim5,
              child: Text(
                _dateTimeFormat('MMMEd',
                    DateTime.fromMillisecondsSinceEpoch(fixture.start)),
                style: GoogleFonts.rubik(
                  color: const Color(0xFFD9D9D9),
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
            ),
          ),
        if (now > fixture.start && !fixture.isPostponed)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FadeTransition(
              opacity: _fadeAnim6,
              child: Container(
                width: () {
                  final s = fixture.outputStatus;
                  if (s.length <= 2) return 25.0;
                  if (s.length == 3) return 40.0;
                  if (s.length <= 7) return 50.0;
                  return 70.0;
                }(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          4.0, 6.0, 4.0, 0.0),
                      child: Text(
                        fixture.outputStatus.isNotEmpty
                            ? fixture.outputStatus
                            : 'Not Started',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: fixture.outputStatus.length > 7
                              ? 11.0
                              : 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (fixture.end > now && fixture.start < now)
                      Lottie.asset(
                        'assets/jsons/LiveAnimationWhite.json',
                        width: 70.0,
                        height: 2.0,
                        fit: BoxFit.fitWidth,
                        animate: true,
                      ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSpecificAwayTeamCol(
      BuildContext context, BLESSfixtureStruct? fixture) {
    final awayPenalty = ((fixture?.awayPenaltyBreakdown ?? 'MMMMM').split(''));
    return FadeTransition(
      opacity: _fadeAnim8,
      child: SlideTransition(
        position: _moveAnim3,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.network(
                    fixture?.awayBadge ?? '',
                    width: 75.0,
                    height: 90.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
              child: Text(
                fixture?.awayTeamName ?? 'Away',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (fixture?.penaltyShootout ?? false)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(awayPenalty.length, (idx) {
                  return _buildIndivPenalty(awayPenalty[idx], context);
                }),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecificBottomSection(
    BuildContext context,
    AppConfig cfg,
    BLESSfixtureStruct? fixture,
    ApiCallResponse pollsResponse,
  ) {
    final now = DateTime.now().millisecondsSinceEpoch;
    if (fixture == null) return const SizedBox.shrink();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        // Goalscorer row
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(22.0, 8.0, 22.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Builder(builder: (context) {
                    final homeGoals = _formatGoalscorers(
                      fixture.eventTimeline
                          .where((e) =>
                              e.participantId == fixture.homeTeamId &&
                              e.typeId == 14)
                          .toList(),
                    );
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: homeGoals.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 5.0),
                      itemBuilder: (context, i) {
                        return Text(
                          homeGoals[i],
                          style: GoogleFonts.inter(
                            color: Theme.of(context).colorScheme.surface,
                            fontSize: 13.0,
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
              if (fixture.eventTimeline
                  .where((e) => e.typeId == 14)
                  .isNotEmpty)
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Icon(
                      Icons.sports_soccer_sharp,
                      color: Theme.of(context).colorScheme.surface,
                      size: 14.0,
                    ),
                  ),
                ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Builder(builder: (context) {
                    final awayGoals = _formatGoalscorers(
                      fixture.eventTimeline
                          .where((e) =>
                              e.participantId == fixture.awayTeamId &&
                              e.typeId == 14)
                          .toList(),
                    );
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: awayGoals.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 5.0),
                      itemBuilder: (context, i) {
                        return Text(
                          awayGoals[i],
                          textAlign: TextAlign.end,
                          style: GoogleFonts.inter(
                            color: Theme.of(context).colorScheme.surface,
                            fontSize: 13.0,
                          ),
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        // Countdown (upcoming)
        if (now < fixture.start && !fixture.isPostponed)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(
                56.0, 12.0, 56.0, 6.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCountdownDays(context, fixture.start),
                _buildCountdownSeparator(context),
                _buildCountdownHours(context, fixture.start),
                _buildCountdownSeparator(context),
                _buildCountdownMins(context, fixture.start),
              ].divide(const SizedBox(width: 12.0)),
            ),
          ),
        // Attendance
        if ((fixture.overallAttendance != null) &&
            (fixture.overallAttendance != 0))
          Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Text(
              (fixture.awayAttendance != null && fixture.awayAttendance != 0)
                  ? 'Attendance ${fixture.overallAttendance} (${fixture.awayAttendance} Away)'
                  : 'Attendance ${fixture.overallAttendance}',
              style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        // Location
        if ((fixture.location != null && fixture.location != '') &&
            !fixture.penaltyShootout)
          Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 5.0),
            child: Text(
              fixture.location ?? 'Stadium Name',
              style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 12.0,
                letterSpacing: 0.5,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        // Penalties text
        if ((fixture.penaltiesText != null && fixture.penaltiesText != '') &&
            (fixture.penaltyShootout))
          Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 5.0),
            child: Text(
              fixture.penaltiesText ?? 'Home won 4-3 on penalties',
              style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 12.0,
                letterSpacing: 0.5,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        // Predictor / Tickets (upcoming)
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: const BoxDecoration(),
            child: Visibility(
              visible: now < fixture.start && !fixture.isPostponed,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (fixture.predictor)
                      Expanded(
                        child: _buildPredictorButton(context, cfg,
                            fontSize: 14.0,
                            hPad: 24.0),
                      ),
                    if ((fixture.homeAbr == widget.teamAbr) && fixture.tickets)
                      Expanded(
                        child: _buildTicketsButton(context, cfg,
                            fontSize: 14.0,
                            hPad: 24.0),
                      ),
                  ].divide(const SizedBox(width: 10.0)),
                ),
              ),
            ),
          ),
        ),
        // Live match centre (post kick-off, no poll)
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: const BoxDecoration(),
            child: Visibility(
              visible: now > fixture.start &&
                  !fixture.isPostponed &&
                  !_hasPoll(pollsResponse),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 0.0),
                        child: _buildLiveMatchCentreButton(
                            context, cfg, fixture),
                      ),
                    ),
                  ].divide(const SizedBox(width: 10.0)),
                ),
              ),
            ),
          ),
        ),
        // Poll banner
        if (_hasPoll(pollsResponse))
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  22.0, 8.0, 22.0, 0.0),
              child: _buildPollBanner(context, pollsResponse,
                  borderRadius: 12.0),
            ),
          ),
      ].addToEnd(const SizedBox(height: 15.0)),
    );
  }

  // ==========================================================================
  // Shared helper widgets
  // ==========================================================================

  bool _hasPoll(ApiCallResponse pollsResponse) {
    final polls = (pollsResponse.jsonBody ?? '')
        .toList()
        .map<PollStruct?>(PollStruct.maybeFromMap)
        .toList() as Iterable<PollStruct?>;
    return polls.withoutNulls.isNotEmpty;
  }

  Widget _buildPollBanner(BuildContext context, ApiCallResponse pollsResponse,
      {double borderRadius = 8.0}) {
    final polls = (pollsResponse.jsonBody ?? '')
        .toList()
        .map<PollStruct?>(PollStruct.maybeFromMap)
        .toList() as Iterable<PollStruct?>;
    final poll = polls.withoutNulls.firstOrNull;
    if (poll == null) return const SizedBox.shrink();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onPoll(poll.objectId);
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(26.0, 8.0, 26.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.bar_chart,
                color: widget.onPrimary,
                size: 24.0,
              ),
              Expanded(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'VOTE: ${poll.title.isNotEmpty ? poll.title : 'Poll Title'}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.keyboard_double_arrow_right_rounded,
                color: widget.onPrimary,
                size: 26.0,
              ),
            ].divide(const SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }

  Widget _buildPredictorButton(BuildContext context, AppConfig cfg,
      {double fontSize = 12.0, double hPad = 12.0}) {
    final cardBr = cfg.cardBorderRadius;
    return OutlinedButton.icon(
      onPressed: () async {
        await widget.onPredictor();
      },
      icon: const Icon(Icons.sports_soccer_outlined, size: 16.0),
      label: const Text('Play Predictor'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0x00FF1D3B),
        padding:
            EdgeInsetsDirectional.fromSTEB(hPad, 0.0, hPad, 0.0),
        minimumSize: Size(double.infinity, 35.0),
        textStyle: GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
        ),
        side: BorderSide(
          color: Theme.of(context).colorScheme.surface,
          width: 0.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: cardBr.bottomLeft,
            bottomRight: cardBr.bottomRight,
            topLeft: cardBr.topLeft,
            topRight: cardBr.topRight,
          ),
        ),
        elevation: 2.0,
      ),
    );
  }

  Widget _buildTicketsButton(BuildContext context, AppConfig cfg,
      {double fontSize = 12.0, double hPad = 12.0}) {
    final cardBr = cfg.cardBorderRadius;
    return ElevatedButton.icon(
      onPressed: () async {
        await widget.onTickets();
      },
      icon: FaIcon(FontAwesomeIcons.ticketAlt, size: 16.0),
      label: const Text('Get Tickets'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        padding:
            EdgeInsetsDirectional.fromSTEB(hPad, 0.0, hPad, 0.0),
        minimumSize: Size(double.infinity, 35.0),
        textStyle: GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
        ),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 0.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: cardBr.bottomLeft,
            bottomRight: cardBr.bottomRight,
            topLeft: cardBr.topLeft,
            topRight: cardBr.topRight,
          ),
        ),
        elevation: 2.0,
      ),
    );
  }

  Widget _buildLiveMatchCentreButton(
    BuildContext context,
    AppConfig cfg,
    BLESSfixtureStruct? fixture,
  ) {
    final cardBr = cfg.cardBorderRadius;
    return ElevatedButton.icon(
      onPressed: () async {
        if (fixture == null) return;
        final result =
            await BackendlessDatabaseGroup.upcomingOneFixturesCall.call(
          time: DateTime.now().millisecondsSinceEpoch,
          teamObjectId: widget.teamObjectIds.elementAtOrNull(_pageViewIndex),
          bLProjectId: cfg.projectId,
          bLRestAPIKey: cfg.restApiKey,
        );
        if (!mounted) return;
        if (result.succeeded) {
          final fixtures = (result.jsonBody ?? '')
              .toList()
              .map<BLESSfixtureStruct?>(BLESSfixtureStruct.maybeFromMap)
              .toList() as Iterable<BLESSfixtureStruct?>;
          if (fixtures.withoutNulls.isNotEmpty) {
            if (fixture.start > DateTime.now().millisecondsSinceEpoch) {
              await widget.onFixture(fixture.objectId);
            } else {
              await widget.onLive(fixture.objectId);
            }
          } else {
            if (!mounted) return;
            _showErrorSnack('No Fixture Found');
          }
        } else {
          if (!mounted) return;
          _showErrorSnack('Failed to fetch');
        }
      },
      icon: const Icon(Icons.east, size: 14.0),
      label: const Text('Live Match Centre'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        minimumSize: Size(double.infinity, 35.0),
        textStyle: GoogleFonts.inter(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
        ),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 0.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: cardBr.bottomLeft,
            bottomRight: cardBr.bottomRight,
            topLeft: cardBr.topLeft,
            topRight: cardBr.topRight,
          ),
        ),
        elevation: 2.0,
      ),
    );
  }

  // ---- Countdown widgets ----

  Widget _buildCountdownDays(BuildContext context, int startMs) {
    final secsRemaining =
        (startMs / 1000) - (DateTime.now().millisecondsSinceEpoch / 1000);
    final days = (secsRemaining / 86400).floor();
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        AnimatedDefaultTextStyle(
          style: GoogleFonts.rubik(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          ),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: Text(
            key: ValueKey(
                (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString()),
            _formatNumber(days < 0 ? 0 : days),
          ),
        ),
        Text(
          'D',
          style: GoogleFonts.rubik(
            color: _timeColour(),
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ].divide(const SizedBox(width: 3.0)),
    );
  }

  Widget _buildCountdownSeparator(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          ':',
          style: GoogleFonts.bebasNeue(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.w100,
          ),
        ),
      ].divide(const SizedBox(width: 3.0)),
    );
  }

  Widget _buildCountdownHours(BuildContext context, int startMs) {
    final secsRemaining =
        (startMs / 1000) - (DateTime.now().millisecondsSinceEpoch / 1000);
    final hours = ((secsRemaining / 3600) % 24).floor();
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        AnimatedDefaultTextStyle(
          style: GoogleFonts.rubik(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          ),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: Text(
            key: ValueKey(
                (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString()),
            _formatNumber(hours < 0 ? 0 : hours),
          ),
        ),
        Text(
          'H',
          style: GoogleFonts.inter(
            color: _timeColour(),
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ].divide(const SizedBox(width: 3.0)),
    );
  }

  Widget _buildCountdownMins(BuildContext context, int startMs) {
    final secsRemaining =
        (startMs / 1000) - (DateTime.now().millisecondsSinceEpoch / 1000);
    final mins = (secsRemaining / 60) % 60;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        AnimatedDefaultTextStyle(
          style: GoogleFonts.rubik(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          ),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: Text(
            key: ValueKey(
                (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString()),
            _formatNumber(mins < 0 ? 0 : mins),
          ),
        ),
        Text(
          'M',
          style: GoogleFonts.inter(
            color: _timeColour(),
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ].divide(const SizedBox(width: 3.0)),
    );
  }

  // ---- Goalscorer formatting ----

  /// Builds a list of "PlayerName minute'" strings (or "PlayerName minute'+extra'")
  List<String> _formatGoalscorers(List<LiveEventFeedItemStruct> events) {
    if (events.isEmpty) return [];
    // Group consecutive duplicates for player names
    final result = <String>[];
    for (final e in events) {
      final extraStr =
          e.hasExtraMinute() && e.extraMinute > 0 ? '+${e.extraMinute}' : '';
      result.add('${e.playerName} ${e.minute}$extraStr\'');
    }
    return result;
  }
}
