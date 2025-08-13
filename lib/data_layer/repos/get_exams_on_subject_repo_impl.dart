import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/errors_model.dart';
import 'package:online_exam/core/errors/exceptions.dart';
import 'package:online_exam/data_layer/data_source/get_exam_on_subject_ds.dart';
import 'package:online_exam/domain_layer/repos/get_exams_on_subject_repo.dart';

import '../../domain_layer/models/exams.dart';

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
