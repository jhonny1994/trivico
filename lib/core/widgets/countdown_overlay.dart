import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trivico/core/utils/utils.dart';

class CountdownOverlay extends StatefulWidget {
  const CountdownOverlay({
    required this.onFinished,
    this.duration = const Duration(seconds: 3),
    super.key,
  });

  final VoidCallback onFinished;
  final Duration duration;

  @override
  State<CountdownOverlay> createState() => _CountdownOverlayState();
}

class _CountdownOverlayState extends State<CountdownOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Timer _timer;
  int _countdown = 3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    _startCountdown();
  }

  void _startCountdown() {
    _controller.forward(from: 0);
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_countdown == 1) {
          timer.cancel();
          widget.onFinished();
        } else {
          setState(() {
            _countdown--;
            _controller.forward(from: 0);
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.onSurface.withOpacity(kSecondaryOpacity),
      child: Center(
        child: Container(
          padding: kContentPadding,
          decoration: UIDecorations.circularDecoration(
            context,
            color: context.colorScheme.primary,
          ),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Text(
              _countdown.toString(),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
