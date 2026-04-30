import 'package:my_guide/api/mappers/delete_doctor_data_mapper.dart';
import 'package:my_guide/api/models/response/delete_doctor/delete_doctor_response_dto.dart';
import 'package:my_guide/domain/entities/response/delete_doctor/delete_doctor_response.dart';

extension DeleteDoctorResponseMapper on DeleteDoctorResponseDto {
  DeleteDoctorResponse toDeleteDoctorResponse() {
    return DeleteDoctorResponse(
      succeeded: succeeded,
      statusCode: statusCode,
      message: message,
      meta: meta,
      errors: errors,
      data: data!.toDeleteDoctorData(),
    );
  }
}
