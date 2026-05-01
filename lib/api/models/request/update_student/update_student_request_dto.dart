import 'package:json_annotation/json_annotation.dart';

part 'update_student_request_dto.g.dart';

@JsonSerializable()
class UpdateStudentRequestDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "nationalId")
  final String? nationalId;
  @JsonKey(name: "fullName")
  final String? fullName;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "academicYear")
  final String? academicYear;
  @JsonKey(name: "department")
  final String? department;

  UpdateStudentRequestDto({
    this.id,
    this.nationalId,
    this.fullName,
    this.username,
    this.academicYear,
    this.department,
  });

  factory UpdateStudentRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateStudentRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateStudentRequestDtoToJson(this);
  }
}
