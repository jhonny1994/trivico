import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:trivico/core/domain/category.dart';
import 'package:trivico/core/providers/trivia_api_service_provider.dart';

final categoriesProvider = FutureProvider<Either<String, List<Category>>>((ref) async {
  return ref.watch(triviaApiProvider).getCategories();
});
