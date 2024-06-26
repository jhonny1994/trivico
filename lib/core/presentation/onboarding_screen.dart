import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trivico/core/providers/onboarding_notifier_provider.dart';
import 'package:trivico/core/providers/theme_notifier_provider.dart';
import 'package:trivico/core/utils/constants.dart';
import 'package:trivico/core/utils/extensions.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => ref.read(themeNotifierProvider.notifier).toggle(),
            icon: const Icon(
              Icons.brightness_6,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          children: [
            const Spacer(flex: 3),
            ClipOval(
              child: Container(
                height: context.width - kDefaultPadding.horizontal,
                width: context.width - kDefaultPadding.horizontal,
                color: Colors.white,
                child: SvgPicture.asset('assets/question.svg'),
              ),
            ),
            const Spacer(),
            Text(
              'Embark on the ultimate quiz adventure!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(),
            IconButton(
              onPressed: () => ref.read(onboardingNotifierProvider.notifier).toggle(),
              iconSize: 56,
              padding: EdgeInsets.zero,
              icon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Icon(Icons.keyboard_arrow_right),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
