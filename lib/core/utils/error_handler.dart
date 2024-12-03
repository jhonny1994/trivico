import 'dart:io';

import 'package:dio/dio.dart';
import 'package:trivico/core/domain/failures.dart';

class TrivicoException implements Exception {
  const TrivicoException([this.message]);
  final String? message;

  @override
  String toString() => message ?? 'Unknown error';
}

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
      case DioExceptionType.badCertificate:
        return const Failure.networkError('Bad certificate');
      case DioExceptionType.cancel:
        return const Failure.networkError('Request cancelled');
      case DioExceptionType.unknown:
        return Failure.unexpectedError(error.message.toString());
    }
  }

  static Failure _handleBadResponse(int? statusCode) {
    if (statusCode == null) {
      return const Failure.unexpectedError('Invalid response');
    }

    if (statusCode == 400) {
      return const Failure.validationError('Invalid request');
    } else if (statusCode == 401) {
      return const Failure.serverError('Unauthorized');
    } else if (statusCode == 403) {
      return const Failure.serverError('Access denied');
    } else if (statusCode == 404) {
      return const Failure.notFoundError('Resource not found');
    } else if (statusCode == 500) {
      return const Failure.serverError('Internal server error');
    } else if (statusCode < 500) {
      return const Failure.validationError('Client error');
    } else {
      return const Failure.serverError('Server error');
    }
  }

  /// Utility method to wrap async operations with error handling
  static Future<T> guard<T>(Future<T> Function() task) async {
    try {
      return await task();
    } catch (e) {
      final failure = handleException(e);
      throw TrivicoException(failure.message);
    }
  }
}
