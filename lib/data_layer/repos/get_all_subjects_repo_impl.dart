import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/errors_model.dart';
import '../../core/errors/exceptions.dart';
import '../../domain_layer/models/subjects.dart';
import '../../domain_layer/repos/get_all_subjects_repo.dart';
import '../data_source/get_all_subjects_ds.dart';

@Injectable(as: GetAllSubjectsRepo)
class GetAllSubjectsRepoImpl implements GetAllSubjectsRepo {
  GetAllSubjectsDataSource _getAllSubjectsDataSource;

  GetAllSubjectsRepoImpl(this._getAllSubjectsDataSource);

  @override
  Future<Either<ServerExceptions, SubjectWithPagination>> getAllSubjects(
      {int? page}) async {
    try {
      var result = await _getAllSubjectsDataSource.getAllSubjects(page: page);
      return result;
    } catch (e) {
      throw ServerExceptions(errorsModel: ErrorsModel(message: e.toString()));
    }
  }
}
