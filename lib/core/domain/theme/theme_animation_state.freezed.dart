// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_animation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeAnimationState {
  bool get isAnimating => throw _privateConstructorUsedError;
  double get rotationValue => throw _privateConstructorUsedError;
  double get opacityValue => throw _privateConstructorUsedError;

  /// Create a copy of ThemeAnimationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeAnimationStateCopyWith<ThemeAnimationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeAnimationStateCopyWith<$Res> {
  factory $ThemeAnimationStateCopyWith(
          ThemeAnimationState value, $Res Function(ThemeAnimationState) then) =
      _$ThemeAnimationStateCopyWithImpl<$Res, ThemeAnimationState>;
  @useResult
  $Res call({bool isAnimating, double rotationValue, double opacityValue});
}

/// @nodoc
class _$ThemeAnimationStateCopyWithImpl<$Res, $Val extends ThemeAnimationState>
    implements $ThemeAnimationStateCopyWith<$Res> {
  _$ThemeAnimationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeAnimationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnimating = null,
    Object? rotationValue = null,
    Object? opacityValue = null,
  }) {
    return _then(_value.copyWith(
      isAnimating: null == isAnimating
          ? _value.isAnimating
          : isAnimating // ignore: cast_nullable_to_non_nullable
              as bool,
      rotationValue: null == rotationValue
          ? _value.rotationValue
          : rotationValue // ignore: cast_nullable_to_non_nullable
              as double,
      opacityValue: null == opacityValue
          ? _value.opacityValue
          : opacityValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThemeAnimationStateImplCopyWith<$Res>
    implements $ThemeAnimationStateCopyWith<$Res> {
  factory _$$ThemeAnimationStateImplCopyWith(_$ThemeAnimationStateImpl value,
          $Res Function(_$ThemeAnimationStateImpl) then) =
      __$$ThemeAnimationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAnimating, double rotationValue, double opacityValue});
}

/// @nodoc
class __$$ThemeAnimationStateImplCopyWithImpl<$Res>
    extends _$ThemeAnimationStateCopyWithImpl<$Res, _$ThemeAnimationStateImpl>
    implements _$$ThemeAnimationStateImplCopyWith<$Res> {
  __$$ThemeAnimationStateImplCopyWithImpl(_$ThemeAnimationStateImpl _value,
      $Res Function(_$ThemeAnimationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThemeAnimationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnimating = null,
    Object? rotationValue = null,
    Object? opacityValue = null,
  }) {
    return _then(_$ThemeAnimationStateImpl(
      isAnimating: null == isAnimating
          ? _value.isAnimating
          : isAnimating // ignore: cast_nullable_to_non_nullable
              as bool,
      rotationValue: null == rotationValue
          ? _value.rotationValue
          : rotationValue // ignore: cast_nullable_to_non_nullable
              as double,
      opacityValue: null == opacityValue
          ? _value.opacityValue
          : opacityValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ThemeAnimationStateImpl implements _ThemeAnimationState {
  const _$ThemeAnimationStateImpl(
      {required this.isAnimating,
      required this.rotationValue,
      required this.opacityValue});

  @override
  final bool isAnimating;
  @override
  final double rotationValue;
  @override
  final double opacityValue;

  @override
  String toString() {
    return 'ThemeAnimationState(isAnimating: $isAnimating, rotationValue: $rotationValue, opacityValue: $opacityValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeAnimationStateImpl &&
            (identical(other.isAnimating, isAnimating) ||
                other.isAnimating == isAnimating) &&
            (identical(other.rotationValue, rotationValue) ||
                other.rotationValue == rotationValue) &&
            (identical(other.opacityValue, opacityValue) ||
                other.opacityValue == opacityValue));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isAnimating, rotationValue, opacityValue);

  /// Create a copy of ThemeAnimationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeAnimationStateImplCopyWith<_$ThemeAnimationStateImpl> get copyWith =>
      __$$ThemeAnimationStateImplCopyWithImpl<_$ThemeAnimationStateImpl>(
          this, _$identity);
}

abstract class _ThemeAnimationState implements ThemeAnimationState {
  const factory _ThemeAnimationState(
      {required final bool isAnimating,
      required final double rotationValue,
      required final double opacityValue}) = _$ThemeAnimationStateImpl;

  @override
  bool get isAnimating;
  @override
  double get rotationValue;
  @override
  double get opacityValue;

  /// Create a copy of ThemeAnimationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeAnimationStateImplCopyWith<_$ThemeAnimationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
