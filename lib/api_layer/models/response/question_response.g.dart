// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResponseDTO _$QuestionResponseDTOFromJson(Map<String, dynamic> json) =>
    QuestionResponseDTO(
      message: json['message'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => QuestionsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionResponseDTOToJson(
        QuestionResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'questions': instance.questions,
    };

QuestionsDTO _$QuestionsDTOFromJson(Map<String, dynamic> json) => QuestionsDTO(
      Id: json['_id'] as String?,
      question: json['question'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => AnswersDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
      correct: json['correct'] as String?,
      subject: json['subject'] == null
          ? null
          : SubjectDTO.fromJson(json['subject'] as Map<String, dynamic>),
      exam: json['exam'] == null
          ? null
          : ExamDTO.fromJson(json['exam'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$QuestionsDTOToJson(QuestionsDTO instance) =>
    <String, dynamic>{
      '_id': instance.Id,
      'question': instance.question,
      'answers': instance.answers,
      'type': instance.type,
      'correct': instance.correct,
      'subject': instance.subject,
      'exam': instance.exam,
      'createdAt': instance.createdAt,
    };

AnswersDTO _$AnswersDTOFromJson(Map<String, dynamic> json) => AnswersDTO(
      answer: json['answer'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$AnswersDTOToJson(AnswersDTO instance) =>
    <String, dynamic>{
      'answer': instance.answer,
      'key': instance.key,
    };

SubjectDTO _$SubjectDTOFromJson(Map<String, dynamic> json) => SubjectDTO(
      Id: json['_id'] as String?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$SubjectDTOToJson(SubjectDTO instance) =>
    <String, dynamic>{
      '_id': instance.Id,
      'name': instance.name,
      'icon': instance.icon,
      'createdAt': instance.createdAt,
    };

ExamDTO _$ExamDTOFromJson(Map<String, dynamic> json) => ExamDTO(
      Id: json['_id'] as String?,
      title: json['title'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      numberOfQuestions: (json['numberOfQuestions'] as num?)?.toInt(),
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ExamDTOToJson(ExamDTO instance) => <String, dynamic>{
      '_id': instance.Id,
      'title': instance.title,
      'duration': instance.duration,
      'subject': instance.subject,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.active,
      'createdAt': instance.createdAt,
    };
