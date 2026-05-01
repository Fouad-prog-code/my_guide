import 'package:dio/dio.dart';
import 'package:my_guide/api/api_endpoints.dart';
import 'package:my_guide/api/models/request/add_doctor_or_manager/add_doctor_or_manager_request_dto.dart';
import 'package:my_guide/api/models/request/add_room/add_room_request_dto.dart';
import 'package:my_guide/api/models/request/add_student/add_student_request_dto.dart';
import 'package:my_guide/api/models/request/add_subject/add_subject_request_dto.dart';
import 'package:my_guide/api/models/request/forget_password/forget_password_request_dto.dart';
import 'package:my_guide/api/models/request/login/login_request_dto.dart';
import 'package:my_guide/api/models/common/add_user/add_user_response_dto.dart';
import 'package:my_guide/api/models/request/updata_room/update_room_request_dto.dart';
import 'package:my_guide/api/models/request/update_doctor/update_doctor_request_dto.dart';
import 'package:my_guide/api/models/request/update_manager/update_manager_request_dto.dart';
import 'package:my_guide/api/models/request/update_student/update_student_request_dto.dart';
import 'package:my_guide/api/models/request/update_course/update_course_request_dto.dart';
import 'package:my_guide/api/models/response/add_room/add_room_response_dto.dart';
import 'package:my_guide/api/models/response/add_subject/add_subject_response_dto.dart';
import 'package:my_guide/api/models/response/delete_doctor/delete_doctor_response_dto.dart';
import 'package:my_guide/api/models/response/delete_room/delete_room_response_dto.dart';
import 'package:my_guide/api/models/response/delete_subject/delete_subject_response_dto.dart';
import 'package:my_guide/api/models/response/doctor/doctor_response_dto.dart';
import 'package:my_guide/api/models/response/forget_password/forget_password_response_dto.dart';
import 'package:my_guide/api/models/response/get_dashboard/dashboard_response_dto.dart';
import 'package:my_guide/api/models/response/get_doctor/get_doctor_response_dto.dart';
import 'package:my_guide/api/models/response/get_room/get_room_response_dto.dart';
import 'package:my_guide/api/models/response/get_student/get_student_response_dto.dart';
import 'package:my_guide/api/models/response/get_subject/get_subject_response_dto.dart';
import 'package:my_guide/api/models/response/get_manager/get_manager_response_dto.dart';
import 'package:my_guide/api/models/response/login/login_response_dto.dart';
import 'package:my_guide/api/models/response/room_response_dto.dart';
import 'package:my_guide/api/models/response/student_schedule_response_dto.dart';
import 'package:my_guide/api/models/response/updata_room/update_room_response_dto.dart';
import 'package:my_guide/api/models/common/update_or_delete_user/update_or_delete_user_response_dto.dart';

import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiEndpoints.loginApi)
  Future<LoginResponseDto> login(@Body() LoginRequestDto loginRequestDto);

  @POST(ApiEndpoints.forgetPasswordApi)
  Future<ForgetPasswordResponseDto> resetPassword(
    @Body() ForgetPasswordRequestDto forgetPasswordRequestDto,
  );

  @GET(ApiEndpoints.doctorApi)
  Future<DoctorResponseDto> getDoctorSchedule(
    @Path("DoctorId") int doctorId,
    @Header("Authorization") String token,
  );

  @POST(ApiEndpoints.addRoomApi)
  Future<AddRoomResponseDto> addRoom(
    @Body() AddRoomRequestDto addRoomRequestDto,
    @Header("Authorization") String token,
  );

  @POST(ApiEndpoints.addSubjectApi)
  Future<AddSubjectResponseDto> addSubject(
    @Body() AddSubjectRequestDto addSubjectRequestDto,
    @Header("Authorization") String token,
  );

  @POST(ApiEndpoints.addDoctorApi)
  Future<AddUserResponseDto> addDoctor(
    @Body() AddDoctorOrManagerRequestDto addDoctorRequestDto,
    @Header("Authorization") String token,
  );

  @POST(ApiEndpoints.addManagerApi)
  Future<AddUserResponseDto> addManager(
    @Body() AddDoctorOrManagerRequestDto addManagerRequestDto,
    @Header("Authorization") String token,
  );

  @POST(ApiEndpoints.addStudentApi)
  Future<AddUserResponseDto> addStudent(
    @Body() AddStudentRequestDto addStudentRequestDto,
    @Header("Authorization") String token,
  );

  @GET(ApiEndpoints.getSubjectApi)
  Future<GetSubjectResponseDto> getSubject(
    @Header("Authorization") String token,
  );

  @GET(ApiEndpoints.getDoctorApi)
  Future<GetDoctorResponseDto> getDoctor(@Header("Authorization") String token);

  @GET(ApiEndpoints.getManagerApi)
  Future<GetManagerResponseDto> getManager(@Header("Authorization") String token);

  @GET(ApiEndpoints.getRoomApi)
  Future<GetRoomResponseDto> getRoom(@Header("Authorization") String token);

  @GET(ApiEndpoints.getStudentApi)
  Future<GetStudentResponseDto> getStudent(
    @Header("Authorization") String token,
  );

  @PUT(ApiEndpoints.updateRoomApi)
  Future<UpdateRoomResponseDto> updateRoom(
    @Body() UpdateRoomRequestDto updateRoomRequestDto,
    @Header("Authorization") String token,
  );

  @DELETE(ApiEndpoints.deleteRoomApi)
  Future<DeleteRoomResponseDto> deleteRoom(
    @Path("Id") int id,
    @Header("Authorization") String token,
  );

  @PUT(ApiEndpoints.updateDoctorApi)
  Future<UpdateOrDeleteUserResponseDto> updateDoctor(
    @Body() UpdateDoctorRequestDto updateDoctorRequestDto,
    @Header("Authorization") String token,
  );

  @PUT(ApiEndpoints.updateManagerApi)
  Future<UpdateOrDeleteUserResponseDto> updateManager(
    @Body() UpdateManagerRequestDto updateManagerRequestDto,
    @Header("Authorization") String token,
  );

  @PUT(ApiEndpoints.updateStudentApi)
  Future<UpdateOrDeleteUserResponseDto> updateStudent(
    @Body() UpdateStudentRequestDto updateStudentRequestDto,
    @Header("Authorization") String token,
  );

  @PUT(ApiEndpoints.updateCourseApi)
  Future<UpdateOrDeleteUserResponseDto> updateCourse(
    @Body() UpdateCourseRequestDto updateCourseRequestDto,
    @Header("Authorization") String token,
  );

  @DELETE(ApiEndpoints.deleteStudentApi)
  Future<UpdateOrDeleteUserResponseDto> deleteStudent(
    @Path("Id") int id,
    @Header("Authorization") String token,
  );

  @DELETE(ApiEndpoints.deleteManagerApi)
  Future<UpdateOrDeleteUserResponseDto> deleteManager(
    @Path("ManagerId") int managerId,
    @Header("Authorization") String token,
  );

  @DELETE(ApiEndpoints.deleteDoctorApi)
  Future<DeleteDoctorResponseDto> deleteDoctor(
    @Path("Id") int id,
    @Header("Authorization") String token,
  );

  @DELETE(ApiEndpoints.deleteSubjectApi)
  Future<DeleteSubjectResponseDto> deleteSubject(
    @Path("Name") String name,
    @Header("Authorization") String token,
  );

  @GET(ApiEndpoints.roomEndPoint)
  Future<RoomResponseDto> getRooms(@Header("Authorization") String token);

  @GET(ApiEndpoints.studentScheduleEndPoint)
  Future<StudentScheduleResponseDto> getStudentSchedule(
    @Header("Authorization") String token,
  );

  @GET(ApiEndpoints.dashboardApi)
  Future<DashboardResponseDto> getDashboard(
    @Header("Authorization") String token,
  );
}
