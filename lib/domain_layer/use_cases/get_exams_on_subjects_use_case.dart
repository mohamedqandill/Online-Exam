import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/exceptions.dart';
import '../models/exams.dart';
import '../repos/get_exams_on_subject_repo.dart';

@injectable
class GetExamsOnSubjectUseCase {
  GetExamsOnSubjectsRepo _getExamsOnSubjectsRepo;

  GetExamsOnSubjectUseCase(this._getExamsOnSubjectsRepo);

  Future<Either<ServerExceptions, List<Exams>>> call(
          {required String subjectId}) async =>
      await _getExamsOnSubjectsRepo.getExamsOnSubject(subjectId: subjectId);
}
