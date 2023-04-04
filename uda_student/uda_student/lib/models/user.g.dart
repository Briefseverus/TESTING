// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      idsv: json['idsv'] as String,
      name: json['name'] as String,
      department: json['department'] as String,
      cccd: json['cccd'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      className: ClassName.fromJson(json['className'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'idsv': instance.idsv,
      'name': instance.name,
      'department': instance.department,
      'cccd': instance.cccd,
      'address': instance.address,
      'phone': instance.phone,
      'className': instance.className,
      'createdAt': instance.createdAt,
    };
