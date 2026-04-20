import 'package:dio/dio.dart';

import 'package:my_guide/api/api_endpoints.dart';
import 'package:my_guide/api/models/request/login/login_request_dto.dart';
import 'package:my_guide/api/models/response/doctor/doctor_response_dto.dart';
import 'package:my_guide/api/models/response/login/login_response_dto.dart';
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
}
