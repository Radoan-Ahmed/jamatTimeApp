// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  List<Datum>? get data => throw _privateConstructorUsedError;
  Map<String, DateTime>? get paresed => throw _privateConstructorUsedError;
  String? get nextPrayer => throw _privateConstructorUsedError;
  String? get nextTime => throw _privateConstructorUsedError;
  Duration? get timeRemaining => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String? email,
      String? password,
      List<Datum>? data,
      Map<String, DateTime>? paresed,
      String? nextPrayer,
      String? nextTime,
      Duration? timeRemaining});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? data = freezed,
    Object? paresed = freezed,
    Object? nextPrayer = freezed,
    Object? nextTime = freezed,
    Object? timeRemaining = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>?,
      paresed: freezed == paresed
          ? _value.paresed
          : paresed // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>?,
      nextPrayer: freezed == nextPrayer
          ? _value.nextPrayer
          : nextPrayer // ignore: cast_nullable_to_non_nullable
              as String?,
      nextTime: freezed == nextTime
          ? _value.nextTime
          : nextTime // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRemaining: freezed == timeRemaining
          ? _value.timeRemaining
          : timeRemaining // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      String? password,
      List<Datum>? data,
      Map<String, DateTime>? paresed,
      String? nextPrayer,
      String? nextTime,
      Duration? timeRemaining});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? data = freezed,
    Object? paresed = freezed,
    Object? nextPrayer = freezed,
    Object? nextTime = freezed,
    Object? timeRemaining = freezed,
  }) {
    return _then(_$HomeStateImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>?,
      paresed: freezed == paresed
          ? _value._paresed
          : paresed // ignore: cast_nullable_to_non_nullable
              as Map<String, DateTime>?,
      nextPrayer: freezed == nextPrayer
          ? _value.nextPrayer
          : nextPrayer // ignore: cast_nullable_to_non_nullable
              as String?,
      nextTime: freezed == nextTime
          ? _value.nextTime
          : nextTime // ignore: cast_nullable_to_non_nullable
              as String?,
      timeRemaining: freezed == timeRemaining
          ? _value.timeRemaining
          : timeRemaining // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.email,
      this.password,
      final List<Datum>? data,
      final Map<String, DateTime>? paresed,
      this.nextPrayer,
      this.nextTime,
      this.timeRemaining})
      : _data = data,
        _paresed = paresed;

  @override
  final String? email;
  @override
  final String? password;
  final List<Datum>? _data;
  @override
  List<Datum>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, DateTime>? _paresed;
  @override
  Map<String, DateTime>? get paresed {
    final value = _paresed;
    if (value == null) return null;
    if (_paresed is EqualUnmodifiableMapView) return _paresed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? nextPrayer;
  @override
  final String? nextTime;
  @override
  final Duration? timeRemaining;

  @override
  String toString() {
    return 'HomeState(email: $email, password: $password, data: $data, paresed: $paresed, nextPrayer: $nextPrayer, nextTime: $nextTime, timeRemaining: $timeRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._paresed, _paresed) &&
            (identical(other.nextPrayer, nextPrayer) ||
                other.nextPrayer == nextPrayer) &&
            (identical(other.nextTime, nextTime) ||
                other.nextTime == nextTime) &&
            (identical(other.timeRemaining, timeRemaining) ||
                other.timeRemaining == timeRemaining));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      password,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_paresed),
      nextPrayer,
      nextTime,
      timeRemaining);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final String? email,
      final String? password,
      final List<Datum>? data,
      final Map<String, DateTime>? paresed,
      final String? nextPrayer,
      final String? nextTime,
      final Duration? timeRemaining}) = _$HomeStateImpl;

  @override
  String? get email;
  @override
  String? get password;
  @override
  List<Datum>? get data;
  @override
  Map<String, DateTime>? get paresed;
  @override
  String? get nextPrayer;
  @override
  String? get nextTime;
  @override
  Duration? get timeRemaining;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
