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
import 'api_layer/data_source/get_exams_on_subject_ds_imp.dart' as _i647;
import 'api_layer/module/api_module.dart' as _i434;
import 'data_layer/data_source/get_all_subjects_ds.dart' as _i659;
import 'data_layer/data_source/get_exam_on_subject_ds.dart' as _i145;
import 'data_layer/repos/get_all_subjects_repo_impl.dart' as _i1022;
import 'data_layer/repos/get_exams_on_subject_repo_impl.dart' as _i916;
import 'domain_layer/repos/get_all_subjects_repo.dart' as _i248;
import 'domain_layer/repos/get_exams_on_subject_repo.dart' as _i540;
import 'domain_layer/use_cases/get_all_subjects_use_case.dart' as _i90;
import 'domain_layer/use_cases/get_exams_on_subjects_use_case.dart' as _i901;
import 'presentation_layer/exams/manager/exams_cubit.dart' as _i177;
import 'presentation_layer/main_layouts/explore/manager/explore_cubit.dart'
    as _i830;

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
    gh.factory<_i659.GetAllSubjectsDataSource>(
        () => _i152.GetAllSubjectsDataSourceImp(gh<_i362.ApiService>()));
    gh.factory<_i540.GetExamsOnSubjectsRepo>(
        () => _i916.GetExamsOnSubjectsRepoImpl(gh<_i145.GetExamOnSubjectDs>()));
    gh.factory<_i248.GetAllSubjectsRepo>(() =>
        _i1022.GetAllSubjectsRepoImpl(gh<_i659.GetAllSubjectsDataSource>()));
    gh.factory<_i90.GetAllSubjectsUseCase>(
        () => _i90.GetAllSubjectsUseCase(gh<_i248.GetAllSubjectsRepo>()));
    gh.factory<_i830.ExploreCubit>(
        () => _i830.ExploreCubit(gh<_i90.GetAllSubjectsUseCase>()));
    gh.factory<_i901.GetExamsOnSubjectUseCase>(() =>
        _i901.GetExamsOnSubjectUseCase(gh<_i540.GetExamsOnSubjectsRepo>()));
    gh.factory<_i177.ExamsCubit>(
        () => _i177.ExamsCubit(gh<_i901.GetExamsOnSubjectUseCase>()));
    return this;
  }
}

class _$ApiModule extends _i434.ApiModule {}
