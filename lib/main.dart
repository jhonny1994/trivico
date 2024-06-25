import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivico/core/presentation/categories_screen.dart';
import 'package:trivico/core/presentation/onboarding_screen.dart';
import 'package:trivico/core/providers/onboarding_notifier_provider.dart';
import 'package:trivico/core/providers/shared_prefrences_provider.dart';
import 'package:trivico/core/providers/theme_notifier_provider.dart';
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
        enabled: Platform.isWindows,
        builder: (context) => const Trivico(),
      ),
    ),
  );
}

class Trivico extends ConsumerWidget {
  const Trivico({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ThemedApp();
  }
}

class ThemedApp extends ConsumerWidget {
  const ThemedApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider);
    final isBoarded = ref.watch(onboardingNotifierProvider);

    SystemChrome.setSystemUIOverlayStyle(
      !isDarkMode
          ? SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
            )
          : SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
            ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: isBoarded ? const CategoriesScreen() : const OnboardingScreen(),
    );
  }
}
