// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exams_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamsResponseDTO _$ExamsResponseDTOFromJson(Map<String, dynamic> json) =>
    ExamsResponseDTO(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : paginationDTO.fromJson(json['metadata'] as Map<String, dynamic>),
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => ExamsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExamsResponseDTOToJson(ExamsResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'exams': instance.exams,
    };

paginationDTO _$paginationDTOFromJson(Map<String, dynamic> json) =>
    paginationDTO(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$paginationDTOToJson(paginationDTO instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
    };

ExamsDTO _$ExamsDTOFromJson(Map<String, dynamic> json) => ExamsDTO(
      Id: json['_id'] as String?,
      title: json['title'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      numberOfQuestions: (json['numberOfQuestions'] as num?)?.toInt(),
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ExamsDTOToJson(ExamsDTO instance) => <String, dynamic>{
      '_id': instance.Id,
      'title': instance.title,
      'duration': instance.duration,
      'subject': instance.subject,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.active,
      'createdAt': instance.createdAt,
    };
