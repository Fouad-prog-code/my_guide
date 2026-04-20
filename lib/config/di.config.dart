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

import '../api/api_services.dart' as _i124;
import '../api/data_sources/remote/doctor_remote_data_source_impl.dart'
    as _i440;
import '../api/data_sources/remote/login_remote_data_source_impl.dart' as _i524;
import '../api/dio/dio_module.dart' as _i223;
import '../data/data_sources/remote/doctor_remote_data_source.dart' as _i943;
import '../data/data_sources/remote/login_remote_data_source.dart' as _i166;
import '../data/repositories/doctor_repository_impl.dart' as _i560;
import '../data/repositories/login_repository_impl.dart' as _i741;
import '../domain/repositories/doctor_repository.dart' as _i787;
import '../domain/repositories/login_repository.dart' as _i907;
import '../domain/use_case/doctor_use_case.dart' as _i240;
import '../domain/use_case/login_use_case.dart' as _i772;
import '../features/ui/auth/login/cubit/login_view_model.dart' as _i1040;
import '../features/ui/screens/doctor/cubit/doctor_view_model.dart' as _i977;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModule.providPprettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i124.ApiServices>(
      () => getItModule.provideApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i943.DoctorRemoteDataSource>(
      () => _i440.DoctorRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i166.LoginRemoteDataSource>(
      () =>
          _i524.LoginRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i907.LoginRepository>(
      () => _i741.LoginRepositoryImpl(
        loginRemoteDataSource: gh<_i166.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i787.DoctorRepository>(
      () => _i560.DoctorRepositoryImpl(
        doctorRemoteDataSource: gh<_i943.DoctorRemoteDataSource>(),
      ),
    );
    gh.factory<_i772.LoginUseCase>(
      () => _i772.LoginUseCase(loginRepository: gh<_i907.LoginRepository>()),
    );
    gh.factory<_i240.DoctorUseCase>(
      () => _i240.DoctorUseCase(doctorRepository: gh<_i787.DoctorRepository>()),
    );
    gh.factory<_i1040.LoginViewModel>(
      () => _i1040.LoginViewModel(loginUseCase: gh<_i772.LoginUseCase>()),
    );
    gh.factory<_i977.DoctorViewModel>(
      () => _i977.DoctorViewModel(doctorUseCase: gh<_i240.DoctorUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i223.GetItModule {}
