import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain_layer/repos/get_all_subjects_repo.dart';

import '../../core/errors/exceptions.dart';
import '../models/subjects.dart';

@injectable
class GetAllSubjectsUseCase {
  GetAllSubjectsRepo _getAllSubjectsRepo;
  GetAllSubjectsUseCase(this._getAllSubjectsRepo);

  Future<Either<ServerExceptions, SubjectWithPagination>> call(
          {int? page}) async =>
      await _getAllSubjectsRepo.getAllSubjects(page: page);
}
