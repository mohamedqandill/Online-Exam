import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/errors_model.dart';
import '../../core/errors/exceptions.dart';
import '../../core/functions/handle_dio_errors.dart';
import '../../data_layer/data_source/get_exam_on_subject_ds.dart';
import '../../domain_layer/models/exams.dart';
import '../api_service/api_service.dart';

@Injectable(as: GetExamOnSubjectDs)
class GetExamsOnSubjectDSImpl implements GetExamOnSubjectDs {
  ApiService _apiService;
  GetExamsOnSubjectDSImpl(this._apiService);

  @override
  Future<Either<ServerExceptions, List<Exams>>> getExamsOnSubject(
      {required String subjectId}) async {
    try {
      final response =
          await _apiService.getExamsOnSubject(subjectId: subjectId);
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
