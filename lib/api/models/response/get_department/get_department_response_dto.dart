import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/get_department/get_department_data_dto.dart';

part 'get_department_response_dto.g.dart';

@JsonSerializable()
class GetDepartmentResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<GetDepartmentDataDto>? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  GetDepartmentResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory GetDepartmentResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetDepartmentResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetDepartmentResponseDtoToJson(this);
  }
}
