import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trivico/domain/category.dart';
import 'package:trivico/utils/constants.dart';
import 'package:trivico/utils/extensions.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    super.key,
  });

  final TriviaCategory category;

  @override
  Widget build(BuildContext context) {
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
  }
}
