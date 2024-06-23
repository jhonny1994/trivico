import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivico/domain/category.dart';
part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  const factory GameState.failure(String message) = _Failure;

  const factory GameState.initial() = _Initial;

  const factory GameState.loading() = _Loading;

  const factory GameState.result() = _Result;

  const factory GameState.start(TriviaCategories categories) = _Start;
}
