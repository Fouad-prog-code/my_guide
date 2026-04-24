import 'package:dio/dio.dart';
import 'package:my_guide/api/api_endpoints.dart';
import 'package:my_guide/api/models/request/add_doctor/add_doctor_request_dto.dart';
import 'package:my_guide/api/models/request/add_room/add_room_request_dto.dart';
import 'package:my_guide/api/models/request/add_student/add_student_request_dto.dart';
import 'package:my_guide/api/models/request/add_subject/add_subject_request_dto.dart';
import 'package:my_guide/api/models/request/login/login_request_dto.dart';
import 'package:my_guide/api/models/common/add_user/add_user_response_dto.dart';
import 'package:my_guide/api/models/request/updata_room/update_room_request_dto.dart';
import 'package:my_guide/api/models/request/update_doctor/update_doctor_request_dto.dart';
import 'package:my_guide/api/models/response/add_room/add_room_response_dto.dart';
import 'package:my_guide/api/models/response/add_subject/add_subject_response_dto.dart';
import 'package:my_guide/api/models/response/delete_room/delete_room_response_dto.dart';
import 'package:my_guide/api/models/response/doctor/doctor_response_dto.dart';
import 'package:my_guide/api/models/response/get_doctor/get_doctor_response_dto.dart';
import 'package:my_guide/api/models/response/get_room/get_room_response_dto.dart';
import 'package:my_guide/api/models/response/get_student/get_student_response_dto.dart';
import 'package:my_guide/api/models/response/get_subject/get_subject_response_dto.dart';
import 'package:my_guide/api/models/response/login/login_response_dto.dart';
import 'package:my_guide/api/models/response/updata_room/update_room_response_dto.dart';
import 'package:my_guide/api/models/common/update_or_delete_user/update_or_delete_user_response_dto.dart';

import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  @POST(ApiEndpoints.loginApi)
  Future<LoginResponseDto> login(@Body() LoginRequestDto loginRequestDto);

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
    @Body() AddDoctorRequestDto addDoctorRequestDto,
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

  @DELETE(ApiEndpoints.deleteStudentApi)
  Future<UpdateOrDeleteUserResponseDto> deleteStudent(
    @Path("Id") int id,
    @Header("Authorization") String token,
  );
}
