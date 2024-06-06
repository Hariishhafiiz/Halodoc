import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rekmed/utils/poli.dart';

part 'patient.freezed.dart';

part 'patient.g.dart';

@freezed
abstract class Patient with _$Patient {
  const factory Patient(
      {required String id,
      required String name,
      required DateTime date,
      required String address,
      required Poli poli,
      required List<String> rekmed}) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

  factory Patient.fromFirstore(DocumentSnapshot snapshot, SnapshotOptions? options) =>
      Patient.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, Object?> toFirestore(Patient patient, SetOptions? options) =>
      patient.toJson();
}
