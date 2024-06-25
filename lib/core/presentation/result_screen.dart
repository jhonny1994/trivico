import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trivico/core/domain/question.dart';
import 'package:trivico/core/presentation/categories_screen.dart';
import 'package:trivico/core/utils/constants.dart';
import 'package:trivico/core/utils/extensions.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    required this.questions,
    super.key,
  });
  final List<Question> questions;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 5));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: kDefaultPadding,
              child: Column(
                children: [
                  const Spacer(flex: 3),
                  ClipOval(
                    child: Container(
                      height: context.width - kDefaultPadding.horizontal,
                      width: context.width - kDefaultPadding.horizontal,
                      color: Colors.white,
                      child: SvgPicture.asset('assets/answer.svg'),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Your Got',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    '${widget.questions.where((e) => e.selectedAnswer == e.correctAnswer).length} out of ${widget.questions.length}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'correct answers',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => context.navigator.pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const CategoriesScreen(),
                      ),
                      (route) => false,
                    ),
                    iconSize: 56,
                    padding: EdgeInsets.zero,
                    icon: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: 3.14 / 2,
              maxBlastForce: 5,
              minBlastForce: 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
