import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/errors_model.dart';
import 'package:online_exam/core/errors/exceptions.dart';
import 'package:online_exam/domain_layer/models/checked_questions_info.dart';
import 'package:online_exam/domain_layer/repos/get_checked_answers_info_repo.dart';

import '../data_source/get_checked_answers_info.dart';

@Injectable(as: GetCheckedAnswersInfoRepo)
class GetCheckedAnswersInfoRepoImpl implements GetCheckedAnswersInfoRepo {
  GetCheckedAnswersInfoDS _getCheckedAnswersInfoDS;

  GetCheckedAnswersInfoRepoImpl(this._getCheckedAnswersInfoDS);

  @override
  Future<Either<ServerExceptions, CheckedQuestionsInfo>> getCheckedAnswersInfo(
      {required Map<String, dynamic> body}) async {
    try {
      var result =
          await _getCheckedAnswersInfoDS.getCheckedAnswersInfo(body: body);
      return result;
    } catch (e) {
      throw ServerExceptions(errorsModel: ErrorsModel(message: e.toString()));
    }
  }
}
