import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:html_unescape/html_unescape_small.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivico/core/domain/domain.dart';
import 'package:trivico/core/utils/utils.dart';

class TriviaApiService {
  TriviaApiService(
    this.dio,
    this.htmlUnescape,
    this.prefs,
  );
  final Dio dio;
  final HtmlUnescape htmlUnescape;
  final SharedPreferences prefs;

  static const _categoriesCacheKey = 'categories_cache';
  static const _cacheExpiration = Duration(hours: 24);
  static const _maxRetries = 3;

  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      // Try to get from cache first
      final cachedData = prefs.getString(_categoriesCacheKey);
      if (cachedData != null) {
        final cacheTime = prefs.getInt('${_categoriesCacheKey}_time') ?? 0;
        if (DateTime.now().millisecondsSinceEpoch - cacheTime <
            _cacheExpiration.inMilliseconds) {
          final decodedData = jsonDecode(cachedData) as Map<String, dynamic>;
          final categories = (decodedData['trivia_categories'] as List<dynamic>)
              .map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList();
          return right(categories);
        }
      }

      // If not in cache or expired, fetch from API with retry
      return _retryOperation(() async {
        final response = await dio.get<Map<String, dynamic>>(
          '${baseUrl}api_category.php',
        );
        if (response.statusCode == 200 && response.data != null) {
          // Cache the response
          await prefs.setString(_categoriesCacheKey, jsonEncode(response.data));
          await prefs.setInt(
            '${_categoriesCacheKey}_time',
            DateTime.now().millisecondsSinceEpoch,
          );

          final categories =
              (response.data!['trivia_categories'] as List<dynamic>)
                  .map((e) => Category.fromJson(e as Map<String, dynamic>))
                  .toList();
          return right(categories);
        } else {
          return left(const Failure.serverError('An error occurred'));
        }
      });
    } on DioException catch (e) {
      return left(ErrorHandler.handleException(e));
    } catch (e) {
      return left(ErrorHandler.handleException(e));
    }
  }

  Future<Either<Failure, List<Question>>> getQuestions(
    GameConfig config,
  ) async {
    try {
      return _retryOperation(() async {
        final response = await dio.get<Map<String, dynamic>>(
          '${baseUrl}api.php',
          queryParameters: {
            'amount': config.amount,
            'category': config.category,
            'difficulty': config.difficulty,
            'type': config.type,
          },
        );
        if (response.statusCode == 200 && response.data != null) {
          final questions = (response.data!['results'] as List<dynamic>)
              .map(
                (e) => Question.withHtmlUnescape(e as Map<String, dynamic>),
              )
              .toList();
          return right(questions);
        } else {
          return left(const Failure.serverError('An error occurred'));
        }
      });
    } on DioException catch (e) {
      return left(ErrorHandler.handleException(e));
    } catch (e) {
      return left(ErrorHandler.handleException(e));
    }
  }

  Future<Either<Failure, T>> _retryOperation<T>(
    Future<Either<Failure, T>> Function() operation,
  ) async {
    var retries = 0;
    while (retries < _maxRetries) {
      try {
        final result = await operation();
        return result;
      } catch (e) {
        retries++;
        if (retries == _maxRetries) {
          return left(ErrorHandler.handleException(e));
        }
        await Future.delayed(Duration(seconds: retries)); // Exponential backoff
      }
    }
    return left(const Failure.serverError('Max retries exceeded'));
  }
}
