import 'package:json_annotation/json_annotation.dart';

part 'update_course_request_dto.g.dart';

@JsonSerializable()
class UpdateCourseRequestDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "doctorName")
  final String? doctorName;
  @JsonKey(name: "academicYear")
  final String? academicYear;
  @JsonKey(name: "departments")
  final List<String>? departments;

  UpdateCourseRequestDto({
    this.id,
    this.name,
    this.doctorName,
    this.academicYear,
    this.departments,
  });

  factory UpdateCourseRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateCourseRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateCourseRequestDtoToJson(this);
  }
}
