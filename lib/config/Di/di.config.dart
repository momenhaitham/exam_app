// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i159.LoginRemoteDataSourceContract>(
      () => _i367.LoginRemoteDateSourceImpl(gh<_i62.LoginApiClient>()),
    );
    gh.factory<_i180.LoginRepoContract>(
      () => _i176.LoginRepoImpl(gh<_i159.LoginRemoteDataSourceContract>()),
    );
    gh.factory<_i538.LoginUsecase>(
      () => _i538.LoginUsecase(gh<_i180.LoginRepoContract>()),
    );
    gh.factory<_i355.LoginViewModel>(
      () => _i355.LoginViewModel(gh<_i538.LoginUsecase>()),
    );
    return this;
  }
}
