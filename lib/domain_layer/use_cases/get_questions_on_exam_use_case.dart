import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain_layer/models/questions.dart';
import 'package:online_exam/domain_layer/repos/get_questions_on_exam_repo.dart';

import '../../core/errors/exceptions.dart';

@injectable
class GetQuestionsOnExamUseCase {
  GetQuestionOnExamRepo _getQuestionOnExamRepo;
  GetQuestionsOnExamUseCase(this._getQuestionOnExamRepo);

  Future<Either<ServerExceptions, Questions>> call(
          {required String? examId}) async =>
      await _getQuestionOnExamRepo.getQuestionsOnExam(examId: examId!);
}
