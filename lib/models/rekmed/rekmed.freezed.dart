// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rekmed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Rekmed _$RekmedFromJson(Map<String, dynamic> json) {
  return _Rekmed.fromJson(json);
}

/// @nodoc
mixin _$Rekmed {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get phone => throw _privateConstructorUsedError;
  int get nik => throw _privateConstructorUsedError;
  int get str => throw _privateConstructorUsedError;
  Poli get poli => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RekmedCopyWith<Rekmed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RekmedCopyWith<$Res> {
  factory $RekmedCopyWith(Rekmed value, $Res Function(Rekmed) then) =
      _$RekmedCopyWithImpl<$Res, Rekmed>;
  @useResult
  $Res call({String id, String name, int phone, int nik, int str, Poli poli});
}

/// @nodoc
class _$RekmedCopyWithImpl<$Res, $Val extends Rekmed>
    implements $RekmedCopyWith<$Res> {
  _$RekmedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? nik = null,
    Object? str = null,
    Object? poli = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      nik: null == nik
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as int,
      str: null == str
          ? _value.str
          : str // ignore: cast_nullable_to_non_nullable
              as int,
      poli: null == poli
          ? _value.poli
          : poli // ignore: cast_nullable_to_non_nullable
              as Poli,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RekmedImplCopyWith<$Res> implements $RekmedCopyWith<$Res> {
  factory _$$RekmedImplCopyWith(
          _$RekmedImpl value, $Res Function(_$RekmedImpl) then) =
      __$$RekmedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int phone, int nik, int str, Poli poli});
}

/// @nodoc
class __$$RekmedImplCopyWithImpl<$Res>
    extends _$RekmedCopyWithImpl<$Res, _$RekmedImpl>
    implements _$$RekmedImplCopyWith<$Res> {
  __$$RekmedImplCopyWithImpl(
      _$RekmedImpl _value, $Res Function(_$RekmedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? nik = null,
    Object? str = null,
    Object? poli = null,
  }) {
    return _then(_$RekmedImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      nik: null == nik
          ? _value.nik
          : nik // ignore: cast_nullable_to_non_nullable
              as int,
      str: null == str
          ? _value.str
          : str // ignore: cast_nullable_to_non_nullable
              as int,
      poli: null == poli
          ? _value.poli
          : poli // ignore: cast_nullable_to_non_nullable
              as Poli,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RekmedImpl implements _Rekmed {
  const _$RekmedImpl(
      {required this.id,
      required this.name,
      required this.phone,
      required this.nik,
      required this.str,
      required this.poli});

  factory _$RekmedImpl.fromJson(Map<String, dynamic> json) =>
      _$$RekmedImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int phone;
  @override
  final int nik;
  @override
  final int str;
  @override
  final Poli poli;

  @override
  String toString() {
    return 'Rekmed(id: $id, name: $name, phone: $phone, nik: $nik, str: $str, poli: $poli)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RekmedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.nik, nik) || other.nik == nik) &&
            (identical(other.str, str) || other.str == str) &&
            (identical(other.poli, poli) || other.poli == poli));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone, nik, str, poli);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RekmedImplCopyWith<_$RekmedImpl> get copyWith =>
      __$$RekmedImplCopyWithImpl<_$RekmedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RekmedImplToJson(
      this,
    );
  }
}

abstract class _Rekmed implements Rekmed {
  const factory _Rekmed(
      {required final String id,
      required final String name,
      required final int phone,
      required final int nik,
      required final int str,
      required final Poli poli}) = _$RekmedImpl;

  factory _Rekmed.fromJson(Map<String, dynamic> json) = _$RekmedImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get phone;
  @override
  int get nik;
  @override
  int get str;
  @override
  Poli get poli;
  @override
  @JsonKey(ignore: true)
  _$$RekmedImplCopyWith<_$RekmedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
