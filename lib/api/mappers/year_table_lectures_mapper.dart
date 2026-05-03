import 'package:my_guide/api/models/response/year_table/year_table_lectures_dto.dart';
import 'package:my_guide/domain/entities/response/year_table/year_table_lectures.dart';

extension YearTableLecturesMapper on YearTableLecturesDto {
  YearTableLectures toYearTableLectures() {
    return YearTableLectures(
      courseName: courseName,
      doctorName: doctorName,
      startTime: startTime,
      endTime: endTime,
      roomName: roomName,
    );
  }
}
