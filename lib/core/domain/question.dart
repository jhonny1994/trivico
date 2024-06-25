import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:html_unescape/html_unescape_small.dart';

part 'question.freezed.dart';

@freezed
class Question with _$Question {
  factory Question({
    required String question,
    required String correctAnswer,
    required List<String> incorrectAnswers,
    required List<String> allAnswers,
    String? selectedAnswer,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json, HtmlUnescape htmlUnescape) {
    final incorrectAnswers =
        (json['incorrect_answers'] as List<dynamic>).map((x) => htmlUnescape.convert(x as String)).toList();
    final allAnswers = [...incorrectAnswers, htmlUnescape.convert(json['correct_answer'] as String)]..shuffle();

    return Question(
      question: htmlUnescape.convert(json['question'] as String),
      correctAnswer: htmlUnescape.convert(json['correct_answer'] as String),
      incorrectAnswers: incorrectAnswers,
      allAnswers: allAnswers,
      selectedAnswer: json['selectedAnswer'] as String?,
    );
  }
}
