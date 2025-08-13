import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain_layer/repos/get_exams_on_subject_repo.dart';

import '../../core/errors/exceptions.dart';
import '../models/exams.dart';

@injectable
class GetExamsOnSubjectUseCase {
  GetExamsOnSubjectsRepo _getExamsOnSubjectsRepo;

  GetExamsOnSubjectUseCase(this._getExamsOnSubjectsRepo);

  Future<Either<ServerExceptions, List<Exams>>> call(
          {required String subjectId}) async =>
      await _getExamsOnSubjectsRepo.getExamsOnSubject(subjectId: subjectId);
}
