import '../../domain_layer/models/checked_questions.dart';

Map<String, dynamic> provideCheckedQuestionsPOSTBody(
    List<CheckedQuestions> checkedQuestions) {
  return {
    "answers": checkedQuestions
        .map(
          (e) => {
            "questionId": e.questionId,
            "correct": e.userAnswers,
          },
        )
        .toList()
  };
}
