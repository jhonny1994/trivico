import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:trivico/core/providers/providers.dart';
import 'package:trivico/core/utils/utils.dart';

class AnimatedThemeToggle extends ConsumerWidget {
  const AnimatedThemeToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider);
    final animationState = ref.watch(themeAnimationProvider);

    return Row(
      children: [
        GestureDetector(
          onTap: () async {
            await ref
                .read(themeAnimationProvider.notifier)
                .animate(isDarkMode: isDarkMode);
            await ref.read(themeNotifierProvider.notifier).toggle();
          },
          child: AnimatedOpacity(
            opacity: animationState.opacityValue,
            duration: AnimationConstants.themeSwitchDuration,
            child: Transform.rotate(
              angle: animationState.rotationValue * (math.pi / 180),
              child: Icon(
                isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ),
        const Gap(8),
      ],
    );
  }
}
