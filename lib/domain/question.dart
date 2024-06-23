// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Result with _$Result {
  const factory Result({
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'difficulty') required String difficulty,
    @JsonKey(name: 'category') required String category,
    @JsonKey(name: 'question') required String question,
    @JsonKey(name: 'correct_answer') required String correctAnswer,
    @JsonKey(name: 'incorrect_answers') required List<String> incorrectAnswers,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
