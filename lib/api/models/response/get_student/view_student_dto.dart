import 'package:json_annotation/json_annotation.dart';

part 'view_student_dto.g.dart';

@JsonSerializable()
class ViewStudentDto {
  @JsonKey(name: "studentName")
  final String? studentName;
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "departmentName")
  final dynamic? departmentName;
  @JsonKey(name: "studentId")
  final int? studentId;

  ViewStudentDto({
    this.studentName,
    this.userName,
    this.departmentName,
    this.studentId,
  });

  factory ViewStudentDto.fromJson(Map<String, dynamic> json) {
    return _$ViewStudentDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ViewStudentDtoToJson(this);
  }
}
