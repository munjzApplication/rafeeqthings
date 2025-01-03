// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Personalmodel _$PersonalmodelFromJson(Map<String, dynamic> json) {
  return _Personalmodel.fromJson(json);
}

/// @nodoc
mixin _$Personalmodel {
  @JsonKey(name: 'token')
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'error')
  String get error => throw _privateConstructorUsedError;

  /// Serializes this Personalmodel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Personalmodel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalmodelCopyWith<Personalmodel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalmodelCopyWith<$Res> {
  factory $PersonalmodelCopyWith(
          Personalmodel value, $Res Function(Personalmodel) then) =
      _$PersonalmodelCopyWithImpl<$Res, Personalmodel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'token') String token,
      @JsonKey(name: 'error') String error});
}

/// @nodoc
class _$PersonalmodelCopyWithImpl<$Res, $Val extends Personalmodel>
    implements $PersonalmodelCopyWith<$Res> {
  _$PersonalmodelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Personalmodel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalmodelImplCopyWith<$Res>
    implements $PersonalmodelCopyWith<$Res> {
  factory _$$PersonalmodelImplCopyWith(
          _$PersonalmodelImpl value, $Res Function(_$PersonalmodelImpl) then) =
      __$$PersonalmodelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'token') String token,
      @JsonKey(name: 'error') String error});
}

/// @nodoc
class __$$PersonalmodelImplCopyWithImpl<$Res>
    extends _$PersonalmodelCopyWithImpl<$Res, _$PersonalmodelImpl>
    implements _$$PersonalmodelImplCopyWith<$Res> {
  __$$PersonalmodelImplCopyWithImpl(
      _$PersonalmodelImpl _value, $Res Function(_$PersonalmodelImpl) _then)
      : super(_value, _then);

  /// Create a copy of Personalmodel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? error = null,
  }) {
    return _then(_$PersonalmodelImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalmodelImpl implements _Personalmodel {
  _$PersonalmodelImpl(
      {@JsonKey(name: 'token') this.token = '',
      @JsonKey(name: 'error') this.error = ''});

  factory _$PersonalmodelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalmodelImplFromJson(json);

  @override
  @JsonKey(name: 'token')
  final String token;
  @override
  @JsonKey(name: 'error')
  final String error;

  @override
  String toString() {
    return 'Personalmodel(token: $token, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalmodelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, error);

  /// Create a copy of Personalmodel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalmodelImplCopyWith<_$PersonalmodelImpl> get copyWith =>
      __$$PersonalmodelImplCopyWithImpl<_$PersonalmodelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalmodelImplToJson(
      this,
    );
  }
}

abstract class _Personalmodel implements Personalmodel {
  factory _Personalmodel(
      {@JsonKey(name: 'token') final String token,
      @JsonKey(name: 'error') final String error}) = _$PersonalmodelImpl;

  factory _Personalmodel.fromJson(Map<String, dynamic> json) =
      _$PersonalmodelImpl.fromJson;

  @override
  @JsonKey(name: 'token')
  String get token;
  @override
  @JsonKey(name: 'error')
  String get error;

  /// Create a copy of Personalmodel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalmodelImplCopyWith<_$PersonalmodelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
