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

import '../../features/login/api/api_client/api_client.dart' as _i62;
import '../../features/login/api/data_sources_impls/login_remote_date_source_impl.dart'
    as _i367;
import '../../features/login/api/data_sources_impls/signup_remote_data_source_impl.dart'
    as _i337;
import '../../features/login/data/data_sources/login_remote_data_source_contract.dart'
    as _i159;
import '../../features/login/data/data_sources/signup_remote_data_source_contract.dart'
    as _i482;
import '../../features/login/data/repo/login_repo_impl.dart' as _i176;
import '../../features/login/data/repo/signup_repo_impl.dart' as _i163;
import '../../features/login/domain/repo/login_repo_contract.dart' as _i180;
import '../../features/login/domain/repo/signup_repo_contract.dart' as _i485;
import '../../features/login/domain/use_cases/login_usecase.dart' as _i538;
import '../../features/login/domain/use_cases/signup_usecase.dart' as _i19;
import '../../features/login/presentaion/view_model/login_view_model.dart'
    as _i355;
import '../../features/login/presentaion/view_model/signup_view_model.dart'
    as _i435;
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
    gh.singleton<_i62.ApiClient>(() => dioModule.apiClient(gh<_i361.Dio>()));
    gh.factory<_i482.SignupRemoteDataSourceContract>(
      () => _i337.SignupRemoteDataSourceImpl(gh<_i62.ApiClient>()),
    );
    gh.factory<_i159.LoginRemoteDataSourceContract>(
      () => _i367.LoginRemoteDateSourceImpl(gh<_i62.ApiClient>()),
    );
    gh.factory<_i180.LoginRepoContract>(
      () => _i176.LoginRepoImpl(gh<_i159.LoginRemoteDataSourceContract>()),
    );
    gh.factory<_i485.SignupRepoContract>(
      () => _i163.SignupRepoImpl(gh<_i482.SignupRemoteDataSourceContract>()),
    );
    gh.factory<_i538.LoginUsecase>(
      () => _i538.LoginUsecase(gh<_i180.LoginRepoContract>()),
    );
    gh.factory<_i19.SignupUsecase>(
      () => _i19.SignupUsecase(gh<_i485.SignupRepoContract>()),
    );
    gh.factory<_i355.LoginViewModel>(
      () => _i355.LoginViewModel(gh<_i538.LoginUsecase>()),
    );
    gh.factory<_i435.SignupViewModel>(
      () => _i435.SignupViewModel(gh<_i19.SignupUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i773.DioModule {}
