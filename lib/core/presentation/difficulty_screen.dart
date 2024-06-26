import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/domain/category.dart';
import 'package:trivico/core/presentation/game_screen.dart';
import 'package:trivico/core/providers/theme_notifier_provider.dart';
import 'package:trivico/core/utils/constants.dart';
import 'package:trivico/core/utils/extensions.dart';
import 'package:trivico/core/widgets/category_card.dart';
import 'package:trivico/core/widgets/difficulty_card.dart';

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
        actions: [
          IconButton(
            onPressed: () => ref.read(themeNotifierProvider.notifier).toggle(),
            icon: const Icon(
              Icons.brightness_6,
            ),
          ),
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
                      (e) => InkWell(
                        onTap: () => context.navigator.push(
                          MaterialPageRoute(
                            builder: (context) => GameScreen(
                              categoryId: widget.category.id,
                              difficulty: e.name,
                            ),
                          ),
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
