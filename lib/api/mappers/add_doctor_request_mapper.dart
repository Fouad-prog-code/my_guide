import 'package:my_guide/api/models/request/add_doctor/add_doctor_request_dto.dart';
import 'package:my_guide/domain/entities/request/add_doctor/add_doctor_request.dart';

extension AddDoctorRequestMapper on AddDoctorRequest {
  AddDoctorRequestDto toAddDoctorRequestDto() {
    return AddDoctorRequestDto(
      userName: userName,
      password: password,
      fullName: fullName,
      nationalId: nationalId,
    );
  }
}
