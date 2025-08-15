// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/src/pretty_dio_logger.dart' as _i59;

import 'api_layer/api_service/api_service.dart' as _i362;
import 'api_layer/data_source/get_all_subjects_ds_imp.dart' as _i152;
import 'api_layer/data_source/get_checked_answers_info.dart' as _i212;
import 'api_layer/data_source/get_exams_on_subject_ds_imp.dart' as _i647;
import 'api_layer/data_source/get_questions_on_exam_ds_imp.dart' as _i741;
import 'api_layer/module/api_module.dart' as _i434;
import 'data_layer/data_source/get_all_subjects_ds.dart' as _i659;
import 'data_layer/data_source/get_checked_answers_info.dart' as _i258;
import 'data_layer/data_source/get_exam_on_subject_ds.dart' as _i145;
import 'data_layer/data_source/get_questions_on_exam_ds.dart' as _i563;
import 'data_layer/repos/get_all_subjects_repo_impl.dart' as _i1022;
import 'data_layer/repos/get_checked_answers_info_repo_impl.dart' as _i409;
import 'data_layer/repos/get_exams_on_subject_repo_impl.dart' as _i916;
import 'data_layer/repos/get_questions_on_exam_repo_imp.dart' as _i789;
import 'domain_layer/repos/get_all_subjects_repo.dart' as _i248;
import 'domain_layer/repos/get_checked_answers_info_repo.dart' as _i888;
import 'domain_layer/repos/get_exams_on_subject_repo.dart' as _i540;
import 'domain_layer/repos/get_questions_on_exam_repo.dart' as _i659;
import 'domain_layer/use_cases/get_all_subjects_use_case.dart' as _i90;
import 'domain_layer/use_cases/get_checked_answers_info_use_case.dart' as _i733;
import 'domain_layer/use_cases/get_exams_on_subjects_use_case.dart' as _i901;
import 'domain_layer/use_cases/get_questions_on_exam_use_case.dart' as _i838;
import 'presentation_layer/exams/manager/exams_cubit.dart' as _i177;
import 'presentation_layer/main_layouts/explore/manager/explore_cubit.dart'
    as _i830;
import 'presentation_layer/quiz/manager/quiz_cubit.dart' as _i553;
import 'presentation_layer/score/manager/score_cubit.dart' as _i698;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiModule = _$ApiModule();
    gh.singleton<_i59.PrettyDioLogger>(() => apiModule.provideDioLogger());
    gh.factory<String>(
      () => apiModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.singleton<_i361.Dio>(
        () => apiModule.provideDio(gh<_i59.PrettyDioLogger>()));
    gh.factory<_i362.ApiService>(() => _i362.ApiService(
          gh<_i361.Dio>(),
          baseUrl: gh<String>(instanceName: 'BaseUrl'),
        ));
    gh.factory<_i145.GetExamOnSubjectDs>(
        () => _i647.GetExamsOnSubjectDSImpl(gh<_i362.ApiService>()));
    gh.factory<_i258.GetCheckedAnswersInfoDS>(
        () => _i212.GetCheckedAnswersInfoDSImpl(gh<_i362.ApiService>()));
    gh.factory<_i659.GetAllSubjectsDataSource>(
        () => _i152.GetAllSubjectsDataSourceImp(gh<_i362.ApiService>()));
    gh.factory<_i563.GetQuestionsOnExamDS>(
        () => _i741.GetQuestionsOnExamDSImpl(gh<_i362.ApiService>()));
    gh.factory<_i888.GetCheckedAnswersInfoRepo>(() =>
        _i409.GetCheckedAnswersInfoRepoImpl(
            gh<_i258.GetCheckedAnswersInfoDS>()));
    gh.factory<_i540.GetExamsOnSubjectsRepo>(
        () => _i916.GetExamsOnSubjectsRepoImpl(gh<_i145.GetExamOnSubjectDs>()));
    gh.factory<_i248.GetAllSubjectsRepo>(() =>
        _i1022.GetAllSubjectsRepoImpl(gh<_i659.GetAllSubjectsDataSource>()));
    gh.factory<_i659.GetQuestionOnExamRepo>(() =>
        _i789.GetQuestionsOnExamRepoImpl(gh<_i563.GetQuestionsOnExamDS>()));
    gh.factory<_i90.GetAllSubjectsUseCase>(
        () => _i90.GetAllSubjectsUseCase(gh<_i248.GetAllSubjectsRepo>()));
    gh.factory<_i830.ExploreCubit>(
        () => _i830.ExploreCubit(gh<_i90.GetAllSubjectsUseCase>()));
    gh.factory<_i733.GetCheckedAnswersInfoUseCase>(() =>
        _i733.GetCheckedAnswersInfoUseCase(
            gh<_i888.GetCheckedAnswersInfoRepo>()));
    gh.factory<_i901.GetExamsOnSubjectUseCase>(() =>
        _i901.GetExamsOnSubjectUseCase(gh<_i540.GetExamsOnSubjectsRepo>()));
    gh.factory<_i698.ScoreCubit>(
        () => _i698.ScoreCubit(gh<_i733.GetCheckedAnswersInfoUseCase>()));
    gh.factory<_i838.GetQuestionsOnExamUseCase>(() =>
        _i838.GetQuestionsOnExamUseCase(gh<_i659.GetQuestionOnExamRepo>()));
    gh.factory<_i177.ExamsCubit>(
        () => _i177.ExamsCubit(gh<_i901.GetExamsOnSubjectUseCase>()));
    gh.factory<_i553.QuizCubit>(
        () => _i553.QuizCubit(gh<_i838.GetQuestionsOnExamUseCase>()));
    return this;
  }
}

class _$ApiModule extends _i434.ApiModule {}
