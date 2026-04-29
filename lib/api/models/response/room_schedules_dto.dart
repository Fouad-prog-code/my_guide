import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/lectures_dto.dart';

part 'room_schedules_dto.g.dart';

@JsonSerializable()
class WeeklyScheduleDto {
  @JsonKey(name: "dayName")
  final String? dayName;
  @JsonKey(name: "lectures")
  final List<LecturesDto>? lectures;

  WeeklyScheduleDto({this.dayName, this.lectures});

  factory WeeklyScheduleDto.fromJson(Map<String, dynamic> json) {
    return _$WeeklyScheduleDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WeeklyScheduleDtoToJson(this);
  }
}
