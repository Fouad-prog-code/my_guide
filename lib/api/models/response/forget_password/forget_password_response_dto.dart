import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response_dto.g.dart';

@JsonSerializable()
class ForgetPasswordResponseDto {
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

  ForgetPasswordResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory ForgetPasswordResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordResponseDtoToJson(this);
  }
}
