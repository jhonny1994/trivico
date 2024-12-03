import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/domain/theme/theme_animation_state.dart';
import 'package:trivico/core/utils/animation_constants.dart';

class ThemeAnimationNotifier extends StateNotifier<ThemeAnimationState> {
  ThemeAnimationNotifier() : super(ThemeAnimationState.initial());

  Future<void> animate({required bool isDarkMode}) async {
    if (state.isAnimating) return;

    state = state.copyWith(isAnimating: true);

    // Start rotation animation
    for (var i = 0.0;
        i <= AnimationConstants.rotationDegrees;
        i += AnimationConstants.rotationStep) {
      if (!mounted) return;
      state = state.copyWith(rotationValue: i);
      await Future.delayed(
        Duration(
          milliseconds: AnimationConstants.themeSwitchDuration.inMilliseconds ~/
              AnimationConstants.rotationSteps,
        ),
      );
    }

    // Fade out
    state = state.copyWith(opacityValue: AnimationConstants.fadeOutOpacity);
    await Future.delayed(
      Duration(
        milliseconds: AnimationConstants.themeSwitchDuration.inMilliseconds ~/
            AnimationConstants.fadeSteps,
      ),
    );

    // Fade in
    state = state.copyWith(opacityValue: AnimationConstants.fadeInOpacity);

    // Reset rotation and animation state
    state = state.copyWith(
      rotationValue: 0,
      isAnimating: false,
    );
  }
}
