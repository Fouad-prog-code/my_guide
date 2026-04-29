import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/student_lecture_dto.dart';

part 'student_day_dto.g.dart';

@JsonSerializable()
class StudentDayDto {
  @JsonKey(name: "dayOfWeek")
  final String? dayOfWeek;
  @JsonKey(name: "lecturesCount")
  final int? lecturesCount;
  @JsonKey(name: "lectures")
  final List<StudentLectureDto>? lectures;

  StudentDayDto({this.dayOfWeek, this.lecturesCount, this.lectures});

  factory StudentDayDto.fromJson(Map<String, dynamic> json) {
    return _$StudentDayDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StudentDayDtoToJson(this);
  }
}
