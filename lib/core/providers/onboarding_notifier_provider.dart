import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/application/onboarding_notifier.dart';
import 'package:trivico/core/providers/shared_prefrences_provider.dart';

final onboardingNotifierProvider = StateNotifierProvider<OnboardingNotifier, bool>((ref) {
  return OnboardingNotifier(ref.read(sharedPreferencesProvider));
});
