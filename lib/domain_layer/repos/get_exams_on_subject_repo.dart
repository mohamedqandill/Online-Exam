import 'package:dartz/dartz.dart';

import '../../core/errors/exceptions.dart';
import '../models/exams.dart';

abstract class GetExamsOnSubjectsRepo {
  Future<Either<ServerExceptions, List<Exams>>> getExamsOnSubject(
      {required String subjectId});
}
