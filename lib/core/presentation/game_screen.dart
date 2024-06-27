import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:trivico/core/domain/domain.dart';
import 'package:trivico/core/presentation/presentation.dart';
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
  List<Question> questions = [];

  late final PageController _pageController;
  int _remainingSeconds = timerSeconds;
  Timer? _timer;

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await getQuestions();
        _startTimer();
      },
    );
  }

  Future<void> getQuestions() async {
    final config = GameConfig(
      category: widget.categoryId,
      difficulty: widget.difficulty,
    );
    final request = await ref.watch(triviaApiProvider).getQuestions(config);
    request.fold(
      (l) => context.showCustomSnackBar(l),
      (r) => setState(() {
        questions = r;
      }),
    );
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
      (timer) async {
        if (_remainingSeconds > 0) {
          setState(() {
            _remainingSeconds--;
          });
        } else {
          if (_pageController.page!.toInt() < questions.length - 1) {
            await nextPage();
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: questions.isEmpty
            ? const LoadingWidget()
            : PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: questions.length,
                itemBuilder: (context, questionIndex) {
                  final question = questions.elementAt(questionIndex);
                  return Column(
                    children: [
                      AppBar(
                        title: (questionIndex != questions.length - 1)
                            ? Card(
                                shape: const StadiumBorder(),
                                color: context.colorScheme.surface,
                                child: Padding(
                                  padding: kDefaultPadding / 2,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.timer_outlined),
                                      const Gap(4),
                                      Text('${_remainingSeconds}s'),
                                    ],
                                  ),
                                ),
                              )
                            : null,
                        actions: [
                          IconButton(
                            onPressed: () => ref.read(themeNotifierProvider.notifier).toggle(),
                            icon: const Icon(
                              Icons.brightness_6,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: kDefaultPadding,
                        child: StepProgressIndicator(
                          totalSteps: questions.length,
                          currentStep: questionIndex + 1,
                          selectedColor: context.colorScheme.primary,
                          unselectedColor: context.colorScheme.surface,
                          roundedEdges: const Radius.circular(8),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: kDefaultPadding,
                          child: Container(
                            padding: kDefaultPadding,
                            decoration: BoxDecoration(
                              color: context.colorScheme.surface,
                              borderRadius: BorderRadius.circular(16),
                            ),
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
                                  itemBuilder: (context, answerIndex) {
                                    final choice = question.allAnswers.elementAt(answerIndex);
                                    final isSelected = question.selectedAnswer == choice;

                                    return Card(
                                      shape: const StadiumBorder(),
                                      child: ListTile(
                                        selected: isSelected,
                                        leading: Icon(
                                          isSelected ? Icons.check_circle : Icons.circle_outlined,
                                          color: context.colorScheme.secondary,
                                        ),
                                        horizontalTitleGap: 0,
                                        onTap: () {
                                          setState(
                                            () =>
                                                questions[questionIndex] = questions.elementAt(questionIndex).copyWith(
                                                      selectedAnswer: choice,
                                                    ),
                                          );
                                        },
                                        shape: const StadiumBorder(),
                                        title: Text(choice),
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Gap(8),
                      if (questionIndex != questions.length - 1)
                        IconButton(
                          onPressed: question.selectedAnswer != null ? () async => nextPage() : null,
                          iconSize: 56,
                          padding: EdgeInsets.zero,
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: const Icon(Icons.keyboard_arrow_right_rounded),
                          ),
                        )
                      else
                        IconButton(
                          onPressed: _remainingSeconds == 0 || questionIndex == questions.length - 1
                              ? () => context.navigator.pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => ResultScreen(
                                        correctAnswersCount:
                                            questions.where((e) => e.selectedAnswer == e.correctAnswer).length,
                                        questionsCount: questions.length,
                                      ),
                                    ),
                                    (route) => false,
                                  )
                              : null,
                          iconSize: 56,
                          padding: EdgeInsets.zero,
                          icon: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: const Icon(Icons.done),
                          ),
                        ),
                      const Gap(16),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
