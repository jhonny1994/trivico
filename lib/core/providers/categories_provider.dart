import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:trivico/core/domain/domain.dart';
import 'package:trivico/core/providers/providers.dart';

final categoriesProvider = FutureProvider<Either<String, List<Category>>>((ref) async {
  return ref.watch(triviaApiProvider).getCategories();
});
