import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:trivico/core/domain/domain.dart';
import 'package:trivico/core/providers/providers.dart';

final questionsProvider = FutureProvider.family<Either<String, List<Question>>, GameConfig>((ref, config) async {
  final questions = await ref.watch(triviaApiProvider).getQuestions(config);
  return questions;
});
