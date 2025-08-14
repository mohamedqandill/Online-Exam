import 'package:hive/hive.dart';

import '../../domain_layer/models/saved_qusetions_answers.dart';

abstract class ExamsHiveHelper {
  static String boxName = 'saved_exams';

  static Future<Map?> getExamById(String examId) async {
    var box = Hive.isBoxOpen(boxName)
        ? Hive.box(boxName)
        : await Hive.openBox(boxName);
    return box.get(examId);
  }

  static Future<void> clearHive() async {
    var box = Hive.isBoxOpen(boxName)
        ? Hive.box(boxName)
        : await Hive.openBox(boxName);
    await box.clear();
  }

  static Future<void> saveExam(SavedExams exam) async {
    var box = Hive.isBoxOpen(boxName)
        ? Hive.box(boxName)
        : await Hive.openBox(boxName);
    await box.put(exam.examId, {
      "examId": exam.examId,
      "savedAnswers": exam.savedAnswers
          .map((a) => {
                "questionId": a.questionId,
                "correctAnswer": a.correctAnswer,
                "userAnswer": a.userAnswer,
              })
          .toList(),
    });
  }
}
