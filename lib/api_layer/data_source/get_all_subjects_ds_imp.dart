import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/errors_model.dart';
import '../../core/errors/exceptions.dart';
import '../../core/functions/handle_dio_errors.dart';
import '../../data_layer/data_source/get_all_subjects_ds.dart';
import '../../domain_layer/models/subjects.dart';
import '../api_service/api_service.dart';

@Injectable(as: GetAllSubjectsDataSource)
class GetAllSubjectsDataSourceImp implements GetAllSubjectsDataSource {
  ApiService _apiService;

  GetAllSubjectsDataSourceImp(this._apiService);

  @override
  Future<Either<ServerExceptions, SubjectWithPagination>> getAllSubjects(
      {int? page}) async {
    try {
      final response = await _apiService.getSubjects(page: page);
      var result = SubjectWithPagination(
          subjects: response.subjects?.map((dto) => dto.toSubject()).toList() ?? [],
          numberOfPage: response.pagination!.numberOfPages);
      return Right(result);
    } on DioException catch (e) {
      return Left(handleDioErrors(e));
    } catch (e) {
      throw ServerExceptions(errorsModel: ErrorsModel(message: e.toString()));
    }
  }
}
