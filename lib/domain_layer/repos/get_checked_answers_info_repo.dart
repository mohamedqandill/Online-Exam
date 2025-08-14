import 'package:dartz/dartz.dart';
import 'package:online_exam/domain_layer/models/checked_questions_info.dart';

import '../../core/errors/exceptions.dart';

abstract class GetCheckedAnswersInfoRepo {
  Future<Either<ServerExceptions, CheckedQuestionsInfo>> getCheckedAnswersInfo(
      {required Map<String, dynamic> body});
}
