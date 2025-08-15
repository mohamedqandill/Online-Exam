import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/domain_layer/models/questions.dart';

part 'question_response.g.dart';

@JsonSerializable()
class QuestionResponseDTO {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'questions')
  final List<QuestionsDTO>? questions;

  const QuestionResponseDTO({
    this.message,
    this.questions,
  });

  factory QuestionResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseDTOToJson(this);

  Questions toQuestions() {
    return Questions(
      questions: questions?.map(
        (e) {
          return SingleQuestion(
              examTitle: e.exam?.title,
              examId: e.exam?.Id,
              id: e.Id,
              questionTitle: e.question,
              type: e.type,
              correctAnswer: e.correct,
              duration: e.exam?.duration,
              numberOfQuestions: e.exam?.numberOfQuestions,
              answers: e.answers
                  ?.map(
                    (answer) => Answers(answer: answer.answer, key: answer.key),
                  )
                  .toList());
        },
      ).toList(),
    );
  }
}

@JsonSerializable()
class QuestionsDTO {
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'question')
  final String? question;
  @JsonKey(name: 'answers')
  final List<AnswersDTO>? answers;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'correct')
  final String? correct;
  @JsonKey(name: 'subject')
  final SubjectDTO? subject;
  @JsonKey(name: 'exam')
  final ExamDTO? exam;
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  const QuestionsDTO({
    this.Id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory QuestionsDTO.fromJson(Map<String, dynamic> json) =>
      _$QuestionsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsDTOToJson(this);
}

@JsonSerializable()
class AnswersDTO {
  @JsonKey(name: 'answer')
  final String? answer;
  @JsonKey(name: 'key')
  final String? key;

  const AnswersDTO({
    this.answer,
    this.key,
  });

  factory AnswersDTO.fromJson(Map<String, dynamic> json) =>
      _$AnswersDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AnswersDTOToJson(this);
}

@JsonSerializable()
class SubjectDTO {
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  const SubjectDTO({
    this.Id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory SubjectDTO.fromJson(Map<String, dynamic> json) =>
      _$SubjectDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDTOToJson(this);
}

@JsonSerializable()
class ExamDTO {
  @JsonKey(name: '_id')
  final String? Id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'duration')
  final int? duration;
  @JsonKey(name: 'subject')
  final String? subject;
  @JsonKey(name: 'numberOfQuestions')
  final int? numberOfQuestions;
  @JsonKey(name: 'active')
  final bool? active;
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  const ExamDTO({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamDTO.fromJson(Map<String, dynamic> json) =>
      _$ExamDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDTOToJson(this);
}
