import 'package:json_annotation/json_annotation.dart';
import 'package:uda_qlsv/models/class_name.dart';
import 'package:uda_qlsv/models/subject.dart';

part 'menu_table.g.dart';

@JsonSerializable()
class MenuTable {
  String id;
  ClassName className;
  List<int> stage;
  int day;
  int session;
  Subject subject;
  int createdAt;

  MenuTable(
      {required this.id,
      required this.className,
      required this.day,
      required this.stage,
      required this.session,
      required this.subject,
      required this.createdAt});

  factory MenuTable.fromJson(Map<String, dynamic> json) =>
      _$MenuTableFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$MenuTableToJson(this);
}
