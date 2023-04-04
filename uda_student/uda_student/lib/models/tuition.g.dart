// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tuition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tuition _$TuitionFromJson(Map<String, dynamic> json) => Tuition(
      id: json['id'] as String,
      totalTuition: json['totalTuition'] as int,
      feePaid: json['feePaid'] as int,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$TuitionToJson(Tuition instance) => <String, dynamic>{
      'id': instance.id,
      'totalTuition': instance.totalTuition,
      'feePaid': instance.feePaid,
      'createdAt': instance.createdAt,
    };
