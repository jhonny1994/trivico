import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/application/application.dart';
import 'package:trivico/core/domain/domain.dart';

class CategoriesNotifier extends StateNotifier<DataState<List<Category>>> {
  CategoriesNotifier(this._apiService) : super(const DataState.initial());
  final TriviaApiService _apiService;

  Future<void> getCategories() async {
    state = const DataState.loading();
    final result = await _apiService.getCategories();
    state = result.fold(
      (failure) => DataState.error(failure),
      (categories) => DataState.success(categories),
    );
  }
}
