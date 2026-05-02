import 'package:json_annotation/json_annotation.dart';

part 'get_department_data_dto.g.dart';

@JsonSerializable()
class GetDepartmentDataDto {
  @JsonKey(name: "departmentId")
  final int? departmentId;
  @JsonKey(name: "departmentName")
  final String? departmentName;
  @JsonKey(name: "departmentCode")
  final String? departmentCode;

  GetDepartmentDataDto({
    this.departmentId,
    this.departmentName,
    this.departmentCode,
  });

  factory GetDepartmentDataDto.fromJson(Map<String, dynamic> json) {
    return _$GetDepartmentDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetDepartmentDataDtoToJson(this);
  }
}
