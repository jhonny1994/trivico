import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:trivico/core/domain/config.dart';
import 'package:trivico/core/domain/question.dart';
import 'package:trivico/core/presentation/result_screen.dart';
import 'package:trivico/core/providers/trivia_api_service_provider.dart';
import 'package:trivico/core/utils/constants.dart';
import 'package:trivico/core/utils/extensions.dart';
import 'package:trivico/core/widgets/loading_widget.dart';

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
  List<Question> questions = [];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        getQuestions();
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

  void nextPage() {
    _pageController.animateToPage(
      _pageController.page!.toInt() + 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
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
                        title:
                            Text('${questionIndex + 1} of ${questions.length}'),
                        actions: [
                          IconButton(
                            onPressed: () {},
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
                          currentStep: questionIndex,
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
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Spacer(flex: 3),
                                ListView.builder(
                                  itemCount: question.allAnswers.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, answerIndex) {
                                    final choice = question.allAnswers
                                        .elementAt(answerIndex);
                                    final isSelected =
                                        question.selectedAnswer == choice;

                                    return Card(
                                      shape: const StadiumBorder(),
                                      child: ListTile(
                                        selected: isSelected,
                                        leading: Icon(
                                          isSelected
                                              ? Icons.circle
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
                          onPressed: question.selectedAnswer != null
                              ? () => nextPage()
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
                          onPressed: questions.every(
                            (element) => element.selectedAnswer != null,
                          )
                              ? () => context.navigator.pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ResultScreen(questions: questions),
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
