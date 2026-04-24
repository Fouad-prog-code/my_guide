import 'package:my_guide/api/mappers/get_doctor_data_mapper.dart';
import 'package:my_guide/api/models/response/get_doctor/get_doctor_response_dto.dart';
import 'package:my_guide/domain/entities/response/get_doctor/get_doctor_response.dart';

extension GetDoctorResponseMapper on GetDoctorResponseDto {
  GetDoctorResponse toGetDoctorResponse() {
    return GetDoctorResponse(
      succeeded: succeeded,
      statusCode: statusCode,
      message: message,
      meta: meta,
      errors: errors,
      data: data?.map((doctor) => doctor.toGetDoctorData()).toList() ?? [],
    );
  }
}
