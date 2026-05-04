import 'package:my_guide/api/models/response/department_table/department_table_lectures_dto.dart';
import 'package:my_guide/domain/entities/response/department_table/department_table_lectures.dart';

extension DepartmentTableLecturesMapper on DepartmentTableLecturesDto {
  DepartmentTableLectures toDepartmentTableLectures() {
    return DepartmentTableLectures(
      doctorName: doctorName,
      courseName: courseName,
      startTime: startTime,
      endTime: endTime,
      roomName: roomName,
    );
  }
}
