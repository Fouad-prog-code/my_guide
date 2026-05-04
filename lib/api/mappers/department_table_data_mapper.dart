import 'package:my_guide/api/mappers/department_table_day_mapper.dart';
import 'package:my_guide/api/models/response/department_table/department_table_data_dto.dart';
import 'package:my_guide/domain/entities/response/department_table/department_table_data.dart';

extension DepartmentTableDataMapper on DepartmentTableDataDto {
  DepartmentTableData toDepartmentTableData() {
    return DepartmentTableData(
      departmentName: departmentName,
      days: days?.map((day) => day.toDepartmentTableDay()).toList() ?? [],
    );
  }
}
