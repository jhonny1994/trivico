import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

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
}
