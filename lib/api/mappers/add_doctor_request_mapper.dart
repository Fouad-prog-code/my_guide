import 'package:my_guide/api/models/request/add_doctor_or_manager/add_doctor_or_manager_request_dto.dart';
import 'package:my_guide/domain/entities/request/add_doctor_or_manager/add_doctor_or_manager_request.dart';

extension AddDoctorRequestMapper on AddDoctOrManagerRequest {
  AddDoctorOrManagerRequestDto toAddDoctorOrManagerRequestDto() {
    return AddDoctorOrManagerRequestDto(
      userName: userName,
      password: password,
      fullName: fullName,
      nationalId: nationalId,
    );
  }
}
