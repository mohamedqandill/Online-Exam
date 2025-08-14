import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/errors_model.dart';
import 'package:online_exam/core/errors/exceptions.dart';
import 'package:online_exam/data_layer/data_source/get_questions_on_exam_ds.dart';

import '../../domain_layer/models/questions.dart';
import '../../domain_layer/repos/get_questions_on_exam_repo.dart';

@Injectable(as: GetQuestionOnExamRepo)
class GetQuestionsOnExamRepoImpl implements GetQuestionOnExamRepo {
  GetQuestionsOnExamDS _getQuestionsOnExamDS;

  GetQuestionsOnExamRepoImpl(this._getQuestionsOnExamDS);

  @override
  Future<Either<ServerExceptions, Questions>> getQuestionsOnExam(
      {required String? examId}) async {
    try {
      var result =
          await _getQuestionsOnExamDS.getQuestionsOnExam(examId: examId!);
      return result;
    } catch (e) {
      throw ServerExceptions(errorsModel: ErrorsModel(message: e.toString()));
    }
  }
}
