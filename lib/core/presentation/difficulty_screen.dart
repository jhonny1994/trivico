import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivico/core/domain/domain.dart';
import 'package:trivico/core/utils/utils.dart';
import 'package:trivico/core/widgets/widgets.dart';

class DifficultyScreen extends ConsumerStatefulWidget {
  const DifficultyScreen({
    required this.category,
    super.key,
  });
  final Category category;
  @override
  ConsumerState<DifficultyScreen> createState() => _DifficultyScreenState();
}

class _DifficultyScreenState extends ConsumerState<DifficultyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose a difficulty',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: const [
          AnimatedThemeToggle(),
        ],
      ),
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          children: [
            const Spacer(),
            SizedBox(
              height: context.width * 0.33,
              width: context.width,
              child: CategoryCard(category: widget.category),
            ),
            const Spacer(),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: TriviaDifficulty.values
                    .map(
                      (e) => AnimatedScaleTap(
                        onTap: () => context.pushNamed(
                          'game',
                          extra: {
                            'categoryId': widget.category.id,
                            'difficulty': e.name,
                          },
                        ),
                        child: DifficultyCard(difficulty: e.name),
                      ),
                    )
                    .toList(),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
