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
import '../api/data_sources/remote/add_doctor_remote_data_source_impl.dart'
    as _i473;
import '../api/data_sources/remote/add_room_remote_data_source_impl.dart'
    as _i494;
import '../api/data_sources/remote/add_student_remote_data_source_impl.dart'
    as _i399;
import '../api/data_sources/remote/add_subject_remote_data_source_impl.dart'
    as _i112;
import '../api/data_sources/remote/doctor_remote_data_source_impl.dart'
    as _i440;
import '../api/data_sources/remote/login_remote_data_source_impl.dart' as _i524;
import '../api/dio/dio_module.dart' as _i223;
import '../data/data_sources/remote/add_doctor_remote_data_source.dart'
    as _i580;
import '../data/data_sources/remote/add_room_remote_data_source.dart' as _i901;
import '../data/data_sources/remote/add_student_remote_data_source.dart'
    as _i32;
import '../data/data_sources/remote/add_subject_remote_data_source.dart'
    as _i747;
import '../data/data_sources/remote/doctor_remote_data_source.dart' as _i943;
import '../data/data_sources/remote/login_remote_data_source.dart' as _i166;
import '../data/repositories/add_doctor_repository_impl.dart' as _i712;
import '../data/repositories/add_room_repository_impl.dart' as _i89;
import '../data/repositories/add_student_repository_impl.dart' as _i1060;
import '../data/repositories/add_subject_repository_impl.dart' as _i540;
import '../data/repositories/doctor_repository_impl.dart' as _i560;
import '../data/repositories/login_repository_impl.dart' as _i741;
import '../domain/repositories/add_doctor_repository.dart' as _i495;
import '../domain/repositories/add_room_repository.dart' as _i446;
import '../domain/repositories/add_student_repository.dart' as _i546;
import '../domain/repositories/add_subject_repository.dart' as _i435;
import '../domain/repositories/doctor_repository.dart' as _i787;
import '../domain/repositories/login_repository.dart' as _i907;
import '../domain/use_case/add_doctor_use_case.dart' as _i972;
import '../domain/use_case/add_room_use_case.dart' as _i352;
import '../domain/use_case/add_student_use_case.dart' as _i805;
import '../domain/use_case/add_subject_use_case.dart' as _i947;
import '../domain/use_case/doctor_use_case.dart' as _i240;
import '../domain/use_case/login_use_case.dart' as _i772;
import '../features/ui/admin/screens/doctor_screen/cubit/doctor_view_model.dart'
    as _i758;
import '../features/ui/admin/screens/room_screen/cubit/room_view_model.dart'
    as _i621;
import '../features/ui/admin/screens/student_screen/cubit/student_view_model.dart'
    as _i372;
import '../features/ui/admin/screens/subject_screen/cubit/subject_view_model.dart'
    as _i734;
import '../features/ui/auth/login/cubit/login_view_model.dart' as _i1040;
import '../features/ui/screens/doctor_schedule/cubit/doctor_schedule_view_model.dart'
    as _i1036;

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
    gh.factory<_i32.AddStudentRemoteDataSource>(
      () => _i399.AddStudentRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i901.AddRoomRemoteDataSource>(
      () => _i494.AddRoomRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i943.DoctorRemoteDataSource>(
      () => _i440.DoctorRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i546.AddStudentRepository>(
      () => _i1060.AddStudentRepositoryImpl(
        addStudentRemoteDataSource: gh<_i32.AddStudentRemoteDataSource>(),
      ),
    );
    gh.factory<_i580.AddDoctorRemoteDataSource>(
      () => _i473.AddDoctorRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i747.AddSubjectRemoteDataSource>(
      () => _i112.AddSubjectRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i166.LoginRemoteDataSource>(
      () =>
          _i524.LoginRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i495.AddDoctorRepository>(
      () => _i712.AddDoctorRepositoryImpl(
        addDoctorRemoteDataSource: gh<_i580.AddDoctorRemoteDataSource>(),
      ),
    );
    gh.factory<_i907.LoginRepository>(
      () => _i741.LoginRepositoryImpl(
        loginRemoteDataSource: gh<_i166.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i435.AddSubjectRepository>(
      () => _i540.AddSubjectRepositoryImpl(
        addSubjectRemoteDataSource: gh<_i747.AddSubjectRemoteDataSource>(),
      ),
    );
    gh.factory<_i805.AddStudentUseCase>(
      () => _i805.AddStudentUseCase(
        addStudentRepository: gh<_i546.AddStudentRepository>(),
      ),
    );
    gh.factory<_i372.StudentViewModel>(
      () => _i372.StudentViewModel(
        addStudentUseCase: gh<_i805.AddStudentUseCase>(),
      ),
    );
    gh.factory<_i972.AddDoctorUseCase>(
      () => _i972.AddDoctorUseCase(
        addDoctorRepository: gh<_i495.AddDoctorRepository>(),
      ),
    );
    gh.factory<_i446.AddRoomRepository>(
      () => _i89.AddRoomRepositoryImpl(
        addRoomRemoteDataSource: gh<_i901.AddRoomRemoteDataSource>(),
      ),
    );
    gh.factory<_i787.DoctorRepository>(
      () => _i560.DoctorRepositoryImpl(
        doctorRemoteDataSource: gh<_i943.DoctorRemoteDataSource>(),
      ),
    );
    gh.factory<_i947.AddSubjectUseCase>(
      () => _i947.AddSubjectUseCase(
        addSubjectRepository: gh<_i435.AddSubjectRepository>(),
      ),
    );
    gh.factory<_i772.LoginUseCase>(
      () => _i772.LoginUseCase(loginRepository: gh<_i907.LoginRepository>()),
    );
    gh.factory<_i758.DoctorViewModel>(
      () =>
          _i758.DoctorViewModel(addDoctorUseCase: gh<_i972.AddDoctorUseCase>()),
    );
    gh.factory<_i352.AddRoomUseCase>(
      () => _i352.AddRoomUseCase(
        addRoomRepository: gh<_i446.AddRoomRepository>(),
      ),
    );
    gh.factory<_i240.DoctorUseCase>(
      () => _i240.DoctorUseCase(doctorRepository: gh<_i787.DoctorRepository>()),
    );
    gh.factory<_i1040.LoginViewModel>(
      () => _i1040.LoginViewModel(loginUseCase: gh<_i772.LoginUseCase>()),
    );
    gh.factory<_i734.SubjectViewModel>(
      () => _i734.SubjectViewModel(
        addSubjectUseCase: gh<_i947.AddSubjectUseCase>(),
      ),
    );
    gh.factory<_i621.RoomViewModel>(
      () => _i621.RoomViewModel(addRoomUseCase: gh<_i352.AddRoomUseCase>()),
    );
    gh.factory<_i1036.DoctorScheduleViewModel>(
      () => _i1036.DoctorScheduleViewModel(
        doctorUseCase: gh<_i240.DoctorUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i223.GetItModule {}
