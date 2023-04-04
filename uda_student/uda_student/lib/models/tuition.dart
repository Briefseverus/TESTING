import 'package:json_annotation/json_annotation.dart';

part 'tuition.g.dart';

@JsonSerializable()

class Tuition {
  String id;
  int totalTuition;
  int feePaid;

  int createdAt;


  Tuition({ required this.id, required this.totalTuition, required this.feePaid, required this.createdAt });

  factory Tuition.fromJson(Map<String, dynamic> json) => _$TuitionFromJson(json);
  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$TuitionToJson(this);

}