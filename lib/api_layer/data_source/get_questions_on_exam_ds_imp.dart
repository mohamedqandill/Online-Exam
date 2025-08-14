import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/api_layer/api_service/api_service.dart';
import 'package:online_exam/core/errors/exceptions.dart';
import 'package:online_exam/data_layer/data_source/get_questions_on_exam_ds.dart';
import 'package:online_exam/domain_layer/models/questions.dart';

import '../../core/errors/errors_model.dart';
import '../../core/functions/handle_dio_errors.dart';

@Injectable(as: GetQuestionsOnExamDS)
class GetQuestionsOnExamDSImpl implements GetQuestionsOnExamDS {
  ApiService _apiService;
  GetQuestionsOnExamDSImpl(this._apiService);
  @override
  Future<Either<ServerExceptions, Questions>> getQuestionsOnExam(
      {required String examId}) async {
    try {
      final response = await _apiService.getQuestionsOnExam(examId: examId);
      var result = response.toQuestions();
      return Right(result);
    } on DioException catch (e) {
      return Left(handleDioErrors(e));
    } catch (e) {
      throw ServerExceptions(errorsModel: ErrorsModel(message: e.toString()));
    }
  }
}
