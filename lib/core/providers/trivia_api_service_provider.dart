import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/application/trivia_api_service.dart';
import 'package:trivico/core/providers/dio_provider.dart';
import 'package:trivico/core/providers/html_unescape_provider.dart';

final triviaApiProvider = Provider<TriviaApiService>((ref) {
  final dio = ref.read(dioProvider);
  final htmlUnescape = ref.read(htmlUnescapeProvider);
  return TriviaApiService(dio, htmlUnescape);
});
