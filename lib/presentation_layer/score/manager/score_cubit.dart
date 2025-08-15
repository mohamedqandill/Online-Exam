import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/domain_layer/use_cases/get_checked_answers_info_use_case.dart';

import '../../../domain_layer/models/checked_questions_info.dart';

part 'score_state.dart';

@injectable
class ScoreCubit extends Cubit<ScoreState> {
  GetCheckedAnswersInfoUseCase _getCheckedAnswersInfoUseCase;

  ScoreCubit(this._getCheckedAnswersInfoUseCase) : super(ScoreInitial());

  late CheckedQuestionsInfo checkedQuestionsInfo;

  Future<void> getScore(Map<String, dynamic> body) async {
    try {
      emit(GetScoreLoading());
      var result = await _getCheckedAnswersInfoUseCase.call(body: body);
      result.fold(
        (l) {
          emit(GetScoreError(l.errorsModel.message));
        },
        (r) {
          checkedQuestionsInfo = r;
          emit(GetScoreSuccess());
        },
      );
    } catch (e) {
      emit(GetScoreError(e.toString()));
    }
  }
}
