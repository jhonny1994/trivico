import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:trivico/core/domain/config.dart';
import 'package:trivico/core/domain/question.dart';
import 'package:trivico/core/providers/trivia_api_service_provider.dart';

final questionsProvider = FutureProvider.family<Either<String, List<Question>>, GameConfig>((ref, config) async {
  final questions = await ref.watch(triviaApiProvider).getQuestions(config);
  return questions;
});
