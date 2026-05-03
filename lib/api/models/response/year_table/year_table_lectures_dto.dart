import 'package:json_annotation/json_annotation.dart';

part 'year_table_lectures_dto.g.dart';

@JsonSerializable()
class YearTableLecturesDto {
  @JsonKey(name: "courseName")
  final String? courseName;
  @JsonKey(name: "doctorName")
  final String? doctorName;
  @JsonKey(name: "roomName")
  final String? roomName;
  @JsonKey(name: "startTime")
  final String? startTime;
  @JsonKey(name: "endTime")
  final String? endTime;

  YearTableLecturesDto({
    this.courseName,
    this.doctorName,
    this.roomName,
    this.startTime,
    this.endTime,
  });

  factory YearTableLecturesDto.fromJson(Map<String, dynamic> json) {
    return _$YearTableLecturesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$YearTableLecturesDtoToJson(this);
  }
}
