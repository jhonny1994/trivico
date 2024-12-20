import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/application/application.dart';
import 'package:trivico/core/domain/domain.dart';

class QuestionsNotifier extends StateNotifier<DataState<List<Question>>> {
  QuestionsNotifier(this._apiService) : super(const DataState.initial());

  final TriviaApiService _apiService;

  Future<void> getQuestions(GameConfig config) async {
    state = const DataState.loading();
    final result = await _apiService.getQuestions(config);
    state = result.fold(
      (failure) => DataState.error(failure),
      (questions) => DataState.success(questions),
    );
  }

  void selectAnswer(int questionIndex, String answer) {
    state.whenOrNull(
      success: (questions) {
        if (questions[questionIndex].selectedAnswer != null) return;
        final updatedQuestions = List<Question>.from(questions);
        updatedQuestions[questionIndex] = questions[questionIndex].copyWith(
          selectedAnswer: answer,
        );
        state = DataState.success(updatedQuestions);
      },
    );
  }
}
