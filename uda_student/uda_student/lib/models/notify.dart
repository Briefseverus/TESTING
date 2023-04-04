import 'package:uda_qlsv/abstract/post.dart';

import 'package:json_annotation/json_annotation.dart';

part 'notify.g.dart';

@JsonSerializable()
class Notify implements Post {
  @override
  int? createdAt;

  @override
  String? description;

  @override
  String? id;

  @override
  String? name;

  Notify(
      {this.id, required this.name, required this.description, this.createdAt});

  factory Notify.fromJson(Map<String, dynamic> json) => _$NotifyFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$NotifyToJson(this);
}

List<Notify> notifiesList = [
  Notify(
      id: '1',
      name: 'Một vài thông tin về Wi-Fi 7 dự kiến được giới thiệu vào 2024',
      description: '',
      createdAt: 123456546546578),
  Notify(
      id: '2',
      name: 'Lần đầu dùng Apple Watch Series 6 44mm GPS',
      description: 'content',
      createdAt: 235675876987),
  Notify(
      id: '3',
      name: 'Vén màn bí mật chiến lược kinh doanh của Tesla',
      description: 'content',
      createdAt: 56789897685746),
  Notify(
      id: '4',
      name:
          'Bạn khó chịu khi màn hình iPhone tự điều chỉnh độ sáng xuống thấp?',
      description: 'content',
      createdAt: 678769859876),
  Notify(
      id: '5',
      name:
          'Liệu Apple sẽ dẫn đầu hay theo sau với trào lưu màn hình gập tất yếu sắp tới?',
      description: 'content',
      createdAt: 5476587658)
];
