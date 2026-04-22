import 'package:json_annotation/json_annotation.dart';

part 'add_student_request_dto.g.dart';

@JsonSerializable()
class AddStudentRequestDto {
  @JsonKey(name: "fullName")
  final String? fullName;
  @JsonKey(name: "nationalId")
  final String? nationalId;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "userName")
  final String? userName;
  @JsonKey(name: "yearName")
  final String? yearName;
  @JsonKey(name: "deptName")
  final String? deptName;

  AddStudentRequestDto ({
    this.fullName,
    this.nationalId,
    this.password,
    this.userName,
    this.yearName,
    this.deptName,
  });

  factory AddStudentRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddStudentRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddStudentRequestDtoToJson(this);
  }
}


