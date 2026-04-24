import 'package:my_guide/api/models/request/update_doctor/update_doctor_request_dto.dart';
import 'package:my_guide/domain/entities/request/update_doctor/update_doctor_request.dart';

extension UpdateDoctorRequestMapper on UpdateDoctorRequest {
  UpdateDoctorRequestDto toUpdateDoctorRequestDto() {
    return UpdateDoctorRequestDto(
      id: id,
      nationalId: nationalId,
      fullName: fullName,
      username: username,
      password: password,
    );
  }
}
