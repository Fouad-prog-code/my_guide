import 'package:my_guide/api/models/request/generate_tables/generate_tables_request_dto.dart';
import 'package:my_guide/domain/entities/request/generate_tables/generate_tables_request.dart';

extension GenerateTablesRequestMapper on GenerateTablesRequest {
  GenerateTablesRequestDto toGenerateTablesRequestDto() {
    return GenerateTablesRequestDto(
      dayEndTime: dayEndTime,
      dayStartTime: dayStartTime,
      lectureDurationMinutes: lectureDurationMinutes,
      maxLecturesPerDoctorPerDay: maxLecturesPerDoctorPerDay,
      maxLecturesPerYearPerDay: maxLecturesPerYearPerDay,
    );
  }
}
