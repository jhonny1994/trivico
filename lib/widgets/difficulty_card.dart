import 'package:flutter/material.dart';
import 'package:trivico/utils/constants.dart';

class DifficultyCard extends StatelessWidget {
  const DifficultyCard({
    required this.difficulty,
    super.key,
  });

  final String difficulty;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: kDefaultPadding * 2,
        child: Center(
          child: Text(
            difficulty,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
