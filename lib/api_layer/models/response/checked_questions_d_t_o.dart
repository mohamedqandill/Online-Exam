import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/domain_layer/models/checked_questions_info.dart';

part 'checked_questions_d_t_o.g.dart';

@JsonSerializable()
class CheckedQuestionsDTO {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "correct")
  final int? correct;
  @JsonKey(name: "wrong")
  final int? wrong;
  @JsonKey(name: "total")
  final String? total;

  const CheckedQuestionsDTO({
    this.message,
    this.correct,
    this.wrong,
    this.total,
  });

  factory CheckedQuestionsDTO.fromJson(Map<String, dynamic> json) =>
      _$CheckedQuestionsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CheckedQuestionsDTOToJson(this);

  CheckedQuestionsInfo toCheckedQuestionsInfo() {
    return CheckedQuestionsInfo(correctAnswers: correct, wrongAnswers: wrong);
  }
}
