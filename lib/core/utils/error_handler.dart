import 'dart:io';

import 'package:dio/dio.dart';
import 'package:trivico/core/domain/failures.dart';

class ErrorHandler {
  static Failure handleException(Object error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else if (error is SocketException) {
      return const Failure.networkError('No internet connection');
    } else if (error is FormatException) {
      return const Failure.unexpectedError('Invalid data format');
    } else {
      return Failure.unexpectedError(error.toString());
    }
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const Failure.networkError('Connection timeout');
      case DioExceptionType.connectionError:
        return const Failure.networkError('No internet connection');
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response?.statusCode);
      default:
        return Failure.unexpectedError(error.message);
    }
  }

  static Failure _handleBadResponse(int? statusCode) {
    switch (statusCode) {
      case 400:
        return const Failure.validationError('Invalid request');
      case 401:
        return const Failure.serverError('Unauthorized');
      case 403:
        return const Failure.serverError('Access denied');
      case 404:
        return const Failure.notFoundError('Resource not found');
      case 500:
        return const Failure.serverError('Internal server error');
      default:
        return const Failure.unexpectedError('Something went wrong');
    }
  }

  /// Utility method to wrap async operations with error handling
  static Future<T> guard<T>(Future<T> Function() task) async {
    try {
      return await task();
    } catch (e) {
      throw handleException(e);
    }
  }
}
