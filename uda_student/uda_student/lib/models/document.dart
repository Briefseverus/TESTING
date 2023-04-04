import 'package:uda_qlsv/abstract/post.dart';

import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

@JsonSerializable()
class Document implements Post {
  @override
  int? createdAt;

  @override
  String? description;

  @override
  String? id;

  @override
  String? name;

  String content;

  Document(
      {required this.id,
      required this.name,
      required this.description,
      required this.content,
      required this.createdAt});

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}
