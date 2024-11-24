import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivico/core/application/application.dart';

final dioProvider = Provider<Dio>((ref) {
  return DioClient.createDio();
});
