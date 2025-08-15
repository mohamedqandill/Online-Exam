import 'dart:developer';

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

  static Future<List<SavedExams>> getAllExams() async {
    var box = Hive.isBoxOpen(boxName)
        ? Hive.box(boxName)
        : await Hive.openBox(boxName);

    return box.values.map((e) {
      var savedAnswers = (e["savedAnswers"] as List)
          .map((a) => SavedAnswers(
                questionId: a["questionId"],
                correctAnswer: a["correctAnswer"],
                userAnswer: a["userAnswer"],
              ))
          .toList();

      return SavedExams(
        examId: e["examId"],
        examDuration: e["duration"],
        numberOfQuestions: e["noOfQuestions"],
        examTitle: e["title"],
        savedAnswers: savedAnswers,
      );
    }).toList();
  }

  static Future<void> saveExam(SavedExams exam) async {
    var box = Hive.isBoxOpen(boxName)
        ? Hive.box(boxName)
        : await Hive.openBox(boxName);
    await box.put(exam.examId, {
      "examId": exam.examId,
      "duration": exam.examDuration,
      "noOfQuestions": exam.numberOfQuestions,
      "title": exam.examTitle,
      "savedAnswers": exam.savedAnswers
          .map((a) => {
                "questionId": a.questionId,
                "correctAnswer": a.correctAnswer,
                "userAnswer": a.userAnswer,
              })
          .toList(),
    });
    log(exam.examTitle);
    log(exam.examDuration.toString());
    log(exam.examId);
    log(exam.numberOfQuestions.toString());
    log(exam.savedAnswers.length.toString());
  }
}
