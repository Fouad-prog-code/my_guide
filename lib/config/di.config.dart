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
import '../api/data_sources/remote/add_manager_remote_data_source_impl.dart'
    as _i782;
import '../api/data_sources/remote/add_room_remote_data_source_impl.dart'
    as _i494;
import '../api/data_sources/remote/add_student_remote_data_source_impl.dart'
    as _i399;
import '../api/data_sources/remote/add_subject_remote_data_source_impl.dart'
    as _i112;
import '../api/data_sources/remote/dashboard_remote_data_source_impl.dart'
    as _i397;
import '../api/data_sources/remote/delete_doctor_remote_data_source_impl.dart'
    as _i479;
import '../api/data_sources/remote/delete_room_remote_data_source_impl.dart'
    as _i626;
import '../api/data_sources/remote/delete_student_remote_data_source_impl.dart'
    as _i456;
import '../api/data_sources/remote/delete_subject_remote_data_source_impl.dart'
    as _i839;
import '../api/data_sources/remote/doctor_remote_data_source_impl.dart'
    as _i440;
import '../api/data_sources/remote/forget_password_remote_data_source_impl.dart'
    as _i273;
import '../api/data_sources/remote/get_doctor_remote_data_source_impl.dart'
    as _i30;
import '../api/data_sources/remote/get_room_remote_data_source_impl.dart'
    as _i1012;
import '../api/data_sources/remote/get_student_remote_data_source_impl.dart'
    as _i475;
import '../api/data_sources/remote/get_subject_remote_data_source_impl.dart'
    as _i423;
import '../api/data_sources/remote/login_remote_data_source_impl.dart' as _i524;
import '../api/data_sources/remote/room_remote_data_source_impl.dart' as _i1057;
import '../api/data_sources/remote/student_remote_data_source_impl.dart'
    as _i420;
import '../api/data_sources/remote/update_doctor_remote_data_source_impl.dart'
    as _i675;
import '../api/data_sources/remote/update_room_remote_data_source_impl.dart'
    as _i28;
import '../api/dio/dio_module.dart' as _i223;
import '../data/data_sources/remote/add_doctor_remote_data_source.dart'
    as _i580;
import '../data/data_sources/remote/add_manager_remote_data_source.dart'
    as _i625;
import '../data/data_sources/remote/add_room_remote_data_source.dart' as _i901;
import '../data/data_sources/remote/add_student_remote_data_source.dart'
    as _i32;
import '../data/data_sources/remote/add_subject_remote_data_source.dart'
    as _i747;
import '../data/data_sources/remote/dashboard_remote_data_source.dart' as _i763;
import '../data/data_sources/remote/delete_doctor_remote_data_source.dart'
    as _i477;
import '../data/data_sources/remote/delete_room_remote_data_source.dart'
    as _i820;
import '../data/data_sources/remote/delete_student_remote_data_source.dart'
    as _i555;
import '../data/data_sources/remote/delete_subject_remote_data_source.dart'
    as _i698;
import '../data/data_sources/remote/doctor_remote_data_source.dart' as _i943;
import '../data/data_sources/remote/forget_password_remote_data_source.dart'
    as _i144;
import '../data/data_sources/remote/get_doctor_remote_data_source.dart'
    as _i1020;
import '../data/data_sources/remote/get_room_remote_data_source.dart' as _i750;
import '../data/data_sources/remote/get_student_remote_data_source.dart'
    as _i1038;
import '../data/data_sources/remote/get_subject_remote_data_source.dart'
    as _i272;
import '../data/data_sources/remote/login_remote_data_source.dart' as _i166;
import '../data/data_sources/remote/room_remote_data_source.dart' as _i315;
import '../data/data_sources/remote/student_remote_data_source.dart' as _i975;
import '../data/data_sources/remote/update_doctor_remote_data_source.dart'
    as _i545;
import '../data/data_sources/remote/update_room_remote_data_source.dart'
    as _i156;
import '../data/repositories/add_doctor_repository_impl.dart' as _i712;
import '../data/repositories/add_manager_repository_impl.dart' as _i938;
import '../data/repositories/add_room_repository_impl.dart' as _i89;
import '../data/repositories/add_student_repository_impl.dart' as _i1060;
import '../data/repositories/add_subject_repository_impl.dart' as _i540;
import '../data/repositories/dashboard_repository_impl.dart' as _i585;
import '../data/repositories/delete_doctor_repository_impl.dart' as _i829;
import '../data/repositories/delete_room_repository_impl.dart' as _i743;
import '../data/repositories/delete_student_repository_impl.dart' as _i98;
import '../data/repositories/delete_subject_repository_impl.dart' as _i47;
import '../data/repositories/doctor_repository_impl.dart' as _i560;
import '../data/repositories/forget_password_repository_impl.dart' as _i924;
import '../data/repositories/get_doctor_repository_impl.dart' as _i376;
import '../data/repositories/get_room_repository_impl.dart' as _i379;
import '../data/repositories/get_student_repository_impl.dart' as _i183;
import '../data/repositories/get_subject_repository_impl.dart' as _i1027;
import '../data/repositories/login_repository_impl.dart' as _i741;
import '../data/repositories/room_repository_impl.dart' as _i809;
import '../data/repositories/student_repository_impl.dart' as _i382;
import '../data/repositories/update_doctor_repository_impl.dart' as _i724;
import '../data/repositories/update_room_repository_impl.dart' as _i496;
import '../domain/repositories/add_doctor_repository.dart' as _i495;
import '../domain/repositories/add_manager_repository.dart' as _i846;
import '../domain/repositories/add_room_repository.dart' as _i446;
import '../domain/repositories/add_student_repository.dart' as _i546;
import '../domain/repositories/add_subject_repository.dart' as _i435;
import '../domain/repositories/dashboard_repository.dart' as _i525;
import '../domain/repositories/delete_doctor_repository.dart' as _i387;
import '../domain/repositories/delete_room_repository.dart' as _i520;
import '../domain/repositories/delete_student_repository.dart' as _i736;
import '../domain/repositories/delete_subject_repository.dart' as _i378;
import '../domain/repositories/doctor_repository.dart' as _i787;
import '../domain/repositories/forget_password_repository.dart' as _i1053;
import '../domain/repositories/get_doctor_repository.dart' as _i177;
import '../domain/repositories/get_room_repository.dart' as _i363;
import '../domain/repositories/get_student_repository.dart' as _i413;
import '../domain/repositories/get_subject_repository.dart' as _i110;
import '../domain/repositories/login_repository.dart' as _i907;
import '../domain/repositories/room_/room_repository.dart' as _i313;
import '../domain/repositories/student_/student_repository.dart' as _i646;
import '../domain/repositories/update_doctor_repository.dart' as _i365;
import '../domain/repositories/update_room_repository.dart' as _i602;
import '../domain/use_case/add_doctor_use_case.dart' as _i972;
import '../domain/use_case/add_manager_use_case.dart' as _i380;
import '../domain/use_case/add_room_use_case.dart' as _i352;
import '../domain/use_case/add_student_use_case.dart' as _i805;
import '../domain/use_case/add_subject_use_case.dart' as _i947;
import '../domain/use_case/dashboard_use_case.dart' as _i790;
import '../domain/use_case/delete_doctor_use_case.dart' as _i172;
import '../domain/use_case/delete_room_use_case.dart' as _i814;
import '../domain/use_case/delete_student_use_case.dart' as _i473;
import '../domain/use_case/delete_subject_use_case.dart' as _i728;
import '../domain/use_case/doctor_use_case.dart' as _i240;
import '../domain/use_case/forget_password_use_case.dart' as _i349;
import '../domain/use_case/get_doctor_use_case.dart' as _i175;
import '../domain/use_case/get_room_use_case.dart' as _i578;
import '../domain/use_case/get_student_use_case.dart' as _i882;
import '../domain/use_case/get_subject_use_case.dart' as _i100;
import '../domain/use_case/login_use_case.dart' as _i772;
import '../domain/use_case/rooms_use_case.dart' as _i46;
import '../domain/use_case/student_schedule_use_case.dart' as _i993;
import '../domain/use_case/update_doctor_use_case.dart' as _i456;
import '../domain/use_case/update_room_use_case.dart' as _i811;
import '../features/ui/admin/screens/dashboard_screen/cubit/dashboard_view_model.dart'
    as _i856;
import '../features/ui/admin/screens/doctor_screen/cubit/doctor_view_model.dart'
    as _i758;
import '../features/ui/admin/screens/manager_screen/cubit/manager_view_model.dart'
    as _i688;
import '../features/ui/admin/screens/room_screen/cubit/room_view_model.dart'
    as _i621;
import '../features/ui/admin/screens/student_screen/cubit/student_view_model.dart'
    as _i372;
import '../features/ui/admin/screens/subject_screen/cubit/subject_view_model.dart'
    as _i734;
import '../features/ui/auth/forget_password/cubit/reset_password_view_model.dart'
    as _i161;
import '../features/ui/auth/login/cubit/login_view_model.dart' as _i1040;
import '../features/ui/screens/doctor_schedule/cubit/doctor_schedule_view_model.dart'
    as _i1036;
import '../features/ui/screens/room/cubit/room_view_model.dart' as _i680;
import '../features/ui/screens/student/cubit/student_view_model.dart' as _i555;

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
    gh.factory<_i555.DeleteStudentRemoteDataSource>(
      () => _i456.DeleteStudentRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i975.StudentRemoteDataSource>(
      () => _i420.StudentRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i272.GetSubjectRemoteDataSource>(
      () => _i423.GetSubjectRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i32.AddStudentRemoteDataSource>(
      () => _i399.AddStudentRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i820.DeleteRoomRemoteDataSource>(
      () => _i626.DeleteRoomRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i901.AddRoomRemoteDataSource>(
      () => _i494.AddRoomRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i110.GetSubjectRepository>(
      () => _i1027.GetSubjectRepositoryImpl(
        getSubjectRemoteDataSource: gh<_i272.GetSubjectRemoteDataSource>(),
      ),
    );
    gh.factory<_i1020.GetDoctorRemoteDataSource>(
      () => _i30.GetDoctorRemoteDataSourceImpl(
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
    gh.factory<_i698.DeleteSubjectRemoteDataSource>(
      () => _i839.DeleteSubjectRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i736.DeleteStudentRepository>(
      () => _i98.DeleteStudentRepositoryImpl(
        deleteStudentRemoteDataSource:
            gh<_i555.DeleteStudentRemoteDataSource>(),
      ),
    );
    gh.factory<_i580.AddDoctorRemoteDataSource>(
      () => _i473.AddDoctorRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i545.UpdateDoctorRemoteDataSource>(
      () => _i675.UpdateDoctorRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i747.AddSubjectRemoteDataSource>(
      () => _i112.AddSubjectRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i520.DeleteRoomRepository>(
      () => _i743.DeleteRoomRepositoryImpl(
        deleteRoomRemoteDataSource: gh<_i820.DeleteRoomRemoteDataSource>(),
      ),
    );
    gh.factory<_i156.UpdateRoomRemoteDataSource>(
      () => _i28.UpdateRoomRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i144.ForgetPasswordRemoteDataSource>(
      () => _i273.ForgetPasswordRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i1053.ForgetPasswordRepository>(
      () => _i924.ForgetPasswordRepositoryImpl(
        forgetPasswordRemoteDataSource:
            gh<_i144.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i477.DeleteDoctorRemoteDataSource>(
      () => _i479.DeleteDoctorRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i315.RoomRemoteDataSource>(
      () =>
          _i1057.RoomRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i1038.GetStudentRemoteDataSource>(
      () => _i475.GetStudentRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i625.AddManagerRemoteDataSource>(
      () => _i782.AddManagerRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i166.LoginRemoteDataSource>(
      () =>
          _i524.LoginRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i763.DashboardRemoteDataSource>(
      () => _i397.DashboardRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i750.GetRoomRemoteDataSource>(
      () => _i1012.GetRoomRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i846.AddManagerRepository>(
      () => _i938.AddManagerRepositoryImpl(
        addManagerRemoteDataSource: gh<_i625.AddManagerRemoteDataSource>(),
      ),
    );
    gh.factory<_i602.UpdateRoomRepository>(
      () => _i496.UpdateRoomRepositoryImpl(
        updateRoomRemoteDataSource: gh<_i156.UpdateRoomRemoteDataSource>(),
      ),
    );
    gh.factory<_i349.ForgetPasswordUseCase>(
      () => _i349.ForgetPasswordUseCase(
        forgetPasswordRepository: gh<_i1053.ForgetPasswordRepository>(),
      ),
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
    gh.factory<_i387.DeleteDoctorRepository>(
      () => _i829.DeleteDoctorRepositoryImpl(
        deleteDoctorRemoteDataSource: gh<_i477.DeleteDoctorRemoteDataSource>(),
      ),
    );
    gh.factory<_i177.GetDoctorRepository>(
      () => _i376.GetDoctorRepositoryImpl(
        getDoctorRemoteDataSource: gh<_i1020.GetDoctorRemoteDataSource>(),
      ),
    );
    gh.factory<_i378.DeleteSubjectRepository>(
      () => _i47.DeleteSubjectRepositoryImpl(
        deleteSubjectRemoteDataSource:
            gh<_i698.DeleteSubjectRemoteDataSource>(),
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
    gh.factory<_i811.UpdateRoomUseCase>(
      () => _i811.UpdateRoomUseCase(
        updateRoomRepository: gh<_i602.UpdateRoomRepository>(),
      ),
    );
    gh.factory<_i646.StudentRepository>(
      () => _i382.StudentRepositoryImpl(
        studentRemoteDataSource: gh<_i975.StudentRemoteDataSource>(),
      ),
    );
    gh.factory<_i363.GetRoomRepository>(
      () => _i379.GetRoomRepositoryImpl(
        getRoomRemoteDataSource: gh<_i750.GetRoomRemoteDataSource>(),
      ),
    );
    gh.factory<_i100.GetSubjectUseCase>(
      () => _i100.GetSubjectUseCase(
        getSubjectRepository: gh<_i110.GetSubjectRepository>(),
      ),
    );
    gh.factory<_i161.ResetPasswordViewModel>(
      () => _i161.ResetPasswordViewModel(
        forgetPasswordUseCase: gh<_i349.ForgetPasswordUseCase>(),
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
    gh.factory<_i313.RoomRepository>(
      () => _i809.RoomRepositoryImpl(
        roomRemoteDataSource: gh<_i315.RoomRemoteDataSource>(),
      ),
    );
    gh.factory<_i787.DoctorRepository>(
      () => _i560.DoctorRepositoryImpl(
        doctorRemoteDataSource: gh<_i943.DoctorRemoteDataSource>(),
      ),
    );
    gh.factory<_i814.DeleteRoomUseCase>(
      () => _i814.DeleteRoomUseCase(
        deleteRoomRepository: gh<_i520.DeleteRoomRepository>(),
      ),
    );
    gh.factory<_i172.DeleteDoctorUseCase>(
      () => _i172.DeleteDoctorUseCase(
        deleteDoctorRepository: gh<_i387.DeleteDoctorRepository>(),
      ),
    );
    gh.factory<_i473.DeleteStudentUseCase>(
      () => _i473.DeleteStudentUseCase(
        deleteStudentRepository: gh<_i736.DeleteStudentRepository>(),
      ),
    );
    gh.factory<_i380.AddManagerUseCase>(
      () => _i380.AddManagerUseCase(
        addManagerRepository: gh<_i846.AddManagerRepository>(),
      ),
    );
    gh.factory<_i365.UpdateDoctorRepository>(
      () => _i724.UpdateDoctorRepositoryImpl(
        updateDoctorRemoteDataSource: gh<_i545.UpdateDoctorRemoteDataSource>(),
      ),
    );
    gh.factory<_i456.UpdateDoctorUseCase>(
      () => _i456.UpdateDoctorUseCase(
        updateDoctorRepository: gh<_i365.UpdateDoctorRepository>(),
      ),
    );
    gh.factory<_i993.StudentScheduleUseCase>(
      () => _i993.StudentScheduleUseCase(
        studentRepository: gh<_i646.StudentRepository>(),
      ),
    );
    gh.factory<_i525.DashboardRepository>(
      () => _i585.DashboardRepositoryImpl(
        dashboardRemoteDataSource: gh<_i763.DashboardRemoteDataSource>(),
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
    gh.factory<_i413.GetStudentRepository>(
      () => _i183.GetStudentRepositoryImpl(
        getStudentRemoteDataSource: gh<_i1038.GetStudentRemoteDataSource>(),
      ),
    );
    gh.factory<_i578.GetRoomUseCase>(
      () => _i578.GetRoomUseCase(
        getRoomRepository: gh<_i363.GetRoomRepository>(),
      ),
    );
    gh.factory<_i175.GetDoctorUseCase>(
      () => _i175.GetDoctorUseCase(
        getDoctorRepository: gh<_i177.GetDoctorRepository>(),
      ),
    );
    gh.factory<_i728.DeleteSubjectUseCase>(
      () => _i728.DeleteSubjectUseCase(
        deleteSubjectRepository: gh<_i378.DeleteSubjectRepository>(),
      ),
    );
    gh.factory<_i758.DoctorViewModel>(
      () => _i758.DoctorViewModel(
        addDoctorUseCase: gh<_i972.AddDoctorUseCase>(),
        getDoctorUseCase: gh<_i175.GetDoctorUseCase>(),
        updateDoctorUseCase: gh<_i456.UpdateDoctorUseCase>(),
        deleteDoctorUseCase: gh<_i172.DeleteDoctorUseCase>(),
      ),
    );
    gh.factory<_i688.ManagerViewModel>(
      () => _i688.ManagerViewModel(
        addManagerUseCase: gh<_i380.AddManagerUseCase>(),
      ),
    );
    gh.factory<_i46.RoomUseCase>(
      () => _i46.RoomUseCase(roomRepository: gh<_i313.RoomRepository>()),
    );
    gh.factory<_i352.AddRoomUseCase>(
      () => _i352.AddRoomUseCase(
        addRoomRepository: gh<_i446.AddRoomRepository>(),
      ),
    );
    gh.factory<_i734.SubjectViewModel>(
      () => _i734.SubjectViewModel(
        addSubjectUseCase: gh<_i947.AddSubjectUseCase>(),
        getSubjectUseCase: gh<_i100.GetSubjectUseCase>(),
        deleteSubjectUseCase: gh<_i728.DeleteSubjectUseCase>(),
      ),
    );
    gh.factory<_i240.DoctorUseCase>(
      () => _i240.DoctorUseCase(doctorRepository: gh<_i787.DoctorRepository>()),
    );
    gh.factory<_i790.DashboardUseCase>(
      () => _i790.DashboardUseCase(
        dashboardRepository: gh<_i525.DashboardRepository>(),
      ),
    );
    gh.factory<_i621.RoomViewModel>(
      () => _i621.RoomViewModel(
        addRoomUseCase: gh<_i352.AddRoomUseCase>(),
        getRoomUseCase: gh<_i578.GetRoomUseCase>(),
        updateRoomUseCase: gh<_i811.UpdateRoomUseCase>(),
        deleteRoomUseCase: gh<_i814.DeleteRoomUseCase>(),
      ),
    );
    gh.factory<_i1040.LoginViewModel>(
      () => _i1040.LoginViewModel(loginUseCase: gh<_i772.LoginUseCase>()),
    );
    gh.factory<_i555.StudentViewModel>(
      () => _i555.StudentViewModel(
        studentScheduleUseCase: gh<_i993.StudentScheduleUseCase>(),
      ),
    );
    gh.factory<_i882.GetStudentUseCase>(
      () => _i882.GetStudentUseCase(
        getStudentRepository: gh<_i413.GetStudentRepository>(),
      ),
    );
    gh.factory<_i856.DashboardViewModel>(
      () => _i856.DashboardViewModel(
        dashboardUseCase: gh<_i790.DashboardUseCase>(),
      ),
    );
    gh.factory<_i1036.DoctorScheduleViewModel>(
      () => _i1036.DoctorScheduleViewModel(
        doctorUseCase: gh<_i240.DoctorUseCase>(),
      ),
    );
    gh.factory<_i680.RoomViewModel>(
      () => _i680.RoomViewModel(roomUseCase: gh<_i46.RoomUseCase>()),
    );
    gh.factory<_i372.StudentViewModel>(
      () => _i372.StudentViewModel(
        addStudentUseCase: gh<_i805.AddStudentUseCase>(),
        getStudentUseCase: gh<_i882.GetStudentUseCase>(),
        deleteStudentUseCase: gh<_i473.DeleteStudentUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i223.GetItModule {}
