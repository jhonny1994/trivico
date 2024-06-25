import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingNotifier extends StateNotifier<bool> {
  OnboardingNotifier(this.prefs) : super(false) {
    _init();
  }
  final SharedPreferences prefs;

  Future<void> _init() async {
    final boarded = prefs.getBool('boarded');
    state = boarded ?? false;
  }

  Future<void> toggle() async {
    state = !state;
    await prefs.setBool('boarded', state);
  }
}
