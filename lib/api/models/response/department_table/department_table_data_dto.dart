import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/department_table/department_table_day_dto.dart';

part 'department_table_data_dto.g.dart';

@JsonSerializable()
class DepartmentTableDataDto {
  @JsonKey(name: "departmentName")
  final String? departmentName;
  @JsonKey(name: "days")
  final List<DepartmentTableDayDto>? days;

  DepartmentTableDataDto({this.departmentName, this.days});

  factory DepartmentTableDataDto.fromJson(Map<String, dynamic> json) {
    return _$DepartmentTableDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DepartmentTableDataDtoToJson(this);
  }
}
