import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivico/core/providers/providers.dart';
import 'package:trivico/core/utils/utils.dart';
import 'package:trivico/core/widgets/widgets.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(categoriesStateProvider.notifier).getCategories(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoriesState = ref.watch(categoriesStateProvider);
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
        child: categoriesState.when(
          initial: () => const LoadingWidget(),
          loading: () => const LoadingWidget(),
          error: (failure) => FailureWidget(
            failure: failure,
            onRetry: () =>
                ref.read(categoriesStateProvider.notifier).getCategories(),
          ),
          success: (categories) => GridView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories.elementAt(index);
              return InkWell(
                onTap: () => context.pushNamed('difficulty', extra: category),
                child: CategoryCard(category: category),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
