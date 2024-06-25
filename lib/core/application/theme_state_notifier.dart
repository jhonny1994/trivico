import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier(this.prefs) : super(false) {
    _init();
  }
  final SharedPreferences prefs;

  Future<void> _init() async {
    final darkMode = prefs.getBool('darkMode');
    state = darkMode ?? false;
  }

  Future<void> toggle() async {
    state = !state;
    await prefs.setBool('darkMode', state);
  }
}
