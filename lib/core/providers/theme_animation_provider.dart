import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/application/application.dart';
import 'package:trivico/core/domain/theme_animation_state.dart';

final themeAnimationProvider =
    StateNotifierProvider<ThemeAnimationNotifier, ThemeAnimationState>((ref) {
  return ThemeAnimationNotifier();
});
