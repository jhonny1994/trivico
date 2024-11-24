import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/application/application.dart';
import 'package:trivico/core/providers/providers.dart';

final triviaApiProvider = Provider<TriviaApiService>((ref) {
  final dio = ref.read(dioProvider);
  final htmlUnescape = ref.read(htmlUnescapeProvider);
  final prefs = ref.read(sharedPreferencesProvider);
  return TriviaApiService(dio, htmlUnescape, prefs);
});
