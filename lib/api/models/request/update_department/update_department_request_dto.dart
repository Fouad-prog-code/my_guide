import 'package:json_annotation/json_annotation.dart';

part 'update_department_request_dto.g.dart';

@JsonSerializable()
class UpdateDepartmentRequestDto {
  @JsonKey(name: "departmentId")
  final int? departmentId;
  @JsonKey(name: "departmentName")
  final String? departmentName;
  @JsonKey(name: "departmentCode")
  final String? departmentCode;

  UpdateDepartmentRequestDto ({
    this.departmentId,
    this.departmentName,
    this.departmentCode,
  });

  factory UpdateDepartmentRequestDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateDepartmentRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateDepartmentRequestDtoToJson(this);
  }
}


