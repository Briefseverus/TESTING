import 'package:json_annotation/json_annotation.dart';

part 'class_name.g.dart';

@JsonSerializable()
class ClassName {
  String id;
  String name;
  int createdAt;

  ClassName({ required this.id, required this.name, required this.createdAt });

  factory ClassName.fromJson(Map<String, dynamic> json) => _$ClassNameFromJson(json);
  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$ClassNameToJson(this);

}