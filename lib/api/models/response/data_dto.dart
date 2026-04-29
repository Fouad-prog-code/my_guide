import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/room_schedules_dto.dart';

part 'data_dto.g.dart';

@JsonSerializable()
class DataDto {
  @JsonKey(name: "roomId")
  final int? roomId;
  @JsonKey(name: "roomName")
  final String? roomName;
  @JsonKey(name: "weeklySchedule")
  final List<WeeklyScheduleDto>? weeklySchedule;

  DataDto({this.roomId, this.roomName, this.weeklySchedule});

  factory DataDto.fromJson(Map<String, dynamic> json) {
    return _$DataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataDtoToJson(this);
  }
}
