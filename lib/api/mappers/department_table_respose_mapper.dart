import 'package:my_guide/api/mappers/department_table_data_mapper.dart';
import 'package:my_guide/api/models/response/department_table/department_table_response_dto.dart';
import 'package:my_guide/domain/entities/response/department_table/department_table_response.dart';

extension DepartmentTableResposeMapper on DepartmentTableResponseDto {
  DepartmentTableResponse toDepartmentTableResponse() {
    return DepartmentTableResponse(
      succeeded: succeeded,
      statusCode: statusCode,
      message: message,
      errors: errors,
      meta: meta,
      data: data?.map((d) => d.toDepartmentTableData()).toList() ?? [],
    );
  }
}
