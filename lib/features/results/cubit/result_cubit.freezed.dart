// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultState {
  List<Race>? get raceResults => throw _privateConstructorUsedError;
  List<TeamResult>? get teamsResults => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Race>? raceResults, List<TeamResult>? teamsResults)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Race>? raceResults, List<TeamResult>? teamsResults)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Race>? raceResults, List<TeamResult>? teamsResults)?
        initial,
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
  $ResultStateCopyWith<ResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultStateCopyWith<$Res> {
  factory $ResultStateCopyWith(
          ResultState value, $Res Function(ResultState) then) =
      _$ResultStateCopyWithImpl<$Res, ResultState>;
  @useResult
  $Res call({List<Race>? raceResults, List<TeamResult>? teamsResults});
}

/// @nodoc
class _$ResultStateCopyWithImpl<$Res, $Val extends ResultState>
    implements $ResultStateCopyWith<$Res> {
  _$ResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raceResults = freezed,
    Object? teamsResults = freezed,
  }) {
    return _then(_value.copyWith(
      raceResults: freezed == raceResults
          ? _value.raceResults
          : raceResults // ignore: cast_nullable_to_non_nullable
              as List<Race>?,
      teamsResults: freezed == teamsResults
          ? _value.teamsResults
          : teamsResults // ignore: cast_nullable_to_non_nullable
              as List<TeamResult>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ResultStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Race>? raceResults, List<TeamResult>? teamsResults});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raceResults = freezed,
    Object? teamsResults = freezed,
  }) {
    return _then(_$InitialImpl(
      raceResults: freezed == raceResults
          ? _value._raceResults
          : raceResults // ignore: cast_nullable_to_non_nullable
              as List<Race>?,
      teamsResults: freezed == teamsResults
          ? _value._teamsResults
          : teamsResults // ignore: cast_nullable_to_non_nullable
              as List<TeamResult>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<Race>? raceResults, final List<TeamResult>? teamsResults})
      : _raceResults = raceResults,
        _teamsResults = teamsResults;

  final List<Race>? _raceResults;
  @override
  List<Race>? get raceResults {
    final value = _raceResults;
    if (value == null) return null;
    if (_raceResults is EqualUnmodifiableListView) return _raceResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TeamResult>? _teamsResults;
  @override
  List<TeamResult>? get teamsResults {
    final value = _teamsResults;
    if (value == null) return null;
    if (_teamsResults is EqualUnmodifiableListView) return _teamsResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResultState.initial(raceResults: $raceResults, teamsResults: $teamsResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._raceResults, _raceResults) &&
            const DeepCollectionEquality()
                .equals(other._teamsResults, _teamsResults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_raceResults),
      const DeepCollectionEquality().hash(_teamsResults));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<Race>? raceResults, List<TeamResult>? teamsResults)
        initial,
  }) {
    return initial(raceResults, teamsResults);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Race>? raceResults, List<TeamResult>? teamsResults)?
        initial,
  }) {
    return initial?.call(raceResults, teamsResults);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Race>? raceResults, List<TeamResult>? teamsResults)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(raceResults, teamsResults);
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

abstract class _Initial implements ResultState {
  const factory _Initial(
      {final List<Race>? raceResults,
      final List<TeamResult>? teamsResults}) = _$InitialImpl;

  @override
  List<Race>? get raceResults;
  @override
  List<TeamResult>? get teamsResults;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
