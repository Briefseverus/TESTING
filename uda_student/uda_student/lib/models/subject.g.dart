// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      id: json['id'] as String,
      name: json['name'] as String,
      numOfLesson: json['numOfLesson'] as int,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numOfLesson': instance.numOfLesson,
      'createdAt': instance.createdAt,
    };
