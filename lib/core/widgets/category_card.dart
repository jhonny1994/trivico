import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trivico/core/domain/category.dart';
import 'package:trivico/core/utils/constants.dart';
import 'package:trivico/core/utils/extensions.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    super.key,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: kDefaultPadding,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/${category.name}.png',
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.category,
                    color: context.primaryColor,
                  ),
                ),
              ),
              const Gap(8),
              Expanded(
                child: Center(
                  child: Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
