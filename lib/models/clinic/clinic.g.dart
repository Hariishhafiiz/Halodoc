// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClinicImpl _$$ClinicImplFromJson(Map<String, dynamic> json) => _$ClinicImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: (json['phone'] as num).toInt(),
      address: json['address'] as String,
      bpjs: json['bpjs'] as String,
      satuSehat: json['satuSehat'] as String,
    );

Map<String, dynamic> _$$ClinicImplToJson(_$ClinicImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'bpjs': instance.bpjs,
      'satuSehat': instance.satuSehat,
    };
