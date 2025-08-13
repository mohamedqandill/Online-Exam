import 'package:dartz/dartz.dart';
import 'package:online_exam/core/errors/exceptions.dart';
import 'package:online_exam/domain_layer/models/exams.dart';

abstract class GetExamsOnSubjectsRepo {
  Future<Either<ServerExceptions, List<Exams>>> getExamsOnSubject(
      {required String subjectId});
}
