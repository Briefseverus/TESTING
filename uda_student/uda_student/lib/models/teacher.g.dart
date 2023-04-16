// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      id: json['id'] as String,
      idGV: json['idGV'] as String,
      name: json['name'] as String,
      department: json['department'] as String,
      cccd: json['cccd'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'id': instance.id,
      'idGV': instance.idGV,
      'name': instance.name,
      'department': instance.department,
      'cccd': instance.cccd,
      'address': instance.address,
      'phone': instance.phone,
    };
