import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/get_subject/get_subject_data_dto.dart';

part 'get_subject_response_dto.g.dart';

@JsonSerializable()
class GetSubjectResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<GetSubjectDataDto>? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  GetSubjectResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory GetSubjectResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetSubjectResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetSubjectResponseDtoToJson(this);
  }
}
