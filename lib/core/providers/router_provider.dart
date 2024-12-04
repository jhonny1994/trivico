import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trivico/core/core.dart';
import 'package:trivico/core/presentation/history_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final isBoarded = ref.watch(onboardingNotifierProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => FadeTransitionPage(
          child:
              isBoarded ? const CategoriesScreen() : const OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: '/categories',
        name: 'categories',
        pageBuilder: (context, state) => const FadeTransitionPage(
          child: CategoriesScreen(),
        ),
      ),
      GoRoute(
        path: '/difficulty',
        name: 'difficulty',
        pageBuilder: (context, state) => FadeTransitionPage(
          child: DifficultyScreen(
            category: state.extra! as Category,
          ),
        ),
      ),
      GoRoute(
        path: '/game',
        name: 'game',
        pageBuilder: (context, state) {
          final args = state.extra! as Map<String, dynamic>;
          return FadeTransitionPage(
            child: GameScreen(
              categoryId: args['categoryId'] as int,
              difficulty: args['difficulty'] as String,
            ),
          );
        },
      ),
      GoRoute(
        path: '/result',
        name: 'result',
        pageBuilder: (context, state) {
          final args = state.extra! as Map<String, dynamic>;
          return FadeTransitionPage(
            child: ResultScreen(
              correctAnswersCount: args['correctAnswersCount'] as int,
              questionsCount: args['questionsCount'] as int,
              category: args['category'] as Category,
              difficulty: args['difficulty'] as TriviaDifficulty,
              questions: (args['questions'] as List<dynamic>).cast<Map<String, dynamic>>(),
            ),
          );
        },
      ),
      GoRoute(
        path: '/history',
        name: 'history',
        pageBuilder: (context, state) => const FadeTransitionPage(
          child: HistoryScreen(),
        ),
      ),
    ],
  );
});
