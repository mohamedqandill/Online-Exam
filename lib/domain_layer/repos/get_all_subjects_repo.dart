import 'package:dartz/dartz.dart';
import '../../core/errors/exceptions.dart';
import '../models/subjects.dart';

abstract class GetAllSubjectsRepo {
  Future<Either<ServerExceptions, SubjectWithPagination>> getAllSubjects(
      {int? page});
}
