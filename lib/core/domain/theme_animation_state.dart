import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_animation_state.freezed.dart';

@freezed
class ThemeAnimationState with _$ThemeAnimationState {
  const factory ThemeAnimationState({
    required bool isAnimating,
    required double rotationValue,
    required double opacityValue,
  }) = _ThemeAnimationState;

  factory ThemeAnimationState.initial() => const ThemeAnimationState(
        isAnimating: false,
        rotationValue: 0,
        opacityValue: 1,
      );
}
