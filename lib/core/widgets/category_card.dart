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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.colorScheme.primary.withOpacity(0.1),
              context.colorScheme.primary.withOpacity(0.05),
            ],
          ),
        ),
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colorScheme.primary.withOpacity(0.1),
                  ),
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
                child: Center(
                  child: Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.colorScheme.onSurface,
                    ),
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
