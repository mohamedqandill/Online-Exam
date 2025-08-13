import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/domain_layer/models/exams.dart';
import 'package:online_exam/domain_layer/use_cases/get_exams_on_subjects_use_case.dart';

part 'exams_state.dart';

@injectable
class ExamsCubit extends Cubit<ExamsState> {
  GetExamsOnSubjectUseCase _getExamsOnSubjectUseCase;
  ExamsCubit(this._getExamsOnSubjectUseCase) : super(ExamsInitial());

  List<Exams> exams = [];

  Future<void> getExamsOnSubjects({required String subjectId}) async {
    try {
      emit(GetExamsLoading());
      var result = await _getExamsOnSubjectUseCase.call(subjectId: subjectId);
      result.fold(
        (l) {
          emit(GetExamsError(l.errorsModel.message));
        },
        (results) {
          exams.addAll(results);
          emit(GetExamsSuccess());
        },
      );
    } catch (e) {
      emit(GetExamsError(e.toString()));
    }
  }
}
