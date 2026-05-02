import 'package:my_guide/api/models/request/add_department/add_department_request_dto.dart';
import 'package:my_guide/domain/entities/request/add_department/add_department_request.dart';

extension AddDepartmentRequestMapper on AddDepartmentRequest {
  AddDepartmentRequestDto toAddDepartmentRequestDto() {
    return AddDepartmentRequestDto(
      departmentName: departmentName,
      departmentCode: departmentCode,
    );
  }
}
