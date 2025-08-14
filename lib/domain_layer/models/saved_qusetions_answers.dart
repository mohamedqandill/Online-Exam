class SavedExams {
  String examId;

  List<SavedAnswers> savedAnswers;

  SavedExams({
    required this.examId,
    required this.savedAnswers,
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
