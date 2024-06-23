import 'package:flutter/material.dart';
import 'package:trivico/domain/category.dart';
import 'package:trivico/presentation/difficulty_screen.dart';
import 'package:trivico/utils/constants.dart';
import 'package:trivico/utils/extensions.dart';
import 'package:trivico/widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose a category',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: kDefaultPadding,
        child: GridView.builder(
          itemCount: TriviaCategories.fromJson(categoris).triviaCategories.length,
          itemBuilder: (context, index) {
            final category = TriviaCategories.fromJson(categoris).triviaCategories.elementAt(index);
            return InkWell(
              onTap: () => context.navigator.push(
                MaterialPageRoute(
                  builder: (context) => DifficultyScreen(category: category),
                ),
              ),
              child: CategoryCard(category: category),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
          ),
        ),
      ),
    );
  }
}
