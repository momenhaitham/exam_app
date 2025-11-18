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

import '../../features/exam/api/api_client/api_client.dart' as _i621;
import '../../features/exam/api/data_sources/remote/exam_remote_data_source_impl.dart'
    as _i157;
import '../../features/exam/data/data_sources/remote/exam_reomote_data_source_contract.dart'
    as _i273;
import '../../features/exam/data/repo/exam_repo_impl.dart' as _i790;
import '../../features/exam/domain/repo/exam_repo_contract.dart' as _i651;
import '../../features/exam/domain/use_cases/check_answers_usecase.dart'
    as _i997;
import '../../features/exam/domain/use_cases/get_questions_usecase.dart'
    as _i386;
import '../../features/exam/presentaion/view_model/exam_view_model.dart'
    as _i243;
import '../../features/explore_tab/subjects_screen/api/api_client/api_client.dart'
    as _i656;
import '../../features/explore_tab/subjects_screen/api/data_sources_impls/getall_subjects_remote_data_source_impl.dart'
    as _i471;
import '../../features/explore_tab/subjects_screen/data/data_sources/getall_subjects_remote_data_source_contract.dart'
    as _i411;
import '../../features/explore_tab/subjects_screen/data/repo/getall_subjects_repo_impl.dart'
    as _i149;
import '../../features/explore_tab/subjects_screen/domain/repo/getall_subjects_repo_contract.dart'
    as _i842;
import '../../features/explore_tab/subjects_screen/domain/use_cases/getall_subjects_usecase.dart'
    as _i546;
import '../../features/explore_tab/subjects_screen/presentaion/view_model/subjects_screen_viewmodel.dart'
    as _i939;
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
import '../../features/signup/api/api_client/api_client.dart' as _i334;
import '../../features/signup/api/data_source_impls/signup_remote_data_source_impl.dart'
    as _i825;
import '../../features/signup/data/data_sources/signup_remote_data_source_contract.dart'
    as _i106;
import '../../features/signup/data/repo/signup_repo_impl.dart' as _i868;
import '../../features/signup/domain/repo/signup_repo_contract.dart' as _i677;
import '../../features/signup/domain/use_cases/signup_usecase.dart' as _i25;
import '../../features/signup/presentation/vie_model/signup_view_model.dart'
    as _i560;
import '../dio_module/dio_module.dart' as _i773;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i656.SubjectsApiClient>(
      () => _i656.SubjectsApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i621.ExamApiClient>(() => _i621.ExamApiClient(gh<_i361.Dio>()));
    gh.factory<_i421.ForgetPasswordApiClient>(
      () => _i421.ForgetPasswordApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i62.LoginApiClient>(() => _i62.LoginApiClient(gh<_i361.Dio>()));
    gh.factory<_i334.SignupApiClient>(
      () => _i334.SignupApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i411.GetallSubjectsRemoteDataSourceContract>(
      () => _i471.GetallSubjectsRemoteDataSourceImpl(
        gh<_i656.SubjectsApiClient>(),
      ),
    );
    gh.factory<_i106.SignupRemoteDataSourceContract>(
      () => _i825.SignupRemoteDataSourceImpl(gh<_i334.SignupApiClient>()),
    );
    gh.factory<_i159.LoginRemoteDataSourceContract>(
      () => _i367.LoginRemoteDateSourceImpl(gh<_i62.LoginApiClient>()),
    );
    gh.factory<_i842.GetallSubjectsRepoContract>(
      () => _i149.GetallSubjectsRepoImpl(
        gh<_i411.GetallSubjectsRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i273.ExamReomoteDataSourceContract>(
      () => _i157.ExamRemoteDataSourceImpl(gh<_i621.ExamApiClient>()),
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
    gh.factory<_i546.GetallSubjectsUsecase>(
      () => _i546.GetallSubjectsUsecase(gh<_i842.GetallSubjectsRepoContract>()),
    );
    gh.factory<_i677.SignupRepoContract>(
      () => _i868.SignupRepoImpl(gh<_i106.SignupRemoteDataSourceContract>()),
    );
    gh.factory<_i939.SubjectsScreenViewmodel>(
      () => _i939.SubjectsScreenViewmodel(gh<_i546.GetallSubjectsUsecase>()),
    );
    gh.factory<_i651.ExamRepoContract>(
      () => _i790.ExamRepoImpl(
        examRemoteDataSource: gh<_i273.ExamReomoteDataSourceContract>(),
      ),
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
    gh.factory<_i997.CheckAnswersUsecase>(
      () => _i997.CheckAnswersUsecase(examRepo: gh<_i651.ExamRepoContract>()),
    );
    gh.factory<_i386.GetQuestionsUsecase>(
      () => _i386.GetQuestionsUsecase(examRepo: gh<_i651.ExamRepoContract>()),
    );
    gh.factory<_i180.LoginRepoContract>(
      () => _i176.LoginRepoImpl(gh<_i159.LoginRemoteDataSourceContract>()),
    );
    gh.factory<_i243.ExamViewModel>(
      () => _i243.ExamViewModel(
        gh<_i386.GetQuestionsUsecase>(),
        gh<_i997.CheckAnswersUsecase>(),
      ),
    );
    gh.factory<_i538.LoginUsecase>(
      () => _i538.LoginUsecase(gh<_i180.LoginRepoContract>()),
    );
    gh.factory<_i25.SignupUsecase>(
      () => _i25.SignupUsecase(gh<_i677.SignupRepoContract>()),
    );
    gh.factory<_i355.LoginViewModel>(
      () => _i355.LoginViewModel(gh<_i538.LoginUsecase>()),
    );
    gh.factory<_i560.SignupViewModel>(
      () => _i560.SignupViewModel(gh<_i25.SignupUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i773.DioModule {}
