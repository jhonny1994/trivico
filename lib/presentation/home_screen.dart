import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trivico/domain/category.dart';
import 'package:trivico/utils/constants.dart';
import 'package:trivico/utils/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: kDefaultPadding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Choose a category',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Gap(8),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: TriviaCategories.fromJson(categoris).triviaCategories.length,
                  itemBuilder: (context, index) {
                    final category = TriviaCategories.fromJson(categoris).triviaCategories.elementAt(index);
                    return Card(
                      child: Padding(
                        padding: kDefaultPadding,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox.square(
                                dimension: context.height * 0.05,
                                child: Image.asset(
                                  'assets/${category.name}.png',
                                  errorBuilder: (context, error, stackTrace) => Icon(
                                    Icons.category,
                                    size: context.height * 0.05,
                                    color: context.primaryColor,
                                  ),
                                ),
                              ),
                              const Gap(8),
                              Text(
                                category.name,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
