import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/errors_model.dart';
import '../../core/errors/exceptions.dart';
import '../../domain_layer/models/exams.dart';
import '../../domain_layer/repos/get_exams_on_subject_repo.dart';
import '../data_source/get_exam_on_subject_ds.dart';

@Injectable(as: GetExamsOnSubjectsRepo)
class GetExamsOnSubjectsRepoImpl implements GetExamsOnSubjectsRepo {
  GetExamOnSubjectDs _getExamOnSubjectDs;

  GetExamsOnSubjectsRepoImpl(this._getExamOnSubjectDs);

  @override
  Future<Either<ServerExceptions, List<Exams>>> getExamsOnSubject(
      {required String subjectId}) async {
    try {
      var result =
          await _getExamOnSubjectDs.getExamsOnSubject(subjectId: subjectId);
      return result;
    } catch (e) {
      throw ServerExceptions(errorsModel: ErrorsModel(message: e.toString()));
    }
  }
}
