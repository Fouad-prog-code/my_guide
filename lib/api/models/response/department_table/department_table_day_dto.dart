import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/department_table/department_table_lectures_dto.dart';
part 'department_table_day_dto.g.dart';

@JsonSerializable()
class DepartmentTableDayDto {
  @JsonKey(name: "dayName")
  final String? dayName;
  @JsonKey(name: "lectures")
  final List<DepartmentTableLecturesDto>? lectures;

  DepartmentTableDayDto({this.dayName, this.lectures});

  factory DepartmentTableDayDto.fromJson(Map<String, dynamic> json) {
    return _$DepartmentTableDayDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DepartmentTableDayDtoToJson(this);
  }
}
