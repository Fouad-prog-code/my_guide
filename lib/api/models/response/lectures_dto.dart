import 'package:json_annotation/json_annotation.dart';
part 'lectures_dto.g.dart';

@JsonSerializable()
class LecturesDto {
  @JsonKey(name: "subjectName")
  final String? subjectName;
  @JsonKey(name: "lecturerName")
  final String? lecturerName;
  @JsonKey(name: "startTime")
  final String? startTime;
  @JsonKey(name: "endTime")
  final String? endTime;

  LecturesDto ({
    this.subjectName,
    this.lecturerName,
    this.startTime,
    this.endTime,
  });

  factory LecturesDto.fromJson(Map<String, dynamic> json) {
    return _$LecturesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LecturesDtoToJson(this);
  }
}