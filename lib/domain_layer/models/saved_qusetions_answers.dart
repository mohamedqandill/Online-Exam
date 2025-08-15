class SavedExams {
  String examId;
  String examTitle;
  int examDuration;
  int numberOfQuestions;
  List<SavedAnswers> savedAnswers;

  SavedExams({
    required this.examId,
    required this.savedAnswers,
    required this.numberOfQuestions,
    required this.examDuration,
    required this.examTitle,
  });
}

class SavedAnswers {
  String questionId;

  String correctAnswer;

  String userAnswer;

  SavedAnswers({
    required this.questionId,
    required this.correctAnswer,
    required this.userAnswer,
  });
}
