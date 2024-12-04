// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuizHistory _$QuizHistoryFromJson(Map<String, dynamic> json) {
  return _QuizHistory.fromJson(json);
}

/// @nodoc
mixin _$QuizHistory {
  /// Unique identifier for the quiz attempt
  String get id => throw _privateConstructorUsedError;

  /// When the quiz was taken
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Number of correct answers
  int get score => throw _privateConstructorUsedError;

  /// Total number of questions in the quiz
  int get totalQuestions => throw _privateConstructorUsedError;

  /// Difficulty level of the quiz
  TriviaDifficulty get difficulty => throw _privateConstructorUsedError;

  /// Category of the quiz
  Category get category => throw _privateConstructorUsedError;

  /// Optional list of questions for detailed review
  List<Question>? get questions => throw _privateConstructorUsedError;

  /// Serializes this QuizHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizHistoryCopyWith<QuizHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizHistoryCopyWith<$Res> {
  factory $QuizHistoryCopyWith(
          QuizHistory value, $Res Function(QuizHistory) then) =
      _$QuizHistoryCopyWithImpl<$Res, QuizHistory>;
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      int score,
      int totalQuestions,
      TriviaDifficulty difficulty,
      Category category,
      List<Question>? questions});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$QuizHistoryCopyWithImpl<$Res, $Val extends QuizHistory>
    implements $QuizHistoryCopyWith<$Res> {
  _$QuizHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? score = null,
    Object? totalQuestions = null,
    Object? difficulty = null,
    Object? category = null,
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as TriviaDifficulty,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
    ) as $Val);
  }

  /// Create a copy of QuizHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuizHistoryImplCopyWith<$Res>
    implements $QuizHistoryCopyWith<$Res> {
  factory _$$QuizHistoryImplCopyWith(
          _$QuizHistoryImpl value, $Res Function(_$QuizHistoryImpl) then) =
      __$$QuizHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      int score,
      int totalQuestions,
      TriviaDifficulty difficulty,
      Category category,
      List<Question>? questions});

  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$QuizHistoryImplCopyWithImpl<$Res>
    extends _$QuizHistoryCopyWithImpl<$Res, _$QuizHistoryImpl>
    implements _$$QuizHistoryImplCopyWith<$Res> {
  __$$QuizHistoryImplCopyWithImpl(
      _$QuizHistoryImpl _value, $Res Function(_$QuizHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuizHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? score = null,
    Object? totalQuestions = null,
    Object? difficulty = null,
    Object? category = null,
    Object? questions = freezed,
  }) {
    return _then(_$QuizHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuestions: null == totalQuestions
          ? _value.totalQuestions
          : totalQuestions // ignore: cast_nullable_to_non_nullable
              as int,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as TriviaDifficulty,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      questions: freezed == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizHistoryImpl implements _QuizHistory {
  const _$QuizHistoryImpl(
      {required this.id,
      required this.timestamp,
      required this.score,
      required this.totalQuestions,
      required this.difficulty,
      required this.category,
      final List<Question>? questions})
      : _questions = questions;

  factory _$QuizHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizHistoryImplFromJson(json);

  /// Unique identifier for the quiz attempt
  @override
  final String id;

  /// When the quiz was taken
  @override
  final DateTime timestamp;

  /// Number of correct answers
  @override
  final int score;

  /// Total number of questions in the quiz
  @override
  final int totalQuestions;

  /// Difficulty level of the quiz
  @override
  final TriviaDifficulty difficulty;

  /// Category of the quiz
  @override
  final Category category;

  /// Optional list of questions for detailed review
  final List<Question>? _questions;

  /// Optional list of questions for detailed review
  @override
  List<Question>? get questions {
    final value = _questions;
    if (value == null) return null;
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QuizHistory(id: $id, timestamp: $timestamp, score: $score, totalQuestions: $totalQuestions, difficulty: $difficulty, category: $category, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      timestamp,
      score,
      totalQuestions,
      difficulty,
      category,
      const DeepCollectionEquality().hash(_questions));

  /// Create a copy of QuizHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizHistoryImplCopyWith<_$QuizHistoryImpl> get copyWith =>
      __$$QuizHistoryImplCopyWithImpl<_$QuizHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizHistoryImplToJson(
      this,
    );
  }
}

abstract class _QuizHistory implements QuizHistory {
  const factory _QuizHistory(
      {required final String id,
      required final DateTime timestamp,
      required final int score,
      required final int totalQuestions,
      required final TriviaDifficulty difficulty,
      required final Category category,
      final List<Question>? questions}) = _$QuizHistoryImpl;

  factory _QuizHistory.fromJson(Map<String, dynamic> json) =
      _$QuizHistoryImpl.fromJson;

  /// Unique identifier for the quiz attempt
  @override
  String get id;

  /// When the quiz was taken
  @override
  DateTime get timestamp;

  /// Number of correct answers
  @override
  int get score;

  /// Total number of questions in the quiz
  @override
  int get totalQuestions;

  /// Difficulty level of the quiz
  @override
  TriviaDifficulty get difficulty;

  /// Category of the quiz
  @override
  Category get category;

  /// Optional list of questions for detailed review
  @override
  List<Question>? get questions;

  /// Create a copy of QuizHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizHistoryImplCopyWith<_$QuizHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
