import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';
import 'package:trivico/core/utils/utils.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        contentType: 'application/json',
      ),
    );

    // Add interceptors
    dio.interceptors.addAll([
      _createLoggingInterceptor(),
      _createRetryInterceptor(dio),
    ]);

    return dio;
  }

  static Interceptor _createLoggingInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint('🌐 REQUEST[${options.method}] => PATH: ${options.path}');
        debugPrint('Parameters: ${options.queryParameters}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint(
          '✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
        );
        return handler.next(response);
      },
      onError: (error, handler) {
        debugPrint(
          '❌ ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}',
        );
        debugPrint('Error Message: ${error.message}');
        return handler.next(error);
      },
    );
  }

  static Interceptor _createRetryInterceptor(Dio dio) {
    return RetryInterceptor(
      dio: dio,
      logPrint: print,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 2),
        Duration(seconds: 3),
      ],
      retryableExtraStatuses: {status403Forbidden},
    );
  }
}
