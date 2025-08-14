import 'package:dartz/dartz.dart';
import 'package:online_exam/core/errors/exceptions.dart';
import 'package:online_exam/domain_layer/models/questions.dart';

abstract class GetQuestionOnExamRepo {
  Future<Either<ServerExceptions, Questions>> getQuestionsOnExam(
      {required String? examId});
}
