class GenerateTablesRequest {
  final String? dayStartTime;

  final String? dayEndTime;

  final int? lectureDurationMinutes;

  final int? maxLecturesPerDoctorPerDay;

  final int? maxLecturesPerYearPerDay;

  GenerateTablesRequest({
    this.dayStartTime,
    this.dayEndTime,
    this.lectureDurationMinutes,
    this.maxLecturesPerDoctorPerDay,
    this.maxLecturesPerYearPerDay,
  });
}
