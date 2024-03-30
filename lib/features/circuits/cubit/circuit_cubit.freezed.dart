// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'circuit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CircuitState {
  List<Circuit>? get circuitLocations => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Circuit>? circuitLocations) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Circuit>? circuitLocations)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Circuit>? circuitLocations)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CircuitStateCopyWith<CircuitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CircuitStateCopyWith<$Res> {
  factory $CircuitStateCopyWith(
          CircuitState value, $Res Function(CircuitState) then) =
      _$CircuitStateCopyWithImpl<$Res, CircuitState>;
  @useResult
  $Res call({List<Circuit>? circuitLocations});
}

/// @nodoc
class _$CircuitStateCopyWithImpl<$Res, $Val extends CircuitState>
    implements $CircuitStateCopyWith<$Res> {
  _$CircuitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? circuitLocations = freezed,
  }) {
    return _then(_value.copyWith(
      circuitLocations: freezed == circuitLocations
          ? _value.circuitLocations
          : circuitLocations // ignore: cast_nullable_to_non_nullable
              as List<Circuit>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CircuitStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Circuit>? circuitLocations});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CircuitStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? circuitLocations = freezed,
  }) {
    return _then(_$InitialImpl(
      circuitLocations: freezed == circuitLocations
          ? _value._circuitLocations
          : circuitLocations // ignore: cast_nullable_to_non_nullable
              as List<Circuit>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({final List<Circuit>? circuitLocations})
      : _circuitLocations = circuitLocations;

  final List<Circuit>? _circuitLocations;
  @override
  List<Circuit>? get circuitLocations {
    final value = _circuitLocations;
    if (value == null) return null;
    if (_circuitLocations is EqualUnmodifiableListView)
      return _circuitLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CircuitState.initial(circuitLocations: $circuitLocations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._circuitLocations, _circuitLocations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_circuitLocations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Circuit>? circuitLocations) initial,
  }) {
    return initial(circuitLocations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Circuit>? circuitLocations)? initial,
  }) {
    return initial?.call(circuitLocations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Circuit>? circuitLocations)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(circuitLocations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CircuitState {
  const factory _Initial({final List<Circuit>? circuitLocations}) =
      _$InitialImpl;

  @override
  List<Circuit>? get circuitLocations;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
