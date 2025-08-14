import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain_layer/models/checked_questions_info.dart';
import 'package:online_exam/domain_layer/repos/get_checked_answers_info_repo.dart';

import '../../core/errors/exceptions.dart';

@injectable
class GetCheckedAnswersInfoUseCase {
  GetCheckedAnswersInfoRepo _getCheckedAnswersInfoRepo;

  GetCheckedAnswersInfoUseCase(this._getCheckedAnswersInfoRepo);

  Future<Either<ServerExceptions, CheckedQuestionsInfo>> call(
          {required Map<String, dynamic> body}) async =>
      await _getCheckedAnswersInfoRepo.getCheckedAnswersInfo(body: body);
}
