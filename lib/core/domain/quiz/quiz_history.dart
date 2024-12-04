import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivico/core/domain/domain.dart';
import 'package:trivico/core/utils/utils.dart';

part 'quiz_history.freezed.dart';
part 'quiz_history.g.dart';

/// Model representing a completed quiz history entry
@freezed
class QuizHistory with _$QuizHistory {
  const factory QuizHistory({
    /// Unique identifier for the quiz attempt
    required String id,

    /// When the quiz was taken
    required DateTime timestamp,

    /// Number of correct answers
    required int score,

    /// Total number of questions in the quiz
    required int totalQuestions,

    /// Difficulty level of the quiz
    required TriviaDifficulty difficulty,

    /// Category of the quiz
    required Category category,

    /// Optional list of questions for detailed review
    List<Question>? questions,
  }) = _QuizHistory;

  /// Creates a QuizHistory instance from JSON map
  factory QuizHistory.fromJson(Map<String, dynamic> json) =>
      _$QuizHistoryFromJson(json);
}
