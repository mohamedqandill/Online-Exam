import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/api_layer/api_service/api_service.dart';
import 'package:online_exam/core/errors/errors_model.dart';
import 'package:online_exam/core/functions/handle_dio_errors.dart';
import 'package:online_exam/domain_layer/models/checked_questions_info.dart';

import '../../core/errors/exceptions.dart';
import '../../data_layer/data_source/get_checked_answers_info.dart';

@Injectable(as: GetCheckedAnswersInfoDS)
class GetCheckedAnswersInfoDSImpl implements GetCheckedAnswersInfoDS {
  ApiService _apiService;

  GetCheckedAnswersInfoDSImpl(this._apiService);

  @override
  Future<Either<ServerExceptions, CheckedQuestionsInfo>> getCheckedAnswersInfo(
      {required Map<String, dynamic> body}) async {
    try {
      final response = await _apiService.checkQuestions(body: body);
      var result = response.toCheckedQuestionsInfo();
      return Right(result);
    } on DioException catch (e) {
      return Left(handleDioErrors(e));
    } catch (e) {
      throw ServerExceptions(errorsModel: ErrorsModel(message: e.toString()));
    }
  }
}
