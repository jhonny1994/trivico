import 'package:flutter/material.dart';

class FadeTransitionPage<T> extends Page<T> {
  const FadeTransitionPage({
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    super.key,
  });
  final Widget child;
  final Duration duration;

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
