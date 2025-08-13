import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain_layer/models/subjects.dart';
import 'package:online_exam/domain_layer/use_cases/get_all_subjects_use_case.dart';

part 'explore_state.dart';

@injectable
class ExploreCubit extends Cubit<ExploreState> {
  GetAllSubjectsUseCase _getAllSubjectsUseCase;
  ExploreCubit(this._getAllSubjectsUseCase) : super(ExploreInitial());
  List<Subjects> subjects = [];
  int _page = 1;
  int _numberOfPage = 0;
  bool isLoading = false;
  final ScrollController scrollController = ScrollController();

  Future<List<Subjects>> getAllSubjects({bool isPagination = false}) async {
    try {
      if (!isPagination) {
        emit(GetSubjectsLoading());
      } else {
        isLoading = true; // عشان نمنع لود تاني وقت الباجينيشن
      }

      var result = await _getAllSubjectsUseCase.call(page: _page);

      result.fold(
        (l) {
          emit(GetSubjectsError(l.errorsModel.message));
        },
        (results) {
          if (isPagination) {
            subjects.addAll(results.subjects!);
          } else {
            subjects = results.subjects ?? [];
          }
          _numberOfPage = results.numberOfPage ?? 0;

          isLoading = false;
          emit(GetSubjectsSuccess());
        },
      );

      return subjects;
    } catch (e) {
      emit(GetSubjectsError(e.toString()));
      isLoading = false;
      rethrow;
    }
  }

  onSubjectScroll() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (_page < _numberOfPage && !isLoading) {
          _page++;
          getAllSubjects(isPagination: true);
        }
      }
    });
  }
}
