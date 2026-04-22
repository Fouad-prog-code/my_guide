import 'package:json_annotation/json_annotation.dart';

part 'add_subject_response_dto.g.dart';

@JsonSerializable()
class AddSubjectResponseDto {
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

  AddSubjectResponseDto ({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory AddSubjectResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddSubjectResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddSubjectResponseDtoToJson(this);
  }
}


