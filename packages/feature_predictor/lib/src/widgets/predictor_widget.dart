import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:feature_predictor/src/providers.dart';

// ---------------------------------------------------------------------------
// Variant enum
// ---------------------------------------------------------------------------

/// Visual variant for [PredictorWidget].
///
/// - [v1]: Close button (×) top-right, plain card background, no sponsor.
/// - [v2]: Back-arrow top-left, gradient card, sponsor section, entry
///   animations.
enum PredictorVariant { v1, v2 }

// ---------------------------------------------------------------------------
// Widget
// ---------------------------------------------------------------------------

/// Predictor game modal — two-page flow:
///  Page 1  Shows the next eligible fixture and checks eligibility.
///  Page 2  Score inputs + scorer dropdown + submit.
///
/// Ported from PredictorV1Widget / PredictorV2Widget (Phase 5.4).
class PredictorWidget extends ConsumerStatefulWidget {
  const PredictorWidget({
    super.key,
    required this.projectId,
    required this.restApiKey,
    required this.teamObjectId,
    required this.userEmail,
    required this.userName,
    required this.userUID,
    this.clubBadgeUrl,
    this.clubShortName = '',
    this.variant = PredictorVariant.v1,
    // v2-only
    this.backArrowColour,
    this.gradientCol1,
    this.gradientCol2,
    this.sponsorName = 'Sponsor',
    this.sponsorColour = const Color(0xFFBA0808),
    this.sponsorImage,
    this.cardBorderRadius = BorderRadius.zero,
  });

  final String projectId;
  final String restApiKey;
  final String teamObjectId;
  final String? userEmail;
  final String? userName;
  final String? userUID;
  final String? clubBadgeUrl;
  final String clubShortName;
  final PredictorVariant variant;

  // v2-only cosmetics
  final Color? backArrowColour;
  final Color? gradientCol1;
  final Color? gradientCol2;
  final String sponsorName;
  final Color sponsorColour;
  final String? sponsorImage;

  /// Border radius applied to the main card (config BR).
  final BorderRadius cardBorderRadius;

  @override
  ConsumerState<PredictorWidget> createState() => _PredictorWidgetState();
}

class _PredictorWidgetState extends ConsumerState<PredictorWidget> {
  int _page = 1;
  int _homeScore = 0;
  int _awayScore = 0;
  int _selectedPlayerIndex = 0;

  void _goToPage2() => setState(() => _page = 2);

  Future<void> _submit(
    BuildContext context,
    BLESSfixtureStruct match,
    List<PlayerStruct> players,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final scorerName = players.isNotEmpty &&
            _selectedPlayerIndex < players.length
        ? players[_selectedPlayerIndex].playerName
        : '';

    final r1 = await BackendlessDatabaseGroup.playPredictorOneCall.call(
      homeScore: _homeScore,
      awayScore: _awayScore,
      email: widget.userEmail,
      name: widget.userName,
      scorerName: scorerName,
      uid: widget.userUID,
      bLProjectId: widget.projectId,
      bLRestAPIKey: widget.restApiKey,
    );

    if (!r1.succeeded) {
      messenger.showSnackBar(const SnackBar(
          content: Text('That failed. Please try again.')));
      return;
    }

    final newObjectId =
        BackendlessDatabaseGroup.playPredictorOneCall.objectId(r1.jsonBody);

    final r2 = await BackendlessDatabaseGroup.playPredictorTwoCall.call(
      objectId: newObjectId,
      objectIdToAdd: match.objectId,
      bLProjectId: widget.projectId,
      bLRestAPIKey: widget.restApiKey,
    );

    if (r2.succeeded) {
      messenger.showSnackBar(
          const SnackBar(content: Text('Predictions Entered!')));
      navigator.pop();
    } else {
      messenger.showSnackBar(const SnackBar(
          content: Text('That failed. Please try again.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final now = DateTime.now().millisecondsSinceEpoch;

    final fixtureAsync = ref.watch(predictorNextGameProvider((
      projectId: widget.projectId,
      restApiKey: widget.restApiKey,
      teamObjectId: widget.teamObjectId,
      time: now,
    )));

    final playersAsync = ref.watch(predictorPlayersProvider((
      projectId: widget.projectId,
      restApiKey: widget.restApiKey,
    )));

    final match = fixtureAsync.valueOrNull?.firstOrNull;
    final checkPlayedAsync = ref.watch(predictorCheckPlayedProvider((
      projectId: widget.projectId,
      restApiKey: widget.restApiKey,
      matchObjectId: match?.objectId ?? '',
      uid: widget.userUID ?? '',
    )));

    return Align(
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Close / back button
            _buildNavButton(context, theme),

            // Main card
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: fixtureAsync.when(
                loading: () => _spinner(theme),
                error: (_, __) => const SizedBox.shrink(),
                data: (fixtures) {
                  if (fixtures.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('No upcoming fixtures.',
                          style: theme.textTheme.bodyMedium),
                    );
                  }
                  final fixture = fixtures.first;

                  return Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    decoration: _cardDecoration(theme, fixture),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: playersAsync.when(
                        loading: () => _spinner(theme),
                        error: (_, __) => const SizedBox.shrink(),
                        data: (players) => _page == 1
                            ? _buildPage1(
                                context, theme, fixture,
                                checkPlayedAsync.valueOrNull ?? [],
                                players)
                            : _buildPage2(context, theme, fixture, players),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Navigation button ─────────────────────────────────────────────────────

  Widget _buildNavButton(BuildContext context, ThemeData theme) {
    if (widget.variant == PredictorVariant.v1) {
      return Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 10, 6),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.close_outlined,
              color: theme.colorScheme.surface,
              size: 30,
            ),
          ),
        ),
      );
    }
    // v2: back arrow top-left
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 0, 6),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: widget.backArrowColour ?? theme.colorScheme.surface,
            size: 30,
          ),
        ),
      ),
    );
  }

  // ── Card decoration ───────────────────────────────────────────────────────

  BoxDecoration _cardDecoration(ThemeData theme, BLESSfixtureStruct fixture) {
    if (widget.variant == PredictorVariant.v2) {
      return BoxDecoration(
        gradient: LinearGradient(
          colors: [
            widget.gradientCol1 ?? theme.colorScheme.primary,
            widget.gradientCol2 ?? theme.colorScheme.secondary,
          ],
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
        ),
        borderRadius: widget.cardBorderRadius,
      );
    }
    return BoxDecoration(
      color: theme.colorScheme.surfaceContainerHighest,
      borderRadius: widget.cardBorderRadius,
    );
  }

  // ── Page 1 ────────────────────────────────────────────────────────────────

  Widget _buildPage1(
    BuildContext context,
    ThemeData theme,
    BLESSfixtureStruct fixture,
    List<ObjectIdOnlyStruct> alreadyPlayed,
    List<PlayerStruct> players,
  ) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final deadlinePassed = now > fixture.start;
    final alreadyEntered = alreadyPlayed.isNotEmpty;

    Widget page1 = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(context, theme),
        const SizedBox(height: 16),
        _buildMatchCard(context, theme, fixture),
        const SizedBox(height: 16),
        if (alreadyEntered)
          Opacity(
            opacity: 0.6,
            child: _buildActionButton(
              label: 'You\'ve already entered this match!',
              onPressed: null,
              theme: theme,
            ),
          )
        else if (deadlinePassed)
          ElevatedButton(
            onPressed: () => _showDeadlineDialog(context),
            child: const Text('Enter Now'),
          )
        else
          _buildActionButton(
            label: 'Enter Now',
            onPressed: _goToPage2,
            theme: theme,
          ),
      ],
    );

    if (widget.variant == PredictorVariant.v2) {
      page1 = page1
          .animate()
          .fadeIn(duration: 300.ms)
          .scaleX(begin: 0.6, end: 1.0, duration: 300.ms,
              curve: Curves.easeInOutQuint);
    }

    return page1;
  }

  // ── Page 2 ────────────────────────────────────────────────────────────────

  Widget _buildPage2(
    BuildContext context,
    ThemeData theme,
    BLESSfixtureStruct fixture,
    List<PlayerStruct> players,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(context, theme),
        const SizedBox(height: 16),
        // Score inputs
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(fixture.homeAbr,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'BebasNeue', fontSize: 24)),
                _ScoreInput(
                  value: _homeScore,
                  onChanged: (v) => setState(() => _homeScore = v),
                  primaryColor: theme.colorScheme.primary,
                ),
              ],
            ),
            Text('VS',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontFamily: 'BebasNeue', fontSize: 32)),
            Column(
              children: [
                Text(fixture.awayAbr,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'BebasNeue', fontSize: 24)),
                _ScoreInput(
                  value: _awayScore,
                  onChanged: (v) => setState(() => _awayScore = v),
                  primaryColor: theme.colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Scorer dropdown
        if (players.isNotEmpty) ...[
          Text('First Goal Scorer',
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          DropdownButton<int>(
            value: _selectedPlayerIndex.clamp(0, players.length - 1),
            isExpanded: true,
            items: List.generate(
              players.length,
              (i) => DropdownMenuItem(
                value: i,
                child: Text(players[i].playerName,
                    style: theme.textTheme.bodyMedium),
              ),
            ),
            onChanged: (v) =>
                setState(() => _selectedPlayerIndex = v ?? 0),
          ),
          const SizedBox(height: 16),
        ],
        // v2 sponsor bar
        if (widget.variant == PredictorVariant.v2)
          _buildSponsorBar(theme),
        const SizedBox(height: 8),
        _buildActionButton(
          label: 'Submit',
          onPressed: () => _submit(context, fixture, players),
          theme: theme,
        ),
      ],
    );
  }

  // ── Shared sub-widgets ────────────────────────────────────────────────────

  Widget _buildHeader(BuildContext context, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.clubBadgeUrl != null && widget.clubBadgeUrl!.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget.clubBadgeUrl!,
              height: 44,
              fit: BoxFit.contain,
            ),
          ),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.clubShortName,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w200, fontSize: 13)),
            Text('PREDICTOR',
                style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'BebasNeue', fontSize: 40, height: 1.0)),
          ],
        ),
      ],
    );
  }

  Widget _buildMatchCard(
      BuildContext context, ThemeData theme, BLESSfixtureStruct fixture) {
    final deadline = DateTime.fromMillisecondsSinceEpoch(fixture.start);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _teamBadge(fixture.homeBadge, fixture.homeAbr, theme),
        Column(
          children: [
            Text('VS',
                style: theme.textTheme.bodyMedium
                    ?.copyWith(fontFamily: 'BebasNeue', fontSize: 32)),
            Text(
              '${deadline.day}/${deadline.month} ${deadline.hour}:${deadline.minute.toString().padLeft(2, '0')}',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        _teamBadge(fixture.awayBadge, fixture.awayAbr, theme),
      ],
    );
  }

  Widget _teamBadge(String badgeUrl, String abr, ThemeData theme) {
    return Column(
      children: [
        if (badgeUrl.isNotEmpty)
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(badgeUrl, height: 50, fit: BoxFit.contain),
          ),
        Text(abr,
            style: theme.textTheme.bodyMedium
                ?.copyWith(fontFamily: 'BebasNeue', fontSize: 20)),
      ],
    );
  }

  Widget _buildSponsorBar(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Sponsored by ',
            style: theme.textTheme.bodySmall),
        if (widget.sponsorImage != null && widget.sponsorImage!.isNotEmpty)
          Image.network(widget.sponsorImage!, height: 24, fit: BoxFit.contain),
        const SizedBox(width: 4),
        Text(widget.sponsorName,
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: widget.sponsorColour)),
      ],
    );
  }

  Widget _buildActionButton({
    required String label,
    required VoidCallback? onPressed,
    required ThemeData theme,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
              borderRadius: widget.cardBorderRadius),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(label,
            style: theme.textTheme.bodyMedium
                ?.copyWith(fontFamily: 'BebasNeue', fontSize: 20)),
      ),
    );
  }

  Widget _spinner(ThemeData theme) {
    return Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: SpinKitWanderingCubes(
            color: theme.colorScheme.primary, size: 50),
      ),
    );
  }

  void _showDeadlineDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Deadline Passed'),
        content: const Text(
            'Not able to play Predictor after KO time!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Score input widget (+/– buttons)
// ---------------------------------------------------------------------------

class _ScoreInput extends StatelessWidget {
  const _ScoreInput({
    required this.value,
    required this.onChanged,
    required this.primaryColor,
  });

  final int value;
  final ValueChanged<int> onChanged;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: value > 0 ? () => onChanged(value - 1) : null,
          icon: const Icon(Icons.remove),
          color: primaryColor,
        ),
        SizedBox(
          width: 36,
          child: Text(
            '$value',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontFamily: 'BebasNeue'),
          ),
        ),
        IconButton(
          onPressed: () => onChanged(value + 1),
          icon: const Icon(Icons.add),
          color: primaryColor,
        ),
      ],
    );
  }
}
