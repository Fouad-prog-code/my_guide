import 'package:json_annotation/json_annotation.dart';

part 'add_subject_request_dto.g.dart';

@JsonSerializable()
class AddSubjectRequestDto {
  @JsonKey(name: "lectureName")
  final String? lectureName;
  @JsonKey(name: "doctorName")
  final String? doctorName;
  @JsonKey(name: "yearName")
  final String? yearName;
  @JsonKey(name: "departmentNames")
  final List<dynamic>? departmentNames;

  AddSubjectRequestDto ({
    this.lectureName,
    this.doctorName,
    this.yearName,
    this.departmentNames,
  });

  factory AddSubjectRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddSubjectRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddSubjectRequestDtoToJson(this);
  }
}


