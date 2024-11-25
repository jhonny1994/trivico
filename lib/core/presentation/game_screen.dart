import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:trivico/core/domain/domain.dart';
import 'package:trivico/core/providers/providers.dart';
import 'package:trivico/core/utils/utils.dart';
import 'package:trivico/core/widgets/widgets.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({
    required this.categoryId,
    required this.difficulty,
    super.key,
  });

  final int categoryId;
  final String difficulty;

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  late final PageController _pageController;
  int _remainingSeconds = timerSeconds;
  Timer? _timer;
  bool _showCountdown = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final config = GameConfig(
          category: widget.categoryId,
          difficulty: widget.difficulty,
        );
        await ref.read(questionsStateProvider.notifier).getQuestions(config);
      },
    );
  }

  void _onCountdownFinished() {
    setState(() {
      _showCountdown = false;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Future<void> nextPage() async {
    await _pageController.animateToPage(
      _pageController.page!.toInt() + 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
    _startTimer();
  }

  void _startTimer() {
    if (_showCountdown) return;
    _timer?.cancel();
    setState(() {
      _remainingSeconds = timerSeconds;
    });
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingSeconds > 0) {
          setState(() {
            _remainingSeconds--;
          });
        } else {
          timer.cancel();
          if (mounted) {
            final questions = ref.read(questionsStateProvider).data;
            if (questions != null) {
              final correctAnswers = questions
                  .where((q) => q.selectedAnswer == q.correctAnswer)
                  .length;
              context.pushNamed(
                'result',
                extra: {
                  'correctAnswersCount': correctAnswers,
                  'questionsCount': questions.length,
                },
              );
            }
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final questionsState = ref.watch(questionsStateProvider);

    return questionsState.when(
      initial: () => const LoadingWidget(),
      loading: () => const LoadingWidget(),
      error: (failure) => FailureWidget(
        failure: failure,
        onRetry: () {
          final config = GameConfig(
            category: widget.categoryId,
            difficulty: widget.difficulty,
          );
          ref.read(questionsStateProvider.notifier).getQuestions(config);
        },
      ),
      success: (questions) {
        if (questions.isEmpty) return const LoadingWidget();

        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: kDefaultPadding,
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: questions.length,
                    itemBuilder: (context, questionIndex) {
                      final question = questions[questionIndex];
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Question ${questionIndex + 1}/${questions.length}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Spacer(),
                              StepProgressIndicator(
                                totalSteps: timerSeconds,
                                currentStep: _remainingSeconds,
                                size: 8,
                                padding: 0,
                                selectedColor: context.colorScheme.primary,
                                unselectedColor: context.colorScheme.primary
                                    .withOpacity(kSecondaryOpacity),
                                roundedEdges: const Radius.circular(10),
                              ),
                              const Gap(8),
                              Text(
                                '$_remainingSeconds',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const Spacer(flex: 3),
                                Text(
                                  question.question,
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Spacer(flex: 3),
                                ListView.builder(
                                  itemCount: question.allAnswers.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final answer =
                                        question.allAnswers.elementAt(index);
                                    final isSelected =
                                        question.selectedAnswer == answer;
                                    final isCorrect =
                                        answer == question.correctAnswer;
                                    final showResult =
                                        question.selectedAnswer != null;

                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            kSmallBorderRadius,
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              if (showResult) ...[
                                                if (isCorrect) ...[
                                                  Colors.green.withOpacity(
                                                    kSecondaryOpacity,
                                                  ),
                                                  Colors.green.withOpacity(
                                                    kPrimaryOpacity,
                                                  ),
                                                ] else if (isSelected) ...[
                                                  Colors.red.withOpacity(
                                                    kSecondaryOpacity,
                                                  ),
                                                  Colors.red.withOpacity(
                                                    kPrimaryOpacity,
                                                  ),
                                                ] else ...[
                                                  context.colorScheme.surface,
                                                  context.colorScheme.surface,
                                                ],
                                              ] else if (isSelected) ...[
                                                context.colorScheme.primary
                                                    .withOpacity(
                                                  kSecondaryOpacity,
                                                ),
                                                context.colorScheme.primary
                                                    .withOpacity(
                                                  kPrimaryOpacity,
                                                ),
                                              ] else ...[
                                                context.colorScheme.surface,
                                                context.colorScheme.surface,
                                              ],
                                            ],
                                          ),
                                          border: Border.all(
                                            color: showResult
                                                ? isCorrect
                                                    ? Colors.green
                                                    : isSelected
                                                        ? Colors.red
                                                        : context
                                                            .colorScheme.outline
                                                            .withOpacity(
                                                            kSecondaryOpacity *
                                                                2.5,
                                                          )
                                                : isSelected
                                                    ? context
                                                        .colorScheme.primary
                                                    : context
                                                        .colorScheme.outline
                                                        .withOpacity(
                                                        kSecondaryOpacity * 2.5,
                                                      ),
                                            width: isSelected ||
                                                    (showResult && isCorrect)
                                                ? 2
                                                : 1,
                                          ),
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: isSelected || showResult
                                                ? null
                                                : () async {
                                                    ref
                                                        .read(
                                                          questionsStateProvider
                                                              .notifier,
                                                        )
                                                        .selectAnswer(
                                                          questionIndex,
                                                          answer,
                                                        );
                                                    await Future.delayed(
                                                      const Duration(
                                                        seconds: 1,
                                                      ),
                                                    );
                                                    if (questionIndex <
                                                        questions.length - 1) {
                                                      await nextPage();
                                                    } else {
                                                      final correctAnswers =
                                                          questions
                                                              .where(
                                                                (q) =>
                                                                    q.selectedAnswer ==
                                                                    q.correctAnswer,
                                                              )
                                                              .length;
                                                      if (context.mounted) {
                                                        await context.pushNamed(
                                                          'result',
                                                          extra: {
                                                            'correctAnswersCount':
                                                                correctAnswers,
                                                            'questionsCount':
                                                                questions
                                                                    .length,
                                                          },
                                                        );
                                                      }
                                                    }
                                                  },
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      answer,
                                                      style:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .titleMedium
                                                              ?.copyWith(
                                                                color: showResult
                                                                    ? isCorrect
                                                                        ? Colors.green
                                                                        : isSelected
                                                                            ? Colors.red
                                                                            : null
                                                                    : isSelected
                                                                        ? context.colorScheme.primary
                                                                        : null,
                                                              ),
                                                    ),
                                                  ),
                                                  if (showResult &&
                                                      (isCorrect ||
                                                          isSelected)) ...[
                                                    const Gap(8),
                                                    Icon(
                                                      isCorrect
                                                          ? Icons.check_circle
                                                          : Icons.cancel,
                                                      color: isCorrect
                                                          ? Colors.green
                                                          : Colors.red,
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                if (_showCountdown)
                  CountdownOverlay(
                    onFinished: _onCountdownFinished,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
