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

import '../../features/explore_tab/exam/api/api_client/api_client.dart'
    as _i660;
import '../../features/explore_tab/exam/api/data_sources/offline/exam_offline_data_source_impl.dart'
    as _i355;
import '../../features/explore_tab/exam/api/data_sources/remote/exam_remote_data_source_impl.dart'
    as _i994;
import '../../features/explore_tab/exam/data/data_sources/offline/exam_offline_data_source_contract.dart'
    as _i538;
import '../../features/explore_tab/exam/data/data_sources/remote/exam_reomote_data_source_contract.dart'
    as _i264;
import '../../features/explore_tab/exam/data/repo/exam_repo_impl.dart' as _i953;
import '../../features/explore_tab/exam/domain/repo/exam_repo_contract.dart'
    as _i62;
import '../../features/explore_tab/exam/domain/use_cases/check_answers_usecase.dart'
    as _i844;
import '../../features/explore_tab/exam/domain/use_cases/get_questions_usecase.dart'
    as _i431;
import '../../features/explore_tab/exam/domain/use_cases/save_exam_info_usecase.dart'
    as _i825;
import '../../features/explore_tab/exam/presentaion/view_model/exam_view_model.dart'
    as _i61;
import '../../features/explore_tab/start_exam/api/api_client/api_client.dart'
    as _i557;
import '../../features/explore_tab/start_exam/api/data_sources_impl/get_exam_data_source_impl.dart'
    as _i218;
import '../../features/explore_tab/start_exam/data/data_sources/get_exam_data_source_contract.dart'
    as _i533;
import '../../features/explore_tab/start_exam/data/repo/get_exam_repo_impl.dart'
    as _i385;
import '../../features/explore_tab/start_exam/domain/repo/get_exam_repo_contract.dart'
    as _i744;
import '../../features/explore_tab/start_exam/domain/use_cases/get_exam_use_case.dart'
    as _i928;
import '../../features/explore_tab/start_exam/presention/view_model/get_exam_view_model.dart'
    as _i450;
import '../../features/explore_tab/subject_exams/api/api_client/api_client.dart'
    as _i242;
import '../../features/explore_tab/subject_exams/api/data_sources_impl/subject_exams_impl.dart'
    as _i920;
import '../../features/explore_tab/subject_exams/data/data_sources/subject_exams_data_source_contract.dart'
    as _i388;
import '../../features/explore_tab/subject_exams/data/repos/subject_exams_repo_impl.dart'
    as _i359;
import '../../features/explore_tab/subject_exams/domain/repos/subject_exams_repo_contract.dart'
    as _i844;
import '../../features/explore_tab/subject_exams/domain/use_cases/get_allexams_usecase.dart'
    as _i323;
import '../../features/explore_tab/subject_exams/domain/use_cases/get_subject_exams_usecase.dart'
    as _i399;
import '../../features/explore_tab/subject_exams/presentation/view_model/subject_exams_view_model.dart'
    as _i682;
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
import '../../features/result_tab/api/data_sources/offline/result_tab_offline_data_source_impl.dart'
    as _i772;
import '../../features/result_tab/data/data_sources/offline/result_tab_data_source_contract.dart'
    as _i1020;
import '../../features/result_tab/data/repo/result_tab_repo_contract.dart'
    as _i984;
import '../../features/result_tab/data/repo/result_tab_repo_impl.dart' as _i434;
import '../../features/result_tab/presentaion/view_model/result_tab_view_model.dart'
    as _i159;
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
    gh.factory<_i1020.ResultTabDataSourceContract>(
      () => _i772.ResultTabOfflineDataSourceImpl(),
    );
    gh.factory<_i538.ExamOfflineDataSourceContract>(
      () => _i355.ExamOfflineDataSourceImpl(),
    );
    gh.factory<_i660.ExamApiClient>(() => _i660.ExamApiClient(gh<_i361.Dio>()));
    gh.factory<_i557.GetExamApiClient>(
      () => _i557.GetExamApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i242.GetSubjectExamsAPIClient>(
      () => _i242.GetSubjectExamsAPIClient(gh<_i361.Dio>()),
    );
    gh.factory<_i656.SubjectsApiClient>(
      () => _i656.SubjectsApiClient(gh<_i361.Dio>()),
    );
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
    gh.factory<_i984.ResultTabRepoContract>(
      () => _i434.ResultTabRepoImpl(gh<_i1020.ResultTabDataSourceContract>()),
    );
    gh.factory<_i388.SubjectExamsDataSourceContract>(
      () => _i920.SubjectExamsImpl(gh<_i242.GetSubjectExamsAPIClient>()),
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
    gh.factory<_i159.ResultTabViewModel>(
      () => _i159.ResultTabViewModel(gh<_i984.ResultTabRepoContract>()),
    );
    gh.factory<_i997.ForgetPasswordRemoteDatasourceContract>(
      () => _i306.ForgetPasswordRemoteDatasourceImpl(
        gh<_i421.ForgetPasswordApiClient>(),
      ),
    );
    gh.factory<_i533.GetExamDataSourceContrcat>(
      () => _i218.GetExamDataSourceImpl(gh<_i557.GetExamApiClient>()),
    );
    gh.factory<_i665.ForgetPasswordRepoContract>(
      () => _i576.ForgetPasswordRepoImpl(
        gh<_i997.ForgetPasswordRemoteDatasourceContract>(),
      ),
    );
    gh.factory<_i264.ExamReomoteDataSourceContract>(
      () => _i994.ExamRemoteDataSourceImpl(gh<_i660.ExamApiClient>()),
    );
    gh.factory<_i546.GetallSubjectsUsecase>(
      () => _i546.GetallSubjectsUsecase(gh<_i842.GetallSubjectsRepoContract>()),
    );
    gh.factory<_i844.SubjectExamsRepoContract>(
      () => _i359.SubjectExamsRepoImpl(
        gh<_i388.SubjectExamsDataSourceContract>(),
      ),
    );
    gh.factory<_i62.ExamRepoContract>(
      () => _i953.ExamRepoImpl(
        examRemoteDataSource: gh<_i264.ExamReomoteDataSourceContract>(),
        examOfflineDataSource: gh<_i538.ExamOfflineDataSourceContract>(),
      ),
    );
    gh.factory<_i677.SignupRepoContract>(
      () => _i868.SignupRepoImpl(gh<_i106.SignupRemoteDataSourceContract>()),
    );
    gh.factory<_i939.SubjectsScreenViewmodel>(
      () => _i939.SubjectsScreenViewmodel(gh<_i546.GetallSubjectsUsecase>()),
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
    gh.factory<_i323.GetAllExamsUsecase>(
      () => _i323.GetAllExamsUsecase(gh<_i844.SubjectExamsRepoContract>()),
    );
    gh.factory<_i399.GetSubjectExamsUsecase>(
      () => _i399.GetSubjectExamsUsecase(gh<_i844.SubjectExamsRepoContract>()),
    );
    gh.factory<_i844.CheckAnswersUsecase>(
      () => _i844.CheckAnswersUsecase(examRepo: gh<_i62.ExamRepoContract>()),
    );
    gh.factory<_i431.GetQuestionsUsecase>(
      () => _i431.GetQuestionsUsecase(examRepo: gh<_i62.ExamRepoContract>()),
    );
    gh.factory<_i825.SaveExamInfoUsecase>(
      () => _i825.SaveExamInfoUsecase(examRepo: gh<_i62.ExamRepoContract>()),
    );
    gh.factory<_i744.GetExamRepoContract>(
      () => _i385.GetExamRepoImpl(gh<_i533.GetExamDataSourceContrcat>()),
    );
    gh.factory<_i61.ExamViewModel>(
      () => _i61.ExamViewModel(
        gh<_i431.GetQuestionsUsecase>(),
        gh<_i844.CheckAnswersUsecase>(),
        gh<_i825.SaveExamInfoUsecase>(),
      ),
    );
    gh.factory<_i538.LoginUsecase>(
      () => _i538.LoginUsecase(gh<_i180.LoginRepoContract>()),
    );
    gh.factory<_i25.SignupUsecase>(
      () => _i25.SignupUsecase(gh<_i677.SignupRepoContract>()),
    );
    gh.factory<_i928.GetExamUseCase>(
      () => _i928.GetExamUseCase(
        getExamRepoContract: gh<_i744.GetExamRepoContract>(),
      ),
    );
    gh.factory<_i450.GetExamViewModel>(
      () => _i450.GetExamViewModel(gh<_i928.GetExamUseCase>()),
    );
    gh.factory<_i355.LoginViewModel>(
      () => _i355.LoginViewModel(gh<_i538.LoginUsecase>()),
    );
    gh.factory<_i682.SubjectExamsViewModel>(
      () => _i682.SubjectExamsViewModel(
        gh<_i399.GetSubjectExamsUsecase>(),
        gh<_i323.GetAllExamsUsecase>(),
      ),
    );
    gh.factory<_i560.SignupViewModel>(
      () => _i560.SignupViewModel(gh<_i25.SignupUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i773.DioModule {}
