import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/presentation/presentation.dart';
import 'package:trivico/core/providers/providers.dart';
import 'package:trivico/core/utils/utils.dart';
import 'package:trivico/core/widgets/widgets.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose a category',
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
        child: categories.when(
          data: (data) => data.fold(
            (message) => Text(message),
            (categories) => GridView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories.elementAt(index);
                return InkWell(
                  onTap: () => context.navigator.push(
                    MaterialPageRoute(
                      builder: (context) =>
                          DifficultyScreen(category: category),
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
          error: (error, stackTrace) =>
              FailureWidget(message: error.toString()),
          loading: () => const LoadingWidget(),
        ),
      ),
    );
  }
}
