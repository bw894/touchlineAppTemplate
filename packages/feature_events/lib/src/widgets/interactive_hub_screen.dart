import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

/// Full-page interactive hub screen for POLL / QUIZ / FORM content.
///
/// Page state:
/// * 1 → Intro card (type badge, title, "Vote Now" / "Play Now" / "Submit Now")
/// * 2 (POLL) → Voting options list
/// * 3 (POLL) → Vote confirmed
/// * 2..n (QUIZ) → One question per page (page - 2 = question index)
///
/// FORM shows a no-op "Submit Now" button (back-end integration pending).
class InteractiveHubScreen extends StatefulWidget {
  const InteractiveHubScreen({
    super.key,
    required this.objectId,
    required this.projectId,
    required this.restApiKey,
    required this.userObjectId,
    required this.userEmail,
    this.clubBadgeUrl,
  });

  final String objectId;
  final String projectId;
  final String restApiKey;
  final String userObjectId;
  final String userEmail;
  final String? clubBadgeUrl;

  @override
  State<InteractiveHubScreen> createState() => _InteractiveHubScreenState();
}

class _InteractiveHubScreenState extends State<InteractiveHubScreen>
    with TickerProviderStateMixin {
  int _page = 1;
  int? _indexSelected;

  // QUIZ state
  double? _currentTimerValue;
  bool _showCorrectAnswers = false;
  List<int> _quizEntry = [];
  int? _totalPointsAvailable;
  Timer? _timer;

  late final AnimationController _buttonScaleController;

  @override
  void initState() {
    super.initState();
    _buttonScaleController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _buttonScaleController.dispose();
    super.dispose();
  }

  String _formatExpiry(int? ms) {
    if (ms == null || ms == 0) return '';
    final dt = DateTime.fromMillisecondsSinceEpoch(ms);
    return DateFormat('EEEE, d MMM @ H:m').format(dt);
  }

  IconData _styleIcon(String? style) {
    switch (style) {
      case 'QUIZ':
        return Icons.quiz_outlined;
      case 'FORM':
        return Icons.article_outlined;
      default:
        return Icons.how_to_vote_outlined;
    }
  }

  void _startQuizTimer(int seconds) {
    _timer?.cancel();
    _currentTimerValue = seconds.toDouble();
    _showCorrectAnswers = false;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      if (!mounted) {
        t.cancel();
        return;
      }
      if ((_currentTimerValue ?? 0) > 0.1) {
        setState(() => _currentTimerValue = (_currentTimerValue! - 0.1));
      } else {
        t.cancel();
        setState(() {
          _showCorrectAnswers = true;
          _quizEntry.add(-1); // timed out — no answer selected
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: theme.colorScheme.surface,
        body: FutureBuilder<ApiCallResponse>(
          future: BackendlessDatabaseGroup.getSpecificGenericPollCall.call(
            pollObjectId: widget.objectId,
            bLProjectId: widget.projectId,
            bLRestAPIKey: widget.restApiKey,
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
            final response = snapshot.data!;
            final poll = PollStruct.maybeFromMap(response.jsonBody);

            return _PollBody(
              poll: poll,
              page: _page,
              indexSelected: _indexSelected,
              currentTimerValue: _currentTimerValue,
              showCorrectAnswers: _showCorrectAnswers,
              quizEntry: _quizEntry,
              totalPointsAvailable: _totalPointsAvailable,
              projectId: widget.projectId,
              restApiKey: widget.restApiKey,
              userObjectId: widget.userObjectId,
              userEmail: widget.userEmail,
              clubBadgeUrl: widget.clubBadgeUrl,
              pollObjectId: widget.objectId,
              formatExpiry: _formatExpiry,
              styleIcon: _styleIcon,
              onIndexSelected: (i) => setState(() => _indexSelected = i),
              onPageChanged: (p) => setState(() => _page = p),
              onVoteConfirmed: () => setState(() => _page = 3),
              onStartQuiz: (q) {
                setState(() {
                  _page = 2;
                  _totalPointsAvailable = q;
                  _quizEntry = [];
                });
              },
              onStartQuizTimer: (seconds) {
                setState(() {});
                if (seconds != 0) {
                  _startQuizTimer(seconds);
                } else {
                  setState(() {
                    _currentTimerValue = 1.0;
                    _showCorrectAnswers = false;
                  });
                }
              },
              onQuizAnswerSelected: (answerIndex) {
                _timer?.cancel();
                setState(() {
                  _showCorrectAnswers = true;
                  _quizEntry.add(answerIndex);
                });
              },
              onNextQuestion: (nextPage, nextSeconds) {
                setState(() {
                  _page = nextPage;
                  _showCorrectAnswers = false;
                });
                if (nextSeconds > 0) {
                  _startQuizTimer(nextSeconds);
                } else {
                  setState(() => _currentTimerValue = 1.0);
                }
              },
              buttonScaleController: _buttonScaleController,
            );
          },
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Internal widget extracted so the FutureBuilder tree stays flat
// ---------------------------------------------------------------------------
class _PollBody extends StatelessWidget {
  const _PollBody({
    required this.poll,
    required this.page,
    required this.indexSelected,
    required this.currentTimerValue,
    required this.showCorrectAnswers,
    required this.quizEntry,
    required this.totalPointsAvailable,
    required this.projectId,
    required this.restApiKey,
    required this.userObjectId,
    required this.userEmail,
    required this.clubBadgeUrl,
    required this.pollObjectId,
    required this.formatExpiry,
    required this.styleIcon,
    required this.onIndexSelected,
    required this.onPageChanged,
    required this.onVoteConfirmed,
    required this.onStartQuiz,
    required this.onStartQuizTimer,
    required this.onQuizAnswerSelected,
    required this.onNextQuestion,
    required this.buttonScaleController,
  });

  final PollStruct? poll;
  final int page;
  final int? indexSelected;
  final double? currentTimerValue;
  final bool showCorrectAnswers;
  final List<int> quizEntry;
  final int? totalPointsAvailable;
  final String projectId;
  final String restApiKey;
  final String userObjectId;
  final String userEmail;
  final String? clubBadgeUrl;
  final String pollObjectId;
  final String Function(int?) formatExpiry;
  final IconData Function(String?) styleIcon;
  final ValueChanged<int?> onIndexSelected;
  final ValueChanged<int> onPageChanged;
  final VoidCallback onVoteConfirmed;
  final void Function(int questionsCount) onStartQuiz;
  final void Function(int seconds) onStartQuizTimer;
  final void Function(int answerIndex) onQuizAnswerSelected;
  final void Function(int nextPage, int nextSeconds) onNextQuestion;
  final AnimationController buttonScaleController;

  @override
  Widget build(BuildContext context) {
    final style = poll?.style ?? 'POLL';

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ----------------------------------------------------------------
          // Page 1 — intro card
          // ----------------------------------------------------------------
          if (page == 1)
            _IntroCard(
              poll: poll,
              style: style,
              clubBadgeUrl: clubBadgeUrl,
              pollObjectId: pollObjectId,
              projectId: projectId,
              restApiKey: restApiKey,
              userObjectId: userObjectId,
              userEmail: userEmail,
              formatExpiry: formatExpiry,
              styleIcon: styleIcon,
              onPageChanged: onPageChanged,
              onStartQuiz: onStartQuiz,
              onStartQuizTimer: onStartQuizTimer,
              buttonScaleController: buttonScaleController,
            ),

          // ----------------------------------------------------------------
          // POLL page 2 — voting options
          // ----------------------------------------------------------------
          if (style == 'POLL' && page == 2)
            _PollVotingCard(
              poll: poll,
              indexSelected: indexSelected,
              projectId: projectId,
              restApiKey: restApiKey,
              userEmail: userEmail,
              onIndexSelected: onIndexSelected,
              onVoteConfirmed: onVoteConfirmed,
              buttonScaleController: buttonScaleController,
            ),

          // ----------------------------------------------------------------
          // POLL page 3 — vote confirmed
          // ----------------------------------------------------------------
          if (style == 'POLL' && page == 3)
            _VoteConfirmedCard(onBack: () => Navigator.of(context).maybePop()),

          // ----------------------------------------------------------------
          // QUIZ — question pages (page >= 2, page < 99)
          // ----------------------------------------------------------------
          if (style == 'QUIZ' && page >= 2 && page < 99)
            _QuizQuestionsCard(
              poll: poll,
              page: page,
              currentTimerValue: currentTimerValue,
              showCorrectAnswers: showCorrectAnswers,
              quizEntry: quizEntry,
              totalPointsAvailable: totalPointsAvailable,
              onQuizAnswerSelected: onQuizAnswerSelected,
              onNextQuestion: onNextQuestion,
              onPageChanged: onPageChanged,
              projectId: projectId,
              restApiKey: restApiKey,
              userObjectId: userObjectId,
            ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Intro card — shown at page == 1
// ---------------------------------------------------------------------------
class _IntroCard extends StatelessWidget {
  const _IntroCard({
    required this.poll,
    required this.style,
    required this.clubBadgeUrl,
    required this.pollObjectId,
    required this.projectId,
    required this.restApiKey,
    required this.userObjectId,
    required this.userEmail,
    required this.formatExpiry,
    required this.styleIcon,
    required this.onPageChanged,
    required this.onStartQuiz,
    required this.onStartQuizTimer,
    required this.buttonScaleController,
  });

  final PollStruct? poll;
  final String style;
  final String? clubBadgeUrl;
  final String pollObjectId;
  final String projectId;
  final String restApiKey;
  final String userObjectId;
  final String userEmail;
  final String Function(int?) formatExpiry;
  final IconData Function(String?) styleIcon;
  final ValueChanged<int> onPageChanged;
  final void Function(int) onStartQuiz;
  final void Function(int) onStartQuizTimer;
  final AnimationController buttonScaleController;

  bool _hasPlayed(ApiCallResponse response) {
    return (response.jsonBody
                .toList()
                .map<PollStruct?>(PollStruct.maybeFromMap)
                .toList() as Iterable<PollStruct?>)
            .withoutNulls
            .isNotEmpty;
  }

  Future<ApiCallResponse> _checkCall() {
    switch (style) {
      case 'QUIZ':
        return BackendlessDatabaseGroup.checkIfUserHasPlayedQuizCall.call(
          userObjectId: userObjectId,
          pollObjectId: pollObjectId,
          bLProjectId: projectId,
          bLRestAPIKey: restApiKey,
        );
      case 'FORM':
        return BackendlessDatabaseGroup.checkIfUserHasSubmittedAFormCall.call(
          userObjectId: userObjectId,
          pollObjectId: pollObjectId,
          bLProjectId: projectId,
          bLRestAPIKey: restApiKey,
        );
      default: // POLL
        return BackendlessDatabaseGroup.checkIfUserHasVotedCall.call(
          userEmail: userEmail,
          pollObjectId: pollObjectId,
          bLProjectId: projectId,
          bLRestAPIKey: restApiKey,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Club badge with gradient overlay
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 90.0,
                height: 90.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  gradient: LinearGradient(
                    colors: [
                      theme.colorScheme.primary.withValues(alpha: 0.3),
                      theme.colorScheme.primary.withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              if (clubBadgeUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    clubBadgeUrl!,
                    width: 70.0,
                    height: 70.0,
                    fit: BoxFit.contain,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8.0),

          // "PLAY" header
          Text(
            'PLAY',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontFamily: 'BebasNeue',
              fontSize: 45.0,
              fontWeight: FontWeight.w400,
            ),
          ),

          // Type badge
          Container(
            padding:
                const EdgeInsetsDirectional.fromSTEB(10.0, 4.0, 10.0, 4.0),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(styleIcon(style),
                    size: 14.0, color: theme.colorScheme.primary),
                const SizedBox(width: 4.0),
                Text(
                  style,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),

          // Poll title
          Text(
            poll?.title ?? '',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 16.0),

          // Vote/Play/Submit button — depends on whether user has already played
          FutureBuilder<ApiCallResponse>(
            future: _checkCall(),
            builder: (context, snap) {
              if (!snap.hasData) {
                return SpinKitWanderingCubes(
                  color: theme.colorScheme.primary,
                  size: 40.0,
                );
              }
              final alreadyDone = _hasPlayed(snap.data!);
              final expiry = formatExpiry(poll?.endDatetime);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Opacity(
                    opacity: alreadyDone ? 0.6 : 1.0,
                    child: SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: ElevatedButton.icon(
                        onPressed: alreadyDone
                            ? null
                            : () {
                                if (style == 'QUIZ') {
                                  final questions = poll?.quizQuestions
                                          .sortedBy<num>((q) => q.sortOrder) ??
                                      [];
                                  onStartQuiz(questions.length);
                                  final firstTime =
                                      questions.firstOrNull?.time ?? 0;
                                  onStartQuizTimer(firstTime);
                                } else if (style == 'FORM') {
                                  // FORM: no-op (no back-end integration)
                                } else {
                                  onPageChanged(2);
                                }
                              },
                        icon: const SizedBox.shrink(),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_buttonLabel(style)),
                            const SizedBox(width: 6.0),
                            const Icon(Icons.east, size: 15.0),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: Colors.white,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          disabledBackgroundColor: theme.colorScheme.primary,
                          disabledForegroundColor: theme.colorScheme.surface,
                        ),
                      ),
                    ),
                  ).animate(controller: buttonScaleController).scale(),
                  const SizedBox(height: 5.0),
                  if (alreadyDone)
                    Text(
                      _alreadyDoneMessage(style),
                      style: theme.textTheme.bodyMedium,
                    )
                  else if (expiry.isNotEmpty)
                    Text(
                      'Expires: $expiry',
                      style: theme.textTheme.bodyMedium,
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  String _buttonLabel(String style) {
    switch (style) {
      case 'QUIZ':
        return 'Play Now';
      case 'FORM':
        return 'Submit Now';
      default:
        return 'Vote Now';
    }
  }

  String _alreadyDoneMessage(String style) {
    switch (style) {
      case 'QUIZ':
        return 'You\'ve already played this quiz!';
      case 'FORM':
        return 'You\'ve already submitted this form!';
      default:
        return 'You\'ve already voted in this poll!';
    }
  }
}

// ---------------------------------------------------------------------------
// POLL voting card — page == 2
// ---------------------------------------------------------------------------
class _PollVotingCard extends StatelessWidget {
  const _PollVotingCard({
    required this.poll,
    required this.indexSelected,
    required this.projectId,
    required this.restApiKey,
    required this.userEmail,
    required this.onIndexSelected,
    required this.onVoteConfirmed,
    required this.buttonScaleController,
  });

  final PollStruct? poll;
  final int? indexSelected;
  final String projectId;
  final String restApiKey;
  final String userEmail;
  final ValueChanged<int?> onIndexSelected;
  final VoidCallback onVoteConfirmed;
  final AnimationController buttonScaleController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final options =
        poll?.options.sortedBy<num>((o) => o.sortOrder).toList() ?? [];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: options.length,
              separatorBuilder: (_, __) => const SizedBox(height: 13.0),
              itemBuilder: (context, i) {
                final opt = options[i];
                final selected = indexSelected == i;
                return GestureDetector(
                  onTap: () =>
                      onIndexSelected(selected ? null : i),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 370),
                      curve: Curves.easeInOut,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: selected
                            ? theme.colorScheme.primary
                            : theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Option image (if present)
                          if (opt.image.isNotEmpty)
                            Container(
                              color: theme.colorScheme.surface,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.network(
                                  opt.image,
                                  width: MediaQuery.sizeOf(context).width *
                                      0.18,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          const SizedBox(width: 8.0),
                          // Option title
                          Expanded(
                            child: Text(
                              opt.optionTitle,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: selected
                                    ? Colors.white
                                    : theme.colorScheme.onSurface,
                                fontWeight: selected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                          // Radio icon
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: Icon(
                              selected
                                  ? Icons.radio_button_checked_rounded
                                  : Icons.radio_button_off,
                              color: selected
                                  ? Colors.white
                                  : theme.colorScheme.onSurfaceVariant,
                              size: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Confirm vote button (only visible when an option is selected)
          if (indexSelected != null)
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 14.0, 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () async {
                    if (indexSelected == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Please select option!'),
                          backgroundColor: Theme.of(context).colorScheme.error,
                          duration: const Duration(milliseconds: 2150),
                        ),
                      );
                      return;
                    }
                    final optionId =
                        options.elementAtOrNull(indexSelected!)?.objectId;
                    final result = await AddVoteToPollCall.call(
                      bLappId: projectId,
                      bLRestApiKey: restApiKey,
                      optionObjectId: optionId,
                      userEmail: userEmail,
                    );
                    if (!result.succeeded) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Failed to add vote!'),
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                            duration: const Duration(milliseconds: 2150),
                          ),
                        );
                      }
                      return;
                    }
                    onVoteConfirmed();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: Colors.white,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text('Confirm Vote'),
                ).animate(controller: buttonScaleController).scale(),
              ),
            ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Vote confirmed card — POLL page == 3
// ---------------------------------------------------------------------------
class _VoteConfirmedCard extends StatelessWidget {
  const _VoteConfirmedCard({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'VOTE CONFIRMED',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'THANKS FOR VOTING',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: 'BebasNeue',
                fontSize: 34.0,
                height: 1.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Icon(
              Icons.check_circle_outline,
              color: theme.colorScheme.primary,
              size: 50.0,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onBack,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: Colors.white,
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Back Home'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Quiz questions card — QUIZ page >= 2
// ---------------------------------------------------------------------------
class _QuizQuestionsCard extends StatelessWidget {
  const _QuizQuestionsCard({
    required this.poll,
    required this.page,
    required this.currentTimerValue,
    required this.showCorrectAnswers,
    required this.quizEntry,
    required this.totalPointsAvailable,
    required this.onQuizAnswerSelected,
    required this.onNextQuestion,
    required this.onPageChanged,
    required this.projectId,
    required this.restApiKey,
    required this.userObjectId,
  });

  final PollStruct? poll;
  final int page;
  final double? currentTimerValue;
  final bool showCorrectAnswers;
  final List<int> quizEntry;
  final int? totalPointsAvailable;
  final void Function(int) onQuizAnswerSelected;
  final void Function(int nextPage, int nextSeconds) onNextQuestion;
  final ValueChanged<int> onPageChanged;
  final String projectId;
  final String restApiKey;
  final String userObjectId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final questions =
        poll?.quizQuestions.sortedBy<num>((q) => q.sortOrder).toList() ?? [];
    final questionIndex = page - 2;

    if (questionIndex >= questions.length) {
      // All questions answered — show results
      return _QuizResultsCard(
        quizEntry: quizEntry,
        totalPointsAvailable: totalPointsAvailable,
        onBack: () => Navigator.of(context).maybePop(),
      );
    }

    final q = questions[questionIndex];
    final timeSeconds = q.time;
    final timerPercent = timeSeconds == 0
        ? 0.99
        : ((timeSeconds.toDouble() - (currentTimerValue ?? timeSeconds)) /
            timeSeconds);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Show questions as single visible item based on page index
        for (var qi = 0; qi < questions.length; qi++)
          if (qi == questionIndex)
            ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Container(
                width: 350.0,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Timer progress bar
                      if (timeSeconds != 0)
                        LinearPercentIndicator(
                          percent: timerPercent.clamp(0.0, 0.99),
                          width: 350.0,
                          lineHeight: 12.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: theme.colorScheme.primary,
                          backgroundColor:
                              theme.colorScheme.surfaceContainerHighest,
                          padding: EdgeInsets.zero,
                        ),
                      const SizedBox(height: 8.0),
                      // Timer label
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.timer_sharp,
                              color: theme.colorScheme.primary, size: 20.0),
                          const SizedBox(width: 4.0),
                          Text(
                            timeSeconds == 0
                                ? 'No Time Limit'
                                : '$timeSeconds Seconds',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      // Question title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          q.title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      // Answer options
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: q.questionOptions
                              .sortedBy<num>((o) => o.sortOrder)
                              .asMap()
                              .entries
                              .map((entry) {
                            final optIdx = entry.key;
                            final opt = entry.value;
                            final selected = quizEntry.length > questionIndex &&
                                quizEntry[questionIndex] == optIdx;

                            return Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                              child: GestureDetector(
                                onTap: showCorrectAnswers
                                    ? null
                                    : () => onQuizAnswerSelected(optIdx),
                                child: AnimatedContainer(
                                  duration:
                                      const Duration(milliseconds: 250),
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: showCorrectAnswers && opt.correct
                                        ? theme.colorScheme.secondary
                                            .withValues(alpha: 0.3)
                                        : selected
                                            ? theme.colorScheme.primary
                                            : theme.colorScheme.surface,
                                    borderRadius:
                                        BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    opt.title,
                                    style: theme.textTheme.bodyMedium
                                        ?.copyWith(
                                      color: selected
                                          ? Colors.white
                                          : theme.colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      // Next question / finish button (shown after answer selected or timer expired)
                      if (showCorrectAnswers || quizEntry.length > questionIndex)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 40.0,
                            child: ElevatedButton(
                              onPressed: () {
                                final isLast = questionIndex ==
                                    questions.length - 1;
                                if (isLast) {
                                  onPageChanged(99); // results page
                                } else {
                                  final nextQ =
                                      questions[questionIndex + 1];
                                  onNextQuestion(
                                    page + 1,
                                    nextQ.time,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    theme.colorScheme.primary,
                                foregroundColor: Colors.white,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text(
                                questionIndex == questions.length - 1
                                    ? 'Finish Quiz'
                                    : 'Next Question',
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Quiz results card
// ---------------------------------------------------------------------------
class _QuizResultsCard extends StatelessWidget {
  const _QuizResultsCard({
    required this.quizEntry,
    required this.totalPointsAvailable,
    required this.onBack,
  });

  final List<int> quizEntry;
  final int? totalPointsAvailable;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'QUIZ COMPLETE',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'THANKS FOR PLAYING',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: 'BebasNeue',
                fontSize: 34.0,
                height: 1.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Icon(Icons.check_circle_outline,
                color: theme.colorScheme.primary, size: 50.0),
            const SizedBox(height: 12.0),
            SizedBox(
              width: double.infinity,
              height: 40.0,
              child: ElevatedButton(
                onPressed: onBack,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Back Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
