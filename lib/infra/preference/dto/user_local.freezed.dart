// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_local.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserLocal _$UserLocalFromJson(Map<String, dynamic> json) {
  return _UserLocal.fromJson(json);
}

/// @nodoc
mixin _$UserLocal {
  @JsonKey(name: 'user_name')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLocalCopyWith<UserLocal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLocalCopyWith<$Res> {
  factory $UserLocalCopyWith(UserLocal value, $Res Function(UserLocal) then) =
      _$UserLocalCopyWithImpl<$Res, UserLocal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'password') String password});
}

/// @nodoc
class _$UserLocalCopyWithImpl<$Res, $Val extends UserLocal>
    implements $UserLocalCopyWith<$Res> {
  _$UserLocalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserLocalCopyWith<$Res> implements $UserLocalCopyWith<$Res> {
  factory _$$_UserLocalCopyWith(
          _$_UserLocal value, $Res Function(_$_UserLocal) then) =
      __$$_UserLocalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'password') String password});
}

/// @nodoc
class __$$_UserLocalCopyWithImpl<$Res>
    extends _$UserLocalCopyWithImpl<$Res, _$_UserLocal>
    implements _$$_UserLocalCopyWith<$Res> {
  __$$_UserLocalCopyWithImpl(
      _$_UserLocal _value, $Res Function(_$_UserLocal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
  }) {
    return _then(_$_UserLocal(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserLocal implements _UserLocal {
  const _$_UserLocal(
      {@JsonKey(name: 'user_name') required this.userName,
      @JsonKey(name: 'password') required this.password});

  factory _$_UserLocal.fromJson(Map<String, dynamic> json) =>
      _$$_UserLocalFromJson(json);

  @override
  @JsonKey(name: 'user_name')
  final String userName;
  @override
  @JsonKey(name: 'password')
  final String password;

  @override
  String toString() {
    return 'UserLocal(userName: $userName, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserLocal &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userName, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserLocalCopyWith<_$_UserLocal> get copyWith =>
      __$$_UserLocalCopyWithImpl<_$_UserLocal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserLocalToJson(
      this,
    );
  }
}

abstract class _UserLocal implements UserLocal {
  const factory _UserLocal(
          {@JsonKey(name: 'user_name') required final String userName,
          @JsonKey(name: 'password') required final String password}) =
      _$_UserLocal;

  factory _UserLocal.fromJson(Map<String, dynamic> json) =
      _$_UserLocal.fromJson;

  @override
  @JsonKey(name: 'user_name')
  String get userName;
  @override
  @JsonKey(name: 'password')
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_UserLocalCopyWith<_$_UserLocal> get copyWith =>
      throw _privateConstructorUsedError;
}
