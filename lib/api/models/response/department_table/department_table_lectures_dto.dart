import 'package:json_annotation/json_annotation.dart';
part 'department_table_lectures_dto.g.dart';

@JsonSerializable()
class DepartmentTableLecturesDto {
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

  DepartmentTableLecturesDto({
    this.courseName,
    this.doctorName,
    this.roomName,
    this.startTime,
    this.endTime,
  });

  factory DepartmentTableLecturesDto.fromJson(Map<String, dynamic> json) {
    return _$DepartmentTableLecturesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DepartmentTableLecturesDtoToJson(this);
  }
}
