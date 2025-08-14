import 'package:dartz/dartz.dart';
import '../../core/errors/exceptions.dart';
import '../../domain_layer/models/exams.dart';

abstract class GetExamOnSubjectDs {
  Future<Either<ServerExceptions, List<Exams>>> getExamsOnSubject(
      {required String subjectId});
}
