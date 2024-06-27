import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivico/core/presentation/categories_screen.dart';
import 'package:trivico/core/presentation/onboarding_screen.dart';
import 'package:trivico/core/providers/onboarding_notifier_provider.dart';
import 'package:trivico/core/providers/shared_prefrences_provider.dart';
import 'package:trivico/core/providers/theme_notifier_provider.dart';
import 'package:trivico/core/utils/theme.dart';
import 'package:trivico/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kReleaseMode) {
    const fatalError = true;
    // Non-async exceptions
    FlutterError.onError = (errorDetails) {
      if (fatalError) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
        // ignore: dead_code
      } else {
        FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      }
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      if (fatalError) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        // ignore: dead_code
      } else {
        FirebaseCrashlytics.instance.recordError(error, stack);
      }
      return true;
    };
  }
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
