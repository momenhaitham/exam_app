// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/forget_password/api/api_client/api_client.dart' as _i421;
import '../../features/forget_password/api/data_sources_impls/forget_password_remote_datasource_impl.dart'
    as _i306;
import '../../features/forget_password/data/data_sources/forget_password_remote_datasource_contract.dart'
    as _i997;
import '../../features/forget_password/data/repo/forget_password_repo_impl.dart'
    as _i576;
import '../../features/forget_password/domain/repo/forget_password_repo_contract.dart'
    as _i665;
import '../../features/forget_password/domain/use_cases/forget_password_usecase.dart'
    as _i559;
import '../../features/forget_password/domain/use_cases/reset_password_usecase.dart'
    as _i907;
import '../../features/forget_password/domain/use_cases/Virefy_reset_code_usecase.dart'
    as _i998;
import '../../features/forget_password/presentaion/view_model/forget_password_view_model.dart'
    as _i171;
import '../../features/login/api/api_client/api_client.dart' as _i62;
import '../../features/login/api/data_sources_impls/login_remote_date_source_impl.dart'
    as _i367;
import '../../features/login/data/data_sources/login_remote_data_source_contract.dart'
    as _i159;
import '../../features/login/data/repo/login_repo_impl.dart' as _i176;
import '../../features/login/domain/repo/login_repo_contract.dart' as _i180;
import '../../features/login/domain/use_cases/login_usecase.dart' as _i538;
import '../../features/login/presentaion/view_model/login_view_model.dart'
    as _i355;
import '../../features/start_exam/api/api_client/api_client.dart' as _i604;
import '../../features/start_exam/api/data_sources_impl/get_exam_data_source_impl.dart'
    as _i426;
import '../../features/start_exam/data/data_sources/get_exam_data_source_contract.dart'
    as _i353;
import '../../features/start_exam/data/repo/get_exam_repo_impl.dart' as _i699;
import '../../features/start_exam/domain/repo/get_exam_repo_contract.dart'
    as _i881;
import '../../features/start_exam/domain/use_cases/get_exam_use_case.dart'
    as _i972;
import '../../features/start_exam/presention/view_model/get_exam_view_model.dart'
    as _i741;
import '../../features/subject_exams/api/api_client/api_client.dart' as _i517;
import '../../features/subject_exams/api/data_sources_impl/subject_exams_impl.dart'
    as _i958;
import '../../features/subject_exams/data/data_sources/subject_exams_data_source_contract.dart'
    as _i212;
import '../../features/subject_exams/data/repos/subject_exams_repo_impl.dart'
    as _i866;
import '../../features/subject_exams/domain/repos/subject_exams_repo_contract.dart'
    as _i0;
import '../../features/subject_exams/domain/use_cases/get_subject_exams_usecase.dart'
    as _i806;
import '../../features/subject_exams/presentation/view_model/subject_exams_view_model.dart'
    as _i806;
import '../dio_module/dio_module.dart' as _i773;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i361.Dio>(() => dioModule.provideDio());
    gh.factory<_i528.PrettyDioLogger>(() => dioModule.dioLogger());
    gh.factory<_i421.ForgetPasswordApiClient>(
      () => _i421.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i62.LoginApiClient>(() => _i62.LoginApiClient(gh<_i361.Dio>()));
    gh.factory<_i604.GetExamApiClient>(
      () => _i604.GetExamApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i517.GetSubjectExamsAPIClient>(
      () => _i517.GetSubjectExamsAPIClient(gh<_i361.Dio>()),
    );
    gh.factory<_i212.SubjectExamsDataSourceContract>(
      () => _i958.SubjectExamsImpl(gh<_i517.GetSubjectExamsAPIClient>()),
    );
    gh.factory<_i353.GetExamDataSourceContrcat>(
      () => _i426.GetExamDataSourceImpl(gh<_i604.GetExamApiClient>()),
    );
    gh.factory<_i159.LoginRemoteDataSourceContract>(
      () => _i367.LoginRemoteDateSourceImpl(gh<_i62.LoginApiClient>()),
    );
    gh.factory<_i0.SubjectExamsRepoContract>(
      () => _i866.SubjectExamsRepoImpl(
        gh<_i212.SubjectExamsDataSourceContract>(),
      ),
    );
    gh.factory<_i997.ForgetPasswordRemoteDatasourceContract>(
      () => _i306.ForgetPasswordRemoteDatasourceImpl(
        gh<_i421.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i665.ForgetPasswordRepoContract>(
      () => _i576.ForgetPasswordRepoImpl(
        gh<_i997.ForgetPasswordRemoteDatasourceContract>(),
      ),
    );
    gh.factory<_i881.GetExamRepoContract>(
      () => _i699.GetExamRepoImpl(gh<_i353.GetExamDataSourceContrcat>()),
    );
    gh.factory<_i806.GetSubjectExamsUsecase>(
      () => _i806.GetSubjectExamsUsecase(gh<_i0.SubjectExamsRepoContract>()),
    );
    gh.lazySingleton<_i998.VirefyResetCodeUsecase>(
      () =>
          _i998.VirefyResetCodeUsecase(gh<_i665.ForgetPasswordRepoContract>()),
    );
    gh.lazySingleton<_i559.ForgetPasswordUsecase>(
      () => _i559.ForgetPasswordUsecase(gh<_i665.ForgetPasswordRepoContract>()),
    );
    gh.lazySingleton<_i907.ResetPasswordUsecase>(
      () => _i907.ResetPasswordUsecase(gh<_i665.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i171.ForgetPasswordViewModel>(
      () => _i171.ForgetPasswordViewModel(
        gh<_i559.ForgetPasswordUsecase>(),
        gh<_i907.ResetPasswordUsecase>(),
        gh<_i998.VirefyResetCodeUsecase>(),
      ),
    );
    gh.factory<_i180.LoginRepoContract>(
      () => _i176.LoginRepoImpl(gh<_i159.LoginRemoteDataSourceContract>()),
    );
    gh.factory<_i972.GetExamUseCase>(
      () => _i972.GetExamUseCase(
        getExamRepoContract: gh<_i881.GetExamRepoContract>(),
      ),
    );
    gh.factory<_i538.LoginUsecase>(
      () => _i538.LoginUsecase(gh<_i180.LoginRepoContract>()),
    );
    gh.factory<_i806.SubjectExamsViewModel>(
      () => _i806.SubjectExamsViewModel(gh<_i806.GetSubjectExamsUsecase>()),
    );
    gh.factory<_i355.LoginViewModel>(
      () => _i355.LoginViewModel(gh<_i538.LoginUsecase>()),
    );
    gh.factory<_i741.GetExamViewModel>(
      () => _i741.GetExamViewModel(gh<_i972.GetExamUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i773.DioModule {}
