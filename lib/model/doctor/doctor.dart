import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rekmed/utils/poli.dart';

part 'doctor.freezed.dart';

part 'doctor.g.dart';

@freezed
abstract class Doctor with _$Doctor {
  const factory Doctor(
      {required String id,
      required String name,
      required int phone,
      required int nik,
      required int str,
      required Poli poli}) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  factory Doctor.fromFirstore(DocumentSnapshot snapshot, SnapshotOptions? options) =>
      Doctor.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, Object?> toFirestore(Doctor doctor, SetOptions? options) =>
      doctor.toJson();
}
