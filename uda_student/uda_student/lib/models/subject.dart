import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  String id;
  String name;
  int numOfLesson;
  int createdAt;

  Subject({ required this.id, required this.name, required this.numOfLesson, required this.createdAt });

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);
  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}