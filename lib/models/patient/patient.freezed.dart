// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
mixin _$Patient {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  Poli get poli => throw _privateConstructorUsedError;
  List<String> get rekmed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime date,
      String address,
      Poli poli,
      List<String> rekmed});
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = null,
    Object? address = null,
    Object? poli = null,
    Object? rekmed = null,
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
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      poli: null == poli
          ? _value.poli
          : poli // ignore: cast_nullable_to_non_nullable
              as Poli,
      rekmed: null == rekmed
          ? _value.rekmed
          : rekmed // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientImplCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$PatientImplCopyWith(
          _$PatientImpl value, $Res Function(_$PatientImpl) then) =
      __$$PatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime date,
      String address,
      Poli poli,
      List<String> rekmed});
}

/// @nodoc
class __$$PatientImplCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$PatientImpl>
    implements _$$PatientImplCopyWith<$Res> {
  __$$PatientImplCopyWithImpl(
      _$PatientImpl _value, $Res Function(_$PatientImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = null,
    Object? address = null,
    Object? poli = null,
    Object? rekmed = null,
  }) {
    return _then(_$PatientImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      poli: null == poli
          ? _value.poli
          : poli // ignore: cast_nullable_to_non_nullable
              as Poli,
      rekmed: null == rekmed
          ? _value._rekmed
          : rekmed // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientImpl implements _Patient {
  const _$PatientImpl(
      {required this.id,
      required this.name,
      required this.date,
      required this.address,
      required this.poli,
      required final List<String> rekmed})
      : _rekmed = rekmed;

  factory _$PatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime date;
  @override
  final String address;
  @override
  final Poli poli;
  final List<String> _rekmed;
  @override
  List<String> get rekmed {
    if (_rekmed is EqualUnmodifiableListView) return _rekmed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rekmed);
  }

  @override
  String toString() {
    return 'Patient(id: $id, name: $name, date: $date, address: $address, poli: $poli, rekmed: $rekmed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.poli, poli) || other.poli == poli) &&
            const DeepCollectionEquality().equals(other._rekmed, _rekmed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, date, address, poli,
      const DeepCollectionEquality().hash(_rekmed));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      __$$PatientImplCopyWithImpl<_$PatientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientImplToJson(
      this,
    );
  }
}

abstract class _Patient implements Patient {
  const factory _Patient(
      {required final String id,
      required final String name,
      required final DateTime date,
      required final String address,
      required final Poli poli,
      required final List<String> rekmed}) = _$PatientImpl;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$PatientImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get date;
  @override
  String get address;
  @override
  Poli get poli;
  @override
  List<String> get rekmed;
  @override
  @JsonKey(ignore: true)
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
