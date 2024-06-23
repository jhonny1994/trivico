// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TriviaCategories _$TriviaCategoriesFromJson(Map<String, dynamic> json) {
  return _TriviaCategories.fromJson(json);
}

/// @nodoc
mixin _$TriviaCategories {
  @JsonKey(name: 'trivia_categories')
  List<TriviaCategory> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TriviaCategoriesCopyWith<TriviaCategories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriviaCategoriesCopyWith<$Res> {
  factory $TriviaCategoriesCopyWith(
          TriviaCategories value, $Res Function(TriviaCategories) then) =
      _$TriviaCategoriesCopyWithImpl<$Res, TriviaCategories>;
  @useResult
  $Res call(
      {@JsonKey(name: 'trivia_categories') List<TriviaCategory> categories});
}

/// @nodoc
class _$TriviaCategoriesCopyWithImpl<$Res, $Val extends TriviaCategories>
    implements $TriviaCategoriesCopyWith<$Res> {
  _$TriviaCategoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TriviaCategory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TriviaCategoriesImplCopyWith<$Res>
    implements $TriviaCategoriesCopyWith<$Res> {
  factory _$$TriviaCategoriesImplCopyWith(_$TriviaCategoriesImpl value,
          $Res Function(_$TriviaCategoriesImpl) then) =
      __$$TriviaCategoriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'trivia_categories') List<TriviaCategory> categories});
}

/// @nodoc
class __$$TriviaCategoriesImplCopyWithImpl<$Res>
    extends _$TriviaCategoriesCopyWithImpl<$Res, _$TriviaCategoriesImpl>
    implements _$$TriviaCategoriesImplCopyWith<$Res> {
  __$$TriviaCategoriesImplCopyWithImpl(_$TriviaCategoriesImpl _value,
      $Res Function(_$TriviaCategoriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$TriviaCategoriesImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TriviaCategory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TriviaCategoriesImpl implements _TriviaCategories {
  const _$TriviaCategoriesImpl(
      {@JsonKey(name: 'trivia_categories')
      required final List<TriviaCategory> categories})
      : _categories = categories;

  factory _$TriviaCategoriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$TriviaCategoriesImplFromJson(json);

  final List<TriviaCategory> _categories;
  @override
  @JsonKey(name: 'trivia_categories')
  List<TriviaCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'TriviaCategories(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TriviaCategoriesImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TriviaCategoriesImplCopyWith<_$TriviaCategoriesImpl> get copyWith =>
      __$$TriviaCategoriesImplCopyWithImpl<_$TriviaCategoriesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TriviaCategoriesImplToJson(
      this,
    );
  }
}

abstract class _TriviaCategories implements TriviaCategories {
  const factory _TriviaCategories(
      {@JsonKey(name: 'trivia_categories')
      required final List<TriviaCategory> categories}) = _$TriviaCategoriesImpl;

  factory _TriviaCategories.fromJson(Map<String, dynamic> json) =
      _$TriviaCategoriesImpl.fromJson;

  @override
  @JsonKey(name: 'trivia_categories')
  List<TriviaCategory> get categories;
  @override
  @JsonKey(ignore: true)
  _$$TriviaCategoriesImplCopyWith<_$TriviaCategoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TriviaCategory _$TriviaCategoryFromJson(Map<String, dynamic> json) {
  return _TriviaCategory.fromJson(json);
}

/// @nodoc
mixin _$TriviaCategory {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', fromJson: nameFromJson)
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TriviaCategoryCopyWith<TriviaCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TriviaCategoryCopyWith<$Res> {
  factory $TriviaCategoryCopyWith(
          TriviaCategory value, $Res Function(TriviaCategory) then) =
      _$TriviaCategoryCopyWithImpl<$Res, TriviaCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name', fromJson: nameFromJson) String name});
}

/// @nodoc
class _$TriviaCategoryCopyWithImpl<$Res, $Val extends TriviaCategory>
    implements $TriviaCategoryCopyWith<$Res> {
  _$TriviaCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TriviaCategoryImplCopyWith<$Res>
    implements $TriviaCategoryCopyWith<$Res> {
  factory _$$TriviaCategoryImplCopyWith(_$TriviaCategoryImpl value,
          $Res Function(_$TriviaCategoryImpl) then) =
      __$$TriviaCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name', fromJson: nameFromJson) String name});
}

/// @nodoc
class __$$TriviaCategoryImplCopyWithImpl<$Res>
    extends _$TriviaCategoryCopyWithImpl<$Res, _$TriviaCategoryImpl>
    implements _$$TriviaCategoryImplCopyWith<$Res> {
  __$$TriviaCategoryImplCopyWithImpl(
      _$TriviaCategoryImpl _value, $Res Function(_$TriviaCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$TriviaCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TriviaCategoryImpl implements _TriviaCategory {
  const _$TriviaCategoryImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name', fromJson: nameFromJson) required this.name});

  factory _$TriviaCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TriviaCategoryImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name', fromJson: nameFromJson)
  final String name;

  @override
  String toString() {
    return 'TriviaCategory(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TriviaCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TriviaCategoryImplCopyWith<_$TriviaCategoryImpl> get copyWith =>
      __$$TriviaCategoryImplCopyWithImpl<_$TriviaCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TriviaCategoryImplToJson(
      this,
    );
  }
}

abstract class _TriviaCategory implements TriviaCategory {
  const factory _TriviaCategory(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name', fromJson: nameFromJson)
      required final String name}) = _$TriviaCategoryImpl;

  factory _TriviaCategory.fromJson(Map<String, dynamic> json) =
      _$TriviaCategoryImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name', fromJson: nameFromJson)
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$TriviaCategoryImplCopyWith<_$TriviaCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
