import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trivico/core/domain/domain.dart';
import 'package:trivico/core/utils/utils.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required this.category,
    super.key,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor:
          context.colorScheme.primary.withValues(alpha: kSecondaryOpacity),
      child: Container(
        decoration: UIDecorations.primaryCardDecoration(context),
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: kSmallPadding,
                  decoration: UIDecorations.circularDecoration(context),
                  child: Image.asset(
                    'assets/png/${category.name}.png',
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.category_rounded,
                      color: context.colorScheme.primary,
                      size: 32,
                    ),
                  ),
                ),
              ),
              const Gap(12),
              Expanded(
                child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
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
