import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/application/application.dart';
import 'package:trivico/core/domain/domain.dart';
import 'package:trivico/core/providers/providers.dart';

final categoriesStateProvider =
    StateNotifierProvider<CategoriesNotifier, DataState<List<Category>>>((ref) {
  return CategoriesNotifier(ref.watch(triviaApiProvider));
});
