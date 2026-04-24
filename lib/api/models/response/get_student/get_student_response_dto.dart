import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/get_student/get_student_data_dto.dart';

part 'get_student_response_dto.g.dart';

@JsonSerializable()
class GetStudentResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<GetStudentDataDto>? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  GetStudentResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory GetStudentResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetStudentResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetStudentResponseDtoToJson(this);
  }
}
