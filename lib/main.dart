import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/presentation/categories_screen.dart';
import 'package:trivico/utils/theme.dart';

void main() {
  runApp(
    ProviderScope(
      child: DevicePreview(
        builder: (context) => const Trivico(),
      ),
    ),
  );
}

class Trivico extends StatelessWidget {
  const Trivico({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: AdaptiveThemeMode.system,
      debugShowFloatingThemeButton: true,
      builder: (light, dark) => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: light,
        darkTheme: dark,
        home: const CategoriesScreen(),
      ),
    );
  }
}
