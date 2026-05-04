import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/department_table/department_table_data_dto.dart';

part 'department_table_response_dto.g.dart';

@JsonSerializable()
class DepartmentTableResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<DepartmentTableDataDto>? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  DepartmentTableResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory DepartmentTableResponseDto.fromJson(Map<String, dynamic> json) {
    return _$DepartmentTableResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DepartmentTableResponseDtoToJson(this);
  }
}
