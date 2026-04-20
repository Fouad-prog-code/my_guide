import 'package:json_annotation/json_annotation.dart';
part 'doctor_lectures_dto.g.dart';

@JsonSerializable()
class DoctorLecturesDto {
  @JsonKey(name: "courseName")
  final String? courseName;
  @JsonKey(name: "startTime")
  final String? startTime;
  @JsonKey(name: "endTime")
  final String? endTime;
  @JsonKey(name: "roomName")
  final String? roomName;
  @JsonKey(name: "gradeName")
  final String? gradeName;

  DoctorLecturesDto({
    this.courseName,
    this.startTime,
    this.endTime,
    this.roomName,
    this.gradeName,
  });

  factory DoctorLecturesDto.fromJson(Map<String, dynamic> json) {
    return _$DoctorLecturesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DoctorLecturesDtoToJson(this);
  }
}
