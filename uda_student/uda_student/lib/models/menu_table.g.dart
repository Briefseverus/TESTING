// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuTable _$MenuTableFromJson(Map<String, dynamic> json) => MenuTable(
      id: json['id'] as String,
      className: ClassName.fromJson(json['className'] as Map<String, dynamic>),
      day: json['day'] as int,
      stage: (json['stage'] as List<dynamic>).map((e) => e as int).toList(),
      session: json['session'] as int,
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$MenuTableToJson(MenuTable instance) => <String, dynamic>{
      'id': instance.id,
      'className': instance.className,
      'stage': instance.stage,
      'day': instance.day,
      'session': instance.session,
      'subject': instance.subject,
      'createdAt': instance.createdAt,
    };
