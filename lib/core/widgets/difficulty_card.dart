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
      elevation: 2,
      shadowColor: difficultyColor.withOpacity(kSecondaryOpacity),
      child: Container(
        decoration: UIDecorations.primaryCardDecoration(
          context,
          color: difficultyColor,
        ),
        child: Padding(
          padding: kDefaultPadding,
          child: Row(
            children: [
              Container(
                padding: kContentPadding,
                decoration: UIDecorations.circularDecoration(
                  context,
                  color: difficultyColor,
                ),
                child: Icon(
                  _getDifficultyIcon(),
                  size: 32,
                  color: difficultyColor,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                difficulty,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: difficultyColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
