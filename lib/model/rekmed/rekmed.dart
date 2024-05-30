import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rekmed/utlis/poli.dart';

part 'rekmed.freezed.dart';

part 'rekmed.g.dart';

@freezed
abstract class Rekmed with _$Rekmed {
  const factory Rekmed(
      {required String id,
      required String name,
      required int phone,
      required int nik,
      required int str,
      required Poli poli}) = _Rekmed;

  factory Rekmed.fromJson(Map<String, dynamic> json) => _$RekmedFromJson(json);

  factory Rekmed.fromFirstore(DocumentSnapshot snapshot, SnapshotOptions? options) =>
      Rekmed.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, Object?> toFirestore(Rekmed rekmed, SetOptions? options) =>
      rekmed.toJson();
}
