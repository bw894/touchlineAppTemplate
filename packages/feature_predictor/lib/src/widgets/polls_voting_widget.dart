import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:feature_predictor/src/providers.dart';

/// Poll voting modal.
///
/// - Page 1: poll options list, one selectable at a time.
/// - Page 2: "Confirm Vote" → submits → Page 3.
/// - Page 3: confirmation / results view.
///
/// Ported from PollsVotingWidget (Phase 5.4).
class PollsVotingWidget extends ConsumerStatefulWidget {
  const PollsVotingWidget({
    super.key,
    required this.projectId,
    required this.restApiKey,
    required this.userEmail,
    required this.pollObjectId,
    this.cardBorderRadius = BorderRadius.zero,
  });

  final String projectId;
  final String restApiKey;
  final String? userEmail;
  final String? pollObjectId;
  final BorderRadius cardBorderRadius;

  @override
  ConsumerState<PollsVotingWidget> createState() => _PollsVotingWidgetState();
}

class _PollsVotingWidgetState extends ConsumerState<PollsVotingWidget> {
  int _page = 1;
  int? _selectedIndex;

  Future<void> _submitVote(
    BuildContext context,
    List<PollOptionsStruct> options,
  ) async {
    if (_selectedIndex == null || _selectedIndex! >= options.length) return;
    final messenger = ScaffoldMessenger.of(context);
    final optionObjectId = options[_selectedIndex!].objectId;

    final r = await AddVoteToPollCall.call(
      bLappId: widget.projectId,
      bLRestApiKey: widget.restApiKey,
      optionObjectId: optionObjectId,
      userEmail: widget.userEmail,
    );

    if (r.succeeded) {
      setState(() => _page = 3);
    } else {
      messenger.showSnackBar(
          const SnackBar(content: Text('Failed to add vote!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final pollAsync = ref.watch(pollProvider((
      projectId: widget.projectId,
      restApiKey: widget.restApiKey,
      pollObjectId: widget.pollObjectId ?? '',
    )));

    final votedAsync = ref.watch(pollCheckVotedProvider((
      projectId: widget.projectId,
      restApiKey: widget.restApiKey,
      pollObjectId: widget.pollObjectId ?? '',
      userEmail: widget.userEmail ?? '',
    )));

    return Align(
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Close button
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 10, 6),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close_outlined,
                      color: Colors.white, size: 30),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
              child: pollAsync.when(
                loading: () => _spinner(theme),
                error: (_, __) => const SizedBox.shrink(),
                data: (poll) {
                  if (poll == null) return const SizedBox.shrink();
                  final alreadyVoted =
                      votedAsync.valueOrNull?.isNotEmpty ?? false;

                  return Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: widget.cardBorderRadius,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: _page == 1
                          ? _buildPage1(context, theme, poll, alreadyVoted)
                              .animate()
                              .fadeIn(duration: 310.ms)
                              .scale(
                                  begin: const Offset(0.9, 0.9),
                                  end: const Offset(1.0, 1.0),
                                  duration: 460.ms)
                          : _page == 3
                              ? _buildPage3(theme, poll)
                              : _buildPage2(context, theme, poll),
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

  // ── Page 1: option selection ──────────────────────────────────────────────

  Widget _buildPage1(
    BuildContext context,
    ThemeData theme,
    PollStruct poll,
    bool alreadyVoted,
  ) {
    final options = poll.options;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(poll.title,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontFamily: 'BebasNeue', fontSize: 28)),
        const SizedBox(height: 12),
        ...List.generate(options.length, (i) {
          final option = options[i];
          final selected = _selectedIndex == i;
          return GestureDetector(
            onTap: alreadyVoted
                ? null
                : () => setState(
                    () => _selectedIndex = selected ? null : i),
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: selected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: selected ? 0 : 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(option.optionTitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                            color: selected
                                ? theme.colorScheme.onPrimary
                                : null)),
                  ),
                  if (poll.showResultsWhileVoting || alreadyVoted)
                    Text('${option.votes}',
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: selected
                                ? theme.colorScheme.onPrimary
                                : null)),
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: 12),
        if (alreadyVoted)
          Opacity(
            opacity: 0.5,
            child: _button(
              label: 'Already Voted!',
              onPressed: null,
              theme: theme,
            ),
          )
        else
          _button(
            label: 'Confirm Vote',
            onPressed: _selectedIndex != null
                ? () => _submitVote(context, options)
                : null,
            theme: theme,
          ),
      ],
    );
  }

  // ── Page 2 (transition only) ──────────────────────────────────────────────

  Widget _buildPage2(BuildContext context, ThemeData theme, PollStruct poll) {
    return _buildPage1(context, theme, poll, false);
  }

  // ── Page 3: confirmation ──────────────────────────────────────────────────

  Widget _buildPage3(ThemeData theme, PollStruct poll) {
    final totalVotes =
        poll.options.fold(0, (sum, o) => sum + o.votes);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Vote Submitted!',
            style: theme.textTheme.titleMedium?.copyWith(
                fontFamily: 'BebasNeue', fontSize: 28)),
        const SizedBox(height: 16),
        ...poll.options.map((o) {
          final pct = totalVotes > 0 ? o.votes / totalVotes : 0.0;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(o.optionTitle,
                    style: theme.textTheme.bodyMedium),
                const SizedBox(height: 4),
                LinearPercentIndicator(
                  lineHeight: 14,
                  percent: pct.clamp(0.0, 1.0),
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  progressColor: theme.colorScheme.primary,
                  trailing: Text(
                    '${(pct * 100).toStringAsFixed(0)}%',
                    style: theme.textTheme.bodySmall,
                  ),
                  barRadius: const Radius.circular(4),
                ),
              ],
            ),
          );
        }),
        const SizedBox(height: 12),
        _button(
          label: 'Close',
          onPressed: () => Navigator.of(context).pop(),
          theme: theme,
        ),
      ],
    );
  }

  // ── Shared helpers ────────────────────────────────────────────────────────

  Widget _button({
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
                ?.copyWith(fontFamily: 'BebasNeue', fontSize: 18)),
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
}
