import 'package:json_annotation/json_annotation.dart';

part 'generate_tables_request_dto.g.dart';

@JsonSerializable()
class GenerateTablesRequestDto {
  @JsonKey(name: "dayStartTime")
  final String? dayStartTime;
  @JsonKey(name: "dayEndTime")
  final String? dayEndTime;
  @JsonKey(name: "lectureDurationMinutes")
  final int? lectureDurationMinutes;
  @JsonKey(name: "maxLecturesPerDoctorPerDay")
  final int? maxLecturesPerDoctorPerDay;
  @JsonKey(name: "maxLecturesPerYearPerDay")
  final int? maxLecturesPerYearPerDay;

  GenerateTablesRequestDto({
    this.dayStartTime,
    this.dayEndTime,
    this.lectureDurationMinutes,
    this.maxLecturesPerDoctorPerDay,
    this.maxLecturesPerYearPerDay,
  });

  factory GenerateTablesRequestDto.fromJson(Map<String, dynamic> json) {
    return _$GenerateTablesRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GenerateTablesRequestDtoToJson(this);
  }
}
