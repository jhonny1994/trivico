import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  NavigatorState get navigator => Navigator.of(this);

  void showCustomSnackBar(String message) {
    if (!mounted) return;
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  void displayDialog(Widget dialog) {
    if (!mounted) return;
    showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  int calculatePercent(int value, int percent) {
    return (value * 100) ~/ percent;
  }
}
