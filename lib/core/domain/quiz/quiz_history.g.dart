// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuizHistoryImpl _$$QuizHistoryImplFromJson(Map<String, dynamic> json) =>
    _$QuizHistoryImpl(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      score: (json['score'] as num).toInt(),
      totalQuestions: (json['totalQuestions'] as num).toInt(),
      difficulty: $enumDecode(_$TriviaDifficultyEnumMap, json['difficulty']),
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuizHistoryImplToJson(_$QuizHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'score': instance.score,
      'totalQuestions': instance.totalQuestions,
      'difficulty': _$TriviaDifficultyEnumMap[instance.difficulty]!,
      'category': instance.category,
      'questions': instance.questions,
    };

const _$TriviaDifficultyEnumMap = {
  TriviaDifficulty.easy: 'easy',
  TriviaDifficulty.medium: 'medium',
  TriviaDifficulty.hard: 'hard',
};
