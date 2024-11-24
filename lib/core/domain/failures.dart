import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.networkError([String? message]) = NetworkFailure;
  const factory Failure.serverError([String? message]) = ServerFailure;
  const factory Failure.unexpectedError([String? message]) = UnexpectedFailure;
  const factory Failure.validationError([String? message]) = ValidationFailure;
  const factory Failure.notFoundError([String? message]) = NotFoundFailure;
}

extension FailureMessage on Failure {
  String get message => when(
        networkError: (message) => message ?? 'Network error occurred',
        serverError: (message) => message ?? 'Server error occurred',
        unexpectedError: (message) => message ?? 'Unexpected error occurred',
        validationError: (message) => message ?? 'Validation error occurred',
        notFoundError: (message) => message ?? 'Resource not found',
      );
}
