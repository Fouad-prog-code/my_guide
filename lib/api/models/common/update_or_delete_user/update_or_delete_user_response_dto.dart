import 'package:json_annotation/json_annotation.dart';

part 'update_or_delete_user_response_dto.g.dart';

@JsonSerializable()
class UpdateOrDeleteUserResponseDto {
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

  UpdateOrDeleteUserResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory UpdateOrDeleteUserResponseDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateOrDeleteUserResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateOrDeleteUserResponseDtoToJson(this);
  }
}
