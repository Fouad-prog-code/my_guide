import 'package:my_guide/api/models/response/add_department/add_department_response_dto.dart';
import 'package:my_guide/domain/entities/response/add_department/add_department_response.dart';

extension AddDepartmentResponseMapper on AddDepartmentResponseDto {
  AddDepartmentResponse toAddDepartmentResponse() {
    return AddDepartmentResponse(
      succeeded: succeeded,
      message: message,
      data: data,
      errors: errors,
      statusCode: statusCode,
      meta: meta,
    );
  }
}
