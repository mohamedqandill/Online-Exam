import 'package:dartz/dartz.dart';
import 'package:online_exam/core/errors/exceptions.dart';

import '../../domain_layer/models/subjects.dart';

abstract class GetAllSubjectsDataSource {
  Future<Either<ServerExceptions, SubjectWithPagination>> getAllSubjects(
      {int? page});
}
