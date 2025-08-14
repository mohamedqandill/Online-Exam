import 'package:json_annotation/json_annotation.dart';

import '../../../domain_layer/models/exams.dart';
part 'exams_response.g.dart';

@JsonSerializable()
class ExamsResponseDTO {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'metadata')
  final paginationDTO? metadata;
  @JsonKey(name: 'exams')
  final List<ExamsDTO>? exams;

  const ExamsResponseDTO({
    this.message,
    this.metadata,
    this.exams,
  });

  factory ExamsResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ExamsResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ExamsResponseDTOToJson(this);
}

@JsonSerializable()
class paginationDTO {
  @JsonKey(name: 'currentPage')
  final int? currentPage;
  @JsonKey(name: 'numberOfPages')
  final int? numberOfPages;
  @JsonKey(name: 'limit')
  final int? limit;

  const paginationDTO({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory paginationDTO.fromJson(Map<String, dynamic> json) =>
      _$paginationDTOFromJson(json);

  Map<String, dynamic> toJson() => _$paginationDTOToJson(this);
}

@JsonSerializable()
class ExamsDTO {
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

  const ExamsDTO({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamsDTO.fromJson(Map<String, dynamic> json) =>
      _$ExamsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ExamsDTOToJson(this);

  Exams toExams() {
    return Exams(
        id: Id,
        title: title,
        duration: duration,
        subjectId: subject,
        numberOfQuestions: numberOfQuestions);
  }
}
