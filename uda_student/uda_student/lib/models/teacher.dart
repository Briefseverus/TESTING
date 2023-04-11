
import 'package:json_annotation/json_annotation.dart';
part 'teacher.g.dart';

@JsonSerializable()
class Teacher {
  String id;
  String idGV;
  String name;
  String department;
  String cccd;
  String address;
  String phone;

  Teacher({
    required this.id,
    required this.idGV,
    required this.name,
    required this.department,
    required this.cccd,
    required this.address,
    required this.phone,
  });

}