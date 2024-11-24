import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivico/core/domain/domain.dart';

part 'states.freezed.dart';

@freezed
class DataState<T> with _$DataState<T> {
  const factory DataState.initial() = _Initial;
  const factory DataState.loading() = _Loading;
  const factory DataState.success(T data) = _Success<T>;
  const factory DataState.error(Failure failure) = _Error;
}

extension DataStateX<T> on DataState<T> {
  bool get isLoading => maybeWhen(
        loading: () => true,
        orElse: () => false,
      );

  bool get isSuccess => maybeWhen(
        success: (_) => true,
        orElse: () => false,
      );

  T? get data => maybeWhen(
        success: (data) => data,
        orElse: () => null,
      );

  Failure? get error => maybeWhen(
        error: (failure) => failure,
        orElse: () => null,
      );
}
