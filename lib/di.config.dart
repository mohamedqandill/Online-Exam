// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/src/pretty_dio_logger.dart' as _i3;

import 'api_layer/api_service/api_service.dart' as _i5;
import 'api_layer/data_source/get_all_subjects_ds_imp.dart' as _i7;
import 'api_layer/data_source/get_exams_on_subject_ds_imp.dart' as _i12;
import 'api_layer/module/api_module.dart' as _i18;
import 'data_layer/data_source/get_all_subjects_ds.dart' as _i6;
import 'data_layer/data_source/get_exam_on_subject_ds.dart' as _i11;
import 'data_layer/repos/get_all_subjects_repo_impl.dart' as _i9;
import 'data_layer/repos/get_exams_on_subject_repo_impl.dart' as _i14;
import 'domain_layer/repos/get_all_subjects_repo.dart' as _i8;
import 'domain_layer/repos/get_exams_on_subject_repo.dart' as _i13;
import 'domain_layer/use_cases/get_all_subjects_use_case.dart' as _i10;
import 'domain_layer/use_cases/get_exams_on_subjects_use_case.dart' as _i16;
import 'presentation_layer/exams/manager/exams_cubit.dart' as _i17;
import 'presentation_layer/main_layouts/explore/manager/explore_cubit.dart'
    as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiModule = _$ApiModule();
    gh.singleton<_i3.PrettyDioLogger>(() => apiModule.provideDioLogger());
    gh.factory<String>(
      () => apiModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.singleton<_i4.Dio>(
        () => apiModule.provideDio(gh<_i3.PrettyDioLogger>()));
    gh.factory<_i5.ApiService>(() => _i5.ApiService(
          gh<_i4.Dio>(),
          baseUrl: gh<String>(instanceName: 'BaseUrl'),
        ));
    gh.factory<_i6.GetAllSubjectsDataSource>(
        () => _i7.GetAllSubjectsDataSourceImp(gh<_i5.ApiService>()));
    gh.factory<_i8.GetAllSubjectsRepo>(
        () => _i9.GetAllSubjectsRepoImpl(gh<_i6.GetAllSubjectsDataSource>()));
    gh.factory<_i10.GetAllSubjectsUseCase>(
        () => _i10.GetAllSubjectsUseCase(gh<_i8.GetAllSubjectsRepo>()));
    gh.factory<_i11.GetExamOnSubjectDs>(
        () => _i12.GetExamsOnSubjectDSImpl(gh<_i5.ApiService>()));
    gh.factory<_i13.GetExamsOnSubjectsRepo>(
        () => _i14.GetExamsOnSubjectsRepoImpl(gh<_i11.GetExamOnSubjectDs>()));
    gh.factory<_i15.ExploreCubit>(
        () => _i15.ExploreCubit(gh<_i10.GetAllSubjectsUseCase>()));
    gh.factory<_i16.GetExamsOnSubjectUseCase>(
        () => _i16.GetExamsOnSubjectUseCase(gh<_i13.GetExamsOnSubjectsRepo>()));
    gh.factory<_i17.ExamsCubit>(
        () => _i17.ExamsCubit(gh<_i16.GetExamsOnSubjectUseCase>()));
    return this;
  }
}

class _$ApiModule extends _i18.ApiModule {}
