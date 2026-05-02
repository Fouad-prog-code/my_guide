import 'package:json_annotation/json_annotation.dart';

part 'add_department_request_dto.g.dart';

@JsonSerializable()
class AddDepartmentRequestDto {
  @JsonKey(name: "departmentName")
  final String? departmentName;
  @JsonKey(name: "departmentCode")
  final String? departmentCode;

  AddDepartmentRequestDto({this.departmentName, this.departmentCode});

  factory AddDepartmentRequestDto.fromJson(Map<String, dynamic> json) {
    return _$AddDepartmentRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddDepartmentRequestDtoToJson(this);
  }
}
