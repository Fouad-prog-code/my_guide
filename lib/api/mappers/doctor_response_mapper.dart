import 'package:my_guide/api/mappers/doctor_data_mapper.dart';
import 'package:my_guide/api/models/response/doctor/doctor_response_dto.dart';
import 'package:my_guide/domain/entities/response/doctor/doctor_response.dart';

extension DoctorResponseMapper on DoctorResponseDto {
  DoctorResponse toDoctorResponse() {
    return DoctorResponse(
      statusCode: statusCode,
      succeeded: succeeded,
      message: message,
      errors: errors,
      meta: meta,
      data: data?.map((e) => e.toDoctorData()).toList() ?? [],
    );
  }
}
