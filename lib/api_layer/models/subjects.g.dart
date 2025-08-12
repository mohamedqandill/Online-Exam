// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsDTO _$SubjectsDTOFromJson(Map<String, dynamic> json) => SubjectsDTO(
      Id: json['_id'] as String?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$SubjectsDTOToJson(SubjectsDTO instance) =>
    <String, dynamic>{
      '_id': instance.Id,
      'name': instance.name,
      'icon': instance.icon,
      'createdAt': instance.createdAt,
    };
