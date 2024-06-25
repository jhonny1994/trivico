import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivico/core/presentation/categories_screen.dart';
import 'package:trivico/core/presentation/onboarding_screen.dart';
import 'package:trivico/core/providers/onboarding_notifier_provider.dart';
import 'package:trivico/core/providers/shared_prefrences_provider.dart';
import 'package:trivico/core/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: DevicePreview(
        builder: (context) => const Trivico(),
      ),
    ),
  );
}

class Trivico extends ConsumerWidget {
  const Trivico({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBoarded = ref.watch(onboardingNotifierProvider);

    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: light,
        darkTheme: dark,
        home: isBoarded ? const CategoriesScreen() : const OnboardingScreen(),
      ),
    );
  }
}
