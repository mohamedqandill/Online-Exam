// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsResponse _$SubjectsResponseFromJson(Map<String, dynamic> json) =>
    SubjectsResponse(
      message: json['message'] as String?,
      pagination: json['metadata'] == null
          ? null
          : Pagination.fromJson(json['metadata'] as Map<String, dynamic>),
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => SubjectsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectsResponseToJson(SubjectsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.pagination,
      'subjects': instance.subjects,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      numberOfPages: (json['numberOfPages'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      nextPage: (json['nextPage'] as num?)?.toInt(),
      prevPage: (json['prevPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'numberOfPages': instance.numberOfPages,
      'limit': instance.limit,
      'nextPage': instance.nextPage,
      'prevPage': instance.prevPage,
    };
