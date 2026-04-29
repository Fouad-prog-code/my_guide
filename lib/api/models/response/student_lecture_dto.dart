import 'package:json_annotation/json_annotation.dart';
part 'student_lecture_dto.g.dart';

@JsonSerializable()
class StudentLectureDto {
  @JsonKey(name: "subjectName")
  final String? subjectName;
  @JsonKey(name: "startTime")
  final String? startTime;
  @JsonKey(name: "endTime")
  final String? endTime;
  @JsonKey(name: "roomName")
  final String? roomName;
  @JsonKey(name: "doctorName")
  final String? doctorName;

  StudentLectureDto({
    this.subjectName,
    this.startTime,
    this.endTime,
    this.roomName,
    this.doctorName,
  });

  factory StudentLectureDto.fromJson(Map<String, dynamic> json) {
    return _$StudentLectureDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StudentLectureDtoToJson(this);
  }
}
