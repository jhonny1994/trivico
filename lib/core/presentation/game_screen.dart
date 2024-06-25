import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/domain/config.dart';
import 'package:trivico/core/domain/question.dart';
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
      (r) {
        setState(() {
          questions = r;
        });
      },
    );
  }

  void nextPage() {
    _pageController.animateToPage(
      _pageController.page!.toInt() + 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  void previousPage() {
    _pageController.animateToPage(
      _pageController.page!.toInt() - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: questions.isEmpty
          ? const LoadingWidget()
          : PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions.elementAt(index);

                return Padding(
                  padding: kDefaultPadding,
                  child: Column(
                    children: [
                      Text(
                        'Question: ${index + 1}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Spacer(flex: 2),
                      Text(
                        question.question,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Spacer(flex: 2),
                      ListView.builder(
                        itemCount: question.allAnswers.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final choice = question.allAnswers.elementAt(index);
                          return ListTile(
                            onTap: () {
                              if (question.correctAnswer == choice) {
                                print('correct');
                              } else {
                                print('incorrect');
                              }
                            },
                            title: Text(choice),
                          );
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
