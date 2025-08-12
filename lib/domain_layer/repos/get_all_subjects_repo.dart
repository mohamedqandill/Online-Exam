import 'package:dartz/dartz.dart';
import 'package:online_exam/domain_layer/models/subjects.dart';

import '../../core/errors/exceptions.dart';

abstract class GetAllSubjectsRepo {
  Future<Either<ServerExceptions, SubjectWithPagination>> getAllSubjects(
      {int? page});
}
