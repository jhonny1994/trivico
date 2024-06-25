import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:html_unescape/html_unescape_small.dart';
import 'package:trivico/core/domain/category.dart';
import 'package:trivico/core/domain/config.dart';
import 'package:trivico/core/domain/question.dart';
import 'package:trivico/core/utils/constants.dart';

class TriviaApiService {
  TriviaApiService(
    this.dio,
    this.htmlUnescape,
  );

  final Dio dio;
  final HtmlUnescape htmlUnescape;

  Future<Either<String, List<Category>>> getCategories() async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${baseUrl}api_category.php',
      );
      if (response.statusCode == 200 && response.data != null) {
        final categories = (response.data!['trivia_categories'] as List<dynamic>)
            .map(
              (e) => Category.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        return right(categories);
      } else {
        return left('An error occurred');
      }
    } on DioException catch (e) {
      return left(e.message ?? 'An error occurred');
    }
  }

  Future<Either<String, List<Question>>> getQuestions(GameConfig config) async {
    try {
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
              (e) => Question.fromJson(
                e as Map<String, dynamic>,
                htmlUnescape,
              ),
            )
            .toList();
        return right(questions);
      } else {
        return left('An error occurred');
      }
    } on DioException catch (e) {
      return left(e.message ?? 'An error occurred');
    }
  }
}
