import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:trivico/core/providers/providers.dart';
import 'package:trivico/core/utils/utils.dart';

class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({
    required this.correctAnswersCount,
    required this.questionsCount,
    super.key,
  });
  final int correctAnswersCount;
  final int questionsCount;

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 5));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  bool get _isCelebrate =>
      widget.correctAnswersCount > 0 &&
      ((widget.correctAnswersCount * 100) / widget.questionsCount) >= 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => ref.read(themeNotifierProvider.notifier).toggle(),
            icon: const Icon(
              Icons.brightness_6,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: kDefaultPadding,
            child: Column(
              children: [
                const Spacer(flex: 3),
                ClipOval(
                  child: Container(
                    height: context.width - kDefaultPadding.horizontal,
                    width: context.width - kDefaultPadding.horizontal,
                    color: Colors.white,
                    child: SvgPicture.asset(
                      'assets/svg/answer_${_isCelebrate ? 'correct' : 'wrong'}.svg',
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'Your Got',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  '${widget.correctAnswersCount} out of ${widget.questionsCount}',
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
                  onPressed: () => context.goNamed('categories'),
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
          if (_isCelebrate)
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
