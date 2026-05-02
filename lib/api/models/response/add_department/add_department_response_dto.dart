import 'package:json_annotation/json_annotation.dart';

part 'add_department_response_dto.g.dart';

@JsonSerializable()
class AddDepartmentResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final String? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  AddDepartmentResponseDto ({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory AddDepartmentResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddDepartmentResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddDepartmentResponseDtoToJson(this);
  }
}


