import 'package:json_annotation/json_annotation.dart';

part 'delete_subject_response_dto.g.dart';

@JsonSerializable()
class DeleteSubjectResponseDto {
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

  DeleteSubjectResponseDto ({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory DeleteSubjectResponseDto.fromJson(Map<String, dynamic> json) {
    return _$DeleteSubjectResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteSubjectResponseDtoToJson(this);
  }
}


