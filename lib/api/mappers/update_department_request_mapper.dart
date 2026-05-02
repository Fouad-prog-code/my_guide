import 'package:my_guide/api/models/request/update_department/update_department_request_dto.dart';
import 'package:my_guide/domain/entities/request/update_department/update_department_request.dart';

extension UpdateDepartmentRequestMapper on UpdateDepartmentRequest {
  UpdateDepartmentRequestDto toUpdateDepartmentRequestDto() {
    return UpdateDepartmentRequestDto(
      departmentId: departmentId,
      departmentCode: departmentCode,
      departmentName: departmentName,
    );
  }
}
