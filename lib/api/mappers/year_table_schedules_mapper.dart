import 'package:my_guide/api/mappers/year_table_lectures_mapper.dart';
import 'package:my_guide/api/models/response/year_table/year_table_schedule_dto.dart';
import 'package:my_guide/domain/entities/response/year_table/year_table_schedule.dart';

extension YearTableSchedulesMapper on YearTableScheduleDto {
  YearTableSchedule toYearTableSchedule() {
    return YearTableSchedule(
      dayName: dayName,
      lectures:
          lectures?.map((lecture) => lecture.toYearTableLectures()).toList() ??
          [],
    );
  }
}
