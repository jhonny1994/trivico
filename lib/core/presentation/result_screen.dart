import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
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

class _ResultScreenState extends ConsumerState<ResultScreen>
    with TickerProviderStateMixin {
  late ConfettiController _confettiController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _progressAnimation;
  late Animation<double> _pulseAnimation;
  late AnimationController _pulseController;
  late Animation<double> _scaleAnimation;
  late AnimationController _scaleController;

  @override
  void dispose() {
    _confettiController.dispose();
    _scaleController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: const Interval(0, 0.5, curve: Curves.elasticOut),
      ),
    );
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1, end: 1.05).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
      ),
    );
    _progressAnimation = Tween<double>(
      begin: 0,
      end: widget.correctAnswersCount / widget.questionsCount,
    ).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: const Interval(0.2, 0.7, curve: Curves.easeOutCubic),
      ),
    );
    _confettiController.play();
    _scaleController.forward();
  }

  bool get _isCelebrate =>
      widget.correctAnswersCount > 0 &&
      ((widget.correctAnswersCount * 100) / widget.questionsCount) >= 50;

  @override
  Widget build(BuildContext context) {
    final percentage =
        (widget.correctAnswersCount * 100) / widget.questionsCount;
    final message = percentage >= 80
        ? 'Excellent!'
        : percentage >= 60
            ? 'Well Done!'
            : percentage >= 40
                ? 'Good Try!'
                : 'Keep Practicing!';
    final color = percentage >= 80
        ? Colors.green
        : percentage >= 60
            ? Colors.blue
            : percentage >= 40
                ? Colors.orange
                : Colors.red;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => ref.read(themeNotifierProvider.notifier).toggle(),
            icon: const Icon(Icons.brightness_6),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: kDefaultPadding,
            child: Column(
              children: [
                const Spacer(flex: 2),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const Spacer(),
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: AnimatedBuilder(
                    animation: _pulseAnimation,
                    builder: (context, child) => Transform.scale(
                      scale: widget.correctAnswersCount == widget.questionsCount
                          ? _pulseAnimation.value
                          : 1.0,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: color.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                AnimatedBuilder(
                                  animation: _progressAnimation,
                                  builder: (context, child) => SizedBox(
                                    height: 150,
                                    width: 150,
                                    child: CircularProgressIndicator(
                                      value: _progressAnimation.value,
                                      strokeWidth: 12,
                                      backgroundColor:
                                          color.withOpacity(kSecondaryOpacity),
                                      valueColor:
                                          AlwaysStoppedAnimation<Color>(color),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    AnimatedBuilder(
                                      animation: _progressAnimation,
                                      builder: (context, child) => Text(
                                        '${(_progressAnimation.value * 100).toStringAsFixed(0)}%',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge
                                            ?.copyWith(
                                              color: color,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      'Score',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: color.withOpacity(
                                              kPrimaryOpacity * 8,
                                            ),
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Gap(24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: color,
                                      size: 32,
                                    ),
                                    const Gap(8),
                                    Text(
                                      '${widget.correctAnswersCount}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: color,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'Correct',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: color.withOpacity(
                                              kPrimaryOpacity * 8,
                                            ),
                                          ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 50,
                                  width: 1,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                  ),
                                  color: color.withOpacity(kSecondaryOpacity),
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.cancel,
                                      color: color
                                          .withOpacity(kSecondaryOpacity * 2.5),
                                      size: 32,
                                    ),
                                    const Gap(8),
                                    Text(
                                      '${widget.questionsCount - widget.correctAnswersCount}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: color.withOpacity(
                                              kSecondaryOpacity * 2.5,
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'Wrong',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: color.withOpacity(
                                              kSecondaryOpacity * 2.5,
                                            ),
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: FilledButton.icon(
                    onPressed: () => context.goNamed('categories'),
                    style: FilledButton.styleFrom(
                      backgroundColor: color,
                      minimumSize: const Size(200, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Play Again'),
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
                blastDirectionality: BlastDirectionality.explosive,
                maxBlastForce: 7,
                minBlastForce: 3,
                emissionFrequency: 0.03,
                numberOfParticles: 50,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple,
                ],
              ),
            ),
        ],
      ),
    );
  }
}
