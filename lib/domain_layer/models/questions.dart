class Questions {
  List<SingleQuestion>? questions;

  Questions({
    required this.questions,
  });
}

class SingleQuestion {
  String? id;
  String? questionTitle;
  String? type;
  String? correctAnswer;
  String? examTitle;
  List<Answers>? answers;
  int? duration;
  int? numberOfQuestions;
  String? examId;

  SingleQuestion(
      {required this.id,
      required this.questionTitle,
      required this.examTitle,
      required this.examId,
      required this.type,
      required this.correctAnswer,
      required this.answers,
      required this.duration,
      required this.numberOfQuestions});
}

class Answers {
  String? answer;
  String? key;

  Answers({required this.answer, required this.key});
}
