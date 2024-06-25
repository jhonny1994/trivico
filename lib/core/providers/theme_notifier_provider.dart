import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/application/theme_state_notifier.dart';
import 'package:trivico/core/providers/shared_prefrences_provider.dart';

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, bool>(
  (ref) => ThemeNotifier(ref.read(sharedPreferencesProvider)),
);
