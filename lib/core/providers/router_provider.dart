import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivico/core/core.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final isBoarded = ref.watch(onboardingNotifierProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            isBoarded ? const CategoriesScreen() : const OnboardingScreen(),
      ),
      GoRoute(
        path: '/categories',
        name: 'categories',
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(
        path: '/difficulty',
        name: 'difficulty',
        builder: (context, state) => DifficultyScreen(
          category: state.extra! as Category,
        ),
      ),
      GoRoute(
        path: '/game',
        name: 'game',
        builder: (context, state) {
          final args = state.extra! as Map<String, dynamic>;
          return GameScreen(
            categoryId: args['categoryId'] as int,
            difficulty: args['difficulty'] as String,
          );
        },
      ),
      GoRoute(
        path: '/result',
        name: 'result',
        builder: (context, state) {
          final args = state.extra! as Map<String, dynamic>;
          return ResultScreen(
            correctAnswersCount: args['correctAnswersCount'] as int,
            questionsCount: args['questionsCount'] as int,
          );
        },
      ),
    ],
  );
});
