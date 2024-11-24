import 'package:flutter/material.dart';
import 'package:trivico/core/utils/utils.dart';

class DifficultyCard extends StatelessWidget {
  const DifficultyCard({
    required this.difficulty,
    super.key,
  });

  final String difficulty;

  Color _getDifficultyColor(BuildContext context) {
    final difficultyEnum = TriviaDifficulty.values.firstWhere(
      (e) => e.name == difficulty.toLowerCase(),
      orElse: () => TriviaDifficulty.easy,
    );

    switch (difficultyEnum) {
      case TriviaDifficulty.easy:
        return Colors.green;
      case TriviaDifficulty.medium:
        return context.colorScheme.secondary;
      case TriviaDifficulty.hard:
        return context.colorScheme.error;
    }
  }

  IconData _getDifficultyIcon() {
    final difficultyEnum = TriviaDifficulty.values.firstWhere(
      (e) => e.name == difficulty.toLowerCase(),
      orElse: () => TriviaDifficulty.easy,
    );

    switch (difficultyEnum) {
      case TriviaDifficulty.easy:
        return Icons.sentiment_satisfied_rounded;
      case TriviaDifficulty.medium:
        return Icons.sentiment_neutral_rounded;
      case TriviaDifficulty.hard:
        return Icons.sentiment_dissatisfied_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final difficultyColor = _getDifficultyColor(context);

    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              difficultyColor.withOpacity(0.1),
              difficultyColor.withOpacity(0.05),
            ],
          ),
        ),
        child: Padding(
          padding: kDefaultPadding * 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getDifficultyIcon(),
                color: difficultyColor,
              ),
              const SizedBox(width: 12),
              Text(
                difficulty.toUpperCase(),
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: difficultyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
