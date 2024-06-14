// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clinic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Clinic _$ClinicFromJson(Map<String, dynamic> json) {
  return _Clinic.fromJson(json);
}

/// @nodoc
mixin _$Clinic {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get bpjs => throw _privateConstructorUsedError;
  String get satuSehat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClinicCopyWith<Clinic> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicCopyWith<$Res> {
  factory $ClinicCopyWith(Clinic value, $Res Function(Clinic) then) =
      _$ClinicCopyWithImpl<$Res, Clinic>;
  @useResult
  $Res call(
      {String uid,
      String name,
      String username,
      String email,
      int phone,
      String address,
      String bpjs,
      String satuSehat});
}

/// @nodoc
class _$ClinicCopyWithImpl<$Res, $Val extends Clinic>
    implements $ClinicCopyWith<$Res> {
  _$ClinicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? bpjs = null,
    Object? satuSehat = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      bpjs: null == bpjs
          ? _value.bpjs
          : bpjs // ignore: cast_nullable_to_non_nullable
              as String,
      satuSehat: null == satuSehat
          ? _value.satuSehat
          : satuSehat // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClinicImplCopyWith<$Res> implements $ClinicCopyWith<$Res> {
  factory _$$ClinicImplCopyWith(
          _$ClinicImpl value, $Res Function(_$ClinicImpl) then) =
      __$$ClinicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String username,
      String email,
      int phone,
      String address,
      String bpjs,
      String satuSehat});
}

/// @nodoc
class __$$ClinicImplCopyWithImpl<$Res>
    extends _$ClinicCopyWithImpl<$Res, _$ClinicImpl>
    implements _$$ClinicImplCopyWith<$Res> {
  __$$ClinicImplCopyWithImpl(
      _$ClinicImpl _value, $Res Function(_$ClinicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? phone = null,
    Object? address = null,
    Object? bpjs = null,
    Object? satuSehat = null,
  }) {
    return _then(_$ClinicImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      bpjs: null == bpjs
          ? _value.bpjs
          : bpjs // ignore: cast_nullable_to_non_nullable
              as String,
      satuSehat: null == satuSehat
          ? _value.satuSehat
          : satuSehat // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicImpl implements _Clinic {
  const _$ClinicImpl(
      {required this.uid,
      required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.address,
      required this.bpjs,
      required this.satuSehat});

  factory _$ClinicImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicImplFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String username;
  @override
  final String email;
  @override
  final int phone;
  @override
  final String address;
  @override
  final String bpjs;
  @override
  final String satuSehat;

  @override
  String toString() {
    return 'Clinic(uid: $uid, name: $name, username: $username, email: $email, phone: $phone, address: $address, bpjs: $bpjs, satuSehat: $satuSehat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.bpjs, bpjs) || other.bpjs == bpjs) &&
            (identical(other.satuSehat, satuSehat) ||
                other.satuSehat == satuSehat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, name, username, email, phone, address, bpjs, satuSehat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicImplCopyWith<_$ClinicImpl> get copyWith =>
      __$$ClinicImplCopyWithImpl<_$ClinicImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicImplToJson(
      this,
    );
  }
}

abstract class _Clinic implements Clinic {
  const factory _Clinic(
      {required final String uid,
      required final String name,
      required final String username,
      required final String email,
      required final int phone,
      required final String address,
      required final String bpjs,
      required final String satuSehat}) = _$ClinicImpl;

  factory _Clinic.fromJson(Map<String, dynamic> json) = _$ClinicImpl.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get username;
  @override
  String get email;
  @override
  int get phone;
  @override
  String get address;
  @override
  String get bpjs;
  @override
  String get satuSehat;
  @override
  @JsonKey(ignore: true)
  _$$ClinicImplCopyWith<_$ClinicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
