// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'description': instance.description,
      'id': instance.id,
      'name': instance.name,
      'content': instance.content,
    };
