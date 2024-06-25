import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/application/trivia_api_service.dart';
import 'package:trivico/core/providers/dio_provider.dart';

final triviaApiProvider = Provider<TriviaApiService>((ref) {
  return TriviaApiService(ref.read(dioProvider));
});
