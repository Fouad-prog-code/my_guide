import 'package:my_guide/api/mappers/department_table_lectures_mapper.dart';
import 'package:my_guide/api/models/response/department_table/department_table_day_dto.dart';
import 'package:my_guide/domain/entities/response/department_table/department_table_day.dart';

extension DepartmentTableDayMapper on DepartmentTableDayDto {
  DepartmentTableDay toDepartmentTableDay() {
    return DepartmentTableDay(
      dayName: dayName,
      lectures:
          lectures?.map((l) => l.toDepartmentTableLectures()).toList() ?? [],
    );
  }
}
