import 'package:flutter/material.dart';
import 'package:trivico/domain/category.dart';
import 'package:trivico/utils/constants.dart';
import 'package:trivico/utils/extensions.dart';
import 'package:trivico/widgets/category_card.dart';
import 'package:trivico/widgets/difficulty_card.dart';

class DifficultyScreen extends StatelessWidget {
  const DifficultyScreen({
    required this.category,
    super.key,
  });
  final TriviaCategory category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose a difficulty',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          children: [
            SizedBox(
              height: context.width * 0.33,
              width: context.width * 0.66,
              child: CategoryCard(category: category),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: TriviaDifficulty.values
                      .map(
                        (e) => InkWell(
                          onTap: () {},
                          child: DifficultyCard(difficulty: e.name),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
