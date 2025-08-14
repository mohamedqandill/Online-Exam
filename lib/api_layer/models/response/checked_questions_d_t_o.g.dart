// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checked_questions_d_t_o.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckedQuestionsDTO _$CheckedQuestionsDTOFromJson(Map<String, dynamic> json) =>
    CheckedQuestionsDTO(
      message: json['message'] as String?,
      correct: (json['correct'] as num?)?.toInt(),
      wrong: (json['wrong'] as num?)?.toInt(),
      total: json['total'] as String?,
    );

Map<String, dynamic> _$CheckedQuestionsDTOToJson(
        CheckedQuestionsDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'correct': instance.correct,
      'wrong': instance.wrong,
      'total': instance.total,
    };
