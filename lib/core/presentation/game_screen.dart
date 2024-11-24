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
        _startTimer();
      },
    );
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
            child: Padding(
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
                            unselectedColor:
                                context.colorScheme.primary.withOpacity(0.2),
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
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const Spacer(flex: 3),
                            ListView.builder(
                              itemCount: question.allAnswers.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, answerIndex) {
                                final choice =
                                    question.allAnswers.elementAt(answerIndex);
                                final isSelected =
                                    question.selectedAnswer == choice;

                                return Card(
                                  shape: const StadiumBorder(),
                                  child: ListTile(
                                    selected: isSelected,
                                    title: Text(choice),
                                    leading: Icon(
                                      isSelected
                                          ? Icons.check_circle
                                          : Icons.circle_outlined,
                                      color: context.colorScheme.secondary,
                                    ),
                                    horizontalTitleGap: 0,
                                    onTap: () {
                                      setState(
                                        () => questions[questionIndex] =
                                            questions
                                                .elementAt(questionIndex)
                                                .copyWith(
                                                  selectedAnswer: choice,
                                                ),
                                      );
                                    },
                                    shape: const StadiumBorder(),
                                  ),
                                );
                              },
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const Gap(8),
                      if (questionIndex != questions.length - 1)
                        IconButton(
                          onPressed: question.selectedAnswer != null
                              ? () async => nextPage()
                              : null,
                          iconSize: 56,
                          padding: EdgeInsets.zero,
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child:
                                const Icon(Icons.keyboard_arrow_right_rounded),
                          ),
                        )
                      else
                        IconButton(
                          onPressed: _remainingSeconds == 0 ||
                                  questionIndex == questions.length - 1
                              ? () {
                                  final correctAnswers = questions
                                      .where(
                                        (e) =>
                                            e.selectedAnswer == e.correctAnswer,
                                      )
                                      .length;

                                  context.pushReplacementNamed(
                                    'result',
                                    extra: {
                                      'correctAnswersCount': correctAnswers,
                                      'questionsCount': questions.length,
                                    },
                                  );
                                }
                              : null,
                          iconSize: 56,
                          padding: EdgeInsets.zero,
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: const Icon(Icons.done_rounded),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
