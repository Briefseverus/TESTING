import 'package:json_annotation/json_annotation.dart';

import 'class_name.dart';

part 'user.g.dart';

@JsonSerializable()
class User {

  String id;
  String idsv;
  String name;
  String department;
  String cccd;
  String address;
  String phone;
  ClassName className;
  int createdAt;

  User({
    required this.id,
    required this.idsv,
    required this.name,
    required this.department,
    required this.cccd,
    required this.address,
    required this.phone,
    required this.className,
    required this.createdAt
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$UserToJson(this);

}