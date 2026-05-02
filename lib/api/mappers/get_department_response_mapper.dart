import 'package:my_guide/api/mappers/get_department_data_mapper.dart';
import 'package:my_guide/api/models/response/get_department/get_department_response_dto.dart';
import 'package:my_guide/domain/entities/response/get_department/get_department_response_dto.dart';

extension GetDepartmentResponseMapper on GetDepartmentResponseDto {
  GetDepartmentResponse toGetDepartmentResponse() {
    return GetDepartmentResponse(
      succeeded: succeeded,
      statusCode: statusCode,
      message: message,
      meta: meta,
      errors: errors,
      data: data?.map((dept) => dept.toGetDepartmentData()).toList() ?? [],
    );
  }
}
