// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notify _$NotifyFromJson(Map<String, dynamic> json) => Notify(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$NotifyToJson(Notify instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'description': instance.description,
      'id': instance.id,
      'name': instance.name,
    };
