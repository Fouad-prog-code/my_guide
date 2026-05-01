import 'package:json_annotation/json_annotation.dart';
part 'view_student_dots_dto.g.dart';

@JsonSerializable()
class ViewStudentDtosDto {
  @JsonKey(name: "studentName")
  final String? studentName;
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "departmentName")
  final dynamic? departmentName;
  @JsonKey(name: "studentId")
  final int? studentId;
  @JsonKey(name: "nationalId")
  final String? nationalId;

  ViewStudentDtosDto({
    this.studentName,
    this.userName,
    this.departmentName,
    this.studentId,
    this.nationalId,
  });

  factory ViewStudentDtosDto.fromJson(Map<String, dynamic> json) {
    return _$ViewStudentDtosDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ViewStudentDtosDtoToJson(this);
  }
}
