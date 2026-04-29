import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/student_day_dto.dart';

part 'student_schedule_response_dto.g.dart';

@JsonSerializable()
class StudentScheduleResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<StudentDayDto>? data;
  @JsonKey(name: "errors")
  final dynamic errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic meta;

  StudentScheduleResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory StudentScheduleResponseDto.fromJson(Map<String, dynamic> json) {
    return _$StudentScheduleResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StudentScheduleResponseDtoToJson(this);
  }
}
