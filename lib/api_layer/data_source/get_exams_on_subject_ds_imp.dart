import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/api_layer/api_service/api_service.dart';
import 'package:online_exam/core/errors/exceptions.dart';
import 'package:online_exam/data_layer/data_source/get_exam_on_subject_ds.dart';
import 'package:online_exam/domain_layer/models/exams.dart';

import '../../core/errors/errors_model.dart';
import '../../core/functions/handle_dio_errors.dart';

@Injectable(as: GetExamOnSubjectDs)
class GetExamsOnSubjectDSImpl implements GetExamOnSubjectDs {
  ApiService _apiService;
  GetExamsOnSubjectDSImpl(this._apiService);

  @override
  Future<Either<ServerExceptions, List<Exams>>> getExamsOnSubject(
      {required String? subjectId}) async {
    try {
      final response =
          await _apiService.getExamsOnSubject(subjectId: subjectId!);
      var result = response.exams!
          .map(
            (dto) => dto.toExams(),
          )
          .toList();
      return Right(result);
    } on DioException catch (e) {
      return Left(handleDioErrors(e));
    } catch (e) {
      throw ServerExceptions(errorsModel: ErrorsModel(message: e.toString()));
    }
  }
}
