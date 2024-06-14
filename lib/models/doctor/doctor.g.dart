// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorImpl _$$DoctorImplFromJson(Map<String, dynamic> json) => _$DoctorImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: (json['phone'] as num).toInt(),
      nik: (json['nik'] as num).toInt(),
      str: (json['str'] as num).toInt(),
      poli: $enumDecode(_$PoliEnumMap, json['poli']),
    );

Map<String, dynamic> _$$DoctorImplToJson(_$DoctorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'nik': instance.nik,
      'str': instance.str,
      'poli': _$PoliEnumMap[instance.poli]!,
    };

const _$PoliEnumMap = {
  Poli.umum: 'umum',
  Poli.gigi: 'gigi',
  Poli.kandungan: 'kandungan',
  Poli.mata: 'mata',
  Poli.jantung: 'jantung',
  Poli.anak: 'anak',
  Poli.syaraf: 'syaraf',
  Poli.bedah: 'bedah',
  Poli.kulit: 'kulit',
  Poli.tht: 'tht',
  Poli.paru: 'paru',
  Poli.saraf: 'saraf',
  Poli.tulang: 'tulang',
  Poli.jiwa: 'jiwa',
  Poli.ginjal: 'ginjal',
  Poli.lambung: 'lambung',
  Poli.hati: 'hati',
  Poli.endokrin: 'endokrin',
};
